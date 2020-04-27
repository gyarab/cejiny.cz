<!-- Funkce pouzivana ve vypisu lekci, aby byl uzivatel odkazan na lekci, kterou si vybral i kdyz neklikne primo na text-->
$(function () {
    $('li').css('cursor', 'pointer')
        // kdyz clovek klikne na list, tak pro stranky kliknul na odkaz
        .click(function () {
            window.location = $('a', this).attr('href');
            return false;
        });
});