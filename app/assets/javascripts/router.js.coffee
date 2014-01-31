# For more information see: http://emberjs.com/guides/routing/

ReportCard.Router.map ()->
  @resource('user', { path: '/u/:slug' });

ReportCard.Router.reopen(rootURL: '/')