<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="editedCourt" scope="request" type="com.silab.njt.springmvc.model.court.Court"/>

<style>
    .select2.select2-container {
        width: 100% !important;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Izmena Terena</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Izmena terena - <i>"${editedCourt.title}"</i></div>
            <div class="panel-body">
                <ul class="nav nav-tabs pull-right">
                    <li class="active"><a data-toggle="tab" href="#basic-info"> Osnovne Informacije</a></li>
                    <li><a data-toggle="tab" href="#additional-info"> Opis terena</a></li>
                    <li><a data-toggle="tab" href="#location-info"> Informacije o Lokaciji</a></li>
                    <li><a data-toggle="tab" href="#video-info"> Video Prezentacija</a></li>
                </ul>
                <div class="row">
                    <div class="tab-content">
                        <div id="basic-info" class="tab-pane fade in active">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="courtTitle">Naziv terena</label>
                                        <input class="form-control" id="courtTitle" name="courtTitle"
                                               value="${editedCourt.title}" placeholder="Naziv terena..." disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="shortDescription">Kratak opis</label>
                                        <textarea class="form-control" rows="3" id="shortDescription"
                                                  name="shortDescription">${editedCourt.shortDescription}</textarea>
                                        <p class="help-block">Kratak opis se prikazuje na stranici svih terena</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtImage">Slika Terena (Glavna)</label>
                                        <input type="file" id="courtImage" name="courtImage" class="dropify"
                                               data-default-file="${editedCourt.baseImage}" multiple/>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtDescription">Opis Terena</label>
                                        <textarea class="form-control" rows="3" id="courtDescription"
                                                  name="courtDescription">${editedCourt.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <div id="js-range-display-change"></div>
                                        <label for="courtPrice">Cena po Satu</label>
                                        <p style="max-height: 5px">&nbsp;</p>
                                        <input class="form-control js-range" id="courtPrice" name="courtPrice"
                                               data-start="${editedCourt.basePrice}">
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="additional-info" class="tab-pane fade">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="courtInfo">Osnovne Informacije o terenu</label>
                                        <textarea class="form-control" rows="3" id="courtInfo"
                                                  name="courtInfo"
                                                  placeholder="Informacije o terenu...">${editedCourt.info}</textarea>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="location-info" class="tab-pane fade">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="phoneNumber">Telefon</label>
                                        <input class="form-control" id="phoneNumber" name="phoneNumber"
                                               placeholder="Broj Telefona..." value="${editedCourt.phoneNumber}">
                                    </div>
                                    <div class="form-group">
                                        <label for="courtAddress">Adresa</label>
                                        <input class="form-control" id="courtAddress" name="courtAddress"
                                               placeholder="Adresa Terena" value="${editedCourt.address}">
                                    </div>
                                    <div class="form-group">
                                        <label for="working-hours">Radno vreme</label>
                                        <input class="form-control" id="working-hours" name="working-hours"
                                               placeholder="Radno vreme..." value="${editedCourt.workingHours}">
                                    </div>
                                    <div class="form-group">
                                        <label for="partOfCity" style="display: block">Deo grada</label>
                                        <select name="partOfCity" id="partOfCity" class="form-control" disabled>
                                            <option value="${editedCourt.partOfCity}"
                                                    selected>${editedCourt.partOfCity}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtBase" style="display: block">Podloga</label>
                                        <select name="courtBase" id="courtBase" class="form-control" disabled>
                                            <option value="${editedCourt.courtBase}"
                                                    selected>${editedCourt.courtBase}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="numberOfPlayers" style="display: block">Broj Igrača</label>
                                        <select name="numberOfPlayers" id="numberOfPlayers" class="form-control"
                                                disabled>
                                            <option value="${editedCourt.numberOfPlayers}"
                                                    selected>${editedCourt.numberOfPlayers}</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="video-info" class="tab-pane fade">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="courtVideo">Video Prezentacija (Embeded Video)</label>
                                        <textarea class="form-control" id="courtVideo" name="courtVideo"
                                                  placeholder="Link ka video prezentaciji...">${editedCourt.video}</textarea>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="pull-right" style="margin-top: 30px">
                            <button id="save-edited-court-btn" class="btn btn-primary">Sacučuvaj izmene</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/resources/js/backend/tinymce/tinymce.min.js' />"></script>
<script>
    var courtId = '${editedCourt.id}';
    var powerange = $('.js-range');

    powerange.change(function () {
        $('#js-range-display-change').html('<p>' + $(this).val() + ' RSD</p>');
    });

    $('#save-edited-court-btn').on('click', function () {
        if (!isCourtValid()) {
            return;
        }
        var editedCourtObj = {
            id: courtId
        };

        $(this).prop('disabled', true);
        sendAuthorizeData('/private/json/court/' + courtId, editedCourtObj, 'PUT', courtEditedSuccessFunction, $(this));
    });

    function isCourtValid() {
        return true;
    }

    function courtEditedSuccessFunction(ctx, data, statusCode) {
        $(ctx).prop('disabled', false);
        if (statusCode === 200) {
            toastr.success('Uspesno sacuvan teren');
        }
    }

    $(document).ready(function () {
        $('.js-switch').each(function (ind, item) {
            new Switchery(item);
        });

        powerange.each(function (ind, item) {
            new Powerange(item, {
                min: 200,
                max: 2000,
                step: 50,
                start: $(this).data('start'),
                hideRange: true
            });
        });

        $('.dropify').dropify({
            'default': 'Drag and drop image lago for the web site',
            'replace': 'Drag and drop or click to replace image',
            'remove': 'Remove image logo',
            'error': 'Ooops, something wrong happended.'
        });

        tinymce.init({
            selector: '#courtVideo',
            height: 500,
            menubar: false,
            plugins: [
                'advlist autolink lists link image charmap print preview anchor textcolor',
                'media searchreplace visualblocks code fullscreen',
                'insertdatetime media table contextmenu paste code help'
            ],
            toolbar: 'media | insert | undo redo |  styleselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
            content_css: [
                '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                '//www.tinymce.com/css/codepen.min.css']
        });
        tinymce.init({
            selector: '#courtInfo',
            height: 500,
            menubar: false,
            plugins: [
                'advlist autolink lists link image charmap print preview anchor textcolor',
                'media searchreplace visualblocks code fullscreen',
                'insertdatetime media table contextmenu paste code help'
            ],
            toolbar: 'media | insert | undo redo |  styleselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
            content_css: [
                '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                '//www.tinymce.com/css/codepen.min.css']
        });

        $('select').select2();
    });
</script>