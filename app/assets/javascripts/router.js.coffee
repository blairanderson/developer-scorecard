# For more information see: http://emberjs.com/guides/routing/

ReportCard.Router.map ()->
  @route('user', { path: '/users/:slug' });
  @route('github', { path: '/github/:slug' });

ReportCard.Router.reopen(rootURL: '/')