module Admin
  module StudentsHelper
    def gender_options
      Student::GENDER.map{|key, value|[t(".#{key}" ), value]}
    end
  end
end
