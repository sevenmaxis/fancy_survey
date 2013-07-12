FancySurvey::Application.routes.draw do
  resources :users, defaults: {format: :json}

  root to: "users#index", defaults: {format: :json}
end
