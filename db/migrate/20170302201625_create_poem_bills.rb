class CreatePoemBills < ActiveRecord::Migration[5.0]
  def change
    create_table :poem_bills do |t|
      t.integer :poem_kid
      t.integer :bill_kid

      t.timestamps
    end
  end
end
