class RemoveAnswerFromQuestionModel < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answer, :boolean
  end
end
