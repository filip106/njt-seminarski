<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Rezervacije</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="<c:url value='/backend/courts' />">Prikaži sve terene detaljno...</a>
            </div>
            <div class="panel-body">
                <table width="100%"
                       class="table table-striped table-bordered table-hover"
                       id="dataTables-example">
                    <thead>
                    <tr>
                        <th>Naziv terena</th>
                        <th>Broj Telefona</th>
                        <th>Deo Grada</th>
                        <th>Akcija</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allCourts}" var="court">
                        <tr>
                            <td>${court.title}</td>
                            <td>${court.phoneNumber}</td>
                            <td>${court.partOfCity}</td>
                            <td><a href="<c:url value='/backend/order/reservations/${court.id}' />">Upravljaj Rezervacija</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="well">
                    <h4>Pomoć oko rada sa tabelama korisnika</h4>
                    <p>
                        Tables is showing all orders made by users (both registered and
                        anonymous users), in order to accept or declined them. In Bet365,
                        we are giving you Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. inus nam natus nesciunt nisi omnis rem sit
                        veritatis!! <a target="_blank" href="https://google.rs/">Bet365.com</a>.
                    </p>
                    <form action="<c:url value='/backend/user/add' />">
                        <button class="btn btn-primary">Dodaj novog korisnika</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- DataTables JavaScript -->
<script src="<c:url value='/resources/js/backend/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/dataTables.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/dataTables.responsive.js' />"></script>

<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive : true
        });
    });
</script>