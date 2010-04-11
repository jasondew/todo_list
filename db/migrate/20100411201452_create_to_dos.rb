class CreateToDos < ActiveRecord::Migration
  def self.up
    create_table :to_dos do |t|
      t.string :description
      t.date :due_on
      t.timestamps
    end
  end

  def self.down
    drop_table :to_dos
  end
end
