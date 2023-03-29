Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :schedule_blocks, only: [] do
    post :lock_transaction
    post :not_lock_transaction
  end

  resource :alternative_schedule_blocks, only: [] do
    post :lock_transaction
  end
end
