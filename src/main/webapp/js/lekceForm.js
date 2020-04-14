$().ready(function () {
    $("#lekceForm").validate({
        rules: {
            lekcename: {
                required: true,
                maxlength: 40
            },
        },

        messages: {
            lekcename: {
                required: " Zadejte název lekce (max. 40 znaků).",
                maxlength: " Název lekce může obsahovat maximálně 40 znaků."
            },
        }
    });

});