 EV SLOT MANAGEMENT SYSTEM
--------------------------
A web-based application for managing EV charging slot bookings efficiently.

TECH STACK:
------------
Frontend: HTML, CSS, JavaScript, JSP  
Backend: Java Servlets, JSP  
Database: MySQL  
Connectivity: JDBC  
Server: Apache Tomcat  

FEATURES:
---------
✔ User Authentication – Secure login system for users and admins  
✔ Real-Time Slot Booking – Users can check availability and book slots  
✔ Admin Dashboard – Manage users and monitor bookings  
✔ Database Integration – Uses JDBC & MySQL for storing data  
✔ Responsive UI – Easy-to-navigate interface  

PROJECT STRUCTURE:
------------------
EVChargingSystem/
│── src/
│   ├── controllers/ (Servlets for login, booking, admin)
│   ├── utils/ (Database connection, helper functions)
│   ├── models/ (User, Slot)
│── WebContent/
│   ├── WEB-INF/web.xml (Servlet configurations)
│   ├── index.jsp, dashboard.jsp, slots.jsp
│── lib/ (JDBC MySQL Connector)
│── README.txt

SETUP INSTRUCTIONS:
-------------------
1. Install Java JDK, Apache Tomcat, and MySQL  
2. Configure database in `DatabaseConnection.java` (if applicable)  
3. Deploy the project on Tomcat and start the server  
4. Open browser and visit: `http://localhost:8080/EVChargingSystem/index.jsp`  

FUTURE ENHANCEMENTS:
---------------------
- Payment Gateway Integration  
- User Notifications (Email/SMS)  
- Slot Cancellation & Refunds  
- Google Maps for Charging Stations  
 

