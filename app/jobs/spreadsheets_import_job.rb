class SpreadsheetsImportJob < ApplicationJob
  queue_as :default

  # 行の構造を定義
  Row = Struct.new(
    :question,
    :answer
  )

  # performメソッドを定義
  def perform(spreadsheet_id, range)
    # APIで取得したデータをresローカル変数に代入
    res = google_spreadsheet_service.get_values(spreadsheet_id, range)
    # 値が空だった場合はここで終了
    return if res.values.empty?

    res.values.drop(1).each do |row_data| # 1行目はヘッダーなので削除
      row = Row.new(*row_data)
      attributes = row.to_h.slice(
        :question,
        :answer
      )
      question = Quiz.questions.build(attributes)
    end
  end

  private

    def google_spreadsheet_service
      @google_spreadsheet_service ||= Google::Spreadsheets.new
    end
end