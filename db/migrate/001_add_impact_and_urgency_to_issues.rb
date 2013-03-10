class AddImpactAndUrgencyToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :impact_id, :integer
    add_column :issues, :urgency_id, :integer
  end
end
