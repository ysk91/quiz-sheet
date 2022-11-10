class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :url
      t.string :spreadsheet_id

      t.timestamps
    end
  end
end
