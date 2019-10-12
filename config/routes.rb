Rails.application.routes.draw do
  # root to: "pictures#index"

  resources :users  
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
