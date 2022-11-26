require 'rails_helper'

RSpec.describe "Quizモデルのテスト" do
  describe "バリデーションのテスト" do
    let!(:test_title) {"test"}
    let!(:test_url) {"https://docs.google.com/spreadsheets/d/19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30/edit#gid=0"}
    let!(:test_spreadsheet_id) {"19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30"}

    describe "titleカラム" do
      it "空欄を防ぐこと" do
        quiz = Quiz.new(title: " ", url: test_url, spreadsheet_id: test_spreadsheet_id)
        expect(quiz.valid?).to eq false;
      end
      it "51文字以上を防ぐこと" do
        quiz = Quiz.new(title: "#{"a" * 51}", url: test_url, spreadsheet_id: test_spreadsheet_id)
        expect(quiz.valid?).to eq false;
      end
    end
    describe "urlカラム" do
      it "空欄を防ぐこと" do
        quiz = Quiz.new(title: test_title, url: " ", spreadsheet_id: " ")
        expect(quiz.valid?).to eq false;
      end
      it "指定されたURL以外を防ぐこと" do
        quiz = Quiz.new(title: test_title, url: "sample.com", spreadsheet_id: "sample")
        expect(quiz.valid?).to eq false;
      end
    end
    describe "サンプルインスタンスを作成する" do
      it "サンプルインスタンスを生成する" do
        quiz = Quiz.new(title: test_title, url: test_url, spreadsheet_id: test_spreadsheet_id)
        expect(quiz.valid?).to eq true;
      end
    end
  end
end