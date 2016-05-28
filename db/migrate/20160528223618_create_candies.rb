class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.integer :candy_type

      t.timestamps null: false
    end
  end
end
