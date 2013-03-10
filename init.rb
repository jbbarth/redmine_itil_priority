Redmine::Plugin.register :redmine_itil_priority do
  name "Redmine ITIL Priority plugin"
  description "This plugin replaces Redmine's priority with an impact/urgency choice"
  author "Jean-Baptiste BARTH"
  author_url "mailto:jeanbaptiste.barth@gmail.com"
  requires_redmine :version_or_higher => "2.1.0"
  version "0.0.1"
  url "https://github.com/jbbarth/redmine_itil_priority"
end
