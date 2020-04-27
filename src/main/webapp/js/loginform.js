<!-- jQuery hlída každého, kdo se snaží přihlásit, že zadá uživatelské jméno a heslo-->
$().ready(function() {
    $("#loginForm").validate({
        // nastavení pravidel, které musí každý uživatel splnit
        rules: {
            username: {
                required: true,
            },

            password:{
                required: true,
            }
        },
        // zprávy, které se vypíšou, pokud uživatel nějaké pravidlo nesplní
        messages: {
            username: {
                required: "Zadejte přezdívku",
            },

            password: "Zadejte heslo"
        }
    });

});