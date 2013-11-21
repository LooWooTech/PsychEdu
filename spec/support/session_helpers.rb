module SessionHelpers
  def login
    controller.stub :current_user => FactoryGirl.create(:student)
  end

  def login_as_administrator
    controller.stub :current_user => FactoryGirl.create(:administrator)
  end

  def logout
    controller.stub :current_user => nil
  end

  def current_user
    controller.current_user
  end
end
