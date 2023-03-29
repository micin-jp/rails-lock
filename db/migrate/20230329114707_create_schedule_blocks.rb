class CreateScheduleBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_blocks, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.integer :capacity, null:false
      t.timestamps
    end
  end
end
