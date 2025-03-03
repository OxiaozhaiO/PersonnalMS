<%@ page import="java.util.List" %>
<%@ page import="com.celivra.personnalms.Entity.People" %>
<%@ page import="com.celivra.personnalms.Service.PeopleService" %><%--
  Created by IntelliJ IDEA.
  User: xiaozhai
  Date: 2025/2/27
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    HttpSession session1 = request.getSession(false);--%>
<%--    if(session1 == null || session1.getAttribute("LoggedIn") == null){--%>
<%--        response.sendRedirect("/");--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人员管理</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
<div class="container">
    <!-- 左侧功能按钮栏 -->
    <div class="sidebar">
        <h2>功能菜单</h2>
        <ul>
            <li id="btnAdd" onclick="showSection('add')">新增人员</li>
            <li id="btnView" onclick="showSection('view')">查看人员</li>
            <li id="btnDelete" onclick="showSection('delete')">删除人员</li>
        </ul>
    </div>

    <!-- 右侧操作区 -->
    <div class="main-content">
        <!-- 新增人员操作区 -->
        <div id="add" class="section" style="display:none;">
            <h3 class="h3">新增人员</h3>
            <form action="addperson" method="post">
                <label for="name" class="h3label">姓名:</label>
                <input type="text" id="name" name="name"><br><br>
                <label for="gender" class="h3label">性别:</label>
                <input type="text" id="gender" name="gender"><br><br>
                <label for="age" class="h3label">年龄:</label>
                <input type="number" id="age" name="age"><br><br>
                <label for="birth" class="h3label">生日:</label>
                <input type="date" id="birth" name="birth" class="h3label"><br><br>
                <label for="email" class="h3label">邮箱:</label>
                <input type="text" id="email" name="email"><br><br>
                <label for="phone" class="h3label">手机:</label>
                <input type="text" id="phone" name="phone"><br><br>
                <label for="poli_look" class="h3label">政治面貌:</label>
                <input type="text" id="poli_look" name="poli_look"><br><br>
                <button type="submit">提交</button>
            </form>
        </div>

        <!-- 查看人员操作区 -->
        <div id="view" class="section2" style="display:none;">
            <% List<People> peopleList = PeopleService.findAll();%>
            <h3 class="h3">查看人员</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>生日</th>
                    <th>邮箱</th>
                    <th>手机号</th>
                    <th>政治面貌</th>
                    <th>操作</th>
                </tr>
                <%for(People i:peopleList){%>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getName()%></td>
                    <td><%=i.getGender()%></td>
                    <td><%=i.getAge()%></td>
                    <td><%=i.getBirth()%></td>
                    <td><%=i.getEmail()%></td>
                    <td><%=i.getPhone()%></td>
                    <td><%=i.getPolilook()%></td>
                    <td>
                        <button class="editButton"
                            data-id="<%= i.getId() %>"
                            data-name="<%= i.getName() %>"
                            data-gender="<%= i.getGender() %>"
                            data-age="<%= i.getAge() %>"
                            data-birth="<%= i.getBirth() %>"
                            data-email="<%= i.getEmail() %>"
                            data-phone="<%= i.getPhone() %>"
                            data-poli_look="<%= i.getPolilook() %>">
                            编辑
                        </button>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

        <!-- 编辑人员操作区 -->
        <div id="edit" class="section" style="display:none;">
            <h3 class="h3">编辑人员</h3>
            <form action="updateperson" method="post">
                <input type="hidden" id="editId" name="id">
                <label for="editName" class="h3label">姓名:</label>
                <input type="text" id="editName" name="name"><br><br>
                <label for="editGender" class="h3label">性别:</label>
                <input type="text" id="editGender" name="gender"><br><br>
                <label for="editAge" class="h3label">年龄:</label>
                <input type="number" id="editAge" name="age"><br><br>
                <label for="editBirth" class="h3label">生日:</label>
                <input type="date" id="editBirth" name="birth" class="h3label"><br><br>
                <label for="editEmail" class="h3label">邮箱:</label>
                <input type="text" id="editEmail" name="email"><br><br>
                <label for="editPhone" class="h3label">手机:</label>
                <input type="text" id="editPhone" name="phone"><br><br>
                <label for="editPoliLook" class="h3label">政治面貌:</label>
                <input type="text" id="editPoliLook" name="poli_look"><br><br>
                <button type="submit">提交</button>
            </form>
        </div>


        <!-- 删除人员操作区 -->
        <div id="delete" class="section" style="display:none;">
            <h3 class="h3">删除人员</h3>
            <form action="removeperson" method="post">
                <label for="deleteID" class="h3label">ID:</label>
                <input type="text" id="deleteID" name="deleteID"><br><br>
                <button type="submit">删除</button>
            </form>
        </div>
    </div>
</div>

<script src="js/dashboard.js"></script>
</body>
</html>
