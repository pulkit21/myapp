class CreatePsts < ActiveRecord::Migration
  def change
    create_table :psts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
