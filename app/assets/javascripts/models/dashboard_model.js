ReportCard.Dashboard = DS.Model.extend({
  provider:             DS.attr('string'),
  nickname:             DS.attr('string'),
  name:                 DS.attr('string'),
  uid:                  DS.attr('integer'),
  email:                DS.attr('string'),
  image:                DS.attr('string'),
  remember_created_at:  DS.attr('date'),
  sign_in_count:        DS.attr('integer'),
  current_sign_in_at:   DS.attr('date'),
  last_sign_in_at:      DS.attr('date'),
  current_sign_in_ip:   DS.attr('string'),
  last_sign_in_ip:      DS.attr('string'),
  created_at:           DS.attr('date'),
  updated_at:           DS.attr('date'),
  connections:          DS.hasMany('connections'),
  // keychain:             DS.BelongsTo('keychain')
});

ReportCard.Dashboard.url = "/dashboard.json";
ReportCard.Dashboard.adapter = ReportCard.Adapter.create();
