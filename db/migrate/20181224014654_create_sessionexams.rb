class CreateSessionexams < ActiveRecord::Migration[5.2]
  def change
    create_table :sessionexams do |t|
      t.string :exam_name
      t.integer :period_for
      t.string :supervisor
      t.datetime :create_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
