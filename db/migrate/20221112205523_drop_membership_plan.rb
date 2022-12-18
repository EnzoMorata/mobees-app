class DropMembershipPlan < ActiveRecord::Migration[6.0]
  def change
    drop_table :membership_plans
    drop_table :belongs_tos
  end
end
