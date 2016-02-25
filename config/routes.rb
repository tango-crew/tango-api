Rails.application.routes.draw do
  scope defaults: { format: 'json' } do
    resources :users do
      post :sign_in, on: :collection
    end
  end
end
