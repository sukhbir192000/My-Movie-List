package filters;

import beans.UserAuthToken;
import daos.UserAuthDao;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import utils.HashGeneratorUtils;

public class UserAuthenticationFilter implements Filter {

    private HttpServletRequest httpRequest;

    private static final String[] loginRequiredURLs = {
        "/view_profile", "/edit_profile", "/update_profile"
    };

    private FilterConfig filterConfig = null;

    public UserAuthenticationFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        if (path.startsWith("/admin/")) {
            chain.doFilter(request, response);
            return;
        }

        boolean loggedIn = (session != null) && (session.getAttribute("loggedUser") != null);

        Cookie[] cookies = httpRequest.getCookies();

        if (!loggedIn && cookies != null) {
            // process auto login for remember me feature
            String selector = "";
            String rawValidator = "";

            for (Cookie aCookie : cookies) {
                if (aCookie.getName().equals("selector")) {
                    selector = aCookie.getValue();
                } else if (aCookie.getName().equals("validator")) {
                    rawValidator = aCookie.getValue();
                }
            }

            if (!"".equals(selector) && !"".equals(rawValidator)) {
                UserAuthDao authDAO = new UserAuthDao();
                UserAuthToken token = authDAO.findBySelector(selector);

                if (token != null) {
                    String hashedValidatorDatabase = token.getValidator();
                    String hashedValidatorCookie = HashGeneratorUtils.generateSHA256(rawValidator);

                    if (hashedValidatorCookie.equals(hashedValidatorDatabase)) {
                        session = httpRequest.getSession();
                        session.setAttribute("loggedUser", token.getUser());
                        loggedIn = true;

                        // update new token in database
                        boolean created = false;
                        String newSelector = "", newRawValidator = "", newHashedValidator = "";

                        while (!created) {
                            newSelector = RandomStringUtils.randomAlphanumeric(12);
                            newRawValidator = RandomStringUtils.randomAlphanumeric(64);

                            newHashedValidator = HashGeneratorUtils.generateSHA256(newRawValidator);

                            token.setSelector(newSelector);
                            token.setValidator(newHashedValidator);

                            created = authDAO.update(token);
                        }

                        // update cookie
                        Cookie cookieSelector = new Cookie("selector", newSelector);
                        cookieSelector.setMaxAge(30 * 24 * 60 * 60);

                        Cookie cookieValidator = new Cookie("validator", newRawValidator);
                        cookieValidator.setMaxAge(30 * 24 * 60 * 60);

                        httpResponse.addCookie(cookieSelector);
                        httpResponse.addCookie(cookieValidator);

                    }
                }
            }

        }

        String loginURI = httpRequest.getContextPath() + "/login";
        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");

        if (loggedIn && (isLoginRequest || isLoginPage)) {
            // the user is already logged in and he's trying to login again
            // then forward to the homepage
            httpRequest.getRequestDispatcher("/").forward(request, response);

        } else if (!loggedIn && isLoginRequired()) {
            // the user is not logged in, and the requested page requires
            // authentication, then forward to the login page
            String loginPage = "/login";
            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
            dispatcher.forward(request, response);
        } else {
            // for other requested pages that do not require authentication
            // or the user is already logged in, continue to the destination
            chain.doFilter(request, response);
        }

    }

    private boolean isLoginRequired() {
        String requestURL = httpRequest.getRequestURL().toString();

        for (String loginRequiredURL : loginRequiredURLs) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }

        return false;
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("UserAuthenticationFilter()");
        }
        StringBuffer sb = new StringBuffer("UserAuthenticationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

}
