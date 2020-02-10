$().ready(function() {
    $("#loginForm").validate({
        rules: {
            email: {
                required: true,
                email: true
            },

            password:{
                required: true,
            }
        },

        messages: {
            email: {
                required: "Please enter email",
                email: "Please enter a valid email address"
            },

            password: "Please enter password"
        }
    });

});