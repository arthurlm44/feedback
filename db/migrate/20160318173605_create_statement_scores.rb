class CreateStatementScores < ActiveRecord::Migration
  def change
    create_table :statement_scores do |t|
      t.integer :review_id
      t.integer :statement_id
      t.integer :score
    end
  end
end
