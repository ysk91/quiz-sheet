class Answer < ApplicationRecord
  belongs_to :question, presence: true

  validates :correct, presence: true
  validates :incorrect_1, presence: true
  validates :incorrect_2, presence: true
  validates :comment, presence: true

end
