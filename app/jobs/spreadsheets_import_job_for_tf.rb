class SpreadsheetsImportJob < ApplicationJob
  queue_as :default

  # 行の構造を定義
  Row = Struct.new(
    :question,
    :answer
  )

  # performメソッドを定義
  def perform(spreadsheet_id, range, quiz_id)
    # APIで取得したデータをresローカル変数に代入
    res = google_spreadsheet_service.get_values(spreadsheet_id, range)
    # 値が空だった場合はここで終了
    return if res.values.empty?

    #row_questions配列を定義
    row_questions = []

    res.values.drop(1).each do |row_data| # 1行目はヘッダーなので削除
      row = Row.new(*row_data)
      attributes = row.to_h.slice(
        :question,
        :answer
      )
      # attributesハッシュに"quiz_id"の要素を追加する
      attributes[:quiz_id] = quiz_id
      # @row_questions配列にハッシュを入れる
      row_questions << attributes
      #この結果作成されるのは
      # row_questions = [{question: A?, answer: true, quiz_id: 1}, {question: B?, answer: false, quiz_id: 1}, ~~ ] という配列
      # https://paiza.io/projects/MzBWRgEYi48ZUpshANx9kQ?locale=en-us
    end
    questions = Question.create!(row_questions)
    # デバック用
    # コンソールにて SpreadsheetsImportJob.perform_now("19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30", ["シート1!A:B"], 1) を実行する
    # p row_questions
  end

  private

    def google_spreadsheet_service
      @google_spreadsheet_service ||= Google::Spreadsheets.new
    end

end

# resからquestionsとanswersを作る方法
# https://paiza.io/projects/Ph6d5ad8x_JUrfU5URm0fQ?locale=en-us