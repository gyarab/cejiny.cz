$().ready(function() {
    $("#loginForm").validate({
        rules: {
            username: {
                required: true,
            },

            password:{
                required: true,
            }
        },

        messages: {
            username: {
                required: "Zadejte přezdívku",
            },

            password: "Zadejte heslo"
        }
    });

});