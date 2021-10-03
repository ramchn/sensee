class AddAppliedStatusToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :applied, :boolean
  end
end
