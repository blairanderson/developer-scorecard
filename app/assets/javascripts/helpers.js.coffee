Ember.Handlebars.helper 'link_to', (name, route) ->
  new Handlebars.SafeString("<a href='" + route + name + "'>'" + name+ "</a>")

Ember.Handlebars.helper "highlight", (value, options) ->
  escaped = Handlebars.Utils.escapeExpression(value)
  new Handlebars.SafeString("<span class=\"highlight\">" + escaped + "</span>")
