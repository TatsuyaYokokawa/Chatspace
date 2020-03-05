class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string  :image
      t.text    :body, null: false
      t.integer :group_id	, null: false
      t.integer :user, null: false
      
      t.timestamps
    end
  end
end
