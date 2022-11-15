class Quiz < ApplicationRecord

  has_many :questions, dependent: :destroy

  validates :title, {presence: true, length: {maximum: 50}}
  validates :url, presence: true
  validates :spreadsheet_id, presence: true

  validate :check_url

  def check_url
    unless self.url.start_with?("https://docs.google.com/spreadsheets/")
      errors.add(:base, "そのURLは使用できません")
    end
  end
  
end
