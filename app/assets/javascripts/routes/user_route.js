ReportCard.UserRoute = Ember.Route.extend({
  model: function(params) {
    return Ember.$.getJSON("/users/" + params.slug);
  },

  setupController: function(controller, model) {
    var connections = model.connections
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
    this.render('github_osrc', {       // the template to render
      outlet: 'main',
      controller: 'github_osrc'        // the controller to use for the template
    });
    this.render('meta', {
      outlet: 'left-sidebar',
      controller: 'meta'
    });
  }
});