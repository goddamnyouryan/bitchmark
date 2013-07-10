class RenameHashColumnToSomethingElse < ActiveRecord::Migration
  def change
    rename_column :accounts, :hash, :hash_id
  end
end
