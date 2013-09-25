class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
