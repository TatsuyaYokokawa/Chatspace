class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id, null: false
      t.text    :body
      t.timestamps
    end
  end
end
