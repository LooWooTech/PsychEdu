PsychEdu::Application.routes.draw do

  resource :session, :only => [:create, :destroy]

  get 'sign_in' => 'sessions#new'

  scope :module => :learning do
    constraints :subdomain => 'learning' do
      resource :password, :only => [:edit, :update], :path_names => {:edit => :change}
      resource :profile, :only => [:show]
      resource :final_exams, :only=> [:show]
      shallow do
        resources :case_analyses, :only => [:index, :show] do
          resources :topic_material_videos, :only => [:show]
        end
        resources :periods, :only => [:index, :destroy]
        resources :topic_learnings, :only => [:show, :index] do
          member do
            get :guide, :review, :exam
          end
          resources :periods, :only => [:create, :destroy]
          resources :heartbeats, :only => [:create]
          resources :topic_exams, :only => [:show] do
            member do
              patch :submit
            end
            resources :topic_exam_materials, :only => [:create, :destroy, :edit, :update]
          end
          resources :announcements, :only => :show
          resources :chapter_learnings, :only => :show do
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
        end
        resources :videos, :only => [] do
          resources :comments, :only => [:create, :destroy, :index]
        end
      end

      root 'chapter_learnings#index', :as => :learning
    end
  end

  scope :module => :admin do
    constraints :subdomain => 'admin' do
      shallow do
        resources :topic_materials, :except => :show
        resources :period_applications, :only => [:index] do
          member do
            patch :accept, :reject
          end
        end
        resources :monthly_online_trackings, :only => [:index]
        resources :students do
          resources :topic_learnings, :only => [:create]
          resources :unit_exams, :only => [:index]
        end
        resources :topic_learnings, :only => [:index, :destroy]
        resources :student_importings, :only => [:index, :create]
        resources :topic_testings, :only => [:new, :create, :show, :edit, :update, :index]
        resources :topic_exam_reviews, :only => [:show, :index, :update]
        resources :topic_exams, :only => [:index]
        resources :announcements
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
            patch 'top', 'refine'
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
