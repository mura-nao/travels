class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.string :resource
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
