class CaseAttachment < ActiveRecord::Base
  belongs_to :case_analysis
  mount_uploader :file, AttachmentsUploader
end
