module HasManyLinkedVideos
  extend ActiveSupport::Concern

  included do
    has_many :videos, :class_name => 'LinkedVideo', :as => :master, :dependent => :destroy
    accepts_nested_attributes_for :videos,
      :reject_if => lambda{|attr| attr[:url].blank? || attr[:name].blank?},
      :allow_destroy => true
  end
end
