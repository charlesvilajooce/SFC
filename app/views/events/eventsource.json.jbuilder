
json.success 1
temparray = []
@events.each do |event|
  if(current_user.canrole == 'admin')
    temppath = edit_event_partial_path(event)
  elsif(current_user.canrole == 'premiere')
    temppath = event_partial_path(event)
  end

  temparray.push({'id'=>event.id,'title'=>event.name,'description'=>event.description,'url'=>'','class'=>'cal_'+event.getcolor(),'start'=>event.begin*1000,'end'=>event.end*1000,'textstart'=>event.textstart(),'link'=>temppath})
end
json.result temparray
json.result



# json.set! :result do
#   json.array! @events, :id, :name, :begin*1000, :end
# end
# json.result json.array! @events, :id, :name
# json.array! @events, :id, :name