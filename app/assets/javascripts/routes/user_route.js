ReportCard.UserRoute = Ember.Route.extend({
  model: function(params) {
    return Ember.$.getJSON("/dashboards/" + params.slug);
  },

  setupController: function(controller, model) {
    this.controllerFor('user').set('model', model.user);
    stat = model.user.stats[0]
    if (stat.type === 'osrc') {
      this.controllerFor('osrc').set('model', stat.event);
    }
    this.controllerFor('meta').set('model', model.meta_object);
  },
  renderTemplate: function() {
    this.render('osrc', {       // the template to render
      outlet: 'main',
      controller: 'osrc'        // the controller to use for the template
    });
    this.render('user', {
      outlet: 'right-sidebar',  // the name of the outlet in the route's template
      controller: 'user'
    });
    this.render('javascript', {
      outlet: 'left-sidebar',
      controller: 'meta'
    });
  }
});