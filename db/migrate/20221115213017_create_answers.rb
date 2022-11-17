class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :correct
      t.string :incorrect_1
      t.string :incorrect_2
      t.text :comment

      t.timestamps
    end
  end
end
