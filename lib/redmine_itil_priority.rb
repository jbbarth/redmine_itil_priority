module RedmineItilPriority
  extend self

  def urgency_options
    [1,2,3].map do |i|
      [label("label_urgency_#{i}"), i]
    end
  end

  def impact_options
    [1,2,3].map do |i|
      [label("label_impact_#{i}"), i]
    end
  end

  def label(key)
    Setting["plugin_redmine_itil_priority"][key]
  end
end
