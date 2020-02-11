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
                required: "Please enter username",
            },

            password: "Please enter password"
        }
    });

});