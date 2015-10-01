class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :origin
      t.string :slug

      t.timestamps null: false
    end

    add_index :links, :slug, :unique => true
  end
end
