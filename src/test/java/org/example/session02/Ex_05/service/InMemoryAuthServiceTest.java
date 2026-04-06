package org.example.session02.Ex_05.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class InMemoryAuthServiceTest {

    private final InMemoryAuthService authService = new InMemoryAuthService();

    @Test
    void shouldAuthenticateManager() {
        assertEquals("hr_manager", authService.authenticate("hr_manager", "hr123").getRole());
    }

    @Test
    void shouldReturnNullForInvalidCredentials() {
        assertNull(authService.authenticate("hr_manager", "wrong-pass"));
    }
}

