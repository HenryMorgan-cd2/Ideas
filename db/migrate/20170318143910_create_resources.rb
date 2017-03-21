class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :file
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
