Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'global#index'
  get '/getUser' => 'user#index'
  post '/insertUser' => 'user#create'
  put '/updateUser/:sysuser_id' => 'user#update'
  delete '/deleteUser/:sysuser_id' => 'user#delete'
  get '/getRole' => 'role#index'
  post '/insertRole' => 'role#create'
  put '/updateRole/:sysrole_kode' => 'role#update'
  delete '/deleteRole/:sysrole_kode' => 'role#delete'
end
