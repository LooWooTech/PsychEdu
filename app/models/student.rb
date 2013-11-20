class Student < ActiveRecord::Base

    has_many :questions, 
      :as => 'questioner', :foreign_key => :questioner_id,
      :dependent => :nullify

    has_many :answers,
      :as => 'answerer', :foreign_key => :answerer_id,
      :dependent => :nullify

    has_many :comments,
      :as => 'commenter', :foreign_key => :commenter_id,
      :dependent => :nullify

    has_many :complaints,
      :as => 'complainer', :foreign_key => :complainer_id,
      :dependent => :nullify

end
