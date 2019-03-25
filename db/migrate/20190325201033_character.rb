class Character < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.text :name
      t.text :status
    end
  end
end
