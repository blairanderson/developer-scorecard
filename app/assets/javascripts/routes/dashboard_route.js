ReportCard.DashboardRoute = Ember.Route.extend({
  model: function(params) {
    return Ember.$.getJSON("/dashboard");
    // return ReportCard.Store.find('dashboard')
  },


  setupController: function(controller, model) {
    var user = model.user
    this.controllerFor('user').set('model', user);

    var connections = model.user.connections
    for (var i = 0; i < connections.length; i++) {
      var connection = connections[i]
      var stats = connection.stats
      for (var i = 0; i < stats.length; i++) {
        var stat = stats[i]
        this.controllerFor(stat.type).set('model', stat.event);
      };
    };
    this.controllerFor('meta').set('model', model.meta_object);
  },
  renderTemplate: function() {
    this.render('navigation', {outlet: 'callout'});
    this.render('dashboard', {outlet: 'left-sidebar', controller: 'user'});
    this.render('github_osrc', {outlet: 'main', controller: 'github_osrc'});
  //   this.render('meta', {outlet: 'left-sidebar', controller: 'meta'});
  }
});