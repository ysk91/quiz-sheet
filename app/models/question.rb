class Question < ApplicationRecord

  belongs_to :quiz
  has_one :answer, dependent: :destroy

  validates :question, presence: true

end
