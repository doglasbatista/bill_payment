class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :from, index: true, foreign_key: true
      t.belongs_to :to, index: true, foreign_key: true
      t.float :amount
      t.boolean :paid, default: false

      t.timestamps null: false
    end
  end
end
