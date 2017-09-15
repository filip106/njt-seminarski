<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    body {
        background: #f2f2f2;
        font-family: 'proxima-nova-soft', sans-serif;
        font-size: 14px;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .post-module {
        position: relative;
        z-index: 1;
        display: block;
        background: #FFFFFF;
        min-width: 270px;
        height: 470px;
        -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
        box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
        -webkit-transition: all 0.3s linear 0s;
        -moz-transition: all 0.3s linear 0s;
        -ms-transition: all 0.3s linear 0s;
        -o-transition: all 0.3s linear 0s;
        transition: all 0.3s linear 0s;
    }

    .post-module:hover,
    .hover {
        -webkit-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
        -moz-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
        box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
    }

    .post-module:hover .thumbnail img,
    .hover .thumbnail img {
        -webkit-transform: scale(1.1);
        -moz-transform: scale(1.1);
        transform: scale(1.1);
        opacity: .6;
    }

    .post-module .thumbnail {
        background: #000000;
        height: 400px;
        overflow: hidden;
    }

    .post-module .thumbnail .date {
        position: absolute;
        top: 20px;
        right: 20px;
        z-index: 1;
        background: #e74c3c;
        width: 55px;
        height: 55px;
        padding: 12.5px 0;
        -webkit-border-radius: 100%;
        -moz-border-radius: 100%;
        border-radius: 100%;
        color: #FFFFFF;
        font-weight: 700;
        text-align: center;
        -webkti-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .post-module .thumbnail .date .day {
        font-size: 13px;
    }

    .post-module .thumbnail .date .month {
        font-size: 12px;
        text-transform: uppercase;
    }

    .post-module .thumbnail img {
        display: block;
        width: 120%;
        -webkit-transition: all 0.3s linear 0s;
        -moz-transition: all 0.3s linear 0s;
        -ms-transition: all 0.3s linear 0s;
        -o-transition: all 0.3s linear 0s;
        transition: all 0.3s linear 0s;
    }

    .post-module .post-content {
        position: absolute;
        bottom: 0;
        background: #FFFFFF;
        width: 100%;
        padding: 30px;
        -webkti-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
        -moz-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
        -ms-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
        -o-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
        transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
    }

    .post-module .post-content .category {
        position: absolute;
        top: -34px;
        left: 0;
        background: #e74c3c;
        padding: 10px 15px;
        color: #FFFFFF;
        font-size: 14px;
        font-weight: 600;
        text-transform: uppercase;
    }

    .post-module .post-content .partner-action-buttons {
        position: absolute;
        top: -34px;
        padding: 10px 15px;
        color: #FFFFFF;
        font-size: 20px;
        font-weight: 600;
        border-radius: 50%;
        cursor: pointer;
    }

    .post-module .post-content .partner-action-buttons.partner-edit {
        right: 65px;
        background: #e2710e;
    }

    .post-module .post-content .partner-action-buttons.partner-remove {
        right: 10px;
        background: #e74c3c;
    }

    .post-module .post-content .title {
        margin: 0;
        min-height: 65px;
        padding: 0 0 10px;
        color: #333333;
        font-size: 26px;
        font-weight: 700;
    }

    .post-module .post-content .sub_title {
        margin: 0;
        padding: 0 0 20px;
        color: #e74c3c;
        font-size: 20px;
        font-weight: 400;
    }

    .post-module .post-content .description {
        display: none;
        color: #666666;
        font-size: 14px;
        line-height: 1.8em;
    }

    .post-module .post-content .post-meta {
        margin: 30px 0 0;
        color: #999999;
    }

    .post-module .post-content .post-meta .timestamp {
        margin: 0 16px 0 0;
    }

    .post-module .post-content .post-meta a {
        color: #999999;
        text-decoration: none;
    }

    .hover .post-content .description {
        display: block !important;
        height: auto !important;
        opacity: 1 !important;
    }

    .partner-container {
        margin-left: 60px;
        margin-right: 60px;
    }

    .partner-container:before,
    .partner-container:after {
        content: '';
        display: block;
        clear: both;
    }

    .partner-container .column {
        width: 50%;
        padding: 0 25px;
        -webkti-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: left;
    }

    .partner-container .column .demo-title {
        margin: 0 0 15px;
        color: #666666;
        font-size: 18px;
        font-weight: bold;
        text-transform: uppercase;
    }

    .partner-container .info {
        width: 300px;
        margin: 50px auto;
        text-align: center;
    }

    .partner-container .info h1 {
        margin: 0 0 15px;
        padding: 0;
        font-size: 24px;
        font-weight: bold;
        color: #333333;
    }

    .partner-container .info span {
        color: #666666;
        font-size: 12px;
    }

    .partner-container .info span a {
        color: #000000;
        text-decoration: none;
    }

    .partner-container .info span .fa {
        color: #e74c3c;
    }

    .partner-card {
        padding: 30px;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Svi Partneri</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Pregled svih partnera i njihov redosled prikazivanja</div>
            <div class="partner-container" style="padding: 25px;">
                <c:forEach items="${allPartner}" var="partner">
                    <div class="col-sm-4">
                        <div class="partner-card">
                            <div class="column">
                                <div class="post-module">
                                    <div class="thumbnail">
                                        <div class="date">
                                            <div class="day">27</div>
                                            <div class="month">Mar</div>
                                        </div>
                                        <img src="${partner.baseImage}"/>
                                    </div>
                                    <div class="post-content">
                                        <div class="category">Photos</div>
                                        <div class="partner-action-buttons partner-edit" data-partnerid="${partner.id}">
                                            <i class="fa fa-edit"></i>
                                        </div>
                                        <div class="partner-action-buttons partner-remove" data-toggle="modal"
                                             href="#removeCourtModal"
                                             data-partnerid="${partner.id}">
                                            <i class="fa fa-remove"></i>
                                        </div>
                                        <h1 class="title">${partner.caption}</h1>
                                        <h2 class="sub_title">${partner.partnerCategory.title}</h2>
                                        <p class="description">New York, the largest city in the U.S., is an
                                            architectural marvel with plenty of historic monuments, magnificent
                                            buildings and countless dazzling skyscrapers...<a
                                                    href="<c:url value='/backend/partner/edit/${partner.id}' />">
                                                Edit Partner</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div id="removeCourtModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Brisanje partnera?</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Odustani</button>
                <button type="button" id="remove-court" class="btn btn-primary">Obriši partnera</button>
            </div>
        </div>
    </div>
</div>


<script>
    var removeCourtId = null;

    $(document).ready(function () {
        $('.post-module').hover(function () {
            $(this).find('.description').stop().animate({
                height: "toggle",
                opacity: "toggle"
            }, 300);
        });

        $('.partner-edit').on('click', function () {
            window.location = '/backend/partner/edit/' + $(this).data('partnerid');
        })
    });

    $('.partner-remove').on('click', function () {
        removeCourtId = $(this).attr('data-partnerid');
    });

    $('#removeCourtModal').on('hidden.bs.modal', function () {
        removeCourtId = null;
    });

    $('#remove-court').on('click', function () {
        if (removeCourtId !== null) {
            sendAuthorizeData('/private/json/partner/' + removeCourtId, '', 'DELETE', deleteSuccessFunction, $(this));
        }
    });

    function deleteSuccessFunction(ctx, data, statusCode) {
        $('#removeCourtModal').modal('hide');
        if (statusCode === 200) {
            toastr.success('Uspešno obrisan partner.');
            $('[data-partnerid="' + removeCourtId + '"]').closest('.col-sm-4').remove();
            removeCourtId = null;
        }
    }
</script>