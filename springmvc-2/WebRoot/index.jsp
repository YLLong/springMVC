<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

	<form action="testFileUpload" method="post" enctype="multipart/form-data">
		File:<input type="file" name="file" />
		Desc:<input type="text" name="desc" />
		<input type="submit" />
	</form>
	<br /><br />

	<a href="emps">List Emps</a>
	<br /><br />
	
	<a href="testJson" id="testJson">Test JSON</a>
	<br /><br />
	
	<form action="testHttpMessageConverter" method="post" enctype="multipart/form-data">
		File:<input type="file" name="file" />
		Desc:<input type="text" name="desc" />
		<input type="submit" />
	</form>
	<br /><br />
	
	<a href="testResponseEntity">Test ResponseEntity</a>
	<br /><br />
	
	<!--  
		关于国际化:
		1. 在页面上能够根据浏览器语言设置的情况对文本(不是内容), 时间, 数值进行本地化处理
		2. 可以在 bean 中获取国际化资源文件 Locale 对应的消息
		3. 可以通过超链接切换 Locale, 而不再依赖于浏览器的语言设置情况
		
		解决:
		1. 使用 JSTL 的 fmt 标签
		2. 在 bean 中注入 ResourceBundleMessageSource 的示例, 使用其对应的 getMessage 方法即可
		3. 配置 LocalResolver 和 LocaleChangeInterceptor
	-->
	<a href="i18n">Test I18n</a>
	<br /><br />

	<script type="text/javascript" src="scripts/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#testJson").click(function() {
				var url = this.href;
				var args = {};
				$.post(url, args, function(data) {
					for(var i = 0; i < data.length; i++) {
						var id = data[i].id;
						var lastName = data[i].lastName;
						alert(id + ":" + lastName);
					}
				});
				return false;
			});
		})
	</script>

</body>
</html>