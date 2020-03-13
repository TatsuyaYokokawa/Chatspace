class CreateMessagexxes < ActiveRecord::Migration[5.0]
  def change
    create_table :messagexxes do |t|
      t.string :content
      t.string :image
      t.references :group, foreign_key: true
      t.references :account, foreign_key: true
      t.timestamps
    end
  end
end
