require 'rails_helper'

RSpec.describe "homeのsystemテスト" do
  describe "home画面表示のテスト" do
    describe "top画面の表示テスト" do
      before do 
        visit root_path
      end
      it "Quizをアップロードボタンが表示される" do
        expect(page).to have_button "Quizをアップロード"
      end
      it "Quiz作成はこちらリンクが表示される" do
        expect(page).to have_content "Quiz作成はこちら"
      end
      it "Quizに答えるボタンが表示される" do
        expect(page).to have_button "Quizに答える"
      end
    end
    describe "ページ遷移のテスト" do
      before do
        visit root_path
      end
      it "Quizアップロードへの遷移" do
        visit new_quiz_path
        expect(current_path).to eq("/quizzes/new")
      end
      it "Quizに答えるへの遷移" do
        visit quizzes_path
        expect(current_path).to eq("/quizzes")
      end
    end
  end
end