class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :url, presence: true
  validates :spreadsheet_id, presence: true
end
