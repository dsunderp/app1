class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :post_id
      #t.decimal :price

      t.timestamps
    end
      add_index :bids, :user_id
      add_index :bids, :post_id
      add_index :bids, [:user_id, :post_id], unique: true

  end
end
