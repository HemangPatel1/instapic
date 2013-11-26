class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :caption

      t.timestamps
    end
  end
end
