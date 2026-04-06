package org.example.ex_05.service;
import org.example.ex_05.model.HrUser;

public interface AuthService {
    HrUser authenticate(String username, String password);
}

