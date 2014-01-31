ReportCard.UserRoute = Ember.Route.extend({
  // setupController: function(controller, model) {
  //   this.controllerFor('user').set('model', model);
  // }
  model: function(params) {
    return Ember.$.getJSON("/dashboards/blairanderson");
  },

  setupController: function(controller, model) {
    this.controllerFor('user').set('model', model.user);
    this.controllerFor('meta').set('model', model.meta_object);
  },
  renderTemplate: function() {
    this.render('ruby', {       // the template to render
      outlet: 'right-sidebar',  // the name of the outlet in the route's template
      controller: 'meta'        // the controller to use for the template
    });
    this.render('user', {
      outlet: 'main',
      controller: 'user'
    });
    this.render('javascript', {
      outlet: 'left-sidebar',
      controller: 'meta'
    });
  }
});