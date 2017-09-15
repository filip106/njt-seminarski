<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" scope="request" type="com.silab.njt.springmvc.model.User"/>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Izmena korisnika - <i class="text-capitalize">"${user.username}"</i></h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <h1>Popunite podatke o korisniku</h1>
        <p style="color: #ff4349"><sub>Svi podaci su obavezni</sub></p>
        <hr>
        <form>
            <div class="form-group">
                <label for="username">Korisničko ime</label>
                <input class="form-control" id="username" value="${user.username}" placeholder="Korisničko ime..."
                       disabled>
            </div>
            <div class="form-group">
                <label for="emailAddress">Email</label>
                <input class="form-control" id="emailAddress" value="${user.email}" placeholder="Email korisnika..."
                       disabled>
            </div>
            <div class="form-group">
                <label for="password">Šifra</label>
                <input type="password" class="form-control" id="password" placeholder="******" disabled>
            </div>
            <div class="form-group">
                <label for="passwordRepeat">Ponovljena Šifra</label>
                <input type="password" class="form-control" id="passwordRepeat" placeholder="******"
                       disabled>
            </div>
            <div class="form-group">
                <label for="userImage">Slika korisnika</label>
                <input type="file" id="userImage" name="userImage" class="dropify"
                       data-default-file="${user.imagePath}"/>
            </div>
            <div class="form-group">
                <label for="firstName">Ime</label>
                <input class="form-control" id="firstName" value="${user.firstName}" placeholder="Ime...">
            </div>
            <div class="form-group">
                <label for="lastName">Prezime</label>
                <input class="form-control" id="lastName" value="${user.lastName}" placeholder="Prezime...">
            </div>
            <div class="form-group">
                <label for="userType">Kategorija Partnera</label>
                <div>
                    <select name="userType" id="userType" class="form-control">
                        <option value="-1" selected disabled>Izaberite tip korisnika...</option>
                        <c:forEach items="${allUserProfiles}" var="userType" varStatus="loop">
                            <c:choose>
                                <c:when test="${userType.id == user.userProfiles.iterator().next().id}">
                                    <option value="${userType.id}" selected>${userType.type}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${userType.id}">${userType.type}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="userEnabled" class="js-switch-label" style="display: block;">Aktiviran</label>
                        <input type="checkbox" class="js-switch" id="userEnabled" name="userEnabled" checked>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="userLocked" class="js-switch-label" style="display: block;">Zaključan</label>
                            <input type="checkbox" class="js-switch" id="userLocked" name="userLocked">
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary pull-right" id="add-user-btn">Sačuvaj Korisnika</button>
        </form>
    </div>
</div>

<script>

    var userId = '${user.id}';
    var userImage = {
        id: '${user.image.id}',
        imageBase64: null,
        imagePath: '${user.image.imagePath}'
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

    $('#add-user-btn').on('click', function () {
        if (!isValid()) {
            return;
        }
        var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var userProfileSelect = $('#userType').val();

        var newUserObject = {
            imagePath: userImage.imageBase64 ? userImage.imageBase64.split(',')[1] : null,
            image: userImage,
            firstName: firstName,
            lastName: lastName,
            userProfiles: [{id: userProfileSelect}]
        };

        $(this).prop('disabled', true);
        sendAuthorizeData("/private/json/user/" + userId, newUserObject, "PUT", editUserSuccessFunction, $(this));
    });

    $('#userImage').on('change', function () {
        userImage.id = 0;
        userImage.imagePath = null;
        getBase64(document.getElementById('userImage').files[0]);
    });

    function editUserSuccessFunction(ctx, data, statusCode) {
        if (statusCode === 200) {
            toastr.success('Podaci o korisniku ' + data.username + ' uspešno ažurirane.');
            setTimeout(function () {
                window.location.replace('<c:url value="/backend/users" />');
            }, 5000);
        } else if (statusCode === 204) {
            $(ctx).prop('disabled', false);
            toastr.error('Koričko ime je već zauzeto');
        } else {
            $(ctx).prop('disabled', false);
            toastr.error('Internal error.contact admin.');
        }
    }

    function isValid() {
        if (!userImage.id && !document.getElementById('userImage').files[0]) {
            toastr.error("Slika je obavezna");
            return false;
        }
        if (!$('#firstName').val()) {
            toastr.error("Ime je obavezno");
            return false;
        }
        if (!$('#lastName').val()) {
            toastr.error("Prezime je obavezno");
            return false;
        }
        if (!$('#userType').val()) {
            toastr.error("Izaberite tip korisnika");
            return false;
        }

        return true;
    }

    function getBase64(file) {
        var reader = new FileReader();
        reader.onload = function () {
            userImage.imageBase64 = reader.result;
        };
        reader.onerror = function (error) {
            alert('error while uploading file')
            console.log('Error: ', error);
        };
        reader.readAsDataURL(file);
    }
</script>