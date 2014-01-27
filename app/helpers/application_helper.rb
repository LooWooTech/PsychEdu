module ApplicationHelper
  def show_gender(user)
    Student::GENDER.invert[user.gender]
  end
end
