class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phonenumber
      t.text :description
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
