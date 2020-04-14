function addingForm(){
    var sele = document.getElementById('option');
    if (sele.value==="1"){
        document.getElementById('content').innerHTML = '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />\n' +
            '    <input  type="text" name="odpoved1" value="" placeholder="odpoved1"/>\n' +
            '     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>\n' +
            '      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>\n' +
            '       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: b"/>'
}else if(sele.value==="2"){
        document.getElementById('content').innerHTML = ' <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />\n' +
            '    <input type="text" name="odpoved1" value="" placeholder="odpoved1"/>\n' +
            '     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>\n' +
            '      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>\n' +
            '       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: b,c"/>'

}
else if(sele.value==="3"){
        document.getElementById('content').innerHTML = '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />\n' +
            '    <input type="text" name="odpoved1" value="" placeholder="odpoved1"/>\n' +
            '     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>\n' +
            '      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>\n' +
            '       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například po sobe: b,c,a,d"/>'
}
else if(sele.value==="4"){
        document.getElementById('content').innerHTML = '<input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />\n' +
            '    <input type="text" name="odpoved1" value="" placeholder="1"/>\n' +
            '     <input type="text" name="odpoved2" value="" placeholder="2"/>\n' +
            '      <input type="text" name="odpoved3" value="" placeholder="3"/>\n' +
            '       <input type="text" name="odpoved4" value="" placeholder="4"/>\n' +
            '           <input type="text" name="odpoveda" value="" placeholder="a"/>\n' +
            '     <input type="text" name="odpovedb" value="" placeholder="b"/>\n' +
            '      <input type="text" name="odpovedc" value="" placeholder="c"/>\n' +
            '       <input type="text" name="odpovedd" value="" placeholder="d"/>\n' +
            '        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: 1-b,2-a,3-d,4-c"/>'

}
}
function loadTestInput(lekceName,lekceId){
 document.getElementById("setup").innerHTML = ' <select class="w3-select" id="zvolenaLekce" disabled>' +
     '<option value='+ lekceId + 'selected>' + lekceName + '</option></select>' +
     '<select class="w3-select" name="option" id="option" onchange="addingForm()">\n' +
     '        <option value="" disabled selected>Vyberte druh otázky</option>\n' +
     '        <option value="1">Testová - 1 správně</option>\n' +
     '        <option value="2">Testová - více správně</option>\n' +
     '        <option value="3">Časová osa</option>\n' +
     '        <option value="4">Přiřazovací</option>\n' +
     '    </select>' +
     '<div id="content" class="w3-container w3-mobile"></div>'
}