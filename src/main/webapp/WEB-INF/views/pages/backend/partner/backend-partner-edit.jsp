<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="partner" scope="request" type="com.silab.njt.springmvc.model.partner.Partner"/>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Izmena Partnera</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Izmena partnera - <i>"${partner.caption}"</i></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <form>
                            <div class="form-group">
                                <label for="partnerCaption">Naziv partnera</label>
                                <input class="form-control" id="partnerCaption" name="partnerCaption"
                                       value="${partner.caption}" placeholder="Naziv partnera...">
                            </div>
                            <div class="form-group">
                                <label for="partnerCategory">Kategorija Partnera</label>
                                <div>
                                    <select name="partnerCategory" id="partnerCategory" class="form-control">
                                        <option value="-1" selected disabled>Izaberite tip partnera...</option>
                                        <c:forEach items="${partnerCategories}" var="partnerCategory" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${partnerCategory.id == partner.partnerCategory.id}">
                                                    <option value="${partnerCategory.id}" selected>${partnerCategory.title}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${partnerCategory.id}">${partnerCategory.title}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="partnerImage">Slika Partnera</label>
                                <input type="file" id="partnerImage" name="partnerImage" class="dropify"
                                       data-default-file="${partner.baseImage}"/>
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
                                       placeholder="Web sajt partnera.." value="${partner.partnerWebSite}">
                            </div>
                            <div class="form-group">
                                <label for="partnerFacebookLink">Facebook Link</label>
                                <input class="form-control" id="partnerFacebookLink" name="partnerFacebookLink"
                                       placeholder="Facebook link..." value="${partner.facebookLink}">
                            </div>
                            <div class="form-group">
                                <label for="partnerTwitterLink">Twitter Link</label>
                                <input class="form-control" id="partnerTwitterLink" name="partnerTwitterLink"
                                       placeholder="Twitter link..." value="${partner.twitterLink}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="pull-right">
                    <button id="save-partner-edit-btn" class="btn btn-primary">Sacučuvaj izmene</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var partnerId = ${partner.id};
    var partnerImage = {
        id: '${partner.image.id}',
        imageBase64: null,
        imagePath: '${partner.image.imagePath}'
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

    $('#save-partner-edit-btn').on('click', function () {
        if (!isPartnerValid()) {
            return;
        }
        var partner = {
            id: partnerId,
            caption: $('#partnerCaption').val(),
            partnerCategory: {id: $('#partnerCategory').val()},
            baseImage:  partnerImage.imageBase64 ? partnerImage.imageBase64.split(',')[1] : null,
            image: partnerImage,
            partnerWebSite: $('#partnerWebSite').val(),
            facebookLink: $('#partnerFacebookLink').val(),
            twitterLink: $('#partnerTwitterLink').val()
        };

        $(this).prop('disabled', true);
        sendAuthorizeData('<c:url value="/private/json/partner/${partner.id}" />', partner, 'PUT', successEditPartnerFunction, $(this));
    });

    $('#partnerImage').on('change', function () {
        partnerImage.id = null;
        partnerImage.imagePath = null;
        getBase64(document.getElementById('partnerImage').files[0]);
    });

    function successEditPartnerFunction(ctx, data, statusCode) {
        toastr.success('Partner successsfully edited');
        setTimeout(function () {
            window.location.replace('<c:url value="/backend/partners" />');
        }, 2000);
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
        if (!partnerImage.id && !document.getElementById('partnerImage').files[0]) {
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