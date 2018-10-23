package com.lhh.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

/*
 * shiro角色（ roles）自定义Filter----同一个URL配置多个角色的或关系
 * 
 * 正常情况下URL路径的拦截设置如下:
   /admins/user/**=roles[admin]
    参数可以写多个，多个时必须加上引号，并且参数之间用逗号分割，当有多个参数时，例如/admins/user/**=roles["admin,guest"]
   但是这个设置方法是需要每个参数满足才算通过，相当于hasAllRoles()方法。
   也就是我们的角色必须同时拥有admin和guest权限才可以。
 * AuthorizationFilter抽象类事项了javax.servlet.Filter接口，它是个过滤器。    
 */
public class ShiroRolesFilter extends AuthorizationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest req, ServletResponse res, Object map) throws Exception {
		Subject subject = getSubject(req, res);    
        String[] rolesArray = (String[]) map;    
        System.out.println("角色过滤器");
        if (rolesArray == null || rolesArray.length == 0) { //没有角色限制，有权限访问    
            return false;    
        }    
        for (int i = 0; i < rolesArray.length; i++) {    
            if (subject.hasRole(rolesArray[i])) { //若当前用户是rolesArray中的任何一个，则有权限访问    
                return true;    
            }    
        }    
        return false;    
	}

}
