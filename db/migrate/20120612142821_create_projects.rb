class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :version, :default => 0, :null => false
      t.string :name

      t.timestamps
    end

    add_index(:projects, [:name], :unique => true)
  end
end
