<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>

	<a href="springMVC/testRedirect">Test Redirect</a>
	<br />
	<br />
	
	<a href="springMVC/testView">Test View</a>
	<br />
	<br />

	<!--  
		模拟修改操作
		1. 原始数据为: 1, Tom, 123456,tom@atguigu.com,12
		2. 密码不能被修改.
		3. 表单回显, 模拟操作直接在表单填写对应的属性值
	-->
	<form action="springMVC/testModelAttribute" method="post">
		<input type="hidden" name="id" value="1" />
		Username:<input type="text" name="username" value="uiyllong" /><br /> 
		email:<input type="text" name="email" value="uiyllong@gmail.com" /><br /> 
		age:<input type="text" name="age" value="22" /><br />
		<input type="submit" value="提交" />
	</form>
	<br /><br />

	<a href="springMVC/testSessionAttributes">Test SessionAttributes</a>
	<br />
	<br />
	
	<a href="springMVC/testMap">Test Map</a>
	<br />
	<br />
	
	<a href="springMVC/testModelAndViews">Test ModelAndViews</a>
	<br />
	<br />
	
	<a href="springMVC/testServletAPI">Test Servlet API</a>
	<br />
	<br />

	<form action="springMVC/testPojo" method="post">
		Username:<input type="text" name="username" /><br /> 
		password:<input type="password" name="password" /><br /> 
		email:<input type="text" name="email" /><br /> 
		age:<input type="text" name="age" /><br />
		province:<input type="text" name="address.province" /><br /> 
		city:<input type="text" name="address.city" /><br /> 
		<input type="submit" value="提交" />
	</form>

	<a href="springMVC/testRequestParam?username=uiyllong&age=11">Test
		RequestParam</a>
	<br>
	<br>

	<form action="springMVC/testRest/1" method="post">
		<input type="hidden" name="_method" value="PUT" /> <input
			type="submit" value="TestRest PUT" />
	</form>
	<br>
	<br>

	<form action="springMVC/testRest/1" method="post">
		<input type="hidden" name="_method" value="DELETE" /> <input
			type="submit" value="TestRest DELETE" />
	</form>
	<br>
	<br>

	<form action="springMVC/testRest" method="post">
		<input type="submit" value="TestRest POST" />
	</form>
	<br>
	<br>

	<a href="springMVC/testRest/1">Test Rest Get</a>
	<br>
	<br>

	<a href="springMVC/testPathVariable/1">Test PathVariable</a>
	<br>
	<br>

	<a href="springMVC/testAntPath/mvc/abc">Test AntPath</a>
	<br>
	<br>

	<a href="springMVC/testParamsAndHeaders?username=uiyllong&age=11">Test
		ParamsAndHeaders</a>
	<br>
	<br>

	<form action="springMVC/testMethod" method="post">
		<input type="submit" />
	</form>

	<a href="springMVC/testMethod">Test Method</a>
	<br>
	<br>

	<a href="springMVC/requestMapping">Test RequestMapping</a>
	<br>
	<br>

	<a href="helloworld">HelloWorld</a>

</body>
</html>
