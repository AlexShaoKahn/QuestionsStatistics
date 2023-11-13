package com.gmail.kahn.sha.alex.questionsstatistics;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "questionsServlet", value = "/questions-servlet")
public class QuestionsServlet extends HttpServlet {
    private final int[][] counters = new int[2][2];

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String q1 = req.getParameter("q1");
        String q2 = req.getParameter("q2");
        HttpSession session = req.getSession(false);
        if (session != null) {
            if ("yes".equals(q1)) counters[0][0]++;
            if ("no".equals(q1)) counters[0][1]++;
            if ("dont".equals(q2)) counters[1][0]++;
            if ("weird".equals(q2)) counters[1][1]++;
            session.setAttribute("counters", counters);
        }
        resp.sendRedirect("index.jsp");
    }
}