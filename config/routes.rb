Rails.application.routes.draw do
  root 'courses#index'
  get 'about', to: 'pages#about'

  get 'courses/new', to: 'courses#new'

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  post 'course_enroll', to: 'student_courses#create'
  
  resources :students, except: [:destroy]
end
