class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.integer :word_kid
      t.string :word

      t.timestamps
    end
  end
end
