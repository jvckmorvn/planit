class AddCreatorToUserGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :user_groups, :is_creator, :boolean, default: false
  end
end
