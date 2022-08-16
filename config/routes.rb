Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    collection do
      get '/users/:page', action: :index
    end
  end
end
