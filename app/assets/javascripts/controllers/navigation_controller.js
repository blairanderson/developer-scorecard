ReportCard.NavigationController = Ember.ObjectController.extend({
  currentTime: function() {
    return this.get("clock.currentTime");
  }.property("clock.currentTime"),

  currentDate: function() {
    return this.get('clock.currentDate');
  }.property("clock.currentDate"),
});