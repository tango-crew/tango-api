Rails.application.routes.draw do
  scope defaults: { format: 'json' } do
    resources :users
  end
end
