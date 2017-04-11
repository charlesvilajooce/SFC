User.create!([
  {email: "admin@test.ch", password: "testtest", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2017-04-11 14:27:27", last_sign_in_at: "2017-04-11 14:25:04", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", level: nil, surname: "Charles", name: "Vila", birthday: "2017-04-11", parents: "", photo_url: nil, injured: false, injury_archive: "", suspended: false, cards_archive: "", role: nil, school: "", school_archive: "", physic_char: "", playtime: nil, arriving_date: "2017-04-11", endcontrat_date: "2017-04-11", sportactivity_archive: "", roles_mask: nil, avatar: nil, canrole: "admin", calendardate: "2017-04-11", calendartype: "week"},
  {email: "premiere@test.ch", password: "testtest", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-04-11 14:21:58", last_sign_in_at: "2017-04-11 13:58:24", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", level: nil, surname: "Valdo", name: "Fischer", birthday: "2017-04-11", parents: "", photo_url: nil, injured: false, injury_archive: "", suspended: false, cards_archive: "", role: nil, school: "", school_archive: "", physic_char: "", playtime: nil, arriving_date: "2017-04-11", endcontrat_date: "2017-04-11", sportactivity_archive: "", roles_mask: nil, avatar: nil, canrole: "premiere", calendardate: "2017-04-12", calendartype: "week"},
  {email: "undefined@test.ch", password: "testtest", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-11 13:58:42", last_sign_in_at: "2017-04-11 13:58:42", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", level: nil, surname: "Incognito", name: "Touriste", birthday: "2017-04-11", parents: "", photo_url: nil, injured: false, injury_archive: "", suspended: false, cards_archive: "", role: nil, school: "", school_archive: "", physic_char: "", playtime: nil, arriving_date: "2017-04-11", endcontrat_date: "2017-04-11", sportactivity_archive: "", roles_mask: nil, avatar: nil, canrole: "undefined", calendardate: nil, calendartype: nil},
  {email: "premiere2@test.ch", password: "testtest", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-11 13:58:55", last_sign_in_at: "2017-04-11 13:58:55", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", level: nil, surname: "Bernard", name: "Moret", birthday: "2017-04-11", parents: "", photo_url: nil, injured: false, injury_archive: "", suspended: false, cards_archive: "", role: nil, school: "", school_archive: "", physic_char: "", playtime: nil, arriving_date: "2017-04-11", endcontrat_date: "2017-04-11", sportactivity_archive: "", roles_mask: nil, avatar: nil, canrole: "premiere", calendardate: nil, calendartype: nil}
])
Event.create!([
  {name: "Sprint", description: "Travailler l'endurance", eventtype: 2, begin: 1491897600, end: 1491901200},
  {name: "FCsion", description: "Au stad de GE", eventtype: 1, begin: 1491912000, end: 1491915600},
  {name: "FCballe", description: "match a GE", eventtype: 1, begin: 1492074660, end: 1492078260}
])
Subscription.create!([
  {user_id: 2, event_id: 1, presense: nil},
  {user_id: 4, event_id: 1, presense: nil},
  {user_id: 2, event_id: 2, presense: nil},
  {user_id: 4, event_id: 2, presense: nil},
  {user_id: 2, event_id: 3, presense: nil}
])
