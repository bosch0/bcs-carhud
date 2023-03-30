$(document).ready(function() {  
    console.log('^3BCS-carhud^0 by B O S C H#4014')
    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.toggle == true) {
            if (data.vel == undefined) {
                $(".vel").html('000');
            } else if (data.vel <= 9) {
                $(".vel").html('00' + data.vel);
            } else if (data.vel >= 10 && data.vel <= 99) {
                $(".vel").html('0' + data.vel);
            } else if (data.vel >= 100) {
                $(".vel").html(data.vel);
            } 
            $('#fuel').html(data.fuel + 'L')
            $('.kmh').html(data.type)

            $('.carhud-container').fadeIn(500)

            if (data.fuel < data.config) {
                $('.fuel').fadeIn(500);
            } else {
                $('.fuel').fadeOut(500);
            }
        } else {
            $('.carhud-container').fadeOut(500)
        }  

    });
});