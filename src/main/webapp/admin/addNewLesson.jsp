<%--
  Created by IntelliJ IDEA.
  User: Bertedel
  Date: 07.03.2020
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Přidat Lekci</title>
    <script src="https://cdn.tiny.cloud/1/0yejmvwyxohdxoq5i01ugclsiuvc5jx31i5kv3qeox97g1pn/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
</head>
<body>
<textarea>
    Welcome to your TinyMCE premium trial!
  </textarea>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: 'a11ychecker advcode casechange formatpainter linkchecker lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
        toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
        toolbar_drawer: 'floating',
        tinycomments_mode: 'embedded',
        tinycomments_author: 'Author name',
    });
</script>
</body>
</html>
