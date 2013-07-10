class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :account_id
      t.string :title

      t.timestamps
    end
  end
end
