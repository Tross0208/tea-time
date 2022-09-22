class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.float :price
      t.boolean :status
      t.string :frequency
      t.string :title
      t.string :string
      t.references :user, foreign_key: true
    end
  end
end
