Rails.application.routes.draw do
   root to: 'students#index'
  # get 'students/show'
  # get 'students/edit'
  # get 'students/new'
  
  resources :students
end
