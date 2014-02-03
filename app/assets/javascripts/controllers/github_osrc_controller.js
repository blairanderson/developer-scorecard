ReportCard.GithubOsrcController = Ember.ObjectController.extend({
  userLeader: function() {
    var list, name, usage, result;
    usage = this.get("model.usage");
    list = usage.languages;

    result = this.languages()

    if (list[0].quantile < 50) {
      result += this.quantile()
    }
    result += this.events();

    result += "."
    return result;
  }.property("model.userLeader"),

  languages: function() {
    var name, usage, list, languages, result;
    name = this.get("model.name");
    usage = this.get("model.usage");
    list = usage.languages;
    result = '';

    if (list && list.length > 0) {
      languages = "" + list[0].language + ", " + list[1].language + ", and " + list[2].language;
    }
    result = "" + name + " is a " + languages +" hacker";
    return result
  },

  quantile: function() {
    var usage, list, result;
    usage = this.get("model.usage");
    list = usage.languages;
    result = '';
    result += "(one of the " + list[0].quantile + "% most active " + list[0].language + " users, ";
    result += "and one of the " + list[1].quantile + "% most active " + list[1].language + " users) ";
    
    return result    
  },

  events: function() {
    var result, usage, main, verbs;
    usage = this.get("model.usage");
    main = usage.events[0].type;
    verbs = window.ReportCard.event_verbs
    return "spends a lot of time " + verbs[main];
  }

});