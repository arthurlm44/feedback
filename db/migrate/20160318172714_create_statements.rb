class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.text :phrase
    end
  end
end
