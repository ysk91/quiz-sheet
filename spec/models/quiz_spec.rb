require 'rails_helper'

RSpec.describe "Quizモデルのテスト" do
  describe "バリデーションのテスト" do
    let(:quiz) { FactoryBot.create(:quiz)}

    describe "正しい値" do
      it "quizが作成可能であること" do
        expect(quiz.valid?).to eq true;
      end
    end

    subject { test_quiz.valid? }
    let!(:test_quiz) { quiz }

    context "titleカラム" do
      it "空欄を防ぐこと" do
        test_quiz.title = " "
        is_expected.to eq false;
      end
      it "51文字以上を防ぐこと" do
        test_quiz.title = "a" * 51
        is_expected.to eq false;
      end
    end
    context "urlカラム" do
      it "空欄を防ぐこと" do
        test_quiz.url = " "
        is_expected.to eq false;
      end
      it "指定されたURL以外を防ぐこと" do
        test_quiz.url = "sample.com"
        is_expected.to eq false;
      end
    end
  end
end