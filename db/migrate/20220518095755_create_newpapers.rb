class CreateNewpapers < ActiveRecord::Migration[6.1]
  def change
    create_table :newpapers do |t|
      t.string :name
     

      t.timestamps
    end
  end
end
