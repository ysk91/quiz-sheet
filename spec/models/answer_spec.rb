require 'rails_helper'

RSpec.describe "Answerモデルのテスト" do
  describe "バリデーションのテスト" do
    # ダミーデータの使用
    let(:quiz) { FactoryBot.create(:quiz) }
    let!(:question) { build(:question, quiz_id: quiz.id) }
    let!(:answer) { build(:answer, question_id: question.id) }

    subject { test_answer.valid? }
    let(:test_answer) { answer }

    context "正しい投稿" do
      it "作成可能であること" do
        is_expected.to eq true;
      end
    end
  end
end

# RSpec.describe "Answerモデルのテスト" do
#   let!(:quiz) { FactoryBot.create(:quiz) }
#   let!(:question) { build(:question, quiz_id: quiz.id) }
#   let!(:correct) {"correct"}
#   let!(:incorrect_1) {"incorrect_1"}
#   let!(:incorrect_2) {"incorrect_2"}
#   let!(:comment) {"This is a comment for question."}
#   describe "quizが正しいかのテスト" do
#     it { is_expected(quiz.valid?).to eq true; }
#   end
#   describe "questionが正しいかのテスト" do
#     it { is_expected(question.valid?).to eq true; }
#   end
#   describe "バリデーションのテスト" do
#     it "correctの空欄を防ぐ" do
#       answer = Answer.create(
#         question_id: question.id,
#         correct: " ",
#         incorrect_1: incorrect_1,
#         incorrect_2: incorrect_2,
#         comment: comment
#       )
#       expect(answer.valid?).to eq false
#     end
#     it "incorrect_1の空欄を防ぐ" do
#       answer = Answer.create(
#         question_id: question.id,
#         correct: correct,
#         incorrect_1: " ",
#         incorrect_2: incorrect_2,
#         comment: comment
#       )
#       expect(answer.valid?).to eq false
#     end
#     it "incorrect_2の空欄を防ぐ" do
#       answer = Answer.create(
#         question_id: question.id,
#         correct: correct,
#         incorrect_1: incorrect_1,
#         incorrect_2: " ",
#         comment: comment
#       )
#       expect(answer.valid?).to eq false
#     end
#     it "commentの空欄を防ぐ" do
#       answer = Answer.create(
#         question_id: question.id,
#         correct: correct,
#         incorrect_1: incorrect_1,
#         incorrect_2: incorrect_2,
#         comment: " "
#       )
#       expect(answer.valid?).to eq false
#     end
#   end
#   describe "正しい投稿のテスト" do
#     it "投稿できる" do
#       answer = Answer.create(
#         question_id: question.id,
#         correct: correct,
#         incorrect_1: incorrect_1,
#         incorrect_2: incorrect_2,
#         comment: comment
#       )
#       expect(answer.valid?).to eq true
#     end
#   end
# end