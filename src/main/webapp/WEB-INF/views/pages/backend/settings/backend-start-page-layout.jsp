<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="startPageLayout" scope="request"
             type="com.silab.njt.springmvc.model.start_page_layout.StartPageLayout"/>

<style>
    .slide-container {
        border: 1px solid lightgrey;
        margin: 10px;
        padding: 10px;
        color: white;
        background-image: url(<c:url value='/resources/image/uploads/slide-backend-img.jpg' />);
    }

    .slide-container p:first-child {
        text-align: center;
    }

    .partner-card {
        padding: 10px;
    }

    .partner-info {
        padding: 0;
        background-color: white;
    }

    .review-info .review-title {
        margin-top: 10px;
        font-size: 20px;
    }

    .review-info .review-title a {
        cursor: pointer;
        margin-right: 50px;
    }

    @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700|Roboto:400,700);
    body {
        background: #f1f1f1;
        margin: 2rem;
    }

    .blog-card {
        transition: height 0.3s ease;
        -webkit-transition: height 0.3s ease;
        background: #fff;
        border-radius: 3px;
        box-shadow: 0 3px 7px -3px rgba(0, 0, 0, 0.3);
        margin: 0 auto 1.6%;
        overflow: hidden;
        position: relative;
        font-size: 14px;
        line-height: 1.45em;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .blog-card:hover .details {
        left: 0;
    }

    .blog-card:hover.alt .details {
        right: 0;
    }

    .blog-card.alt .details {
        right: -100%;
        left: inherit;
    }

    .blog-card .photo {
        height: 200px;
        position: relative;
    }

    .blog-card .photo.photo1 {
        background: url("http://i62.tinypic.com/34oq4o0.jpg") center no-repeat;
        background-size: cover;
    }

    .blog-card .photo.photo2 {
        background: url("http://i60.tinypic.com/xeiv79.jpg") center no-repeat;
        background-size: cover;
    }

    .blog-card .details {
        transition: all 0.3s ease;
        -webkit-transition: all 0.3s ease;
        background: rgba(0, 0, 0, 0.6);
        box-sizing: border-box;
        color: #fff;
        font-family: "Open Sans";
        list-style: none;
        margin: 0;
        padding: 10px 15px;
        height: 200px;
        /*POSITION*/
        position: absolute;
        top: 0;
        left: -100%;
    }

    .blog-card .details > li {
        padding: 3px 0;
    }

    .blog-card .details li:before, .blog-card .details .tags ul:before {
        font-family: FontAwesome;
        margin-right: 10px;
        vertical-align: middle;
    }

    .blog-card .details .author:before {
        content: "\f007";
    }

    .blog-card .details .date:before {
        content: "\f133";
    }

    .blog-card .details .tags ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .blog-card .details .tags ul:before {
        content: "\f02b";
    }

    .blog-card .details .tags li {
        display: inline-block;
        margin-right: 3px;
    }

    .blog-card .details a {
        color: inherit;
        border-bottom: 1px dotted;
    }

    .blog-card .details a:hover {
        color: #75D13B;
    }

    .blog-card .description {
        padding: 10px;
        box-sizing: border-box;
        position: relative;
    }

    .blog-card .description h1 {
        font-family: "Roboto";
        line-height: 1em;
        margin: 0 0 10px 0;
    }

    .blog-card .description h2 {
        color: #9b9b9b;
        font-family: "Open Sans";
        line-height: 1.2em;
        text-transform: uppercase;
        font-size: 1em;
        font-weight: 400;
        margin: 1.2% 0;
    }

    .blog-card .description p {
        position: relative;
        margin: 0;
        padding-top: 20px;
    }

    .blog-card .description p:after {
        content: "";
        background: #75D13B;
        height: 6px;
        width: 40px;
        /*POSITION*/
        position: absolute;
        top: 6px;
        left: 0;
    }

    .blog-card .description a {
        color: #75D13B;
        margin-bottom: 10px;
        float: right;
    }

    .blog-card .description a:after {
        transition: all 0.3s ease;
        -webkit-transition: all 0.3s ease;
        content: "\f061";
        font-family: FontAwesome;
        margin-left: -10px;
        opacity: 0;
        vertical-align: middle;
    }

    .blog-card .description a:hover:after {
        margin-left: 5px;
        opacity: 1;
    }

    @media screen and (min-width: 600px) {
        .blog-card {
            height: 200px;
            max-width: 600px;
        }

        .blog-card:hover .photo {
            -webkit-transform: rotate(5deg) scale(1.3);
            transform: rotate(5deg) scale(1.3);
        }

        .blog-card:hover.alt .photo {
            -webkit-transform: rotate(-5deg) scale(1.3);
            transform: rotate(-5deg) scale(1.3);
        }

        .blog-card.alt .details {
            padding-left: 30px;
        }

        .blog-card.alt .description {
            float: right;
        }

        .blog-card.alt .description:before {
            -webkit-transform: skewX(5deg);
            transform: skewX(5deg);
            right: -15px;
            left: inherit;
        }

        .blog-card.alt .photo {
            float: right;
        }

        .blog-card .photo {
            transition: all 0.5s ease;
            -webkit-transition: all 0.5s ease;
            float: left;
            height: 100%;
            width: 40%;
        }

        .blog-card .details {
            width: 40%;
        }

        .blog-card .description {
            float: left;
            width: 60%;
            z-index: 0;
        }

        .blog-card .description:before {
            -webkit-transform: skewX(-5deg);
            transform: skewX(-5deg);
            content: "";
            background: #fff;
            width: 100%;
            z-index: -1;
            position: absolute;
            left: -15px;
            top: 0;
            bottom: 0;
        }

        .delete-feature-btn {
            font-size: 12px;
            cursor: pointer;
            position: relative;
            left: 10px;
        }
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
                    <li class="active">
                        <a data-toggle="tab" href="#slide-config">Podešavanja Slajdera</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#featured-config">Podešavanja Featura</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#partner-config">Podešavanja Partnera</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#celebrity-review-config">Utisci Poznatih</a>
                    </li>
                </ul>
                <div class="row">
                    <div class="tab-content">

                        <%--SLIDER SETTINGS--%>
                        <div id="slide-config" class="tab-pane fade in active">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="row">
                                    <div class="slide-sortable-holder">
                                        <c:forEach items="${startPageLayout.allSlides}" var="slide" varStatus="loop">
                                            <div class="col-sm-6">
                                                <div class="slide-container">
                                                    <p>${loop.index + 1}. <span
                                                            class="slide-title">${slide.title}</span></p>
                                                    <p class="slide-leading-text">${slide.leadingText}</p>
                                                    <input type="hidden" class="slide-main-content"
                                                           value="${slide.mainContent}">
                                                    <input type="hidden" class="slide-details-link"
                                                           value="${slide.detailsLink}">
                                                    <input type="hidden" class="slide-external-link"
                                                           value="${slide.externalLink}">
                                                    <input type="hidden" class="slide-id" value="${slide.id}">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2">
                                    <div class="pull-right">
                                        <button id="save-slide-settings-btn" class="btn btn-primary">Sacučuvaj opcije
                                            slidera
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--FEATURE SETTINGS--%>
                        <div id="featured-config" class="tab-pane fade">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="row main-features-container">
                                    <c:forEach items="${startPageLayout.allFeatures}" var="feature" varStatus="loop">
                                        <div class="col-lg-6 col-sm-12 main-feature-element">
                                            <div class="form-group">
                                                <label>Feature Title<span><a class="delete-feature-btn">(Obriši feature..)</a></span></label>
                                                <input class="form-control main-feature-title"
                                                       value="${feature.featuredTitle}">
                                            </div>
                                            <div class="form-group">
                                                <label>Kratak opis</label>
                                                <textarea class="form-control main-feature-short-description"
                                                          rows="7">${feature.featuredContent}</textarea>
                                            </div>
                                            <input type="hidden" class="main-feature-id" value="${feature.id}">
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a data-toggle="modal" href="#addFeatureModal"
                                           class="btn btn-primary pull-right">Dodaj feature</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="court-search">Pretraži Terene</label>
                                            <input class="form-control" id="court-search" name="court-search">
                                        </div>
                                        <div class="blog-card">
                                            <div class="photo photo1"></div>
                                            <ul class="details">
                                                <li class="author"><a
                                                        href="#">${startPageLayout.featuredCourt.title}</a></li>
                                                <li class="date">Aug. 24, 2015</li>
                                                <li class="tags">
                                                    <ul>
                                                        <li><a>POVOLJAN</a></li>
                                                        <li><a>SAVREMEN</a></li>
                                                        <li><a>MODERAN</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <div class="description">
                                                <h1>${startPageLayout.featuredCourt.title}</h1>
                                                <h2>${startPageLayout.featuredCourt.shortDescription}</h2>
                                                <p class="summary">Lorem ipsum dolor sit amet, consectetur adipisicing
                                                    elit. Ad eum dolorum architecto obcaecati enim dicta praesentium,
                                                    quam nobis! Neque ad aliquam facilis numquam. Veritatis, sit.</p>
                                                <a href="<c:url value="/backend/court/edit/${startPageLayout.featuredCourt.id}" />">Pogledaj
                                                    Detaljnije</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2">
                                    <div class="pull-right">
                                        <button id="save-features-settings-btn" class="btn btn-primary">Sacučuvaj
                                            izmene featura
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--PARTNER SETTINGS--%>
                        <div id="partner-config" class="tab-pane fade">
                            <div class="col-lg-8  col-lg-offset-2">
                                <h1>Svi Partneri</h1>
                                <hr>
                                <div>
                                    <a href="<c:url value='/backend/partners' />">Idi na stranicu partnera...</a>
                                    <button class="pull-right btn btn-info" data-toggle="button">Sortiraj po
                                        kategorijama
                                    </button>
                                </div>
                                <hr>
                                <div class="row partner-sortable-container">
                                    <c:forEach items="${allPartners}" var="partner">
                                        <div class="col-sm-3 partner-card">
                                            <div>
                                                <img src="${partner.baseImage}" alt="" width="100%">
                                                <div class="partner-info">
                                                    <p style="font-size: 20px">${partner.caption}</p>
                                                    <p>${partner.partnerCategory.title}</p>
                                                    <input type="hidden" class="partner-id" value="${partner.id}">
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2">
                                    <div class="pull-right">
                                        <button id="save-partner-order-btn" class="btn btn-primary">Sacučuvaj redosled
                                            partnera
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--CELEBRITY REVIEWS--%>
                        <div id="celebrity-review-config" class="tab-pane fade">
                            <div class="col-lg-8  col-lg-offset-2">
                                <h3>Sta Poznati kazu o name..</h3>
                                <hr>
                                <c:forEach items="${startPageLayout.celebrityReviews}" var="celebrityReview">
                                    <div class="col-sm-6 celebrity-review-single-holder">
                                        <div class="review-image-holder">
                                            <img class="img-circle" src="${celebrityReview.reviewImage}" alt="">
                                        </div>
                                        <div class="review-info">
                                            <p><span class="review-title">${celebrityReview.reviewTitle}</span>
                                                <a data-toggle="modal" href="#celebrityReviewModal"
                                                   class="pull-right"><i class="fa fa-edit"></i></a>
                                            </p>
                                            <p class="reviewContent">${celebrityReview.reviewText}</p>
                                        </div>
                                        <input type="hidden" class="reviewLinkTitle"
                                               value="${celebrityReview.reviewLinkTitle}">
                                        <input type="hidden" class="reviewLink" value="${celebrityReview.reviewLink}">
                                        <input type="hidden" class="celebrity-review-id" value="${celebrityReview.id}">
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2">
                                    <div class="pull-right">
                                        <button id="save-celebrity-reviews-settings-btn" class="btn btn-primary">
                                            Sacučuvaj
                                            izmene recenzije
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="celebrityReviewModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Izmena recenzije</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="reviewTitle">Ime Osobe</label>
                    <input class="form-control" id="reviewTitle" name="reviewTitle"
                           value="" placeholder="Naziv osobe...">
                </div>
                <div class="form-group">
                    <label for="reviewContent">Sadržaj Recenzije</label>
                    <textarea class="form-control" rows="3" id="reviewContent" name="reviewContent"
                              placeholder="Sadržaj Recenzije"></textarea>
                </div>
                <div class="form-group">
                    <label for="reviewImage">Slika</label>
                    <input type="file" id="reviewImage" name="reviewImage " class="dropify" data-default-file=""/>
                </div>
                <div class="form-group">
                    <label for="reviewLinkTitle">Test linka</label>
                    <input class="form-control" id="reviewLinkTitle" name="reviewLinkTitle" value=""
                           placeholder="Tekst linka...">
                </div>
                <div class="form-group">
                    <label for="reviewLink">Link</label>
                    <input class="form-control" id="reviewLink" name="reviewLink" value="" placeholder="Link...">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Odustani</button>
                <button type="button" id="save-celebrity-change-btn" class="btn btn-primary">Sačuvaj izmene</button>
            </div>
        </div>
    </div>
</div>

<div id="addFeatureModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Dodavanje Feature-a</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="featureTitleModal">Naslov Feature-a</label>
                    <input class="form-control" id="featureTitleModal" name="featureTitleModal"
                           placeholder="Naslov Feature-a...">
                </div>
                <div class="form-group">
                    <label for="featureContentModal">Sadržaj Feature-a</label>
                    <textarea class="form-control" rows="7" id="featureContentModal" name="featureContentModal"
                              placeholder="Sadržaj Feature-a"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Odustani</button>
                <button type="button" id="add-new-main-feature" class="btn btn-primary">Sačuvaj Feature-a</button>
            </div>
        </div>
    </div>
</div>

<div id="newFeature" class="col-lg-6 col-sm-12 main-feature-element" style="display: none">
    <div class="form-group">
        <label>Feature Title <span><a class="delete-feature-btn">(Obriši feature..)</a></span></label>
        <input class="form-control main-feature-title" value="">
    </div>
    <div class="form-group">
        <label>Kratak opis</label>
        <textarea class="form-control main-feature-short-description" rows="7"></textarea>
    </div>
    <input type="hidden" class="main-feature-id" value="0">
</div>

<script>
    var celebrityContainerEditing = null;
    var powerange = $('.js-range');
    var dropifyCelebrityImage;

    $(document).ready(function () {
        $('.js-switch').each(function (ind, item) {
            new Switchery(item);
        });
        powerange.each(function (ind, item) {
            new Powerange(item, {
                min: 100,
                max: 1000,
                start: 300,
                step: 50,
                hideRange: true
            });
        });

        dropifyCelebrityImage = $('.dropify').dropify({
            'default': 'Drag and drop image lago for the web site',
            'replace': 'Drag and drop or click to replace image',
            'remove': 'Remove image logo',
            'error': 'Ooops, something wrong happended.'
        });
        dropifyCelebrityImage = dropifyCelebrityImage.data();

        $('.partner-sortable-container').sortable();
        $('.slide-sortable-holder').sortable();
    });

    $('.review-info a').on('click', function () {
        var reviewModal = $('#celebrityReviewModal');
        var parentContainer = $(this).closest('.celebrity-review-single-holder');
        celebrityContainerEditing = parentContainer;

        dropifyCelebrityImage.dropify.destroy();

        reviewModal.find('#reviewTitle').val(parentContainer.find('.review-title').html().trim());
        reviewModal.find('#reviewContent').val(parentContainer.find('.reviewContent').html().trim());
        reviewModal.find('#reviewImage').attr('data-default-file', parentContainer.find('.img-circle').prop('src'));
        reviewModal.find('#reviewImage').prop('data-default-file', parentContainer.find('.img-circle').prop('src'));
        reviewModal.find('#reviewLinkTitle').val(parentContainer.find('.reviewLinkTitle').val());
        reviewModal.find('#reviewLink').val(parentContainer.find('.reviewLink').val());
        dropifyCelebrityImage.dropify.init();
    });

    $('#save-celebrity-change-btn').on('click', function () {
        var reviewModal = $('#celebrityReviewModal');
        if (celebrityContainerEditing) {
            celebrityContainerEditing.find('.review-title').html(reviewModal.find('#reviewTitle').val());
            celebrityContainerEditing.find('.reviewContent').html(reviewModal.find('#reviewContent').val());
            reviewModal.find('#reviewImage');
            celebrityContainerEditing.find('.reviewLinkTitle').val(reviewModal.find('#reviewLinkTitle').val());
            celebrityContainerEditing.find('.reviewLink').val(reviewModal.find('#reviewLink').val());

            reviewModal.modal('hide');
            celebrityContainerEditing = null;
            toastr.success('Changed saved.');
        } else {
            toastr.error('Changes were not saved.');
        }
    });

    $('#celebrityReviewModal').on('hidden.bs.modal', function () {
        celebrityContainerEditing = null;
    });

    powerange.change(function () {
        $('#js-range-display-change').html('<p>' + $(this).val() + ' RSD</p>');
    });

    $('#save-slide-settings-btn').on('click', function () {

        var slides = [];
        var priority = 1;

        $('.slide-container').each(function () {
            slides.push({
                id: $(this).find('.slide-id').val(),
                title: $(this).find('.slide-title').html().trim(),
                leadingText: $(this).find('.slide-leading-text').html().trim(),
                mainContent: $(this).find('.slide-main-content').val(),
                detailsLink: $(this).find('.slide-details-link').val(),
                externalLink: $(this).find('.slide-external-link').val(),
                priority: priority++
            });
        });

        var startPageLayout = {
            allSlides: slides
        };

        sendAuthorizeData('/private/json/start-page-layout/save-slides-options', startPageLayout, 'PUT', slideOptionsSuccessFunction, $(this));

        function slideOptionsSuccessFunction(ctx, data, statusCode) {
            if (statusCode === 200) {
                toastr.success('Uspesno izmenjeni slajderi');
            }
        }
    });

    $('.delete-feature-btn').on('click', function (e) {
        e.preventDefault();
        $(this).closest('.main-feature-element').remove();
    });

    $('#save-features-settings-btn').on('click', function () {

        var mainFeatures = [];
        var priority = 1;

        $('.main-features-container .main-feature-element').each(function () {
            mainFeatures.push({
                id: $(this).find('.main-feature-id').val(),
                featuredTitle: $(this).find('.main-feature-title').val(),
                featuredContent: $(this).find('.main-feature-short-description').val(),
                priority: priority++
            });
        });

        var startPageLayout = {
            allFeatures: mainFeatures
        };

        sendAuthorizeData('/private/json/start-page-layout/save-feature-options', startPageLayout, 'PUT', slideOptionsSuccessFunction, $(this));

        function slideOptionsSuccessFunction(ctx, data, statusCode) {
            if (statusCode === 200) {
                toastr.success('Uspesno izmenjeni slajderi');
            }
        }
    });

    $('#add-new-main-feature').on('click', function () {
        var newFeatureModal = $('#addFeatureModal');
        var newFeatureElement = $('#newFeature').clone();
        newFeatureElement.attr('id', '');
        newFeatureElement.find('.main-feature-title').val(newFeatureModal.find('#featureTitleModal').val());
        newFeatureElement.find('.main-feature-short-description').val(newFeatureModal.find('#featureContentModal').val());
        newFeatureElement.show();

        $('.main-features-container').append(newFeatureElement);
        newFeatureModal.modal('hide');
        newFeatureModal.find('#featureTitleModal').val('');
        newFeatureModal.find('#featureContentModal').val('');
    });

    $('#save-partner-order-btn').on('click', function () {
        var partnersPriority = [];
        var priority = 1;

        $('.partner-card').each(function () {
            partnersPriority.push({
                id: $(this).find('.partner-id').val(),
                priority: priority++
            });
        });

        sendAuthorizeData('/private/json/partner/save-list', partnersPriority, 'PUT', slideOptionsSuccessFunction, $(this));

        function slideOptionsSuccessFunction(ctx, data, statusCode) {
            if (statusCode === 200) {
                toastr.success('Uspešno sačuvan redosled partnera');
            }
        }
    });

    $('#save-celebrity-reviews-settings-btn').on('click', function () {
        var reviews = [];

        $('.celebrity-review-single-holder').each(function () {
            reviews.push({
                id: $(this).find('.celebrity-review-id').val(),
                reviewTitle: $(this).find('.review-title').html().trim(),
                reviewLinkTitle: $(this).find('.reviewLinkTitle').val(),
                reviewLink: $(this).find('.reviewLink').val(),
                reviewText: $(this).find('.reviewContent').html().trim()
            });
        });

        var startPageLayout = {
            celebrityReviews: reviews
        };

        sendAuthorizeData('/private/json/start-page-layout/save-review-options', startPageLayout, 'PUT', slideOptionsSuccessFunction, $(this));

        function slideOptionsSuccessFunction(ctx, data, statusCode) {
            if (statusCode === 200) {
                toastr.success('Uspesno izmenjeni recenzije');
            }
        }
    });

    function getBase64(file) {
        var reader = new FileReader();
        reader.onload = function () {
            logoBase64 = reader.result;
        };
        reader.onerror = function (error) {
            alert('error while uploading file')
            console.log('Error: ', error);
        };
        reader.readAsDataURL(file);
    }
</script>