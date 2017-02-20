package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import util.ConstCommon;

import java.util.Map;

/**
 * 登录拦截器
 * 
 * @author Administrator
 * 
 */
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// 取得请求相关的ActionContext实例
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		Map<String, Object> user = null;
		if (session.get(ConstCommon.USERCONTEXT) != null) {
			user = (Map<String, Object>) session.get(ConstCommon.USERCONTEXT);
		}

		// 如果没有登陆，或者登陆所有的用户名不是yuewei，都返回重新登陆

		if (user != null) {
			String userName = user.get("name") != null ? user.get(
					"name").toString() : null;
			if (userName != null) {
				return invocation.invoke();
			}
		}
		return Action.LOGIN;
	}

}
