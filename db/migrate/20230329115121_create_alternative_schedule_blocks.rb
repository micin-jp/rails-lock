class CreateAlternativeScheduleBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :alternative_schedule_blocks do |t|

      t.timestamps
    end
  end
end
