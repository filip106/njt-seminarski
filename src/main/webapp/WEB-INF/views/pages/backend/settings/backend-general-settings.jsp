<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="generalSettings" scope="request" type="com.silab.njt.springmvc.model.settings.GeneralSettings"/>

<style>
    .js-switch-label {
        display: block;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Opšta podešavanja</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Izmena trenutnih podešavanja</div>
            <div class="panel-body">
                <ul class="nav nav-tabs pull-right">
                    <li class="active"><a data-toggle="tab" href="#basic-info"> Osnovne Informacije</a></li>
                    <li><a data-toggle="tab" href="#additional-info"> Društvene Mreže</a></li>
                    <li><a data-toggle="tab" href="#location-info"> Informacije o Lokaciji</a></li>
                    <li><a data-toggle="tab" href="#working-hours"> Radno Vreme</a></li>
                </ul>
                <div class="row">
                    <div class="tab-content">
                        <div id="basic-info" class="tab-pane fade in active">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="siteName">Naziv web sajta</label>
                                        <input class="form-control" id="siteName" name="siteName"
                                               value="${generalSettings.webSiteName}">
                                    </div>
                                    <div class="form-group">
                                        <label for="shortDescription">Kratak opis</label>
                                        <textarea class="form-control" rows="3" id="shortDescription"
                                                  name="shortDescription">${generalSettings.shortDescription}</textarea>
                                        <p class="help-block">Osnovne informacije sa nalaze u 'footer'-u svake
                                            stranice</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="logoImage">Logo</label>
                                        <input type="file" id="logoImage" name="logoImage " class="dropify"
                                               data-default-file="${generalSettings.logoImage}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="allowAnonymous" class="js-switch-label">Dozvoli neregistrovanim
                                            korisnicima da rezervišu ${generalSettings.allowAnonymousReservation}
                                            termine</label>
                                        <c:choose>
                                            <c:when test="${generalSettings.allowAnonymousReservation}">
                                                <input type="checkbox" class="js-switch" id="allowAnonymous"
                                                       name="allowAnonymous" value="" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="js-switch" id="allowAnonymous"
                                                       name="allowAnonymous" value="">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-group">
                                        <label for="emailAddress">Email Adresa</label> <input
                                            class="form-control" id="emailAddress" name="emailAddress"
                                            value="${generalSettings.webSiteEmail}">
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneNumber">Telefon</label>
                                        <input class="form-control" id="phoneNumber" name="phoneNumber"
                                               value="${generalSettings.workingHours}">
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="additional-info" class="tab-pane fade">
                            <div class="col-lg-8 col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label for="facebookLink">Facebook Link</label>
                                        <input class="form-control" id="facebookLink" name="facebookLink"
                                               value="${generalSettings.facebookLink}">
                                    </div>
                                    <div class="form-group">
                                        <label for="twitterLink">Twitter Link</label>
                                        <input class="form-control" id="twitterLink"
                                               name="twitterLink" value="${generalSettings.twitterLink}">
                                    </div>
                                    <div class="form-group">
                                        <label for="linkedinLink">Linkedin Link</label>
                                        <input class="form-control" id="linkedinLink"
                                               name="linkedinLink" value="${generalSettings.linkedinLink}">
                                    </div>
                                    <div class="form-group">
                                        <label for="googlePlusLink">Google plus Link</label>
                                        <input class="form-control" id="googlePlusLink" name="googlePlusLink"
                                               value="${generalSettings.googlePlusLink}">
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="location-info" class="tab-pane fade">
                            <div class="col-lg-8  col-lg-offset-2">
                                <div class="form-group">
                                    <label for="locationAddress">Adresa</label>
                                    <input class="form-control" id="locationAddress"
                                           name="locationAddress" value="${generalSettings.locationAddress}">
                                </div>
                            </div>
                        </div>

                        <div id="working-hours" class="tab-pane fade">
                            <div class="col-lg-8  col-lg-offset-2">
                                <form>
                                    <div class="form-group">
                                        <label>Working Hours</label>
                                        <div class="form-group">
                                            <label for="workingHours">Radno vreme</label>
                                            <input class="form-control" id="workingHours" name="workingHours"
                                                   value="${generalSettings.workingHours}">
                                        </div>
                                        <div>
                                            <label for="workdayWeekdays" class="js-switch-label">Weekdays</label>
                                            <input type="checkbox" class="js-switch" id="workdayWeekdays"
                                                   name="workdayWeekdays" value="" checked>
                                        </div>
                                        <div>
                                            <label for="workdaySaturday" class="js-switch-label">Saturday</label>
                                            <input type="checkbox" class="js-switch" id="workdaySaturday"
                                                   name="workdaySaturday" value="">
                                        </div>
                                        <div>
                                            <label for="workdaySunday" class="js-switch-label">Sunday</label>
                                            <input type="checkbox" class="js-switch" id="workdaySunday"
                                                   name="workdaySunday" value="">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="pull-right">
                            <button id="save-general-settings-btn" class="btn btn-default">Sacučuvaj izmene</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var logoImage = {
        id: '${generalSettings.image.id}',
        base64Content: null,
        webPath: '${generalSettings.image.imagePath}'
    };

    $(document).ready(function () {
        $('.js-switch').each(function (ind, item) {
            new Switchery(item);
        });

        $('.dropify').dropify({
            'default': 'Drag and drop image lago for the web site',
            'replace': 'Drag and drop or click to replace image',
            'remove': 'Remove image logo',
            'error': 'Ooops, something wrong happended.'
        });
    });

    var webSiteName;
    var shortDescription;
    var webSiteEmail;
    var webSitePhone;

    var facebookLink;
    var twitterLink;
    var linkedinLink;
    var googlePlusLink;
    var locationAddress;
    var workingHours;

    $('#save-general-settings-btn').on('click', function (e) {
        e.preventDefault();
        if (!validateGeneralSettings()) {
            return;
        }

        var generalSettingsObj = {
            webSiteName: webSiteName,
            shortDescription: shortDescription,
            logoImage: logoImage.base64Content ? logoImage.base64Content.split(',')[1] : null,
            image: logoImage,
            allowAnonymousReservation: $('#allowAnonymous').is(':checked'),
            webSiteEmail: webSiteEmail,
            webSitePhone: webSitePhone,

            facebookLink: facebookLink,
            twitterLink: twitterLink,
            linkedinLink: linkedinLink,
            googlePlusLink: googlePlusLink,
            locationAddress: locationAddress,
            workingHours: workingHours
        };

        function successFunction(ctx, data, statusCode) {
            $(ctx).prop('disabled', false);
            if (statusCode === 200) {
                toastr.success('General settings updated.');
            } else {
                toastr.error('Internal error.contact');
            }
        }

        $(this).prop('disabled', true);
        sendAuthorizeData('/private/json/general-settings/edit', generalSettingsObj, 'PUT', successFunction, $(this));
    });

    $('#logoImage').on('change', function () {
        logoImage.id = 0;
        logoImage.imagePath = null;
        getBase64(document.getElementById('logoImage').files[0]);
    });

    function validateGeneralSettings() {
        if (!(webSiteName = $('#siteName').val())) {
            alert('wrong name');
            return false;
        }
        if (!(shortDescription = $('#shortDescription').val())) {
            alert('wrong descr');
            return false;
        }
        if (!logoImage.id && !document.getElementById('logoImage').files[0]) {
            alert('wrong logo');
            return false;
        }
        if (!(locationAddress = $('#locationAddress').val())) {
            alert('wrong addres');
            return false;
        }
        if (!(webSiteEmail = $('#emailAddress').val())) {
            alert('wrong email');
            return false;
        }
        if (!(webSitePhone = $('#phoneNumber').val())) {
            alert('wrong name');
            return false;
        }
        if (!(workingHours = $('#workingHours').val())) {
            alert('wrong name');
            return false;
        }
        facebookLink = $('#facebookLink').val();
        twitterLink = $('#twitterLink').val();
        linkedinLink = $('#linkedinLink').val();
        googlePlusLink = $('#googlePlusLink').val();

        return true;
    }

    function getBase64(file) {
        var reader = new FileReader();
        reader.onload = function () {
            logoImage.base64Content = reader.result;
        };
        reader.onerror = function (error) {
            alert('error while uploading file');
            console.log('Error: ', error);
        };
        reader.readAsDataURL(file);
    }

</script>