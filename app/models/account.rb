class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :owner, :polymorphic => true

  validates :username, :presence => true, :uniqueness => true

  def change_password(params)
    if authenticate params[:old_password]
      self.password = params[:password]
      self.password_confirmation = params[:password_confirmation]
      save
    else
      errors[:base] << '原密码不正确'
      false
    end
  end

  class << self
    def authenticate(username, password)
      find_by(:username => username).try :authenticate, password
    end
  end
end
