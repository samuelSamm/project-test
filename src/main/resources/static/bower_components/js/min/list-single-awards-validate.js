/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function () {
    var urlAwards = $("#url-awards").val();
    
    closeModal = function () {
        $("#modalMensaje").hide();
    };

    previewSaveValidate = function (descriptionTypeAward, fullName, template, description, message) {
         var params =
                 "typeAward=" + descriptionTypeAward +
                "&employee=" + encodeURIComponent(fullName) +
                "&template=" + "template-" + template +
                "&behavior=" + encodeURIComponent(description) +
                "&message=" + encodeURIComponent(message);

        var req = new XMLHttpRequest();
        req.open("GET", urlAwards + "award-preview?" + params, true);
        req.setRequestHeader('Content-type', "text/plain;charset=UTF-8");
        req.responseType = "blob";

        req.onload = function (event) {
            var blob = req.response;
            console.log(blob.size);
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = "Award-Preview.pdf";
            link.click();
        };
        req.send();


    };
});