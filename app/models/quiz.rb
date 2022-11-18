class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, {presence: true, length: {maximum: 50} }
  validates :url, presence: true
  validates :spreadsheet_id, presence: true
end
