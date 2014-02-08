Ember.Handlebars.registerBoundHelper 'currentDate', (option) ->
  moment().format('LL');

Ember.Handlebars.registerBoundHelper 'currentTime', (option) ->
  moment().format('h:mm:ss a');

Ember.Handlebars.helper 'link_to', (name, route) ->
  new Handlebars.SafeString("<a href='#{route}'>#{name}</a>")

Ember.Handlebars.helper "highlight", (value, options) ->
  escaped = Handlebars.Utils.escapeExpression(value)
  new Handlebars.SafeString("<span class=\"highlight\">" + escaped + "</span>")