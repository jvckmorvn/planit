class ChangeLockedDefaultInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column_default :events, :locked, from: true, to: false
  end
end
