<!-- jQuery hlida aby vzdy kazdy zadal jmeno lekce a aby jmeno nemelo vic jak 40 znaku-->
$().ready(function () {
    $("#lekceForm").validate({
        // nastaveni pravidel co musi uzivatel dodrzet
        rules: {
            lekcename: {
                required: true,
                maxlength: 40
            },
        },
        // zpravy co se vypisou pokud uzivatel nejake pravidlo nesplni
        messages: {
            lekcename: {
                required: " Zadejte název lekce (max. 40 znaků).",
                maxlength: " Název lekce může obsahovat maximálně 40 znaků."
            },
        }
    });

});