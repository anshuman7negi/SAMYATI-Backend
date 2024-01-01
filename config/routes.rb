Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    post 'create_destination', to: 'destinations#create_destination'
    get 'destinations', to: 'destinations#display_destinations'
    delete 'delete_destination/:id', to: 'destinations#delete_destination'

    post 'find_buddy', to: 'buddies#find_buddy'
    get 'buddies', to: 'buddies#display_buddies'
    delete 'delete_buddy/:id', to: 'buddies#delete_buddy'
  end
  
end
