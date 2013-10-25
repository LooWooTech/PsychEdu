module SessionHelpers
  def login
    controller.stub :current_user => FactoryGirl.create(:user)
  end

  def current_user
    controller.current_user
  end
end
