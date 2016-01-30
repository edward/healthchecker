class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.string :handle, index: true
      t.integer :champion
      t.integer :team
      t.integer :alignment
      t.integer :keeping_score
      t.integer :transparency
      t.integer :progress
      t.integer :quality
      t.integer :scrappy
      t.text :comments
      t.references :healthcheck

      t.timestamps
    end
  end
end
