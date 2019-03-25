class Player < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :name
      t.integer :score
    end
  end
end
