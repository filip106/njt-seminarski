<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .custom-slogan {
        color: #4cae4c;
    }
    .custom-slogan span { color: #FE980F
    }
    .custom-slogan span.selected {
        background: #09f;
        color: #fff;
    }
    ul.custom-slogan-ul {
        list-style-type: circle;
    }
</style>
<!--Business Section-->
<section id="business" class="business bg-grey roomy-70">
    <div class="container">
        <div class="row">
            <div class="main_business">
                <div class="col-md-6">
                    <div class="business_slid">
                        <div class="slid_shap bg-grey"></div>
                        <div class="business_items text-center">
                            <div class="business_item">
                                <div class="business_img">
                                    <img src="<c:url value='/resources/image/uploads/sport-court3.jpg' />" alt=""/>
                                </div>
                            </div>
                            <div class="business_item">
                                <div class="business_img">
                                    <img src="<c:url value='/resources/image/uploads/sport-court1.jpg' />" alt=""/>
                                </div>
                            </div>
                            <div class="business_item">
                                <div class="business_img">
                                    <img src="<c:url value='/resources/image/uploads/sport-court2.jpg' />" alt=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="business_item sm-m-top-50">
                        <h2 class="text">
                            <strong>${layout.featuredCourt.title} </strong><span class="typer" data-delay="150"
                                                           data-words="is Template For Business?, is Template For Business?, is Template For Business?"
                                                           data-colors="#00a885,orange,#93DBFF"></span>
                        </h2>
                        <ul class="custom-slogan-ul">
                            <li id="first-slogan" class="custom-slogan" data-text="Brz"><i
                                    class="fa fa-arrow-circle-right"></i></li>
                            <li id="second-slogan" class="custom-slogan" data-text="Moderan"><i
                                    class="fa  fa-arrow-circle-right"></i></li>
                            <li id="third-slogan" class="custom-slogan" data-text="Lak za Upotrebu"><i
                                    class="fa  fa-arrow-circle-right"></i></li>
                        </ul>
                        <p class="m-top-20">Lorem ipsum dolor sit amet, consectetur
                            adipiscing elit pellentesque eleifend in mi sit amet mattis
                            suspendisse ac ligula volutpat nisl rhoncus sagittis cras
                            suscipit lacus quis erat malesuada lobortis eiam dui magna
                            volutpat commodo eget pretium vitae elit etiam luctus risus urna
                            in malesuada ante convallis.</p>

                        <div class="business_btn">
                            <a href="<c:url value='/court-details/bet365' />" class="btn btn-default m-top-20">Poseti
                                bet365 Teren</a>
                            <a href="<c:url value='/all-courts' />" class="btn btn-primary m-top-20">Vidi sve</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="<c:url value='/resources/js/common/typer.js' />"></script>
<script>
    $(function () {
        $('#first-slogan').typer({
            search: 'Brz',
            replace: ['Brz', 'Moderan', 'Lak za Upotrebu']
        });
        $('#second-slogan').typer({
            search: 'Moderan',
            replace: ['Lak za Upotrebu', 'Brz', 'Moderan']
        });
        $('#third-slogan').typer({
            search: 'Lak za Upotrebu',
            replace: ['Moderan', 'Lak za Upotrebu', 'Brz']
        });
    });

    (function ($) {
        $.fn.typer = function (options) {

            var defaults = $.extend({
                search: '',
                replace: [],
                speed: 50,
                delay: 2000
            }, options);

            var bintext = function (length) {
                var text = '';
                for (var $i = 0; $i <= length; $i++) {
                    text = text + Math.floor(Math.random() * 2)
                }
                return text;
            };

            this.each(function () {
                var $this = $(this);
                var $text = $this.data('text');
                var position = 0;

                var indexOf = $text.indexOf(defaults.search);
                var normal = $text.substr(0, indexOf);
                var changer = $text.substr(indexOf, $text.length);

                defaults.replace.push(changer);

                var interval = setInterval(function () {
                    var $bintext = '';
                    if (position == indexOf) {
                        $bintext = bintext(changer.length - 1);
                        $this.html($text.substr(0, normal.length));
                        $this.append('<span>' + $bintext + '</span>')
                    } else if (position > indexOf) {
                        $bintext = bintext($text.length - 1);
                        $this.delay(defaults.speed).find('span').html(
                            changer.substring(0, position - indexOf) +
                            $bintext.substring(position, ($bintext.length))
                        );
                    } else if (position < indexOf) {
                        $bintext = bintext($text.length - 1);
                        $this.delay(defaults.speed).html(
                            normal.substring(0, position) +
                            $bintext.substring(position, ($bintext.length))
                        );
                    }

                    if (position < $text.length) {
                        position++;
                    } else {
                        clearInterval(interval);

                        var index = 0;
                        setInterval(function () {
                            var position = 0;
                            var newText = defaults.replace[index];

                            var changeInterval = setInterval(function () {
                                var $bintext = '';
                                for (var $i = 0; $i <= newText.length - 1; $i++) {
                                    $bintext = $bintext + Math.floor(Math.random() * 2)
                                }

                                $this.delay(defaults.speed).find('span').html(
                                    newText.substring(0, position) + $bintext.substring(position, ($bintext.length))
                                );

                                if (position < newText.length) {
                                    position++;
                                } else {
                                    clearInterval(changeInterval);
                                }

                            }, defaults.speed);

                            if (index < defaults.replace.length - 1) {
                                index++;
                            } else {
                                index = 0;
                            }
                        }, defaults.delay)
                    }
                }, defaults.speed)
            });
        }
    })(jQuery)
</script>
<!-- End off Business section -->