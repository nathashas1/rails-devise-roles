class CreatePageViews < ActiveRecord::Migration[5.0]
  def change
    create_table :page_views do |t|
      t.integer :user_id, null: false
      t.integer :page_viewed, default: 0, null: false

      t.timestamps
    end
    add_index :page_views, :user_id, unique: true
  end
end
