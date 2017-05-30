class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :assignable, polymorphic: true
      t.references :educable, polymorphic: true

      t.timestamps
    end
  end
end
