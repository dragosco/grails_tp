/**
 * Created by tmota on 26/10/16.
 */
refreshActivityList = function () {
    $("#listeActivites").removeAttr('value');
    var groupes = [];

    $(".superGroup").each(function (index, element) {
        groupes.push(element[element.selectedIndex].value);
    });


    $("#groupes").attr("value", groupes);
}