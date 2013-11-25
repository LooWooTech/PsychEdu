module HasAnAccount

  extend ActiveSupport::Concern

  included do
    has_one :account, :as => :owner, :dependent => :destroy
    delegates_attributes :login, :password, :password_confirmation, :to => :account

    validates :account, :presence => true
  end

end
