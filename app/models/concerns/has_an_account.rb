module HasAnAccount

  extend ActiveSupport::Concern

  included do
    has_one :account, :as => :owner, :dependent => :destroy
    delegate :username, :username=,
      :password, :password=,
      :password_confirmation, :password_confirmation=,
      :change_password, :to => :account

    validates :account, :presence => true

    accepts_nested_attributes_for :account, :update_only => true
  end

end
