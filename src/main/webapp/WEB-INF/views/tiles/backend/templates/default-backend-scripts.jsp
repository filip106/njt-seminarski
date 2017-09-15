<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    function sendAuthorizeData(route, data, method, successFunction, ctx) {
        $.ajax({
            url: route,
            method: method,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            xhrFields: {withCredentials: true},
            async: true,
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json"
        }).then(function (data, textStatus, xhr) {
            if (successFunction !== null) {
                successFunction(ctx, data, xhr.status);
            }
            return data;
        })
    }
</script>
<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/resources/js/backend/bootstrap.min.js' />"></script>
<%--JQuery ui--%>
<script src="<c:url value='/resources/js/backend/jquery-ui.min.js' />"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value='/resources/js/backend/metisMenu.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/sb-admin-2.js' />"></script>

<!--Switchery JavaScript-->
<script src="<c:url value='/resources/js/backend/switchery.min.js' />"></script>
<!--Dropify JavaScript-->
<script src="<c:url value='/resources/js/backend/dropify.min.js' />"></script>
<!--Powerange JavaScript -->
<script src="<c:url value='/resources/js/backend/powerange.min.js' />"></script>
<script src="<c:url value='/resources/js/backend/select2.full.min.js' />"></script>
<script src="<c:url value='/resources/js/common/toastr.min.js' />"></script>
<script>
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-left",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
</script>