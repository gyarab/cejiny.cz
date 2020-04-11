$(function () {
    $('li').css('cursor', 'pointer')

        .click(function () {
            window.location = $('a', this).attr('href');
            return false;
        });
});