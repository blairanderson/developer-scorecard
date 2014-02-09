ReportCard.Clock = Ember.Object.extend({
  currentTime:  null,
  currentDate:  null,
  globalTime:   null,

  init: function() {
    this.tick();
  },

  tick: function() {
    var now = moment()

    this.setProperties({
      globalTime: now,
      currentDate: now.format('LL'),
      currentTime: now.format('h:mm:ss a'),
    });

    var self = this;
    // EM.run.later works like SetTimeout
    Em.run.later( function(){
      self.tick();
    }, 1000);
  }
});

Ember.ControllerMixin.reopen({ clock: null });

ReportCard.Clock.reopenClass({
  register: function(container, application) {
    container.optionsForType('clock', { singleton: true });
    container.register('clock:main', application.Clock);
    container.typeInjection('controller', 'clock', 'clock:main');      
  }
})