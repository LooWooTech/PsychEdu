module SessionHelpers
  def sign_in 
    controller.stub :current_user => FactoryGirl.create(:student)
  end

  def sign_in_as_administrator
    controller.stub :current_user => FactoryGirl.create(:administrator)
  end

  def sign_out
    controller.stub :current_user => nil
  end

  def current_user
    controller.current_user
  end
end
