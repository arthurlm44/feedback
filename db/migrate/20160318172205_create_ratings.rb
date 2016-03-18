class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :review_id
      t.integer :user_id
      t.integer :specificity
      t.integer :actionability
      t.integer :kindness
      t.timestamps
    end
  end
end
