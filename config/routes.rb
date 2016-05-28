Rails.application.routes.draw do
  resources :candy, param: :candy_type, controller: 'candies'
  get 'candies', :to => 'candies#index'
end
