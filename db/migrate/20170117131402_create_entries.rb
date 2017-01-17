class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.text :text
      t.belongs_to :user, foreign_key: true
      t.date :date, index: true

      t.timestamps
    end
  end
end
