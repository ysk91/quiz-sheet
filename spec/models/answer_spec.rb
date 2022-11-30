require 'rails_helper'

RSpec.describe "Answerモデルのテスト" do
  describe "バリデーションのテスト" do
    # ダミーデータの使用
    let(:quiz) { FactoryBot.create(:quiz) }
    let!(:question) { FactoryBot.create(:question, quiz_id: quiz.id) }
    let!(:answer) { build(:answer, question_id: question.id) }

    describe "親モデルの作成テスト" do
      it "quizが作成可能であること" do
        expect(quiz.valid?).to eq true;
      end
      it "questionが作成可能であること" do
        expect(question.valid?).to eq true;
      end
    end

    subject { test_answer.valid? }
    let(:test_answer) { answer }

    context "正しい投稿" do
      it "作成可能であること" do
        is_expected.to eq true;
      end
    end
    context "エラー投稿" do
      it "correctが空欄はエラー" do
        test_answer.correct = " "
        is_expected.to eq false;
      end
      it "incorrect_1が空欄はエラー" do
        test_answer.incorrect_1 = " "
        is_expected.to eq false;
      end
      it "incorrect_2が空欄はエラー" do
        test_answer.incorrect_2 = " "
        is_expected.to eq false;
      end
      it "commentが空欄はエラー" do
        test_answer.comment = " "
        is_expected.to eq false;
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Questionモデルとの関係" do
      it "answerからみたquestion" do
        expect(Answer.reflect_on_association(:question).macro).to eq :belongs_to
      end
      it "answerからみたquestion" do
        expect(Question.reflect_on_association(:answer).macro).to eq :has_one
      end
    end
  end
end
