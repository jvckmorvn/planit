class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.boolean :locked
      t.string :name
      t.string :colour
      t.date :locked_start
      t.date :locked_end
      t.string :address

      t.timestamps
    end
  end
end
