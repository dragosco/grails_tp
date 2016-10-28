/**
 * Created by tmota on 09/10/16.
 */
$(document).ready(function () {
    var groupList = $("#groupes").attr('value');
    if(groupList && !groupList.empty){
        var groupesIds = groupList.substring(1,groupList.length-1).split(',').map(function(item) {
            return item.trim();
        });
        /*var groupesIds = $.map($.makeArray(groupList), function (g) {
            return g.id;
        });*/
        $(".superGroup").each(function (index, element) {
            var options = element.children;
            for (var i = 0; i < options.length; i++) {
                if ($.inArray(options[i].value, groupesIds) >= 0) {
                    options[i].setAttribute('selected', true);
                    i = element.children.length;
                }
                /*for (var j = 0; j < groupesIds.length; j++) {
                    if(options[i].value === groupesIds[j]) {
                        options[i].setAttribute('selected', true);
                        i = options.length;
                        j = groupesIds.length;
                    }
                }*/
                /*if ($.inArray(options[i].value, groupesIds) >= 0) {
                    //i = element.children.length;
                }*/
            }
        });
    }
})

refreshGroupList = function () {
    $("#groupes").removeAttr('value');
    var groupes = [];

    $(".superGroup").each(function (index, element) {
        groupes.push(element[element.selectedIndex].value);
    });


    $("#groupes").attr("value", groupes);
}