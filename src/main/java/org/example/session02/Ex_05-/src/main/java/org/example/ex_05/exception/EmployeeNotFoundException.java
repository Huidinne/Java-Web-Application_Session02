package org.example.ex_05.exception;

public class EmployeeNotFoundException extends RuntimeException {
    public EmployeeNotFoundException(String code) {
        super("Nhân viên [" + code + "] không tồn tại trong hệ thống");
    }
}

