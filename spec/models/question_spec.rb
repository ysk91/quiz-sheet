require 'rails_helper'

RSpec.describe "Questionモデルのテスト" do
  describe "バリデーションのテスト" do
    # ダミーデータの使用
    let(:quiz) { FactoryBot.create(:quiz) }
    let!(:question) {build(:question, quiz_id: quiz.id)}

    subject { test_question.valid? }
    let(:test_question) { question }

    context "正しい投稿" do
      it "作成可能であること" do
        is_expected.to eq true;
      end
    end
    context "questionカラム" do
      it "空欄でないこと" do
        test_question.question = " "
        is_expected.to eq false;
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Quizモデルとの関係" do
      it "1:Nの関係になっている" do
        expect(Question.reflect_on_association(:quiz).macro).to eq :belongs_to
      end
    end
  end
end