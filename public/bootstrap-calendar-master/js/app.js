(function($) {
	"use strict";
//for getting current view
		var sessionstart = "";
		sessionstart = $.ajax({url: "http://keepup.ch/index.php?r=calendar/getview", async: false,success: function(result){return result;}}).responseText; 
//end for getting current view	
//for getting current viewtype
		var sessiontype = "";
		sessiontype = $.ajax({url: "http://keepup.ch/index.php?r=calendar/getviewtype", async: false,success: function(result){return result;}}).responseText; 
//end for getting current viewtype		
	var options = {
		events_source: '/index.php?r=calendar/eventsource',
		view: sessiontype,
		tmpl_path: '/bootstrap-calendar-master/tmpls/',
		tmpl_cache: false,
		day: sessionstart,
		first_day: 1,
		language: 'fr-FR',
		
		time_start: '08:00',
		time_end: '20:00',
		time_split: '60',
		
		// ID of the element of modal window. If set, events URLs will be opened in modal windows.
		modal: '#events-modal',
		//	modal handling setting, one of "iframe", "ajax" or "template"
		modal_type: "ajax",
		onAfterEventsLoad: function(events) {
			if(!events) {
				return;
			}
			var list = $('#eventlist');
			list.html('');

			$.each(events, function(key, val) {
				$(document.createElement('li'))
					.html('<a href="' + val.url + '">' + val.title + '</a>')
					.appendTo(list);
			});
		},
		onAfterViewLoad: function(view) {
			$('.page-header h3').text(this.getTitle());
			$('.btn-group button').removeClass('active');
			$('button[data-calendar-view="' + view + '"]').addClass('active');
		},
		classes: {
			months: {
				general: 'label'
			}
		}
	};

	var calendar = $('#calendar').calendar(options);

	$('.btn-group button[data-calendar-nav]').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.navigate($this.data('calendar-nav'));
		});
	});

	$('.btn-group button[data-calendar-view]').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.view($this.data('calendar-view'));
		});
	});

	$('#first_day').change(function(){
		var value = $(this).val();
		value = value.length ? parseInt(value) : null;
		calendar.setOptions({first_day: value});
		calendar.view();
	});

	$('#language').change(function(){
		calendar.setLanguage($(this).val());
		calendar.view();
	});

	$('#events-in-modal').change(function(){
		var val = $(this).is(':checked') ? $(this).val() : null;
		calendar.setOptions({modal: val});
	});
	$('#format-12-hours').change(function(){
		var val = $(this).is(':checked') ? true : false;
		calendar.setOptions({format12: val});
		calendar.view();
	});
	$('#show_wbn').change(function(){
		var val = $(this).is(':checked') ? true : false;
		calendar.setOptions({display_week_numbers: val});
		calendar.view();
	});
	$('#show_wb').change(function(){
		var val = $(this).is(':checked') ? true : false;
		calendar.setOptions({weekbox: val});
		calendar.view();
	});
	$('#events-modal .modal-header, #events-modal .modal-footer').click(function(e){
		//e.preventDefault();
		//e.stopPropagation();
	});
}(jQuery));