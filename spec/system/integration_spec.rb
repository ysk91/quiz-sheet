require 'rails_helper'

RSpec.describe "結合テスト" do
  describe "Quiz投稿までの結合テスト" do
    let!(:test_title) {"test"}
    let!(:test_url) {"https://docs.google.com/spreadsheets/d/integration_test_url/edit#gid=0"}
    let!(:test_spreadsheet_id) {"integration_test_url"}
    context "投稿できる" do
      
      before do
        # new_quiz_pathへ移動
        visit new_quiz_path
      end
      # it "送信ボタンを押すとQuizモデルがひとつ増える" do
      #   # TitleとURLを正しく入力
      #   fill_in "quiz[title]", with: test_title
      #   fill_in "quiz[url]", with: test_url
      #   # 送信ボタンを押すとQuiz, Question, Answerインスタンスが1ずつ増える
      #   expect{find('input[name="commit"]').click}.to change {Quiz.count}.by(1)
      # end
      # quizzes/showが表示されている
      # quiz.idが表示されている
      # quiz.titleが表示されている
      # quiz.urlが表示されている
      # quiz.spreadsheet_idが表示されている
      # question.question(first)が表示されている
      # answer.correctが表示されている
      # answer.incorrect_1が表示されている
      # answer.incorrect_2が表示されている
      # answer.commentが表示されている
      # Quizに答えるボタンが表示されている
    end
    context "Titleがない" do
      before do
        # new_quiz_pathへ移動
        visit new_quiz_path
      end
      it "URLのみ記入するとquizzes/newに戻る" do
        # URLのみ記入
        fill_in "quiz[url]", with: test_url
        # 送信ボタンを押すとnew_quizzes_pathへ戻る
        expect{find('input[name="commit"]').click}.to change {Quiz.count}.by(0)
        expect(current_path).to eq(new_quiz_path)
      end
    end
    context "URLがない" do
      before do
        # new_quiz_pathへ移動
        visit new_quiz_path
      end
      it "Titleのみ記入するとquizzes/newに戻る" do
        # Titleのみ記入
        fill_in "quiz[title]", with: test_title
        # 送信ボタンを押すとnew_quizzes_pathへ戻る
        expect{find('input[name="commit"]').click}.to change {Quiz.count}.by(0)
        expect(current_path).to eq(new_quiz_path)
      end
    end
    context "URLの一意性を確認" do #未実装
      # new_quiz_pathへ移動
      # 同じURLを記入
      # 送信ボタンを押すとnew_quizzes_pathへ戻る
    end
  end
end