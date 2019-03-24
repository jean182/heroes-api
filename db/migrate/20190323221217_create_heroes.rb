class CreateHeroes < ActiveRecord::Migration[5.2]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :real_name
      t.string :species
      t.text :abilities, array: true, default: []
      t.belongs_to :universe, index: true

      t.timestamps
    end
  end
end
