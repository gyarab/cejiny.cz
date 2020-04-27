<!-- Integrace google signin/out-->
function onSuccess(googleUser) {
    // pri uspesnem prihlaseni vytvori variable profile(informace o prihlasenem uzivateli) a idtoken(ID prihlaseneho uzivatele)
    var profile = googleUser.getBasicProfile();
    var id_token = profile.getId();
    // zneviditelni tlacitko na prihlaseni a ukaze tlacitko na prihlaseni
    document.getElementById("signout").style.visibility = "visible";
    document.getElementById("my-signin2").style.visibility = "hidden";
    // ziska jmeno uzivatele z variable profile
    document.getElementById("setUserProfileName").innerHTML = profile.getName()
    // zviditelni jmeno uzivatele a zpristupni testy
    document.getElementById("userHide").style.visibility = "visible";
    document.getElementById("testyHide").style.visibility = "visible";
    // na id "idtoken,idtoken2" nastavi id uzivatele
    document.getElementById("idtoken2").value = id_token;
    document.getElementById("idtoken").value = id_token;
}

<!-- Pri neuspesnem prihlaseni napise error do console-->
function onFailure(error) {
    console.log(error);
}

<!-- Nastaveni vzhledu prihlasovaciho tlacitka-->
function renderButton() {
    gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 200,
        'height': 50,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
    });
    //zneviditelni jmeno uzivatele (protoze ho nema), testy(nikdo neni prihlaseny) a odhlasovaci tlacitko(nikdo neni prihlaseny, takze se nepotrebuje odhlasovat)
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
}

<!-- Nastaveni co ma udelat pri odhlaseni uzivatele-->
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
    // zneviditelni odhlasovaci tlacitko, uzivatelske jmeno a testy, zviditelni prihlasovaci tlacitko
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("my-signin2").style.visibility = "visible";
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
    // po odhlaseni znovunacte stranku
    location.reload();
}
