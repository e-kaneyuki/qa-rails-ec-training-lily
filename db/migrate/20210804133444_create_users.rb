class CreateUsers < ActiveRecord::Migration[6.0]

  def change

    create_table :user_classifications do |t|
      t.string :user_classification_name, limit: 32
      t.timestamps
    end

    create_table :users do |t|
      t.string :last_name, limit: 16
      t.string :first_name, limit: 16
      t.string :zipcode, limit: 16
      t.string :prefecture, limit: 16
      t.string :municipality, limit: 16
      t.string :address, limit: 32
      t.string :apartments, limit: 32
      t.string :email, limit: 128
      t.string :phone_number, limit: 16
      t.references :user_classification, null: false, foreign_key: true
      t.string :company_name, limit: 128
      t.boolean :delete_flag
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string, limit: 64

  end
end
