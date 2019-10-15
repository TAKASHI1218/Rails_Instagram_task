Rails.application.routes.draw do
  root to: "users#new"
  resources :favorites, only: [:create, :destroy, :show]
  resources :sessions
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end


# , only: [:new, :create, :destroy]
# resources :users
