$(document).on('submit', '.database_operation', function () {
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function (fb) {
        var resp = JSON.parse(fb);
        if (resp.status == 'true') {
            alert(resp.message);
            setTimeout(function () {
                window.location.href = resp.reload;
            }, 1000);
        }
        else {
            alert(resp.message);
        }
    })
    return false;
});

var interval;
function countdown() {
    clearInterval(interval);
    interval = setInterval(function () {
        var timer = $('.js-timeout').html();
        timer = timer.split(':');
        var minutes = timer[0];
        var seconds = timer[1];
        seconds -= 1;
        if (minutes < 0) return;
        else if (seconds < 0 && minutes != 0) {
            minutes -= 1;
            seconds = 59;
        }
        else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;

        $('.js-timeout').html(minutes + ':' + seconds);

        if (minutes == 0 && seconds == 0) { clearInterval(interval); alert('time UP'); }
    }, 1000);
}

$('.js-timeout').text("60:00");
countdown();
