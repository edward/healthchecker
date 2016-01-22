class CreateHealthchecks < ActiveRecord::Migration[5.0]
  def change
    create_table :healthchecks do |t|
      t.string :handle, index: true, null: false

      t.timestamps
    end
  end
end
