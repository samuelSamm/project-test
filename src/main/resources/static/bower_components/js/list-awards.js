/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function () {
    getUrlParameter = function getUrlParameter(sParam) {

        var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }

        }
    };

    setFilters = function () {
        var area = getUrlParameter("idArea");
        var month = getUrlParameter("month");
        var anio = getUrlParameter("anio");
        var status = getUrlParameter("idCatStatus");

        $("#cmbArea").val(area ? area.replace("+", " ") : '0');
        $("#cmbMonth").val(month ? month : '0');
        $("#cmbAnio").val(anio ? anio : '0');
        $("#cmbCatStatus").val(status != undefined ? status : '2');
        /*
        if (status && status !== '2') {
            if (status === '1') {
                $("#cmbCatStatus option:eq(1)").attr('selected', 'selected');
            }else{
                $("#cmbCatStatus option:eq(2)").attr('selected', 'selected');
            }
        }
        */
    };

    init = function () {
        setFilters();
    };

    init();
});