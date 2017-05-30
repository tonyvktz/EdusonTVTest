Rails.application.routes.draw do
  resources :course_tests
  resources :courses
  resources :users
  resources :user_groups

  scope controller: :admin_enrollment, path: :admin_enrollment do
    get '/' => :index, as: :admin_enrollment
    get ':educable_type/:id/new' => :new, as: :new_admin_enrollment
    post ':educable_type/:id/create' => :create, as: :create_admin_enrollment
    get ':educable_type/:id/edit' => :edit, as: :edit_admin_enrollment
    post ':educable_type/:id/destroy' => :destroy, as: :destroy_admin_enrollment
    get ':educable_type/:id/show' => :show, as: :show_admin_enrollment
  end

  scope controller: :user_testing, path: :user_testing do
    get ':id/' => :index, as: :user_testing
    post ':id/:assignable_type/:assignable_id/pass' => :pass, as: :pass_user_testing
  end
end
