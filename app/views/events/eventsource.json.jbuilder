
json.success 1
temparray = []
@events.each do |event|
  temparray.push({'id'=>event.id,'title'=>event.name,'description'=>event.description,'url'=>'','class'=>'cal_'+event.getcolor(),'start'=>event.begin*1000,'end'=>event.end*1000,'textstart'=>event.textstart(),'link'=>edit_event_partial_path(event)})
end
json.result temparray
json.result



# json.set! :result do
#   json.array! @events, :id, :name, :begin*1000, :end
# end
# json.result json.array! @events, :id, :name
# json.array! @events, :id, :name