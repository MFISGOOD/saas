class AddPlanToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :plan_id, :integer
  end
end
