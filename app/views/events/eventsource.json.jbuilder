
json.success 1
temparray = []
@events.each do |event|
  if(current_user.isadmin() )
    temppath = edit_event_partial_path(event)
  elsif(current_user.canrole == 'premiere')
    temppath = event_partial_path(event)
  end
  subs = event.subscriptions
  subscribed = subs.select{ |s| s.user.id == current_user.id }
  print('asd')
  print(subscribed)
  print(subscribed != [])
  print(current_user.isadmin())
  print('123')
  print(event.eventtype != 3)
  print(event.id)
  print(' '+event.eventtype.to_s)
  if( current_user.isadmin() || subscribed != [] || event.eventtype != 3)
  temparray.push({'id'=>event.id,'title'=>event.name,'description'=>event.description,'url'=>'','class'=>'cal_'+event.getcolor(),'start'=>event.begin*1000,'end'=>event.end*1000,'textstart'=>event.textstart(),'textend'=>event.textend(),'link'=>temppath})
  end
end
json.result temparray
json.result



# json.set! :result do
#   json.array! @events, :id, :name, :begin*1000, :end
# end
# json.result json.array! @events, :id, :name
# json.array! @events, :id, :name