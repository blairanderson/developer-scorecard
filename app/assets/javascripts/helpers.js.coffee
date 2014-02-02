Ember.Handlebars.registerBoundHelper 'currentDate', (option) ->
  moment().format('LL');

Ember.Handlebars.registerBoundHelper 'currentTime', (option) ->
  moment().format('h:mm:ss a');

Ember.Handlebars.helper 'link_to', (name, route) ->
  new Handlebars.SafeString("<a href='#{route}'>#{name}</a>")

Ember.Handlebars.helper 'link_to_github_user', (nickname, name) ->
  new Handlebars.SafeString("<a href='http://github.com/#{nickname}'>#{nickname}</a>")

Ember.Handlebars.helper "highlight", (value, options) ->
  escaped = Handlebars.Utils.escapeExpression(value)
  new Handlebars.SafeString("<span class=\"highlight\">" + escaped + "</span>")

Ember.Handlebars.helper 'profileBadge', (model) ->
  result = "<div>"
  result += "<a href='https://github.com/#{model.username}' target='_blank'>"
  result += "<img height='50' width='50' alt='#{model.username}' class='avatar' src='https://secure.gravatar.com/avatar/#{model.gravatar}?s=220&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png'>"
  result += "<span class='profile-name'>#{model.name}</span>"
  result += "</a>"
  result += "</div>"

  new Handlebars.SafeString(result)