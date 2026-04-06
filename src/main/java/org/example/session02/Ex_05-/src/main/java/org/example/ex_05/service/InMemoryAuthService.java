package org.example.ex_05.service;

import org.example.ex_05.model.HrUser;
import org.springframework.stereotype.Service;

@Service
public class InMemoryAuthService implements AuthService {

    @Override
    public HrUser authenticate(String username, String password) {
        if ("hr_manager".equals(username) && "hr123".equals(password)) {
            return new HrUser(username, "hr_manager");
        }

        if ("hr_staff".equals(username) && "staff456".equals(password)) {
            return new HrUser(username, "hr_staff");
        }

        return null;
    }
}

