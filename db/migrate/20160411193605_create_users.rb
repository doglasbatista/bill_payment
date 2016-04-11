class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :credit

      t.timestamps null: false
    end
  end
end
