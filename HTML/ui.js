// Credits: Marmota#2533
$(document).ready(function () {
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (data.action == "toggle") {
            if (data.show) {
                $("body").show();
            } else {
                $("body").hide();
            }
        }
        else if (data.action == "updateStatus") {
            $("#hunger").css("width", data.status[0].percent + "%");
	        $("#thirst").css("width", data.status[1].percent + "%");
        }
        $("#armor").css("width", data.armor + "%");
        $("#life").css("width", data.life + "%");
    });
});