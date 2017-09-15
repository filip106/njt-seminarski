<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .features_items .hide {
        width: 0;
        opacity: 0;
        transition: all 0.1s;
    }
</style>

<section>
    <div class="container">
        <div class="row" style="margin-top: 150px">
            <div class="col-sm-3">
                <div class="left-sidebar" id="filter-options-container">
                    <h2>Deo Grada</h2>
                    <div class="panel-group category-products" id="accordian">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#mens"
                                       data-filter="Grocka"><span
                                            class="badge pull-right"><i class="fa fa-plus"></i></span>Grocka</a>
                                </h4>
                            </div>
                            <div id="mens" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="" data-filter="Kaluđerica">Kaluđerica</a></li>
                                        <li><a href="" data-filter="Boleč">Boleč</a></li>
                                        <li><a href="" data-filter="Leštane">Leštane</a></li>
                                        <li><a href="" data-filter="Grocka">Grocka</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#womens"
                                       data-filter="Zvezdara"> <span
                                            class="badge pull-right"><i class="fa fa-plus"></i></span> Zvezdara</a>
                                </h4>
                            </div>
                            <div id="womens" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="" data-filter="Mirijevo">Mirijevo</a></li>
                                        <li><a href="" data-filter="VukovSpomenik">Vukov Spomenik</a></li>
                                        <li><a href="" data-filter="MaliMokriLug">Mali Mokri Lug</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a href="" data-filter="Voždovac">Voždovac</a></h4>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a href="" data-filter="Vračar">Vračar</a></h4>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a href="" data-filter="Zemun">Zemun</a></h4>
                            </div>
                        </div>
                    </div>

                    <div class="brands_products">
                        <h2>Podloga</h2>
                        <div class="brands-name">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="" data-filter="VeštačkaTrava"> <span class="pull-right">(5)</span>Veštačka
                                    Trava</a></li>
                                <li><a href="" data-filter="PrirodnaTrava"> <span class="pull-right">(9)</span>Prirodna
                                    Trava</a></li>
                                <li><a href="" data-filter="Guma"> <span class="pull-right">(4)</span>Guma</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="price-range">
                        <h2>Broj Igrača</h2>
                        <div class="brands-name">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="" data-filter="4na4"> <span class="pull-right">(5)</span>4 na 4</a></li>
                                <li><a href="" data-filter="5na5"> <span class="pull-right">(9)</span>5 na 5</a></li>
                                <li><a href="" data-filter="6na6"> <span class="pull-right">(4)</span>6 na 6</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="shipping text-center">
                        <img src="<c:url value='/resources/image/uploads/shipping.jpg' /> " alt=""/>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items">
                    <h2 class="title text-center">Fudblaski Tereni</h2>
                    <c:forEach items="${allCourts}" var="court">
                        <div class="col-sm-4 court-wrapper ${court.partOfCity} ${court.courtBase} ${court.numberOfPlayers}">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="${court.baseImage}" alt=""/>
                                        <h2>${court.basePrice} RSD</h2>
                                        <p>${court.shortDescription}</p>
                                        <a href="<c:url value='/court-details/${court.slug}' />"
                                           class="btn btn-default add-to-cart"><i
                                                class="fa fa-shopping-cart"></i>Vidi Detaljnije</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>RSD ${court.basePrice}</h2>
                                            <p>${court.shortDescription}</p>
                                            <a href="<c:url value='/court-details/${court.slug}' />"
                                               class="btn btn-default add-to-cart"><i
                                                    class="fa fa-shopping-cart"></i>Vidi Detaljnije</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="court-details.html"><i
                                                class="fa fa-plus-square"></i>Vidi Detaljnije</a></li>
                                        <li><a href=""><i class="fa fa-plus-square"></i>Dodaj u Omiljene</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $('#filter-options-container').find('a').on('click', function (e) {
            var filter = $(this).prop('href').indexOf('#');
            if (filter === -1) {
                e.preventDefault();
                var filterClass = $(this).data('filter');

                $('.features_items .court-wrapper').each(function () {
                    if (!$(this).hasClass(filterClass)) {
                        $(this).addClass('hide');
                    } else {
                        $(this).removeClass('hide');
                    }
                });
            }
        });
    });
</script>