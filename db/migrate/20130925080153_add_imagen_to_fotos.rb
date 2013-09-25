class AddImagenToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :imagen, :string
  end
end
