class SetDefaultTextForEntries < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :entries, :text, ""
  end
end
