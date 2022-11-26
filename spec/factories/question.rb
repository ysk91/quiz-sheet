FactoryBot.define do
  factory :question do
    # quiz_id: quiz.id で定義すること
    question { "test_question" }
    quiz
  end
end