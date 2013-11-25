class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :owner, :polymorphic => true

  validates :username, :presence => true, :uniqueness => true

  class << self
    def authenticate(username, password)
      find_by(:username => username).try :authenticate, password
    end
  end
end
