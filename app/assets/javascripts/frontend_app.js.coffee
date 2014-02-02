#= require jquery
#= require jquery_ujs
#= require moment
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require report_card

# for more details see: http://emberjs.com/guides/application/
window.ReportCard = Ember.Application.create({
  LOG_TRANSITIONS: true
})

window.ReportCard.event_verbs = 
  "CommitCommentEvent": "commit comments",
  "CreateEvent": "new repos or branches",
  "DeleteEvent": "deletion of branches",
  "DownloadEvent": "creation of downloads",
  "FollowEvent": "following",
  "ForkEvent": "forking",
  "ForkApplyEvent": "fork merges",
  "GistEvent": "gist creation",
  "GollumEvent": "wiki edits",
  "IssueCommentEvent": "issue comments",
  "IssuesEvent": "new issues",
  "MemberEvent": "new collaborations",
  "PublicEvent": "open-sourcing",
  "PullRequestEvent": "pull requests",
  "PullRequestReviewCommentEvent": "pull request comments",
  "PushEvent": "pushes",
  "TeamAddEvent": "teams",
  "WatchEvent": "watching",
  "ReleaseEvent": "new releases"
   
window.ReportCard.event_actions = 
  "CreateEvent": "creating new repositories and branches",
  "CommitCommentEvent": "commenting on your commits",
  "FollowEvent": "following other users",
  "ForkEvent": "forking other people's code",
  "IssuesEvent": "creating issues",
  "IssueCommentEvent": "commenting on issues",
  "PublicEvent": "open sourcing new projects",
  "PullRequestEvent": "submitting pull requests"

window.ReportCard.times_of_day = [
  times: [0, 1]
  name: "around midnight"
,
  times: [1, 7]
  name: "in the wee hours"
,
  times: [7, 12]
  name: "in the morning"
,
  times: [12, 13]
  name: "around noon"
,
  times: [13, 18]
  name: "in the afternoon"
,
  times: [18, 21]
  name: "in the evening"
,
  times: [21, 24]
  name: "late at night"
]

window.ReportCard.week_types = [
  name: "a Tuesday tinkerer"
  vector: [1.0, 1.0, 10.0, 1.0, 1.0, 1.0, 1.0]
,
  name: "an early-week worker"
  vector: [1.0, 6.0, 4.0, 2.0, 1.0, 1.0, 1.0]
,
  name: "a weekend warrior"
  vector: [10.0, 1.0, 1.0, 1.0, 1.0, 1.0, 10.0]
,
  name: "a hump day hero"
  vector: [1.0, 1.0, 3.0, 10.0, 3.0, 1.0, 1.0]
,
  name: "a late-week deadliner"
  vector: [1.0, 1.0, 1.0, 3.0, 10.0, 1.0, 1.0]
,
  name: "a Friday hacker"
  vector: [1.0, 1.0, 1.0, 1.0, 1.0, 10.0, 1.0]
,
  name: "a fulltime hacker"
  vector: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
,
  name: "a Sunday driver"
  vector: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 10.0]
,
  name: "a nine-to-fiver"
  vector: [1.0, 5.0, 5.0, 5.0, 5.0, 5.0, 1.0]
]