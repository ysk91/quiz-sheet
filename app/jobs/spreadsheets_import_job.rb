class SpreadsheetsImportJob < ApplicationJob
  queue_as :default

  # performメソッドを定義
  def perform(spreadsheet_id, range, quiz_id)
    # APIで取得したデータをresローカル変数に代入
    res = google_spreadsheet_service.get_values(spreadsheet_id, range)
    # 値が空だった場合はここで終了
    return if res.values.empty?

    res.values.drop(1).each_with_index do |r, i|
      @question = Question.create(
        quiz_id: quiz_id,
        question: r[0]
      )
      @answer = Answer.create(
        question_id: @question.id,
        correct: res.values[i+1][1],
        incorrect_1: res.values[i+1][2],
        incorrect_2: res.values[i+1][3],
        comment: res.values[i+1][4]
      )
    end

    # デバック用
    # quiz = Quiz.create(title: "test", url: "test", spreadsheet_id: "test")
    # コンソールにて SpreadsheetsImportJob.perform_now("19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30", ["シート1!A:E"], 1) を実行する
  end

  private

    def google_spreadsheet_service
      @google_spreadsheet_service ||= Google::Spreadsheets.new
    end

end