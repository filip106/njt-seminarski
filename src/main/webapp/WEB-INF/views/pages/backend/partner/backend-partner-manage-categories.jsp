<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .partner-category-item {
        height: 50px;
        margin: 10px;

        display: flex;
        align-items: center;
        justify-content: center;
    }

    .draw-border {
        box-shadow: inset 0 0 0 4px #0c6588;
        color: #0c6588;
        -webkit-transition: color 0.25s 0.08333s;
        transition: color 0.25s 0.08333s;
        position: relative;
    }

    .draw-border::before, .draw-border::after {
        border: 0 solid transparent;
        box-sizing: border-box;
        content: '';
        pointer-events: none;
        position: absolute;
        width: 0;
        height: 0;
        bottom: 0;
        right: 0;
    }

    .draw-border::before {
        border-bottom-width: 4px;
        border-left-width: 4px;
    }

    .draw-border::after {
        border-top-width: 4px;
        border-right-width: 4px;
    }

    .draw-border:hover {
        color: rgba(142, 40, 8, 0.96);
    }

    .draw-border:hover::before, .draw-border:hover::after {
        border-color: rgba(142, 40, 8, 0.96);
        -webkit-transition: border-color 0s, width 0.25s, height 0.25s;
        transition: border-color 0s, width 0.25s, height 0.25s;
        width: 100%;
        height: 100%;
    }

    .draw-border:hover::before {
        -webkit-transition-delay: 0s, 0s, 0.25s;
        transition-delay: 0s, 0s, 0.25s;
    }

    .draw-border:hover::after {
        -webkit-transition-delay: 0s, 0.25s, 0s;
        transition-delay: 0s, 0.25s, 0s;
    }

    .draw-border {
        background: none;
        border: none;
        cursor: pointer;
        line-height: 1.5;
        font: 700 1.2rem 'Roboto Slab', sans-serif;
        padding: 1em 2em;
        letter-spacing: 0.05rem;
    }

    .draw-border:focus {
        outline: 2px dotted #55d7dc;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Upravaljanje Kategorijama Partnera</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Izmena kategorija partnera</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div style="margin-bottom: 100px">
                            <h2>Dodajte nove kategoriju ili izmenite redosled postojecih</h2>
                            <a href="<c:url value='/backend/partners' />">Idi na stranicu svih partnera...</a>
                            <hr>
                            <h3>Dodaj novog partnera</h3>
                            <div class="form-group">
                                <label for="partnerCategoryTitle">Naziv kategorije partnera</label>
                                <input class="form-control" id="partnerCategoryTitle" name="partnerCategoryTitle"
                                       placeholder="Naziv kategorije partnera...">
                            </div>
                            <div class="pull-right">
                                <button type="button" id="add-partner-category-btn" class="btn btn-primary pull-right">
                                    Dodaj kategoriju
                                </button>
                            </div>
                        </div>
                        <hr>

                        <div class="col-lg-6 col-lg-offset-3">
                            <h3 style="text-align: center">Trenutni redosled</h3>
                            <div class="partner-categories-holder">
                                <c:forEach items="${partnerCategories}" var="partnerCategory" varStatus="loop">
                                    <div class="partner-category-item ui-state-default draw-border">
                                        <span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
                                        <span class="partner-category-info"
                                              data-categoryid="${partnerCategory.id}"
                                              data-categorytitle="${partnerCategory.title}"
                                        >${partnerCategory.title}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
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
    $(document).ready(function () {
        $('.partner-categories-holder').sortable();
    });

    $('#add-partner-category-btn').on('click', function () {
        var categoryTitle = $('#partnerCategoryTitle');
        $('.partner-categories-holder').append(
            '<div class="partner-category-item ui-state-default draw-border">'
            + '<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>'
            + '<span class="partner-category-info"'
            + ' data-categoryid="0" data-categorytitle="' + categoryTitle.val() + '">' + categoryTitle.val() + '</span></div>'
        );

        categoryTitle.val('');
    });

    $('#save-general-settings-btn').on('click', function () {
        var allCategories = [];

        $('.partner-category-item').each(function () {
            var infoSpan = $(this).find('.partner-category-info');
            allCategories.push({
                id: infoSpan.attr('data-categoryid'),
                title: infoSpan.attr('data-categorytitle')
            });
        });

        sendAuthorizeData('<c:url value="/private/json/partner-category/" />', allCategories, 'POST', successEditPartnerCategoriesFunction, $(this));
    });

    function successEditPartnerCategoriesFunction(ctx, data, statusCode) {
        toastr.success('Uspešno ažuriranje kategorija partnera');
    }
</script>