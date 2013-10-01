class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :pst 

      t.timestamps
    end
    add_index :comments, :pst_id
  end
end
