class CreatePsts < ActiveRecord::Migration
  def change
    create_table :psts do |t|
      t.string :title
      t.text :body
      t.references :user
      t.boolean :published, :default => false

      t.timestamps
    end
    add_index :psts, :user_id
  end
end
