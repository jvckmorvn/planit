class CreateDayVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :day_votes do |t|
      t.references :day, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
