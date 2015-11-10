class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :token, null: false
      t.string :integration_id
      t.integer :integration_type
      t.date :birthday
      t.text :bio

      t.timestamps null: false
    end
  end
end
