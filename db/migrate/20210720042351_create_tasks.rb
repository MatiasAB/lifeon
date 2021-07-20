class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.integer :parent
      t.integer :user_id

      t.timestamps
    end
  end
end
