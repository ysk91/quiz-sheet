require 'rails_helper'

describe "quizzes_viewのテスト" do
  describe "new_quiz_pathの表示テスト" do
    before do
      visit new_quiz_path
    end
    it "Titleフォームが表示される" do
      expect(page).to have_field "quiz[title]"
    end
    it "URLフォームが表示される" do
      expect(page).to have_field "quiz[url]"
    end
    it "送信ボタンが表示される" do
      expect(page).to have_button "送信"
    end
  end
  describe "quizzes_pathの表示テスト" do
    before do
      visit quizzes_path
    end
    it "Created_atが表示される" do
      expect(page).to have_content "Created_at"
    end
    it "Titleが表示される" do
      expect(page).to have_content "Title"
    end
  end
end

describe "Quiz投稿までの結合テスト" do
  let(:quiz) {FactoryBot.create(:quiz)}
  let(:question) {build(:question, quiz_id: quiz.id)}
  describe "投稿できる" do
    # new_quiz_pathへ移動
    visit new_quiz_path
    # TitleとURLを正しく入力
    # 送信ボタンを押すとQuiz, Question, Answerインスタンスが1ずつ増える
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
  describe "Titleがない" do
    # new_quiz_pathへ移動
    # URLのみ記入
    # 送信ボタンを押すとnew_quizzes_pathへ戻る
  end
  describe "URLがない" do
    # new_quiz_pathへ移動
    # Titleのみ記入
    # 送信ボタンを押すとnew_quizzes_pathへ戻る
  end
  describe "URLの一意性を確認" do
    # new_quiz_pathへ移動
    # 同じURLを記入
    # 送信ボタンを押すとnew_quizzes_pathへ戻る
  end
end