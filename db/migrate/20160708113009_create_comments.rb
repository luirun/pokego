class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :zawartosc
      t.text :login
      t.integer :id_postu

      t.timestamps null: false
    end
  end
end
