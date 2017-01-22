class AddFgColorAndBgColorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fg_color, :string, default: '#000'
    add_column :users, :bg_color, :string, default: '#FFF'
  end
end
