# For more information see: http://emberjs.com/guides/routing/

ReportCard.Router.map ()->
  @route("user", path: "/" )
  @resource('dashboard')

ReportCard.Router.reopen(rootURL: '/')