class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.boolean :success
      t.references :user, foreign_key: true
      t.references :attempt, foreign_key: true
      t.references :assignable, polymorphic: true

      t.timestamps
    end
  end
end
