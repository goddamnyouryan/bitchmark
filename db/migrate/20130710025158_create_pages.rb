class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :group_id
      t.string :url

      t.timestamps
    end
  end
end
