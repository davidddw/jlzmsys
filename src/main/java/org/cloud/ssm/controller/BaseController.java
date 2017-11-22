package org.cloud.ssm.controller;

import org.apache.shiro.SecurityUtils;
import org.cloud.ssm.domain.Result;
import org.cloud.ssm.security.ShiroUser;

public class BaseController {

    /**
     * 获取当前登录用户对象
     * @return {ShiroUser}
     */
    public ShiroUser getShiroUser() {
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取当前登录用户id
     * @return {Long}
     */
    public String getUserId() {
        return this.getShiroUser().getUserId();
    }

    /**
     * 获取当前登录用户名
     * @return {String}
     */
    public String getStaffName() {
        return this.getShiroUser().getLoginName();
    }

    /**
     * 获取当前登录用户名
     * @return {String}
     */
    public int getUserRoleLevel() {
        return this.getShiroUser().getLevel();
    }

    /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public Object renderError(String msg) {
        Result result = new Result();
        result.setMessage(msg);
        return result;
    }

    /**
     * ajax成功
     * @return {Object}
     */
    public Object renderSuccess() {
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public Object renderSuccess(String msg) {
        Result result = new Result();
        result.setSuccess(true);
        result.setMessage(msg);
        return result;
    }

}
