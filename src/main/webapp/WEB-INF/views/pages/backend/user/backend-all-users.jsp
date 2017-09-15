<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Korisnici</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="#">Prikaži aktivnosti korisnika</a>
            </div>
            <div class="panel-body">
                <table width="100%"
                       class="table table-striped table-bordered table-hover"
                       id="dataTables-example">
                    <thead>
                    <tr>
                        <th>Id Korisnika</th>
                        <th>Korisničko ime</th>
                        <th>Email</th>
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Akcija</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr data-row-user-id="${user.id}">
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>
                                <a href="<c:url value='/backend/user/edit/${user.id}' />"><i
                                        class="fa fa-pencil-square-o"></i></a>
                                <a data-toggle="modal" href="#removeUserModal" data-userid="${user.id}"
                                   data-username="${user.username}" class="open-delete-user-modal"><i
                                        class="fa fa-trash-o"></i></a>
                            </td>
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

<div id="removeUserModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Brisanje Korisnika</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <p>Brišete korisnika <i>"<span class="username-span"></span>"</i></p>
                    <p>Da li ste sigurni da želite da obrišete korisnika</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Odustani</button>
                <button type="button" class="btn btn-primary" id="delete-user-modal-btn">Obriši korisnika</button>
            </div>
        </div>
    </div>
</div>

<!-- DataTables JavaScript -->
<script src="<c:url value='/resources/js/backend/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/dataTables.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/dataTables.responsive.js' />"></script>

<script>

    var deleteUserBtn = $('#delete-user-modal-btn');
    var currentDeletingUserId = null;
    var removeUserModal = $('#removeUserModal');
    var userDataTable;

    $('.open-delete-user-modal').on('click', function () {
        removeUserModal.find('.username-span').html($(this).attr('data-username'));
        currentDeletingUserId = $(this).attr('data-userid');
    });

    deleteUserBtn.on('click', function () {
        $(this).prop('disabled', true);
        sendAuthorizeData('/private/json/user/' + currentDeletingUserId, '', 'DELETE', successRemoveUserFunction, $(this));
    });

    function successRemoveUserFunction(ctx, data, statusCode) {
        $(this).prop('disabled', false);
        if (statusCode === 204) {
            userDataTable.row($('[data-row-user-id="' + currentDeletingUserId + '"]'))
                .remove()
                .draw();
            toastr.success('Uspešno obrisan korisnik');
        } else {
            toastr.error('Greška prilikom brisanja korisnika');
        }
        currentDeletingUserId = null;
        $('#removeUserModal').modal('hide');
    }

    removeUserModal.on('hidden.bs.modal', function () {
        currentDeletingUserId = null;
    });

    $(document).ready(function () {
        userDataTable = $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>