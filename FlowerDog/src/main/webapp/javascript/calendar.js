// 캘린더 생성하기


document.addEventListener('DOMContentLoaded', function() {
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendar.Draggable;
  
	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	let calendarBtnMonth = document.querySelector("[title='month view']");
	
	console.log(calendarBtnMonth);
	
		var calendar = new Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		views: {
			dayGridMonth: { buttonText: "month" },
			dayGridWeek: { buttonText: "week" },
			listMonth: { buttonText: "list month" },
			listYear: { buttonText: "list year" },
		},
		
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev today next',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek listMonth,listYear'
		},
		
		eventDidMount: function(info) {
			var tooltip = new Tooltip(info.el, {
			  title: info.event.extendedProps.description,
			  placement: 'top',
			  trigger: 'hover',
			  container: 'body'
			});
		  },
		
		// 달력 한글로 설정하기
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},

		eventClick: function(info) {
            var info_input = info.event;
			console.log(info_input);

			let calendar_head = document.querySelector('.calendar-board__head');
			let calendar_sday = document.querySelector('.calendar-board__sday');
			let calendar_eday = document.querySelector('.calendar-board__eday');
			let calendar_content = document.querySelector('.calendar-board__content');
			let calendar_back = document.querySelector('#calendar-color__back');
			let calendar_font = document.querySelector('#calendar-color__font');

			// start 날짜 +1
			let info_sday = info_input.start;
			let add_sday = new Date(info_sday);
			add_sday.setDate(info_sday.getDate()+1);		

			calendar_head.value = info_input.title;
			calendar_sday.value = add_sday.toISOString().substring(0, 10);
			calendar_eday.value = info_input.end.toISOString().substring(0, 10);
			calendar_content.value = info_input.extendedProps.description;
			calendar_back.value = info_input.backgroundColor;
			calendar_font.value = info_input.textColor;

			console.log("Title: " + info_input.title);
			console.log("Start Date: " + add_sday.toISOString().substring(0, 10));
			console.log("End Date: " + info_input.end.toISOString().substring(0, 10));
			console.log("Description: " + info_input.extendedProps.description);
			console.log("Color: " + info_input.backgroundColor);
			console.log("Text Color: " + info_input.textColor);
        },

		


		//initialDate: '2023-09-06', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		// locale: 'ko' // 한국어 설정

		/* 드래그로 이벤트 추가하기 */
		select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.

			var title = prompt('일정을 입력해주세요.');
			if (title) {
				calendar.addEvent({
					title: title,
					start: arg.start,
					end: arg.end,
					allDay: arg.allDay,
					borderColor : "black",
					backgroundColor : "#fae6df",
					textColor : "#000000",
					description: 'default0'
				})
			}

			var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			for (var i = 0; i < allEvent.length; i++) {
				var obj = new Object();     // Json 을 담기 위해 Object 선언
				// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
				obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
				obj.start = allEvent[i]._instance.range.start; // 시작
				obj.end = allEvent[i]._instance.range.end; 
				obj.backgroundColor = allEvent[i]._instance.range.backgroundColor; 
				obj.textColor = allEvent[i]._instance.range.textColor; 
				// obj.description = allEvent[i]._instance.range.extendedProps.description; // if문돌려서 검증하세요

				events.push(obj);
			}
			var jsondata = JSON.stringify(events);
			console.log(jsondata);
			// saveData(jsondata);

			$(function saveData(jsondata) {
				$.ajax({
					url: "/full-calendar/calendar-admin-update",
					method: "POST",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
					.done(function (result) {
						// alert(result);
					})
					.fail(function (request, status, error) {
						 // alert("에러 발생" + error);
					});
				calendar.unselect()
			});
		},

		/* 드래그로 이벤트 수정하기 */
		eventDrop: function (info){
			console.log(info);
			if(confirm("'"+ info.event.title +"'일정을 수정하시겠습니까 ?")){
			}
			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			var obj = new Object();

			obj.title = info.event._def.title;
			obj.start = info.event._instance.range.start;
			obj.end = info.event._instance.range.end;
			obj.backgroundColor = info.event._instance.range.backgroundColor; 
			obj.textColor = info.event._instance.range.textColor; 
			obj.description = info.event._instance.range.extendedProps.description;
			events.push(obj);

			console.log(events);
			$(function deleteData() {
				$.ajax({
					url: "/full-calendar/calendar-admin-update",
					method: "PATCH",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
			})
		},
		

		//ex
		events: [
			{ // this object will be "parsed" into an Event Object
			  title: 'The Title', // a property!
			  start: '2023-09-01', // a property!
			  end: '2023-09-09', // a property! ** see important note below about 'end' **
			  backgroundColor : '#fae6df',
			  borderColor :'black',
			  textColor :'#999999',
			  description: 'Description1111111111111111111111111111111111111',
			}
		  ]


	});
	calendar.render();
});




	    /*이벤트 선택해서 삭제하기*/
		// eventClick: function calBoardDelete (info){
		// if(confirm("일정을 삭제하시겠습니까 ?")){
		// 	// 확인 클릭 시
		// 	info.event.remove();
		// }
		 
		// console.log(info.event);
		// var events = new Array(); // Json 데이터를 받기 위한 배열 선언
		// var obj = new Object();
		// 	obj.title = info.event._def.title;
		// 	obj.start = info.event._instance.range.start;
		// 	events.push(obj);
		 
		// console.log(events);
		// $(function deleteData(){
		// 	$.ajax({
		// 		url: "/full-calendar/calendar-admin-update",
		// 		method: "DELETE",
		// 		dataType: "json",
		// 		data: JSON.stringify(events),
		// 		contentType: 'application/json',
		// 		})
		// 	})
		// },
		// eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
		//
		// },

				// /* 드래그로 이벤트 추가하기 */
		// select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.

		// 	var title = prompt('일정을 입력해주세요.');
		// 	if (title) {
		// 		calendar.addEvent({
		// 			title: title,
		// 			start: arg.start,
		// 			end: arg.end,
		// 			allDay: arg.allDay,
		// 		})
		// 	}

		// 	var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

		// 	var events = new Array(); // Json 데이터를 받기 위한 배열 선언
		// 	for (var i = 0; i < allEvent.length; i++) {
		// 		var obj = new Object();     // Json 을 담기 위해 Object 선언
		// 		// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
		// 		obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
		// 		obj.start = allEvent[i]._instance.range.start; // 시작
		// 		obj.end = allEvent[i]._instance.range.end; // 끝

		// 		events.push(obj);
		// 	}
		// 	var jsondata = JSON.stringify(events);
		// 	console.log(jsondata);
		// 	// saveData(jsondata);

		// 	$(function saveData(jsondata) {
		// 		$.ajax({
		// 			url: "/full-calendar/calendar-admin-update",
		// 			method: "POST",
		// 			dataType: "json",
		// 			data: JSON.stringify(events),
		// 			contentType: 'application/json',
		// 		})
		// 			.done(function (result) {
		// 				// alert(result);
		// 			})
		// 			.fail(function (request, status, error) {
		// 				 // alert("에러 발생" + error);
		// 			});
		// 		calendar.unselect()
		// 	});
		// },


		// 이벤트추가 버튼만들기
		// customButtons: {
		// 	addEventButton: {
		// 	  text: 'add event',
		// 	  click: function() {
		// 		var dateStr = prompt('Enter a date in YYYY-MM-DD format');
		// 		var date = new Date(dateStr + 'T00:00:00'); // will be in local time
	  
		// 		if (!isNaN(date.valueOf())) { // valid?
		// 		  calendar.addEvent({
		// 			title: 'dynamic event',
		// 			start: date,
		// 			allDay: true
		// 		  });
		// 		  alert('Great. Now, update your database...');
		// 		} else {
		// 		  alert('Invalid date.');
		// 		}
		// 	  }
		// 	}
		// },