class CreateStaticpages < ActiveRecord::Migration
  def change
    create_table :staticpages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
