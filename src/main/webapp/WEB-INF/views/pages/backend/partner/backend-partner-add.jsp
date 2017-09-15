<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Dodaj Novog Partnera</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Dodavanje novog partnera</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <form>
                            <div class="form-group">
                                <label for="partnerCaption">Naziv partnera</label>
                                <input class="form-control" id="partnerCaption" name="partnerCaption"
                                       placeholder="Naziv partnera...">
                            </div>
                            <div class="form-group">
                                <label for="partnerCategory">Kategorija Partnera</label>
                                <div>
                                    <select name="partnerCategory" id="partnerCategory" class="form-control">
                                        <option value="-1" selected disabled>Izaberite tip partnera...</option>
                                        <c:forEach items="${partnerCategories}" var="partnerCategory" varStatus="loop">
                                            <option value="${partnerCategory.id}">${partnerCategory.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="partnerImage">Slika Partnera</label>
                                <input type="file" id="partnerImage" name="partnerImage" class="dropify"/>
                            </div>
                            <div class="form-group">
                                <label for="partnerActive" class="js-switch-label" style="display: block;">Prikaži
                                    Partnera</label>
                                <input type="checkbox" class="js-switch" id="partnerActive" name="partnerActive"
                                       checked>
                            </div>
                            <div class="form-group">
                                <label for="partnerWebSite">Web Sajt Partnera</label>
                                <input class="form-control" id="partnerWebSite" name="partnerWebSite"
                                       placeholder="Web sajt partnera..">
                            </div>
                            <div class="form-group">
                                <label for="partnerFacebookLink">Facebook Link</label>
                                <input class="form-control" id="partnerFacebookLink" name="partnerFacebookLink"
                                       placeholder="Facebook link...">
                            </div>
                            <div class="form-group">
                                <label for="partnerTwitterLink">Twitter Link</label>
                                <input class="form-control" id="partnerTwitterLink" name="partnerTwitterLink"
                                       placeholder="Twitter link...">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="pull-right">
                    <button id="save-general-settings-btn" class="btn btn-primary">Sacučuvaj izmene</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var partnerImage = {
        id: null,
        imageBase64: null,
        imagePath: null
    };
    $(document).ready(function () {
        $('.js-switch').each(function (ind, item) {
            new Switchery(item);
        });

        $('.dropify').dropify({
            'default': 'Dodajte ili prevucite sliku za partnera',
            'replace': 'Spustite sliku da biste zamenili',
            'remove': 'Obrišite sliku partnera',
            'error': 'Ups, nepredviđena greška.'
        });
    });

    $('#save-general-settings-btn').on('click', function () {
        if (!isPartnerValid()) {
            return;
        }
        var partner = {
            caption: $('#partnerCaption').val(),
            partnerCategory: {id: $('#partnerCategory').val()},
            baseImage: partnerImage.imageBase64.split(',')[1],
            image: partnerImage,
            partnerWebSite: $('#partnerWebSite').val(),
            facebookLink: $('#partnerFacebookLink').val(),
            twitterLink: $('#partnerTwitterLink').val()
        };

        $(this).prop('disabled', true);
        sendAuthorizeData('<c:url value="/private/json/partner/" />', partner, 'POST', savePartnerSuccessFunction, $(this));

    });

    $('#partnerImage').on('change', function () {
        getBase64(document.getElementById('partnerImage').files[0]);
    });

    function savePartnerSuccessFunction(ctx, data, statusCode) {
        if (statusCode === 201) {
            toastr.success('Partner saved successfully');
            setTimeout(function () {
                window.location.replace('<c:url value="/backend/partners" />');
            }, 2000);
        } else {
            $(this).prop('disabled', false);
            toastr.error('Error while saving partner');
        }
    }

    function isPartnerValid() {
        if (!$('#partnerCaption').val()) {
            toastr.error('Ime partnera je obavezno');
            return false;
        }
        if (!$('#partnerCategory').val()) {
            toastr.error("Odaberite kategoriju partnera");
            return false;
        }
        if (!document.getElementById('partnerImage').files[0]) {
            toastr.error("Slika je obavezna");
            return false;
        }

        return true;
    }

    function getBase64(file) {
        var reader = new FileReader();
        reader.onload = function () {
            partnerImage.imageBase64 = reader.result;
        };
        reader.onerror = function (error) {
            alert('error while uploading file');
            console.log('Error: ', error);
        };
        reader.readAsDataURL(file);
    }
</script>