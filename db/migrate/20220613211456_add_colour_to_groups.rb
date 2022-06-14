class AddColourToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :colour, :string
  end
end
