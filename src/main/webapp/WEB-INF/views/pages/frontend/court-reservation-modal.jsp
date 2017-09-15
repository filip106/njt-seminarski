<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #placeReservationModal .modal-footer p,
    #placeReservationModal .page-header
    {
        text-align: center;
        vertical-align: middle;
    }
    #placeReservationModal .page-header {
        margin-top: 0;
    }
</style>

<div id="placeReservationModal" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Rezervacija Temina</h4>
            </div>
            <div class="modal-body">
                <h3>Korisnik: <i>"${logedInUser}"</i></h3>
                <div class="panel-body">
                    <div id="page">
                        <div class="page-header">
                            <h1>Online Rezervacija</h1>
                        </div>
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
            <input type="hidden" value="${logedInUser}" id="logedInUser">
            <div class="modal-footer">
                <p>Omogućio "Goool" - sajt za rezervacije</p>
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
    var courtId = '${court.id}';
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
            selectable: true,
            selectHelper: true,
            selectOverlap: false,
            selectConstraint: 'businessHours',
            visibleRange: function(currentDate) {
                return {
                    start: currentDate,
                    end: currentDate.clone().add(7, 'days')
                };
            },
            validRange: function(nowDate) {
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

                    var dataToSend = {
                        start: start.toISOString(),
                        end: end.toISOString(),
                        court: {id: courtId}
                    };

                    $.ajax({
                        url: '<c:url value="/json/add-new-order" />',
                        method: 'POST',
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                        },
                        xhrFields: {withCredentials: true},
                        async: true,
                        contentType: "application/json",
                        data: JSON.stringify(dataToSend),
                        dataType: "json"
                    }).then(function (data, textStatus, xhr) {
                        toastr.success('Uspesno postavljena rezervacija')
                    });
                }
                calendar.fullCalendar('unselect');
            }
        });

    });
</script>
