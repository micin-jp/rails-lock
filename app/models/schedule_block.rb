class ScheduleBlock < ApplicationRecord
    self.primary_key = :uid
    before_validation(on: :create) do
      self.uid = Digest::UUID.uuid_v4.tr('-', '')
    end
end

# == Schema Information
#
# Table name: schedule_blocks
#
#  capacity   :integer          not null
#  uid        :string           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
