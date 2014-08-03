require 'api_constraints'

Rails4Api::Application.routes.draw do
  
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
    devise_for :users, path: '/api/users',controllers: {
      registrations: 'api/v1/registrations',
      sessions: 'api/v1/sessions',
    }
  end
 

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :users, :only => [:index]
      resources :quiz, :only => [:create, :index]
      
      post 'quiz/submit'
    end
  end

  #root :to => "home#index"
end
