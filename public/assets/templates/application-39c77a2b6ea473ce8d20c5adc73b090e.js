Ember.TEMPLATES["application"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, hashTypes, hashContexts, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  data.buffer.push("<div style=\"width: 600px; border: 6px solid #eee; margin: 0 auto; padding: 20px; text-align: center; font-family: sans-serif;\">\n  <img src=\"http://emberjs.com/images/about/ember-productivity-sm.png\" style=\"display: block; margin: 0 auto;\">\n  <h1>Welcome to Ember.js!</h1>\n  <p>You're running an Ember.js app on top of Ruby on Rails. To get started, replace this content\n  (inside <code>app/assets/javascripts/templates/application.handlebars</code>) with your application's\n  HTML.</p>\n</div>\n<div class=\"container\">\n  <div class=\"col-md-3\">\n    ");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.outlet || (depth0 && depth0.outlet)),stack1 ? stack1.call(depth0, "left-sidebar", options) : helperMissing.call(depth0, "outlet", "left-sidebar", options))));
  data.buffer.push("\n  </div>\n  <div class=\"col-md-6\">\n    ");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.outlet || (depth0 && depth0.outlet)),stack1 ? stack1.call(depth0, "main", options) : helperMissing.call(depth0, "outlet", "main", options))));
  data.buffer.push("\n  </div>\n  <div class=\"col-md-3\">\n    ");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.outlet || (depth0 && depth0.outlet)),stack1 ? stack1.call(depth0, "right-sidebar", options) : helperMissing.call(depth0, "outlet", "right-sidebar", options))));
  data.buffer.push("\n  </div>\n</div>\n");
  return buffer;
  
});
