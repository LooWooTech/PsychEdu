class Admin < ActiveRecord::Base
  
  def fourm_admin?(forum)
    true
  end
end
