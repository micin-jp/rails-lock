class AlternativeScheduleBlock < ApplicationRecord
    self.primary_key = :uid
    before_validation(on: :create) do
      self.uid = Digest::UUID.uuid_v4.tr('-', '')
    end
end
