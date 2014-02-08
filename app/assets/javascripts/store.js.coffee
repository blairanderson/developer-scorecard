# http://emberjs.com/guides/models/using-the-store/

ReportCard.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

ReportCard.Adapter.map('ReportCard.Connection', {
  connections: {embedded: 'always'}
});

ReportCard.Store = DS.Store.extend({
  revision: 1,
  adapter:  ReportCard.Adapter.create()
});
