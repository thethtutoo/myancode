Rails.application.routes.draw do
  root 'pages#home'
 get 'about' => 'pages#about' 
 get 'home' , to: 'pages#home'
end
