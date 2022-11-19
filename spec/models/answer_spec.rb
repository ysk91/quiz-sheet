require 'rails_helper'

RSpec.describe "Answerモデルのテスト" do
  describe "バリデーションのテスト" do
    let(:quiz) { FactoryBot.create(:quiz) }
    let(:question) { FactoryBot.create(:question) }
  end
end