class CreatePoems < ActiveRecord::Migration[5.0]
  def change
    create_table :poems do |t|
      t.integer :poem_kid
      t.string :text

      t.timestamps
    end
  end
end
