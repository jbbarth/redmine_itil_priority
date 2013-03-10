Redmine::Plugin.register :redmine_itil_priority do
  name "Redmine ITIL Priority plugin"
  description "This plugin replaces Redmine's priority with an impact/urgency choice"
  author "Jean-Baptiste BARTH"
  author_url "mailto:jeanbaptiste.barth@gmail.com"
  requires_redmine :version_or_higher => "2.1.0"
  version "0.0.1"
  url "https://github.com/jbbarth/redmine_itil_priority"
  settings :partial => 'settings/itil_priority',
           :default => {
             "label_urgency_1" => "Not urgent", "label_urgency_2" => "Normal", "label_urgency_3" => "Urgent",
             "label_impact_1" => "Low impact", "label_impact_2" => "Medium impact", "label_impact_3" => "Important impact",
             "priority_i1_u1" => 1, "priority_i1_u2" => 2, "priority_i1_u3" => 2,
             "priority_i2_u1" => 2, "priority_i2_u2" => 2, "priority_i2_u3" => 3,
             "priority_i3_u1" => 2, "priority_i3_u2" => 3, "priority_i3_u3" => 3
           }
end

# Extra classes
require_dependency 'redmine_itil_priority'

# Patch of core classes
ActionDispatch::Callbacks.to_prepare do
  require_dependency 'redmine_itil_priority/issue_patch'
end

# Little hack for using the "deface" gem in redmine:
# - redmine plugins are not railties nor engines, so deface overrides in app/overrides/ are not detected automatically
# - deface doesn"t support direct loading anymore ; it unloads everything at boot so that reload in dev works
# - hack consists in adding "app/overrides" path of the plugin in Redmine"s main #paths
# TODO: see if it"s complicated to turn a plugin into a Railtie or find something a bit cleaner
Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)
