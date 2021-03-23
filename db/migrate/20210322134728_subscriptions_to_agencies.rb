class SubscriptionsToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :subscribed, :boolean
    add_column :agencies, :stripeid, :string
  end
end
