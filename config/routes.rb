Rails.application.routes.draw do
  root to: "pictures#index"
  resources :favorites, only: [:create, :destroy, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
