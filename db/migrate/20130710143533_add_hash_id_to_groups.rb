class AddHashIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :hash_id, :string
    Group.find_each(&:save)
  end
end
