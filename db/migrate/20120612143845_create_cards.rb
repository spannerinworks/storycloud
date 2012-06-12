class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :description
      t.integer :points
      t.string :status

      t.timestamps
    end
  end
end
