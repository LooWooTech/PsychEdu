module HasAnAccount

  extend ActiveSupport::Concern

  included do
    has_one :account, :as => :owner, :dependent => :destroy
    delegate_account :login, :password

    validates :account, :presence => true

    accepts_nested_attributes_for :account
  end

  module ClassMethods
    def delegate_account(*attrs)
      attrs.each{|attr| delegate attr, :to => :account}
    end
  end
end
