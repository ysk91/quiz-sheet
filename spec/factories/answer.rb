FactoryBot.define do
  factory :answer do
    # question_id: question.id で定義すること
    correct { "correct answer" }
    incorrect_1 { "incorrect_1 answer" }
    incorrect_2 { "incorrect_2 answer" }
    comment { "This is a comment for question." }
    question
  end
end