<%--
  Created by IntelliJ IDEA.
  User: Marty Pang
  Date: 2017/3/14
  Time: 14:00
  To change this template use File | Settings | File Templates.
  --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">
        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 用户管理 <span data-toggle="collapse" href="#sub-item-0" class="icon pull-right" id='role'></span>
            </a>
            <ul class="children " id="sub-item-0">
                <li>
                    <a class="" href="user_management.jsp">
                        <span class="glyphicon glyphicon-share-alt"></span> 管理员用户管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 基本结构与功能 <span data-toggle="collapse" href="#sub-item-basic" class="icon pull-right" id="basic"></span>
            </a>
            <ul class="children " id="sub-item-basic">
                <li>
                    <a class="" href="/preDepartmentManage.action">
                        <span class="glyphicon glyphicon-share-alt"></span> 科室管理
                    </a>
                </li>
            </ul>
        </li>

        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 职能学习 <span data-toggle="collapse" href="#sub-item-2" class="icon pull-right"></span>
            </a>
            <ul class="children " id="sub-item-2">
                <li>
                    <a class="" href="/preRoleManage.action">
                        <span class="glyphicon glyphicon-share-alt"></span> 角色管理
                    </a>
                </li>
                <li>
                    <a class="" href="/preCaseManage.action">
                        <span class="glyphicon glyphicon-share-alt"></span> 病例管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 资源管理 <span data-toggle="collapse" href="#sub-item-3" class="icon pull-right"></span>
            </a>
            <ul class="children " id="sub-item-3">
                <li>
                    <a class="" href="/preImageManage.action">
                        <span class="glyphicon glyphicon-share-alt"></span> 图片管理
                    </a>
                </li>
                <li>
                    <a class="" href="/preVideoManage.action">
                        <span class="glyphicon glyphicon-share-alt"></span> 视频管理
                    </a>
                </li>
            </ul>
        </li>

        <li role="presentation" class="divider"></li>

    </ul>
</div><!--/.sidebar-->
