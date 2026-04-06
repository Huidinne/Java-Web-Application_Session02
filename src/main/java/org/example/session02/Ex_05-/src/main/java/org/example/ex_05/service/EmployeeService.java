package org.example.ex_05.service;
import org.example.ex_05.model.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();

    Employee findByCode(String code);

    long totalSalaryByDepartment(String department);
}

