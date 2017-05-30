class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.references :user_group, foreign_key: true

      t.timestamps

      t.index(:login, unique: true)
    end
  end
end
