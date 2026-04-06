package org.example.session02.Ex_05.service;

import org.example.session02.Ex_05.exception.EmployeeNotFoundException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class InMemoryEmployeeServiceTest {

    private final InMemoryEmployeeService service = new InMemoryEmployeeService();

    @Test
    void shouldReturnFiveSeedEmployees() {
        assertEquals(5, service.findAll().size());
    }

    @Test
    void shouldCalculateTechnicalDepartmentTotalSalary() {
        assertEquals(47000000L, service.totalSalaryByDepartment("Kỹ thuật"));
    }

    @Test
    void shouldThrowWhenEmployeeCodeDoesNotExist() {
        assertThrows(EmployeeNotFoundException.class, () -> service.findByCode("NV999"));
    }
}

