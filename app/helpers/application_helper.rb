module ApplicationHelper
  def show_gender(user)
    Student::GENDER.invert[user.gender]
  end

  def topic_learning_state(topic_learning)
    if topic_learning.out_of_period?
      '超期'
    elsif topic_learning.ongoing?
      '在学'
    else
      '休学'
    end
  end

  def navigator_link(options)
    content_tag :li, :class => (controller.belongs_to_module?(options[:name]) ? 'active' : '') do
      link_to raw(options[:text]), options[:url]
    end
  end
end
