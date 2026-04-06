package org.example.ex_06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
public class StudentCardController {

    private static final Map<String, StudentInfo> STUDENTS = new HashMap<>();

    static {
        STUDENTS.put("SV001", new StudentInfo("Nguyễn Văn An", "Công nghệ thông tin", 3, 8.5));
        STUDENTS.put("SV002", new StudentInfo("Trần Thị Bình", "Kinh tế", 2, 7.2));
        STUDENTS.put("SV003", new StudentInfo("Lê Minh Cường", "Công nghệ thông tin", 4, 3.8));
    }

    @GetMapping({"/","/student-card"})
    public String showStudentCard(@RequestParam(value = "msv", required = false) String msv,
                                  Model model) {
        if (msv == null || msv.trim().isEmpty()) {
            return "student-card";
        }

        String normalizedMsv = msv.trim().toUpperCase(Locale.ROOT);
        model.addAttribute("msv", normalizedMsv);

        StudentInfo student = STUDENTS.get(normalizedMsv);
        if (student == null) {
            model.addAttribute("errorMessage", "Không tìm thấy sinh viên với mã " + normalizedMsv);
            return "student-card";
        }

        model.addAttribute("studentName", student.studentName());
        model.addAttribute("faculty", student.faculty());
        model.addAttribute("year", student.year());
        model.addAttribute("gpa", student.gpa());
        return "student-card";
    }

    private record StudentInfo(String studentName, String faculty, int year, double gpa) {
    }
}


