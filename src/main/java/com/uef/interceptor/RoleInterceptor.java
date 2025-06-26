package com.uef.interceptor;

import com.uef.annotation.RoleRequired;
import com.uef.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Arrays;

public class RoleInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {

        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            RoleRequired roleRequired = method.getMethodAnnotation(RoleRequired.class);

            if (roleRequired != null) {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("role") == null) {
                    // Chưa đăng nhập → chuyển về login
                    response.sendRedirect(request.getContextPath() + "/login");
                    return false;
                }

                User user = (User) session.getAttribute("user");
                String userRole = user.getVaiTro(); // hoặc getRole()

                String[] allowedRoles = roleRequired.value();

                boolean authorized = Arrays.stream(allowedRoles)
                        .anyMatch(r -> r.equalsIgnoreCase(userRole));

                if (!authorized) {
                    // Không đủ quyền → chuyển về unauthorized
                    response.sendRedirect(request.getContextPath() + "/unauthorized");
                    return false;
                }
            }
        }

        return true;
    }
}
