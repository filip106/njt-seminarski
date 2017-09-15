<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .select2.select2-container {
        width: 100% !important;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Dodavanje Terena</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Dodavanje novog terena</div>
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
                                               placeholder="Naziv terena...">
                                    </div>
                                    <div class="form-group">
                                        <label for="shortDescription">Kratak opis</label>
                                        <textarea class="form-control" rows="3" id="shortDescription"
                                                  name="shortDescription" placeholder="Kratak opis..."></textarea>
                                        <p class="help-block">Kratak opis se prikazuje na stranici svih terena</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtImage">Slika Terena (Glavna)</label>
                                        <input type="file" id="courtImage" name="courtImage" class="dropify" multiple/>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtDescription">Opis Terena</label>
                                        <textarea class="form-control" rows="3" id="courtDescription"
                                                  name="courtDescription"
                                                  placeholder="Detaljan opis terena..."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <div id="js-range-display-change"></div>
                                        <label for="courtPrice">Cena po Satu</label>
                                        <p style="max-height: 5px">&nbsp;</p>
                                        <input class="form-control js-range" id="courtPrice" name="courtPrice"
                                               data-start="300">
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
                                                  name="courtInfo" placeholder="Informacije o terenu..."></textarea>
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
                                               placeholder="Broj Telefona...">
                                    </div>
                                    <div class="form-group">
                                        <label for="courtAddress">Adresa</label>
                                        <input class="form-control" id="courtAddress" name="courtAddress"
                                               placeholder="Adresa Terena">
                                    </div>
                                    <div class="form-group">
                                        <label for="working-hours">Radno vreme</label>
                                        <input class="form-control" id="working-hours" name="working-hours"
                                               placeholder="Radno vreme...">
                                    </div>
                                    <div class="form-group">
                                        <label for="partOfCity" style="display: block">Deo grada</label>
                                        <select name="partOfCity" id="partOfCity" class="form-control">
                                            <option value="-1" selected disabled>Izaberite deo grada...</option>
                                            <option value="Kaluđerica">Kaluđerica</option>
                                            <option value="Boleč">Boleč</option>
                                            <option value="Voždovac">Voždovac</option>
                                            <option value="Vračar">Vračar</option>
                                            <option value="Zemun">Zemun</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="courtBase" style="display: block">Podloga</label>
                                        <select name="courtBase" id="courtBase" class="form-control">
                                            <option value="-1" selected disabled>Izaberite podlogu...</option>
                                            <option value="VeštačkaTrava">Veštačka Trava</option>
                                            <option value="PrirodnaTrava">Prirodna Trava</option>
                                            <option value="Guma">Guma</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="numberOfPlayers" style="display: block">Broj Igrača</label>
                                        <select name="numberOfPlayers" id="numberOfPlayers" class="form-control">
                                            <option value="-1" selected disabled>Izaberite broj igrača...</option>
                                            <option value="4na4">4 na 4</option>
                                            <option value="5na5">5 na 5</option>
                                            <option value="6na6">6 na 6</option>
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
                                                  placeholder="Link ka video prezentaciji..."></textarea>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="pull-right" style="margin-top: 30px">
                            <button id="save-new-court-btn" class="btn btn-primary">Dodaj Teren</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="<c:url value='/resources/js/backend/tinymce/tinymce.min.js' />"></script>
<script>
    var powerange = $('.js-range');
    var courtImage = {
        id: null,
        imageBase64: null,
        imagePath: null
    };

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

    powerange.change(function () {
        $('#js-range-display-change').html('<p>' + $(this).val() + ' RSD</p>');
    });

    $('#save-new-court-btn').on('click', function () {
        if (!isCourtValid()) {
            return;
        }
        var title = $('#courtTitle').val();
        var description = $('#courtDescription').val();
        var shortDescription = $('#shortDescription').val();
        var info = tinymce.get('courtInfo').getContent();
        var basePrice = $('#courtPrice').val();
        var phoneNumber = $('#phoneNumber').val();
        var address = $('#courtAddress').val();
        var workingHours = $('#working-hours').val();
        var video = tinymce.get('courtVideo').getContent();
        var partOfCity = $('#partOfCity').val();
        var courtBase = $('#courtBase').val();
        var numberOfPlayers = $('#numberOfPlayers').val();
        var allCourtRelationship = [];
        $('.relationship-courts').each(function () {
            allCourtRelationship.push({
                id: $(this).data('courtid')
            });
        });

        var newCourt = {
            title: title,
            description: description,
            shortDescription: shortDescription,
            info: info,
            basePrice: basePrice,
            baseImage: courtImage.imageBase64.split(',')[1],
            image: courtImage,
            phoneNumber: phoneNumber,
            address: address,
            workingHours: workingHours,
            video: video,
            partOfCity: partOfCity,
            courtBase: courtBase,
            numberOfPlayers: numberOfPlayers
        };

        $(this).prop('disabled', true);
        sendAuthorizeData('<c:url value="/private/json/court/" />', newCourt, 'POST', saveNewCourtSuccessFunction, $(this));
    });

    function isCourtValid() {
        if (!$('#courtTitle').val()) {
            toastr.error('Naslov terena je obavezan');
            return false;
        }
        if (!document.getElementById('courtImage').files[0]) {
            toastr.error("Slika je obavezna");
            return false;
        }

        return true;
    }

    $('#courtImage').on('change', function () {
        getBase64(document.getElementById('courtImage').files[0]);
    });

    function saveNewCourtSuccessFunction(ctx, data, statusCode) {
        if (statusCode === 200) {
            toastr.success('Novi sportski teren je sacuvan');
        } else {
            $(ctx).prop('disabled', false);
            toastr.error('Greška pri čuvanju terena');
        }
    }

    function getBase64(file) {
        var reader = new FileReader();
        reader.onload = function () {
            courtImage.imageBase64 = reader.result;
        };
        reader.onerror = function (error) {
            alert('error while uploading file');
            console.log('Error: ', error);
        };
        reader.readAsDataURL(file);
    }
</script>