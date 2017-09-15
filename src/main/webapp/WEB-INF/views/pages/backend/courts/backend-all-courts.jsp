<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .all-courts-page .court-container {
        padding: 25px;
    }

    .all-courts-page .container {
        max-width: 1100px;
        margin: 0 auto;
    }

    .cards {
        display: -webkit-flex;
        display: flex;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-top: 15px;
        padding: 1.5%;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card {
        position: relative;
        margin-bottom: 20px;
        padding-bottom: 30px;
        background: #fefff9;
        color: #363636;
        text-decoration: none;
        -moz-box-shadow: rgba(0, 0, 0, 0.19) 0 0 8px 0;
        -webkit-box-shadow: rgba(0, 0, 0, 0.19) 0 0 8px 0;
        box-shadow: rgba(0, 0, 0, 0.19) 0 0 8px 0;
        -moz-border-radius: 4px;
        -webkit-border-radius: 4px;
        border-radius: 4px;
    }

    @media (max-width: 700px) {
        .card {
            width: 100%;
        }
    }

    @media (min-width: 700px) {
        .card {
            max-width: 320px;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        .card:nth-child(even) {
            margin-right: 0;
        }
    }

    @media (min-width: 980px) {
        .card:nth-child(even) {
            margin-right: 20px;
        }

        .card:nth-child(3n) {
            margin-right: 0;
        }
    }

    .card span {
        display: block;
    }

    .card .card-summary {
        padding: 5% 5% 3% 5%;
    }

    .card .card-header {
        position: relative;
        height: 175px;
        overflow: hidden;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        background-color: rgba(255, 255, 255, 0.15);
        background-blend-mode: overlay;
        -moz-border-radius: 4px 4px 0 0;
        -webkit-border-radius: 4px;
        border-radius: 4px 4px 0 0;
    }

    .card .card-header:hover, .card .card-header:focus {
        background-color: rgba(255, 255, 255, 0);
    }

    .card .card-title {
        background: rgba(157, 187, 63, 0.85);
        padding: 3.5% 0 2.5% 0;
        color: white;
        font-family: 'Roboto Condensed', sans-serif;
        text-transform: uppercase;
        position: absolute;
        bottom: 0;
        width: 100%;
    }

    .card .card-title h3 {
        font-size: 1.2em;
        line-height: 1.2;
        padding: 0 3.5%;
        margin: 0;
    }

    .card .card-meta {
        max-height: 0;
        overflow: hidden;
        color: #666;
        font-size: .78em;
        text-transform: uppercase;
        position: absolute;
        bottom: 5%;
        padding: 0 5%;
        -moz-transition-property: max-height;
        -o-transition-property: max-height;
        -webkit-transition-property: max-height;
        transition-property: max-height;
        -moz-transition-duration: 0.4s;
        -o-transition-duration: 0.4s;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
        -moz-transition-timing-function: ease-in-out;
        -o-transition-timing-function: ease-in-out;
        -webkit-transition-timing-function: ease-in-out;
        transition-timing-function: ease-in-out;
    }

    .card:hover, .card:focus {
        background: white;
        -moz-box-shadow: rgba(0, 0, 0, 0.45) 0px 0px 20px 0px;
        -webkit-box-shadow: rgba(0, 0, 0, 0.45) 0px 0px 20px 0px;
        box-shadow: rgba(0, 0, 0, 0.45) 0px 0px 20px 0px;
    }

    .card:hover .card-title, .card:focus .card-title {
        background: rgba(157, 187, 63, 0.95);
    }

    .card:hover .card-meta, .card:focus .card-meta {
        max-height: 1em;
    }

    .all-courts-page img {
        max-width: 100%;
    }

    .all-courts-page body {
        background: #f0f0f0;
        font-size: 17px;
        line-height: 1.4;
        font-family: 'Jaldi', sans-serif;
    }

    .all-courts-page * {
        -moz-transition-property: background-color, border-color, box-shadow, color, opacity, text-shadow, -moz-transform;
        -o-transition-property: background-color, border-color, box-shadow, color, opacity, text-shadow, -o-transform;
        -webkit-transition-property: background-color, border-color, box-shadow, color, opacity, text-shadow, -webkit-transform;
        transition-property: background-color, border-color, box-shadow, color, opacity, text-shadow, transform;
        -moz-transition-duration: 0.2s;
        -o-transition-duration: 0.2s;
        -webkit-transition-duration: 0.2s;
        transition-duration: 0.2s;
        -moz-transition-timing-function: linear;
        -o-transition-timing-function: linear;
        -webkit-transition-timing-function: linear;
        transition-timing-function: linear;
    }

    .card .court-action-buttons {
        position: absolute;
        z-index: 10;
        overflow: hidden;
        -moz-transition-property: max-height;
        -o-transition-property: max-height;
        -webkit-transition-property: max-height;
        transition-property: max-height;
        -moz-transition-duration: 0.4s;
        -o-transition-duration: 0.4s;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
        -moz-transition-timing-function: ease-in-out;
        -o-transition-timing-function: ease-in-out;
        -webkit-transition-timing-function: ease-in-out;
        transition-timing-function: ease-in-out;
        color: #FFFFFF;
        font-size: 20px;
        font-weight: 600;
        border-radius: 50%;
        cursor: pointer;
        max-height: 0;
    }

    .card:hover .court-action-buttons {
        padding: 11px;
        max-height: 2em;
    }

    .card .court-remove {
        right: 7px;
        top: 5px;
        background: #e74c3c;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Svi Tereni</h1>
    </div>
</div>
<div class="row all-courts-page">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Pregled svih terena</div>
            <div class="court-container">
                <div class="row">
                    <div class="container">
                        <div class="cards">
                            <c:forEach items="${allCourts}" var="court">
                                <a class="card" href="<c:url value='/backend/court/edit/${court.id}' />">
                                    <div class="court-action-buttons court-remove" data-courtid="${court.id}">
                                        <i class="fa fa-remove"></i>
                                    </div>
                                    <span class="card-header"
                                          style="background-image: url(<c:url value='${court.baseImage}'/>);">
                                        <span class="card-title">
                                            <h3>${court.title}</h3>
                                        </span>
                                    </span>
                                    <span class="card-summary">A summary will also be present. Usually two to three brief sentences about the content on the detail page.</span>
                                    <span class="card-meta">Published: June 18th, 2015</span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="removeCourtModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Brisanje terena?</h4>
            </div>
            <div class="modal-body">
                <p>Da li ste sigurni da zelite da obrisete teren?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Odustani</button>
                <button type="button" id="remove-court" class="btn btn-danger">Obriši teren</button>
            </div>
        </div>
    </div>
</div>

<script>
    var currentRemovingCourtId = null;
    var removeModal = $('#removeCourtModal');

    $(document).ready(function () {
        $('.court-remove').on('click', function (e) {
            e.preventDefault();
            currentRemovingCourtId = $(this).data('courtid');
            removeModal.modal('show');
        });
    });

    $('#remove-court').on('click', function () {
        $(this).prop('disabled', true);
        sendAuthorizeData('/private/json/court/' + currentRemovingCourtId, '', 'DELETE', successRemoveCourtFunction, $(this));
    });

    function successRemoveCourtFunction(ctx, data, statusCode) {
        $(ctx).prop('disabled', false);
        if (statusCode === 204) {
            toastr.success('Uspesno obrisan teren');
            removeModal.modal('hide');
            currentRemovingCourtId = null;
        } else {
            toastr.error('Greska prilikom brisanja terena. Probajte ponovo.');
        }
    }

</script>
