<!-- jQuery hlida kazdeho kdo se snazi prihlasit, ze zada uzivatelske jmeno a heslo-->
$().ready(function() {
    $("#loginForm").validate({
        // nastaveni pravidel co musi kazdy uzivatel splnit
        rules: {
            username: {
                required: true,
            },

            password:{
                required: true,
            }
        },
        // zpravy co se vypisou pokud uzivatel nejake pravidlo nesplni
        messages: {
            username: {
                required: "Zadejte přezdívku",
            },

            password: "Zadejte heslo"
        }
    });

});