<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name = "value" type="java.lang.String" required="true"%>
<%
/*게시글 쓰기 폼에서 입력한 형식으로 보이도록하는 커스텀 태그
WEB-INF / tags 폴더 */
	value = value.replace("<", "&lt;");
	value = value.replace(">", "&gt;");
	value = value.replace("\n", "\n<br>");
	value = value.replace("&", "&amp;");
	value = value.replace(" ", "&nbsp;");
%>
<%= value%>
