class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.references :user, foreign_key: true
      t.references :assignable, polymorphic: true
      t.boolean :success

      t.timestamps
    end
  end
end
