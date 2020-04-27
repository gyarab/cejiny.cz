<!-- jQuery hlídá, aby vždy každý zadal jméno lekce, a aby jméno nemělo více jak 40 znaků-->
$().ready(function () {
    $("#lekceForm").validate({
        // nastavení pravidel, které musi uzivatel dodrzet
        rules: {
            lekcename: {
                required: true,
                maxlength: 40
            },
        },
        // zprávy, které se vypíšou, pokud uživatel nějaké pravidlo nesplní
        messages: {
            lekcename: {
                required: " Zadejte název lekce (max. 40 znaků).",
                maxlength: " Název lekce může obsahovat maximálně 40 znaků."
            },
        }
    });

});