class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :hash

      t.timestamps
    end
  end
end
