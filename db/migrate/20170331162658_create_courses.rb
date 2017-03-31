class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :number_students
      t.integer :number_credits
      t.integer :teacher_id

      t.timestamps
    end
  end
end
