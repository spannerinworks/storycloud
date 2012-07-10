class CreateProjectsCardsAndSharedSequences < ActiveRecord::Migration
  def change
    create_table :shared_sequences do |t|
      t.integer :sequence, :default => 0, :null => false
      t.timestamps
    end

    create_table :cards do |t|
      t.integer :version, :default => 0, :null => false
      t.text :description
      t.integer :points
      t.string :status

      t.integer :project_id

      t.timestamps
    end

    create_table :projects do |t|
      t.integer :version, :default => 0, :null => false
      t.string :name
      t.integer :shared_sequence_id

      t.timestamps
    end

    add_index(:projects, [:name], :unique => true)
  end
end
