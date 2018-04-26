Rails.application.routes.draw do
  root to: "homes#index"
  get "/about", to: "abouts#index"
  get "/contact", to: "contacts#index"
  get "/event", to: "events#index"
  get "/schedules", to: "schedules#show"
  get "/booking", to: "tickets#index"
  resources :homes
  namespace :admin do
    resources :homes do
      get "delete"
    end
    resources :movies do
      get "delete"
    end
    resources :schedules do
      get "delete"
    end
    resources :cinemarooms do
      get "delete"
    end
    resources :seats do
      get "delete"
    end
    resources :users do
      get "delete"
    end
    resources :studios do
      get "delete"
    end
    resources :movietypes do
      get "delete"
    end
    resources :movies_movietypes do
      get "delete"
    end
    resources :schedule_times do
      get "delete"
    end
   end
end
