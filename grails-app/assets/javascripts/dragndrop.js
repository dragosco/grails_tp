/**
 * Created by cojoc on 01/10/2016.
 */
(function(window) {
    function triggerCallback(e, callback) {
        if(!callback || typeof callback !== 'function') {
            return;
        }
        var files;
        if(e.dataTransfer) {
            files = e.dataTransfer.files;
        } else if(e.target) {
            files = e.target.files;
        }
        callback.call(null, files);
    }
    function makeDroppable(ele, callback) {
        var input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('name', 'image');
        input.setAttribute('id', 'photo');
        input.style.display = 'none';
        input.addEventListener('change', function(e) {
            triggerCallback(e, callback);
        });
        ele.appendChild(input);

        ele.addEventListener('click', function() {
            input.value = null;
            input.click();
        });
    }
    window.makeDroppable = makeDroppable;
})(this);
(function(window) {
    makeDroppable(window.document.querySelector('#inputFileArea'));
})(this);

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#previewContainer').empty();
            $('#previewContainer').append('<img id="previewImage" src="' + e.target.result + '" alt="image"/>');
            //var w = $("#previewImage").width();
            //$("#previewImage").css({'height': w +'px'});

        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#photo").change(function(){
    readURL(this);
});

