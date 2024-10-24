<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="Search">
    <form  action="/searchByConditition" method="post">
        <div class="Search_nav" id="selectsearch">

            <a href="javascript:;"  class="choose">食物名</a>
        </div>
        <div class="Search_area">
            <input type="search"  name="keyword" placeholder="请输入您所需查找的食物名称..." class="searchbox" />
            <input type="submit" class="searchbutton" value="搜 索" />
        </div>
    </form>
</div>
</body>
</html>
