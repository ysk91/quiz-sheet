require 'rails_helper'

RSpec.describe "quizのsystemテスト" do
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
end