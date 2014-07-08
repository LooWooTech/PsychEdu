module HasManyAttachments
  extend ActiveSupport::Concern
  included do
    has_many :attachments,
      :as => :article,
      :class_name => 'ArticleAttachment',
      :dependent => :destroy

    accepts_nested_attributes_for :attachments,
      :reject_if => lambda{|attr| attr[:file].blank? },
      :allow_destroy => true
  end
end
