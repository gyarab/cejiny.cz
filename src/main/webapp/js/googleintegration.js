function onSuccess(googleUser) {
    console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    document.getElementById("signout").style.visibility = "visible";
    document.getElementById("my-signin2").style.visibility = "hidden";
}

function onFailure(error) {
    console.log(error);
}

function renderButton() {
    gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 200,
        'height': 50,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
    });
    document.getElementById("signout").style.visibility = "hidden";
}
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId());
    console.log('Name: ' + profile.getName());
    console.log('Email: ' + profile.getEmail());
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("my-signin2").style.visibility = "visible";
}
