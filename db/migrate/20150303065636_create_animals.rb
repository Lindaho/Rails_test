class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :sex
      t.text :desc

      t.timestamps null: false
    end
  end
end
