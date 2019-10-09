Rails.application.routes.draw do
  get 'home_page/index'
  devise_for :librarians , controllers:{sessions: 'librarians/sessions', registrations: 'librarians/registrations'}
  devise_for :students, controllers:{sessions: 'students/sessions',registrations: 'students/registrations'}
  devise_for :admins , controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}
  resources :admins
  resources :librarians
  resources :students
  #resources :bookmarks
  resources :book_histories
  resources :libraries
  get '/getBookmarkBooks' => 'books#getBookmarkBooks', :as => 'getBookmarkBooks'
  get '/getStudentBookFine' => 'books#getStudentBookFine', :as => 'getStudentBookFine'
  get '/getOverDueBooks' => 'books#getOverDueBooks', :as => 'getOverDueBooks'
  get '/viewBookHistory' => 'books#viewBookHistory', :as => 'viewBookHistory'
  get '/viewHoldRequest' => 'books#viewHoldRequest', :as => 'viewHoldRequest'
  root to: 'home_page#index'
  get '/list_checkedoutBooks' => 'books#list_checkedoutBooks', :as => 'list_checkedoutBooks'
  get '/viewHoldRequestForLibrarian' => 'books#viewHoldRequestForLibrarian', :as => 'viewHoldRequestForLibrarian'
  resources :books
  get '/list_students' => 'students#list_students',:as=> 'list_students'
  get '/list_librarians' => 'librarians#list_librarians',:as=> 'list_librarians'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
