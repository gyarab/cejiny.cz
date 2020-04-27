<!-- Integrace google signin/out-->
function onSuccess(googleUser) {
    // při úspěšném přihlášení vytvoří variable profile(informace o přihlášeném uživateli) a idtoken(ID přihlášeného uživatele)
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

<!-- Pri neúspšsném přihlášení napíše error do konzole-->
function onFailure(error) {
    console.log(error);
}

<!-- Nastavení vzhledu přihlašovacího tlačítka-->
function renderButton() {
    gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 200,
        'height': 50,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
    });
    //zneviditelní jméno uživatele (protože ho nemá), testy(nikdo není prihlášen) a odhlašovací tlačítko(nikdo není prihlášen, takže se nepotřebuje odhlašovat)
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
}

<!-- Nastavení, co má udělat při odhlášení uživatele-->
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
    // zneviditelní odhlašovací tlačítko, uživatelské jméno a testy. Zviditelní přihlašovací tlačítko
    document.getElementById("signout").style.visibility = "hidden";
    document.getElementById("my-signin2").style.visibility = "visible";
    document.getElementById("userHide").style.visibility = "hidden";
    document.getElementById("testyHide").style.visibility = "hidden";
    // po odhlášení znovu načte stránku
    location.reload();
}
