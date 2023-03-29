class AlternativeScheduleBlocksController < ApplicationController
    def lock_transaction
        begin
            block = AlternativeScheduleBlock.first
            pp block

            AlternativeScheduleBlock.transaction do
              block.capacity -= 1
              block.save!
              sleep(6)
            end
        rescue ActiveRecord::StaleObjectError
           render json: {message: '予約が失敗しました'}, status: :internal_server_error and return
        end

       render json: {message: '予約完了', data:{capacity: block.capacity}}, status: :ok
    end
end
