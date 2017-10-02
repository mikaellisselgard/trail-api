class CreateMushrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :mushrooms do |t|
      t.string :species, null: false

      t.timestamps
    end
  end
end
