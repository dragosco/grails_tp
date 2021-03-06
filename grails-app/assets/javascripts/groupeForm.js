/**
 * Created by tmota on 26/10/16.
 */
refreshActivityList = function () {
    $("#listeActivites").removeAttr('value');
    var activitesParGroupes = '';

    $(".groupeElement").each(function (index, element) {
        if(element.id) {
            var lis = element.getElementsByClassName("activiteElement");

            activitesParGroupes += element.id + ':';

            for (var i = 0; i < lis.length; i++) {
                if(i == lis.length - 1) {
                    activitesParGroupes += lis[i].id;
                } else {
                    activitesParGroupes += lis[i].id + ',';
                }
            }
            activitesParGroupes += ';';
        }
    });

    //alert(activitesParGroupes);

    $("#listeActivites").attr("value", activitesParGroupes);
}