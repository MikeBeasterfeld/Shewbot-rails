class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voterip
      t.integer :title_id

      t.timestamps
    end
  end
end
