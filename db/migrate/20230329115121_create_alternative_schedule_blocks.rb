class CreateAlternativeScheduleBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :alternative_schedule_blocks, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.integer :capacity, null:false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
