class BlogArticle < ActiveRecord::Base
  PUBLISH_STATE = {
    :unrequested => 0,
    :unreviewed => 1,
    :accepted => 2,
    :rejected => 3
  }

  belongs_to :author, :class_name => 'Student'

  validates :title, :presence => true
  validates :content, :presence => true

  scope :published, lambda { where :publish_state => PUBLISH_STATE[:accepted] }
  scope :requested_publishing, lambda { where.not :publish_state => PUBLISH_STATE[:unrequested] }
  scope :unreviewed, lambda { where :publish_state => PUBLISH_STATE[:unreviewed] }

  delegate :name, :to => :author, :prefix => true

  def contains_image?
    !!cover_url
  end

  def cover_url
    content[/\<img .* src=['"]([^"']+)['"].+?\>/, 1]
  end

  def publishing_unrequested?
    publish_state == PUBLISH_STATE[:unrequested]
  end

  def publishing_accepted?
    publish_state == PUBLISH_STATE[:accepted]
  end

  def request_publishing
    update_attribute :publish_state, PUBLISH_STATE[:unreviewed]
  end

  def unpublish
    update_attribute :publish_state, PUBLISH_STATE[:unrequested]
  end

  def accept_publishing
    update_attribute :publish_state, PUBLISH_STATE[:accepted]
  end

  def reject_publishing
    update_attribute :publish_state, PUBLISH_STATE[:rejected]
  end
end
