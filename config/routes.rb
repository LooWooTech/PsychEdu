PsychEdu::Application.routes.draw do

  resource :session, :only => [:create, :destroy]

  get 'sign_in' => 'sessions#new'

  scope :module => :learning do
    constraints :subdomain => 'learning' do
      root 'period_applications#index', :as => :learning
    end
  end

  scope :module => :admin do
    constraints :subdomain => 'admin' do
      resources :students, :only => [:new, :create, :show, :edit, :update]
      shallow do
        resources :subjects, :only => [:new, :create, :index, :show, :edit, :update, :destroy] do
          resources :courses, :only => [:new, :create, :show, :edit, :update, :destroy] do
            resources :units
          end
        end
      end
      root 'students#index', :as => :admin
    end
  end

  scope :module => :ask do
    constraints :subdomain => 'ask' do
      concern :complainable do
        resources :complaints, :only => [:new, :create]
      end

      concern :commentable do
        resources :comments,
          :only => [:index, :create, :destroy],
          :concerns => :complainable
      end

      shallow do
        resources :questions,
          :only => [:new, :create, :show, :edit, :update, :destroy],
          :concerns => [:commentable, :complainable] do

          member do
            patch 'top'
            patch 'refine'
          end

          resources :answers,
            :only => [:create, :edit, :update, :destroy],
            :concerns => [:commentable, :complainable]
        end
      end
      root 'questions#index', :as => :ask
    end
  end

end
