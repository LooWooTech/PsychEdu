class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :owner, :polymorphic => true

  validates :login, :presence => true

  class << self
    def authenticate(login, password)
      find_by(:login => login).try :authenticate, password
    end
  end
end
