<!-- Funkce pouzívaná ve výpisu lekcí, aby byl uživatel odkázán na lekci, kterou si vybral, i když neklikne přímo na text-->
$(function () {
    $('li').css('cursor', 'pointer')
        // kdyz uživatel klikne na list, pro stranky kliknul na odkaz
        .click(function () {
            window.location = $('a', this).attr('href');
            return false;
        });
});