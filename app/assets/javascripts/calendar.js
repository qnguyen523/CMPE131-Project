$(function() { // document ready
	/*$.get('/to_dos.json').then(function(toDos) {
		var events = [];
		_.forEach(toDos, function(todo) {
			events.push({
				title: todo.task,
				start: "2016-05-12",
			})
		});		

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: new Date(),
			editable: true,
		    eventLimit: true, // allow "more" link when too many events
		    events: events
		});
	});
*/
	function getMethods(obj) {
	  var result = [];
	  for (var id in obj) {
	    try {
	      if (typeof(obj[id]) == "function") {
	        result.push(id + ": " + obj[id].toString());
	      }
	    } catch (err) {
	      result.push(id + ": inaccessible");
	    }
	  }
	  return result;
	}

	$.get('/goals.json').then(function(_goal){
		var events = [];
		_.forEach(_goal, function(goal){
			console.log(goal.Date);
			events.push({
			
				title: goal.Goal,
				start: goal.Date,	
				end: goal.DueDate
			})
		});

		$('#calendar').fullCalendar({
			header:{
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: new Date(),
			editable: true,
			eventLimit: true,
			events: events
		});
	});

	
});