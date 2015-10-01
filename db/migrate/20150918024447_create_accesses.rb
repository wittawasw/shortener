class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :ip
      t.references :link, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
