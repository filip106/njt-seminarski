<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Upravljanje Kategorija Terena</h1>
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
                            <h2>Dodajte nove kategoriju ili izmenite postojeće</h2>
                            <a href="<c:url value='/backend/courts' />">Idi na stranicu svih terena...</a>
                            <hr>
                            <div id="jstree_div">
                                <ul>
                                    <li class="jstree-open">
                                        Root node
                                        <ul>
                                            <li>
                                                Deo Grada
                                                <ul>
                                                    <li>Grocka</li>
                                                    <li>Zvezdara</li>
                                                    <li>Zemun</li>
                                                </ul>
                                            </li>
                                            <li>
                                                Podloga
                                                <ul>
                                                    <li>Veštačka Trava</li>
                                                    <li>Prirodna Trava</li>
                                                    <li>Guma</li>
                                                </ul>
                                            </li>
                                            <li>
                                                Broj Igrača
                                                <ul>
                                                    <li>4 na 4</li>
                                                    <li>5 na 5</li>
                                                    <li>6 na 6</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
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

<script src="<c:url value='/resources/js/backend/jstree.min.js' />"></script>
<script>

    var jsTreeElement = $('#jstree_div');

    $(document).ready(function(){
        jsTreeElement.jstree({
            'plugins': ['contextmenu', 'dnd', 'wholerow'],
            'contextmenu' : {
                'items': function(node) {
                    var contentMenuObj = {};

                    contentMenuObj = {
                        addFilter: {
                            label: 'Add new filter',
                            action: function () {
                                alert('create');
                            },
                            _disabled: function (obj) {
                            }
                        },
                        removeFilter: {
                            label: 'Remove filter',
                            action: function () {
                                alert('removed');
                            },
                            _disabled: function (obj) {
                            },
                            separator_after: true
                        },
                        addFilterValue: {
                            label: 'Add new filter value',
                            action: function () {
                                alert('create');
                            },
                            _disabled: function (obj) {
                            }
                        },
                        removeFilterValue: {
                            label: 'Remove filter value',
                            action: function () {
                                alert('removed');
                            },
                            _disabled: function (obj) {
                            }
                        }
                    };

                    return contentMenuObj;
                }
            }
        });

//        jsTreeElement.jstree("select_node", "ul > li:first");
//        var selectedNode = jsTreeElement.jstree("get_selected");
//        jsTreeElement.jstree("open_node", selectedNode, false, true);​
    });
</script>
