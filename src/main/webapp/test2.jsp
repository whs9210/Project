<html>
<head>
    <title>title</title>
</head>
<body>
 
    <!-- form enctype="multipart/form-data" 을 꼭 적어줘야 함 -->
    <form class="form-horizontal" method="post" action="<c:url value='/re/add'/>" enctype="multipart/form-data">
        <!-- input type="file" 이라고 꼭 저어줘야 함 -->
        <input type="file" class="form-control1" id="uploadFile" name="uploadFile" style="border:0px solid black;"/>
        
        <button type="submit" class="btn btn-default">등록</button>
        <button type="reset" class="btn btn-default">취소</button>
    </form>
 
</body>
</html>


