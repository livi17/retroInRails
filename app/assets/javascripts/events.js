
$( document ).ready(function() {

	var multiDaySelect;
	var singleDay = document.getElementById('event_single_day');
	var endDate = document.getElementById('end_date_div');

	var startYear;
	var startMonth;
	var startDay;

	var eventSubmit = $('#new_event');

	if( $(singleDay).prop('checked') ){
			//multi-day event
			$(endDate).show("fast" );
			multiDaySelect = true;
		} else {
			//single day event
			$(endDate).hide("fast" );
			multiDaySelect = false;
		}


	$( singleDay ).click(function() {
		if( $(singleDay).prop('checked') ){
			//multi-day event
			$(endDate).show("slow" );
			multiDaySelect = true;
		} else {
			//single day event
			$(endDate).hide("slow" );
			multiDaySelect = false;
		}
	});


	$( eventSubmit ).submit(function(e) {
		e.preventDefault();//prevent default submit functionality

		if( !$( singleDay ).prop('checked') ){ 

			//if NOT checked it is a single day
			startYear =  $('#event_start_date_1i').val();
			startMonth = $('#event_start_date_2i').val();
			startDay =   $('#event_start_date_3i').val();

			//if single day event, set end date to same day
			$("#event_end_date_1i").val(startYear);
			$("#event_end_date_2i").val(startMonth);
			$("#event_end_date_3i").val(startDay);
		} else {
			// if it is checked it is a multiday... make sure the end_date is later than the start_date

		}
		this.submit();
	});


});//end of document.ready

$(function() {
	$("#event_address").geocomplete();
});  