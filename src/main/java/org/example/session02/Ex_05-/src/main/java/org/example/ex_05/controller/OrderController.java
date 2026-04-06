package org.example.ex_03.controller;

import jakarta.servlet.http.HttpSession;
import org.example.ex_03.model.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String orders(HttpSession session, Model model) {

        // Check login
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        // Fake data
        List<Order> orders = new ArrayList<>();
        orders.add(new Order("OD01", "Chuột Gaming", 250000, new Date()));
        orders.add(new Order("OD02", "Bàn phím cơ", 750000, new Date()));
        orders.add(new Order("OD03", "Tai nghe", 500000, new Date()));

        // Request scope
        model.addAttribute("orderList", orders);

        var application = session.getServletContext();

        // Application scope (fix race condition)
        synchronized (application) {
            Integer count = (Integer) application.getAttribute("totalViewCount");
            if (count == null) count = 0;
            count++;
            application.setAttribute("totalViewCount", count);
        }

        return "order";
    }
}

