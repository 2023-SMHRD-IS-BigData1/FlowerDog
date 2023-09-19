
let result_event = [];
let getData = [];
// DB에서 데이터 가져오기
// $.ajax({
//     url: "CalendarselectService",		// 데이터를 가져올 경로 설정
//     type: "POST",						// 데이터를 가져오는 방식
// 	data : {'calendarDBInfo': result_event },	// 받거나 넘겨줄 데이터, 필수작성
// 	traditional : true,   
//     success: function(data){	// 데이터를 가져왔을때 동작. 매개변수로 data 입력
//         console.log("연결성공");
// 		getData = JSON.stringify(data);
//         // console.log(JSON.stringify(data));

// 		console.log("for 전 : "+getData);

//         //var json = JSON.parse(data.trim());	// 가져온 데이터를 자바스크립트 객체로 변환해주는 작업이 필요
//                                             	// trim()을 통해 불필요한 여백 제거
//         // for (let i = 0; i < getData.length; i++) {
        	
//         // 	getData[i].start= getData[i].dayStart;
// 		// 	delete getData[i].dayStart;
// 		// 	console.log("for 문 안 : "+getData[i].dayStart);
//         // }
		
//     },
// 	error : function( error ) {
// 		console.log(error+"에러발생");

// 	}
// }) 	

// 캘린더 생성하기
document.addEventListener('DOMContentLoaded', function() {
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendar.Draggable;

	let NewEventCal;
	var events;
  
	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	let calendarBtnMonth = document.querySelector("[title='month view']");

	
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
		locale: 'ko', // 한국어 설정

		
		/* 드래그로 이벤트 추가하기 */
		select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.

			var title = prompt('일정을 입력해주세요.');
			if (title) {
					events = calendar.addEvent({
					title: title,
					start: arg.start,
					end: arg.end,
					allDay: arg.allDay,
					borderColor : "black",
					backgroundColor : "#fae6df",
					textColor : "#000000",
				})
				console.dir(events);
			}

			var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

/*			var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			for (var i = 0; i < allEvent.length; i++) {
				var obj = new Object();     // Json 을 담기 위해 Object 선언
				// alert(allEvent[i]._def.title); // 이벤트 명칭 알람
				obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
				obj.start = allEvent[i]._instance.range.start.toISOString().substring(0, 10); // 시작
				obj.end = allEvent[i]._instance.range.end.toISOString().substring(0, 10); 
				obj.backgroundColor = allEvent[i]._instance.range.backgroundColor; 
				obj.textColor = allEvent[i]._instance.range.textColor;
				
			
				console.dir(obj);
				events.push(obj);
			}*/
			var jsondata = JSON.stringify(events);
			console.dir(jsondata);
			/*console.dir(jsondata[0]);*/

			// saveData(jsondata);
			
			$(function saveData(events) {
				$.ajax({
					url: "CalendarinsertService",
					method: "GET",
					data : {'calendarEvent': jsondata },
					traditional : true,    				
					})
					.done(function (result) {
						console.log(result);
					})
					.fail(function (request, status, error) {
						 console.log("에러 발생" + error);
					});
					console.dir(events);
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
			events.push(obj);

			console.log(events);
			$(function deleteData() {
				$.ajax({
					url: "CalendarupdateService",
					method: "PATCH",
					dataType: "json",
					data: JSON.stringify(events),
					contentType: 'application/json',
				})
			})
		},
		
		
		// DB 에서 이벤트 가져오기
		// events: result_event,
		events: result_event,

	});
	calendar.render();

	//-------------------------------------------------------------------------------------------------------------

	window.onload = function(){

		let calendarData = getCalendarDataInDB();
	
		console.log(calendarData);
		var calendarOut = JSON.parse(calendarData.responseText);
		$.each(calendarOut,function(index,item){
			calendar.addEvent(item);
		})
		calendar.render();
	}

	//-------------------------------------------------------------------------------------------------------------
});


function saveEventToServer(event) {
	events = {
		title : event.title,
		start : event.start.toISOString().substring(0, 10),
		end : event.end.toISOString().substring(0, 10),
		borderColor : event.borderColor,
		backgroundColor : event.backgroundColor,
		textColor : event.textColor,
		/*description : event.description*/
	};
	
}

function getCalendarDataInDB(){

    return $.ajax({
       url: "CalendarselectService",      // 데이터를 가져올 경로 설정
       type: "GET",                  // 데이터를 가져오는 방식
	   async: false,
       data : {'calendarDBInfo': result_event },   // 받거나 넘겨줄 데이터, 필수작성
       traditional : true,  
       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
       success: function(data){   // 데이터를 가져왔을때 동작. 매개변수로 data 입력
          console.log("연결성공");
          console.log(data);
		//   data = JSON.parse(data);
          // getData = JSON.parse(data);
          // getData = data;
       },
       error : function( error ) {
          console.log(error+"에러발생");
       }
    }) 
 
 }
