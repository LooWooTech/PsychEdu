PsychEdu::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resource :session, :only => [:create, :destroy]
  resources :articles, :only => [:show, :index]
  resources :blog_articles, :only => [:index, :show]

  get 'sign_in' => 'sessions#new'

  root 'welcome#index'

  namespace :learning do
    get :guide, :to => 'topic_learnings#guide'
    get :review, :to => 'topic_learnings#review'
    get :exam, :to => 'topic_learnings#exam'

    resource :password, :only => [:edit, :update], :path_names => {:edit => :change}
    resource :profile, :only => [:show]
    resource :supervision, :only => [:show]

    resources :blog_articles do
      member do
        patch :request_publishing, :unpublish
      end
    end

    resources :topic_learnings, :only => [:show, :index]
    resources :announcements, :only => :show
    resources :periods, :only => [:index, :create, :destroy]
    resources :heartbeats, :only => [:create]
    resources :linked_videos, :only => [:show]

    shallow do

      resources :case_analyses, :only => [:index, :show] do
        resources :topic_material_videos, :only => [:show]
      end

      resources :extended_topic_materials, :only => [:index, :show] do
        resources :topic_material_videos, :only => [:show]
      end

      resources :videos, :only => [] do
        resources :comments, :only => [:create, :destroy, :index]
      end

      resources :topic_exams, :only => [:index, :show] do
        member do
          patch :submit
        end
        resources :topic_exam_materials, :only => [:create, :destroy]
      end

      resources :unit_learnings, :only => :show do
        member do
          get :summary, :review
        end
        resources :video_watchings, :only => [:show, :update] do
          resources :notes, :only => [:create, :destroy, :index]
        end
        resources :unit_exams, :only => [:create, :update, :show, :index]
      end
    end

    root 'chapter_learnings#index'
  end

  namespace :admin do
    resource :setting, :only => [:edit, :update]

    resources :complaints, :only => [:index, :show] do
      member do
        patch :processed, :ignored
      end
    end

    resources :administrators
    resources :articles
    resources :forums, :except => [:show]
    resources :forum_catalogs, :except => [:show]
    resources :topic_materials, :except => :show
    resources :topic_exams, :only => [:index]
    resources :topic_exam_reviews, :only => [:show, :index, :update]
    resources :topic_exam_assignments, :only => [:index, :destroy]
    resources :topic_learnings, :only => [:index, :destroy]
    resources :student_importings, :only => [:index, :create]
    resources :topic_testings, :only => [:new, :create, :show, :edit, :update, :index]
    resources :monthly_online_trackings, :only => [:index]
    resources :announcements
    resources :comments, :only => [:index, :show, :destroy]

    resources :blog_articles, :only => [:index, :edit, :update] do
      member do
        patch :accept_publishing, :reject_publishing
      end
    end

    resources :period_applications, :only => [:index] do
      member do
        patch :accept, :reject
      end
    end

    shallow do 
      resources :students do
        resources :topic_learnings, :only => [:create]
        resources :unit_exams, :only => [:index]
      end
      resources :experts, :only => [:index] do
        resources :topic_exam_assignments, :only => [:new, :create]
      end
      resources :topics, :only => [:new, :create, :index, :show, :edit, :update, :destroy] do
        resources :chapters, :only => [:new, :create, :show, :edit, :update, :destroy] do
          resources :units, :only => [:new, :create, :show, :edit, :update, :destroy] do
            resources :singular_choice_questions, :only => [:edit, :update, :destroy]
            resources :multiple_choice_questions, :only => [:edit, :update, :destroy]
            member do
              post :import_questions
            end
          end
        end
      end
    end
    root 'home#index'
  end

  namespace :ask do
    concern :complainable do
      resources :complaints, :only => [:new, :create]
    end

    concern :commentable do
      resources :comments,
        :only => [:index, :create, :destroy],
        :concerns => :complainable
    end

    resources :answer_votes, :only => :create
    resources :answers, :only => :show
    resources :comments, :only => :show
    resources :questions, :only => :index

    shallow do
      resources :forums, :only => :show do
        resources :questions,
          :only => [:new, :create, :show, :edit, :update, :destroy],
          :concerns => [:commentable, :complainable] do

          member do
            patch 'top', 'refine'
          end

          resources :answers,
            :only => [:create, :edit, :update, :destroy],
            :concerns => [:commentable, :complainable]
        end
      end
    end
    root 'home#index'
  end

end
