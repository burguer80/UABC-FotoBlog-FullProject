class AddUsuarioIdToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :usuario_id, :integer
  end
end
