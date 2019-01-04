class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :user

      t.timestamps null: false
    end
  end
end
