<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	
 	<div class="container">


		 <c:forEach items="${slist}" var="sdto"> 
			<div class="n_div">
				
					<div class="num_div">
						<img src=${sdto.images} width=200px height=200px>
					</div>
					<div class="date_div" style="font-size:18px"><a href=searchedDetail?pname=${PlaceDTO.pname}>${PlaceDTO.pname}
					</a>
					</div>
					
					<div class="date_div"><h5>${sdto.pname} </h5>
					</div>
				</div>
			
		</c:forEach>
	</div>
</body>
</html>