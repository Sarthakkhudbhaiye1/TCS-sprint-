<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Servlet.CustomerBooking" %>
<html>
<head>
    <title>Customer Booking History</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h2>Customer Booking History</h2>

    <table>
        <tr>
            <th>Booking ID</th>
            <th>Receiver Name</th>
            <th>Receiver Address</th>
            <th>Status</th>
            <th>Service Cost</th>
            <th>Payment Time</th>
        </tr>
        <%
            List<CustomerBooking> customerBookings = (List<CustomerBooking>) request.getAttribute("customerBookings");
            if (customerBookings != null && !customerBookings.isEmpty()) {
                for (CustomerBooking customerBooking : customerBookings) {
        %>
        <tr>
            <td><%= customerBooking.getBookingId() %></td>
            <td><%= customerBooking.getReceiverName() %></td>
            <td><%= customerBooking.getReceiverAddress() %></td>
            <td><%= customerBooking.getStatus() %></td>
            <td><%= customerBooking.getServiceCost() %></td>
            <td><%= customerBooking.getPaymentTime() != null ? customerBooking.getPaymentTime().toString() : "N/A" %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No booking history found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="customermenu.jsp">Back to Dashboard</a>
</body>
</html>

