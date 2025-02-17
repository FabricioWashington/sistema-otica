package com.fabriciodev.service.cookies;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import java.util.Arrays;
import java.util.Optional;

@Service
public class CookieService {

    private static final String COOKIE_USUARIO = "auth_usuario";
    private static final String COOKIE_EMPRESA = "auth_empresa";

    public Optional<String> obterCookieUsuario(HttpServletRequest request) {
        return obterCookie(request, COOKIE_USUARIO);
    }

    public Optional<String> obterCookieEmpresa(HttpServletRequest request) {
        return obterCookie(request, COOKIE_EMPRESA);
    }

    public Optional<String> obterCookie(HttpServletRequest request, String cookieName) {
        if (request.getCookies() != null) {
            return Arrays.stream(request.getCookies())
                    .filter(cookie -> cookie.getName().equals(cookieName))
                    .map(Cookie::getValue)
                    .findFirst();
        }
        return Optional.empty();
    }
}
