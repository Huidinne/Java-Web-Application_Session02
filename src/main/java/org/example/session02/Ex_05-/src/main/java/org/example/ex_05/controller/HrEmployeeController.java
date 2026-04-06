package org.example.ex_05.controller;

import jakarta.servlet.http.HttpSession;
import org.example.session02.Ex_05.model.Employee;
import org.example.session02.Ex_05.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HrEmployeeController {
    private final EmployeeService employeeService;

    public HrEmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/hr/employees")
    public String employeeList(HttpSession session, Model model) {
        if (!isLoggedIn(session)) {
            return "redirect:/hr/login";
        }

        model.addAttribute("employees", employeeService.findAll());
        model.addAttribute("technicalTotalSalary", employeeService.totalSalaryByDepartment("Kỹ thuật"));
        return "hr/employees";
    }

    @GetMapping("/hr/employees/{code}")
    public String employeeDetail(@PathVariable("code") String code,
                                 HttpSession session,
                                 Model model) {
        if (!isLoggedIn(session)) {
            return "redirect:/hr/login";
        }

        Employee employee = employeeService.findByCode(code);
        model.addAttribute("employee", employee);
        return "hr/employee-detail";
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedUser") != null;
    }
}

