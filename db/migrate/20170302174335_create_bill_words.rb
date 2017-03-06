class CreateBillWords < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_words do |t|
      t.integer :bill_kid
      t.integer :word_kid

      t.timestamps
    end
  end
end
