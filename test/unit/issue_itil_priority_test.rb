require File.expand_path('../../test_helper', __FILE__)

class IssueItilPriorityTest < ActiveSupport::TestCase
  fixtures :projects, :users, :members, :member_roles, :roles,
           :groups_users,
           :trackers, :projects_trackers,
           :enabled_modules,
           :versions,
           :issue_statuses, :issue_categories, :issue_relations, :workflows,
           :enumerations,
           :issues, :journals, :journal_details,
           :custom_fields, :custom_fields_projects, :custom_fields_trackers, :custom_values,
           :time_entries

  test "#itil_priority" do
    issue = Issue.find(1)
    issue.safe_attributes = { "impact_id" => 1, "urgency_id" => 2 }
    issue.save
    issue.reload
    assert_equal 1, issue.impact_id
    assert_equal 2, issue.urgency_id
  end
end
