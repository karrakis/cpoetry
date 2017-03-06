class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :link
      t.integer :bill_kid

      t.timestamps
    end
  end
end
