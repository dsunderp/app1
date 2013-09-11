class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :profile_type
      t.string :name
      t.string :skills

      t.timestamps
    end
  end
end
