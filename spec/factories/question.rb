FactoryBot.define do
  factory :question do
    quiz_id { " " } # quiz.idをmergeすること
    question { "test_quiz" }
  end
end