class CreateLocatableItems < ActiveRecord::Migration[5.1]
  def change
    create_table :locatable_items do |t|
      t.references :location, foreign_key: true
      t.references :locatable, polymorphic: true

      t.timestamps
    end
  end
end
