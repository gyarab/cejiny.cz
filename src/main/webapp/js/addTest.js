function add(value){
    const div = document.createElement('div');

    if (value = '1'){
        div.innerHTML = `
    <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />
    <input type="text" name="odpoved1" value="" placeholder="odpoved1"/>
     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>
      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>
       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>
        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: b"/>
  `;

        document.getElementById('content').appendChild(div);
}else if(value = '2'){
        div.innerHTML = `
    <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />
    <input type="text" name="odpoved1" value="" placeholder="odpoved1"/>
     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>
      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>
       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>
        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: b,c"/>
  `;

        document.getElementById('content').appendChild(div);
}
else if(value = '3'){
        div.innerHTML = `
    <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />
    <input type="text" name="odpoved1" value="" placeholder="odpoved1"/>
     <input type="text" name="odpoved2" value="" placeholder="odpoved2"/>
      <input type="text" name="odpoved3" value="" placeholder="odpoved3"/>
       <input type="text" name="odpoved4" value="" placeholder="odpoved4"/>
        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například po sobe: b,c,a,d"/>
  `;

    document.getElementById('content').appendChild(div);
}
else if(value = '4'){
        div.innerHTML = `
    <input type="text" name="otazka" value="" placeholder="Zadejte znění otázky" />
    <input type="text" name="odpoved1" value="" placeholder="1"/>
     <input type="text" name="odpoved2" value="" placeholder="2"/>
      <input type="text" name="odpoved3" value="" placeholder="3"/>
       <input type="text" name="odpoved4" value="" placeholder="4"/>
           <input type="text" name="odpoveda" value="" placeholder="a"/>
     <input type="text" name="odpovedb" value="" placeholder="b"/>
      <input type="text" name="odpovedc" value="" placeholder="c"/>
       <input type="text" name="odpovedd" value="" placeholder="d"/>
        <input type="text" name="Sodpoved1" value="" placeholder="Spravna odpoved například: 1-b,2-a,3-d,4-c"/>
  `;


        document.getElementById('content').appendChild(div);
}
}