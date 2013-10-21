class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :hass
      t.string :salt

      t.timestamps
    end
  end
end
