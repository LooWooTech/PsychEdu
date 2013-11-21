class Administrator < ActiveRecord::Base
  has_secure_password

  validates :login, :presence => true
  
  def fourm_admin?(forum)
    true
  end

  class << self
    def authenticate(login, password)
      find_by(:login => login).try :authenticate, password
    end
  end
end
