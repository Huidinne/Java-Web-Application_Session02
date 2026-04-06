package org.example.ex_05.service;

import org.example.ex_05.exception.EmployeeNotFoundException;
import org.example.ex_05.model.Employee;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

@Service
public class InMemoryEmployeeService implements EmployeeService {
    private final List<Employee> employees;

    public InMemoryEmployeeService() {
        this.employees = Collections.unmodifiableList(seedEmployees());
    }

    @Override
    public List<Employee> findAll() {
        return employees;
    }

    @Override
    public Employee findByCode(String code) {
        return employees.stream()
                .filter(emp -> emp.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElseThrow(() -> new EmployeeNotFoundException(code));
    }

    @Override
    public long totalSalaryByDepartment(String department) {
        return employees.stream()
                .filter(emp -> emp.getDepartment().equalsIgnoreCase(department))
                .mapToLong(Employee::getSalary)
                .sum();
    }

    private List<Employee> seedEmployees() {
        List<Employee> data = new ArrayList<>();
        data.add(new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000L, parse("2020-03-01"), "Đang làm"));
        data.add(new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000L, parse("2019-07-15"), "Đang làm"));
        data.add(new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000L, parse("2021-11-20"), "Nghỉ phép"));
        data.add(new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000L, parse("2022-01-05"), "Đang làm"));
        data.add(new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000L, parse("2023-06-10"), "Thử việc"));
        return data;
    }

    private java.util.Date parse(String value) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT).parse(value);
        } catch (ParseException ex) {
            throw new IllegalStateException("Cannot parse date: " + value, ex);
        }
    }
}

