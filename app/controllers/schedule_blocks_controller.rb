class ScheduleBlocksController < ApplicationController
    def lock_transaction
        block = ScheduleBlock.lock.first

        ScheduleBlock.transaction do
            if block.capacity == 0
                render json: {message: '予約枠はありません', data:{capacity: block.capacity}}, status: :bad_request and return
            end
            block.capacity -= 1
            block.save!
            sleep(6)
        end

        render json: {message: '予約完了', data:{capacity: block.capacity}}, status: :ok
    end

    def not_lock_transaction
       block = ScheduleBlock.first
       pp block
       ScheduleBlock.transaction do
        sleep(6)
        if block.capacity == 0
            render json: {message: '予約枠はありません', data:{capacity: block.capacity}}, status: :bad_request and return
        end

         block.capacity -= 1
         block.save!
         sleep(6)
       end

       render json: {message: '予約完了', data:{capacity: block.capacity}}, status: :ok
    end
end
