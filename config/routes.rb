PsychEdu::Application.routes.draw do
  resource :session, :only => [:create, :destroy]

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
  end

end

  get 'signin' => 'sessions#new'

  root 'ask/questions#index'
end
