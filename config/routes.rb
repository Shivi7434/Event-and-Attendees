Rails.application.routes.draw do
  
    root 'users#new'
  
    #New User
    get 'register' => 'users#new', as: 'new_register'
    get'users/new' => 'users#new'
    #create user
    post 'register' => 'users#create', as: 'register'
    post 'users' => 'users#create'
    #show user
    get 'users/:id' => 'users#show', as: 'user'
    # New Login
    get 'login' => 'logins#new', as:'new_login'
    get 'logins/new' => 'logins#new'
    # Login
    post 'login' => 'logins#create' ,as: 'login'
    post 'logins'  => 'logins#create'
    # Logout   
    delete 'logout' => 'logins#destroy', as: 'logout'
    delete 'logins' => 'logins#destroy' 
    # Event Routes
    get 'events' => 'events#index', as: 'events'
    post 'events' => 'events#create', as: 'create_event'
    get 'events/:id' => 'events#show', as:'event'
    delete 'events/:id' => 'events#destroy', as: 'delete_event'
    # Attends Routes
    post 'join_event' => 'attends#create', as: 'join_event'
    delete 'leave_event' => 'attends#destroy', as: 'leave_event'
    #messages Route

    post 'messages' => 'messages#create', as: 'create_message'

end
  
