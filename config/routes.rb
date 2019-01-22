Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'global#index'
  get '/getUser' => 'user#index'
  post '/insertUser' => 'user#create'
  put '/updateUser/:sysuser_id' => 'user#update'
  put '/deleteUser/:sysuser_id' => 'user#delete'
end
