package org.example.ex_05.model;

public class HrUser {
    private final String username;
    private final String role;

    public HrUser(String username, String role) {
        this.username = username;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public String getRole() {
        return role;
    }
}

