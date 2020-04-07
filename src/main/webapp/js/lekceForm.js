$().ready(function () {
    $("#lekceForm").validate({
        rules: {
            lekcename: {
                required: true,
                maxlength: 25
            },
        },

        messages: {
            lekcename: {
                required: " Zadejte název lekce (max. 25 znaků).",
                maxlength: " Název lekce může obsahovat maximálně 25 znaků."
            },
        }
    });

});