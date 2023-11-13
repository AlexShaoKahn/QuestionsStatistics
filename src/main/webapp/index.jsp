<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Questions Statistics</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

        *, *:before, *:after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
            color: #ffffff;
        }

        table {
            background: #012B39;
            border-radius: 0.25em;
            border-collapse: collapse;
            margin: 1em;
        }

        th {
            border-bottom: 1px solid #364043;
            color: #E2B842;
            font-size: 0.85em;
            font-weight: 600;
            padding: 0.5em 1em;
            text-align: left;
        }

        td {
            color: #fff;
            font-weight: 400;
            padding: 0.65em 1em;
        }

        .disabled td {
            color: #4F5F64;
        }

        tbody tr {
            transition: background 0.25s ease;
        }

        tbody tr:hover {
            background: #014055;
        }

        .center {
            margin-left: auto;
            margin-right: auto;
        }

        form {
            display: inline-block;
        }
    </style>
</head>
<body>
<%
    int[][] counters = (int[][]) session.getAttribute("counters");
    if (counters == null) counters = new int[2][2];
%>
<div style="text-align: center;">
    <form action="${pageContext.request.contextPath}/questions-servlet">
        <h1>Is HTML a programming language?</h1>
        <input type="radio" id="yes" name="q1" value="yes">
        <label for="yes">Yes</label><br>
        <input type="radio" id="no" name="q1" value="no">
        <label for="no">No</label><br><br>
        <h1>What is a Servlet?</h1>
        <input type="radio" id="dont" name="q2" value="dont">
        <label for="dont">Don't know</label><br>
        <input type="radio" id="weird" name="q2" value="weird">
        <label for="weird">Weird critter</label><br><br>
        <input type="submit" value="Submit">
    </form>
</div>

<table class="center">
    <tr>
        <th>QUESTION</th>
        <th>ANSWER 1</th>
        <th>COUNT</th>
        <th>ANSWER 2</th>
        <th>COUNT</th>
    </tr>
    <tr>
        <td>Is HTML a programming language?</td>
        <td>Yes</td>
        <td><%= counters[0][0] %>
        </td>
        <td>No</td>
        <td><%= counters[0][1] %>
        </td>
    </tr>
    <tr>
        <td>What is a Servlet?</td>
        <td>Don't know</td>
        <td><%= counters[1][0] %>
        </td>
        <td>Weird critter</td>
        <td><%= counters[1][1] %>
        </td>
    </tr>
</table>
</body>
</html>