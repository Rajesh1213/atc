Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'inbound/sms', to: 'inbound#sms'
      post 'inbound/sms', to: 'inbound#sms'
    end
  end
end

