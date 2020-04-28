function loadNewCat(idO) {
    // Tato funkce nahraje volbu typu otázky na původní stranu.
    document.getElementById("setup").innerHTML =
        '<select class="w3-select" name="option" id="option" onchange="addingForm()">\n' +
        '        <option value="" disabled selected>Vyberte druh otázky</option>\n' +
        '        <option value="1">Testová - 1 správná odpověď</option>\n' +
        '        <option value="2">Testová - více správných odpovědí</option>\n' +
        '        <option value="3">Časová osa</option>\n' +
        '        <option value="4">Přiřazovací</option>\n' +
        '    </select>\n' +
        '<div id="content" class="w3-container w3-mobile w3-left-align">' +
        '</div>\n' +
        '<button id="sendIt" name="sendIt" class="w3-button w3-black" type="submit"  disabled> Změnit otázku</button>\n' +
        '<input type="hidden" id="zvolenaOtazka" name="zvolenaOtazka" value="' + idO + '" />'
}