FactoryBot.define do
  factory :quiz do
    title { "test_quiz" }
    url { "https://docs.google.com/spreadsheets/d/RSpecTest/edit#gid=0" }
    spreadsheet_id { "RSpecTest" }
  end
end