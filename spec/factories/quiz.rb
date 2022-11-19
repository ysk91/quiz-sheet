FactoryBot.define do
  factory :quiz do
    title { "test_quiz" }
    url { "https://docs.google.com/spreadsheets/d/19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30/edit#gid=0" }
    spreadsheet_id { "19pNJTNF2lRx45zKisC7H3HtqVOrhbojwZToz0rRs_30" }
  end
end