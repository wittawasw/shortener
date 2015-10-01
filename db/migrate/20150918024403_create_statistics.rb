class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.references :link, index: true, foreign_key: true
      t.integer :visit
      t.integer :unique_visit

      t.timestamps null: false
    end
  end
end
