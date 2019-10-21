package ecnu.dase.psf.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import ecnu.dase.psf.pojo.User;
import ecnu.dase.psf.service.UserService;
import ecnu.dase.psf.util.CommonConst;
import ecnu.dase.psf.util.RenderUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @ClassName: UserController
 * @Description:
 * @Author: Marty Pang
 * @Date: 2019-10-11 14:21
 **/

@Controller
@RequestMapping("/user")
public class UserController extends BasicController{
    @Autowired
    private UserService userService;

    private static final Logger log = Logger.getLogger(UserController.class);

    @RequestMapping("/login")
    public String userLogin(User user, HttpServletRequest req) {
        User admin = userService.login(user);
        if(admin != null) {
            log.info("request: user/login, user: " + admin.toString());
            // save session
            setSessionAttribute(req, CommonConst.USERCONTEXT, user);
            // update access time
            admin.setLastAccessTime(new Timestamp(System.currentTimeMillis()));
            int affected = userService.updateUser(admin);
            log.info("user/update, user: " + admin.toString());
            if(affected == 1) {
                return "redirect:/main.jsp";
            } else {
                return "redirect:/login.jsp";
            }
        } else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("getUserList")
    public String getUserList(@RequestParam(value="page", required=false) String page,
                              @RequestParam(value="pageSize", required=false) String pageSize,
                              HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("start", (Integer.parseInt(page)-1)*Integer.parseInt(pageSize));
        map.put("size", Integer.parseInt(pageSize));
        List<User> users = userService.getUserList(map);
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONStringWithDateFormat(users, CommonConst.DATAFORMAT));
        jsonObject.put("Result", "OK");
        jsonObject.put("Records", jsonArray);
        RenderUtil.renderJson(response, jsonObject);
        log.info("request: user/getUserList, users: " + jsonArray.toJSONString());
        return null;
    }

    @RequestMapping("addUser")
    public String addUser(User user, HttpServletResponse response) {
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        int affected = userService.addUser(user);
        if(affected == 1) {
            RenderUtil.renderText(response, "true");
        } else {
            RenderUtil.renderText(response, "false");
        }
        return null;
    }

    @RequestMapping("deleteUser")
    public String deleteUser(Integer id, HttpServletResponse response) {
        int affected = userService.deleteUser(id);
        if(affected == 1) {
            RenderUtil.renderText(response, "true");
        } else {
            RenderUtil.renderText(response, "false");
        }
        return null;
    }
}
