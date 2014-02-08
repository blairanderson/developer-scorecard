ReportCard.UserController = Ember.ObjectController.extend({
  targetUrl: function() {
    var nickname = this.get("model.nickname");
    var github_url = "http://github.com/";
    return github_url + nickname;
  }.property("model.targetUrl"),
});