function addingForm(){
    // V této funkci se vypíše skupina vstupů v zavislosti na zvoleném typu otázky.
    // Systém doplňování kódu zdroj :"Add/remove HTML inside div using JavaScript"
    // (https://stackoverflow.com/a/17650902/1735235)
    var sele = document.getElementById('option');

    const button = document.getElementById('sendIt');
    button.disabled = false;
    if (sele.value==="1"){
        document.getElementById('content').innerHTML =
            '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" /><br>\n' +
            '    <input  type="text" name="odpoved0" value="" placeholder="možnost a"/><br>\n' +
            '     <input type="text" name="odpoved1" value="" placeholder="možnost b"/><br>\n' +
            '      <input type="text" name="odpoved2" value="" placeholder="možnost c"/><br>\n' +
            '       <input type="text" name="odpoved3" value="" placeholder="možnost d"/><br>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Správná odpověď například: b"/><br>'
}else if(sele.value==="2"){
        document.getElementById('content').innerHTML =
            ' <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" /><br>\n' +
            '    <input type="text" name="odpoved0" value="" placeholder="možnost a"/><br>\n' +
            '     <input type="text" name="odpoved1" value="" placeholder="možnost b"/><br>\n' +
            '      <input type="text" name="odpoved2" value="" placeholder="možnost c"/><br>\n' +
            '       <input type="text" name="odpoved3" value="" placeholder="možnost d"/><br>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Správná odpověď například: b,c"/><br>'

}
else if(sele.value==="3"){
        document.getElementById('content').innerHTML =
            '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" /><br>\n' +
            '    <input type="text" name="odpoved0" value="" placeholder="1. událost a"/><br>\n' +
            '     <input type="text" name="odpoved1" value="" placeholder="2. událost b"/><br>\n' +
            '      <input type="text" name="odpoved2" value="" placeholder="3. událost c"/><br>\n' +
            '       <input type="text" name="odpoved3" value="" placeholder="4.událost d"/><br>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Správná odpověď například po sobě: b,c,a,d"/><br>'
}
else if(sele.value==="4"){
        document.getElementById('content').innerHTML =
            '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" /><br>\n' +
            '    <input type="text" name="odpoved0" value="" placeholder="1"/><br>\n' +
            '     <input type="text" name="odpoved1" value="" placeholder="2"/><br>\n' +
            '      <input type="text" name="odpoved2" value="" placeholder="3"/><br>\n' +
            '       <input type="text" name="odpoved3" value="" placeholder="4"/><br>\n' +
            '           <input type="text" name="odpoved4" value="" placeholder="a"/><br>\n' +
            '     <input type="text" name="odpoved5" value="" placeholder="b"/><br>\n' +
            '      <input type="text" name="odpoved6" value="" placeholder="c"/><br>\n' +
            '       <input type="text" name="odpoved7" value="" placeholder="d"/><br>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Správná odpověď například: 1-b,2-a,3-d,4-c"/><br>'


}
}

// V této funkci se vypíše volba typu otázky společně s dalšími potřebnými údaji, přepíší se předchozí data na
//stránce, anebo se zobrazí finální obrazovka po přidání poslední otázky.
function loadTestInput(lekceName,lekceId,numero){

    document.getElementById("starting").innerHTML = '<h1>Vytváření otázky</h1>'
    numero++;
    if (numero === 11){
        document.getElementById("setup").innerHTML = ' <h2> Všechny otázky byly úspěšně přidány. </h2>\n' +
            '<a href="login.jsp" class="w3-btn w3-white w3-border w3-border-green w3-round-xlarge">Navrátit se do základního menu</a>'

    }else{
        document.getElementById("setup").innerHTML =
            '<form target="_blank" action="saveQuestion.jsp" onsubmit="allowNext()"  method="post" class="w3-container" id="inputMain" >\n' +
            '<h2>' + lekceName + '</h2>' +
            '<h1>Otázka ' + numero + '/10</h1>\n' +
            '<select class="w3-select" name="option" id="option" onchange="addingForm()">\n' +
            '        <option value="" disabled selected>Vyberte druh otázky</option>\n' +
            '        <option value="1">Testová - 1 správná odpověď</option>\n' +
            '        <option value="2">Testová - více správných odpovědí</option>\n' +
            '        <option value="3">Časová osa</option>\n' +
            '        <option value="4">Přiřazovací</option>\n' +
            '    </select>\n'  +
            '<div id="content" class="w3-container w3-mobile">' +
            '</div>\n' +
            '<button id="sendIt" name="sendIt" class="w3-button w3-black" type="submit"  value="' + numero +
            '" disabled> Uložit otázku</button>\n' +
            '<input type="hidden" id="zvolenaLekce" name="zvolenaLekce" value="' + lekceId + '" />' +
            '<input type="hidden" id="zvolenaOtazka" name="zvolenaOtazka" value="' + numero + '" />' +
            '</form>\n' + '<button class="w3-button w3-black"' +
            ' id="nextQuestion" onclick="loadTestInput(\''+ lekceName + '\',' + lekceId + ',' + numero +
            ')" disabled>Přejít na další otázku</button>'
    }

}
function allowNext(){
  const button =   document.getElementById("nextQuestion");
  button.disabled = false;
  const but = document.getElementById("sendIt");
  but.disabled = true;

}

