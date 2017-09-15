<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertAttribute name="home-section"/>

<tiles:insertAttribute name="featured-section"/>

<tiles:insertAttribute name="business-section"/>

<tiles:insertAttribute name="product-section"/>

<tiles:insertAttribute name="test-section"/>

<c:if test="${layout.startPageModal.modalActive}">
    <style>
        html.modal-active, body.modal-active {
            overflow: hidden;
        }

        #modal-container {
            position: fixed;
            display: table;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            transform: scale(0);
            z-index: 90;
        }

        #modal-container.one {
            transform: scaleY(0.01) scaleX(0);
            animation: unfoldIn 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
        }

        #modal-container.one .modal-background .modal {
            transform: scale(0);
            animation: zoomIn 0.5s 0.8s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
        }

        #modal-container.one.out {
            transform: scale(1);
            animation: unfoldOut 1s 0.3s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
        }

        #modal-container.one.out .modal-background .modal {
            animation: zoomOut 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
        }

        #modal-container .modal-background {
            display: table-cell;
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            vertical-align: middle;
        }

        #modal-container .modal-background .modal {
            background: white;
            padding: 50px;
            display: inline-block;
            border-radius: 3px;
            font-weight: 300;
            position: relative;
        }

        #modal-container .modal-background .modal h2 {
            font-size: 25px;
            line-height: 25px;
            margin-bottom: 15px;
        }

        #modal-container .modal-background .modal p {
            font-size: 18px;
            line-height: 22px;
        }

        #modal-container .modal-background .modal .modal-svg {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            border-radius: 3px;
        }

        #modal-container .modal-background .modal .modal-svg rect {
            stroke: #fff;
            stroke-width: 2px;
            stroke-dasharray: 778;
            stroke-dashoffset: 778;
        }

        .content {
            min-height: 100%;
            height: 100%;
            background: white;
            position: relative;
            z-index: 0;
        }

        .content h1 {
            padding: 75px 0 30px 0;
            text-align: center;
            font-size: 30px;
            line-height: 30px;
        }

        .content .buttons {
            max-width: 800px;
            margin: 0 auto;
            padding: 0;
            text-align: center;
        }

        .content .buttons .button {
            display: inline-block;
            text-align: center;
            padding: 10px 15px;
            margin: 10px;
            background: red;
            font-size: 18px;
            background-color: #efefef;
            border-radius: 3px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }

        .content .buttons .button:hover {
            color: white;
            background: #009bd5;
        }

        @keyframes unfoldIn {
            0% {
                transform: scaleY(0.005) scaleX(0);
            }
            50% {
                transform: scaleY(0.005) scaleX(1);
            }
            100% {
                transform: scaleY(1) scaleX(1);
            }
        }

        @keyframes unfoldOut {
            0% {
                transform: scaleY(1) scaleX(1);
            }
            50% {
                transform: scaleY(0.005) scaleX(1);
            }
            100% {
                transform: scaleY(0.005) scaleX(0);
            }
        }

        @keyframes zoomIn {
            0% {
                transform: scale(0);
            }
            100% {
                transform: scale(1);
            }
        }

        @keyframes zoomOut {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(0);
            }
        }

        #modal-container .modal-background .modal * {
            padding-top: 10px;
        }
    </style>

    <div id="modal-container">
        <div class="modal-background">
            <div class="modal">
                <h2>Dobrodošli na sajt <i>"${generalSettings.webSiteName}"</i></h2>
                <img src="${generalSettings.logoImage}" alt="">
                ${layout.startPageModal.content}
                <svg class="modal-svg" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"
                     preserveAspectRatio="none">
                    <rect x="0" y="0" fill="none" width="226" height="162" rx="3" ry="3"></rect>
                </svg>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            setTimeout(function () {
                $('#modal-container').addClass('one');
                $('body').addClass('modal-active');
            }, 3000);

            $('#modal-container').click(function () {
                $(this).addClass('out');
                $('body').removeClass('modal-active');
            });
        });
    </script>
</c:if>