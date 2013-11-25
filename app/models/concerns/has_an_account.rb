module HasAnAccount

  extend ActiveSupport::Concern

  included do
    has_one :account, :as => :owner, :dependent => :destroy
    delegate :login, :password, :to => :account

    validates :account, :presence => true

    accepts_nested_attributes_for :account, :update_only => true
  end

end
