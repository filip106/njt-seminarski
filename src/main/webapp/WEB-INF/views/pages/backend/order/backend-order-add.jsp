<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Orders</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="#">Show Orders By Location</a>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div id="page">
                    <div class="page-header">
                        <h1>Najnovije Rezervacije</h1>
                    </div>
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/resources/js/backend/reservation/moment.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/reservation/fullcalendar.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/reservation/sr.js' />"></script>
<script>
    var logedInUser = $('#logedInUser').val();
    var reservations = [];
    <c:forEach items="${allReservations}" var="reservation">
    reservations.push({
        id: ${reservation.id},
        start: "${reservation.start}",
        end: "${reservation.end}",
        status: "${reservation.orderStatus}"
    });
    </c:forEach>

    function generateEvents() {
        var eventsData = [];

        reservations.forEach(function (reservation) {
            var color;
            switch (reservation.status) {
                case 'PENDING':
                    color = 'orange';
                    break;
                case 'APPROVED':
                    color = 'green';
                    break;
                default:
                    color = 'red';
                    break;
            }
            eventsData.push({
                title: reservation.id,
                start: reservation.start,
                color: color,
                end: reservation.end
            });
        });

        return eventsData;
    }

    $(function () {
        var calendar = $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'agendaWeek, agendaDay'
            },
            firstDay: 1,
            businessHours: [
                {
                    dow: [1, 2, 3, 4, 5],
                    start: '08:00',
                    end: '18:00'
                },
                {
                    dow: [6, 7],
                    start: '10:00',
                    end: '16:00'
                }
            ],
            events: generateEvents(),
            defaultView: 'agenda',
            locale: 'sr',
            timezone: 'Europe/Belgrade',
            selectConstraint: 'businessHours',
            visibleRange: function (currentDate) {
                return {
                    start: currentDate,
                    end: currentDate.clone().add(7, 'days')
                };
            },
            validRange: function (nowDate) {
                return {
                    start: nowDate,
                    end: nowDate.clone().add(14, 'days')
                };
            },
            select: function (start, end) {
                var duration = (end - start) / 1000;
                if (duration == 1800) {
                    // set default duration to 1 hr.
                    end = start.add(30, 'mins');
                    return calendar.fullCalendar('select', start, end);
                }
                var title = prompt('Dodatne informacije:');
                if (title !== null) {
                    var textToDisplay = '"' + logedInUser + '"\n\r' + title.trim();
                    var eventData = {
                        title: textToDisplay,
                        start: start,
                        color: 'orange',
                        end: end
                    };
                    calendar.fullCalendar('renderEvent', eventData);
                }
                calendar.fullCalendar('unselect');
            }
        });
    });
</script>