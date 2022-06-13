class AddStartEndDatesToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :proposed_start_date, :date
    add_column :events, :proposed_end_date, :date
  end
end
