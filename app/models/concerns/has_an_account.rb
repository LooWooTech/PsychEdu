module HasAnAccount

  extend ActiveSupport::Concern

  included do
    has_one :account, :as => :owner, :dependent => :destroy
    delegate :username, :username=,
      :password, :password=,
      :password_confirmation, :password_confirmation=,
      :cipher, :cipher=,
      :cipher_answer, :cipher_answer=,
      :change_password, :to => :account

    validates :account, :presence => true

    accepts_nested_attributes_for :account, :update_only => true

    after_initialize :ensure_account
  end

  def ensure_account
    self.build_account if self.account.nil?
  end

end
