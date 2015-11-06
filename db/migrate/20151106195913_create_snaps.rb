class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
