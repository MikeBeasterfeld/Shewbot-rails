class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :show_id
      t.integer :irc_user_id

      t.timestamps
    end
  end
end
