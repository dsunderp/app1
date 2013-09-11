class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :skills
      t.integer :user_id
      t.datetime :expire_by
      t.datetime :start_date
      t.time :duration
      t.time :report_time
      t.decimal :maximum_bid

      t.timestamps
    end
  end
end
