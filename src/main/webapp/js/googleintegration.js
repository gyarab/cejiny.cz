function onSuccess(googleUser) {
    var profile = googleUser.getBasicProfile();
    var id_token = profile.getId();
    //console.log('ID: ' + profile.getId());
    //console.log('Name: ' + profile.getName());
    //console.log('Email: ' + profile.getEmail());
    document.getElementById("signout").style.visibility = "visible";
    document.getElementById("my-signin2").style.visibility = "hidden";
    document.getElementById("setUserProfileName").innerHTML = profile.getName()
    document.getElementById("userHide").style.visibility = "visible";
    document.getElementById("testyHide").style.visibility = "visible";
    document.getElementById("idtoken").innerHTML = id_token
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
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("my-signin2").style.visibility = "visible";
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
    location.reload();
}
