class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.integer :position
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
