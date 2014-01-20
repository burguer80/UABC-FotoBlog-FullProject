class AddPosicionToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :posicion, :integer
  end
end
