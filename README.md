# 💼 EJB-Based Banking System

This project is a Java EE-based **Banking System** designed to demonstrate core enterprise features such as user account management, fund transfers, scheduled transactions, and automated monthly transaction reporting. It utilizes **EJB**, **JSP**, **Servlets**, and **TimerService** to deliver a modular, maintainable, and scalable banking application.

---

## 🚀 Features

- 🔐 **User Authentication**
  - Secure login for customers and administrators.
- 💸 **Real-Time Fund Transfers**
  - Transfer money instantly between accounts.
- 📅 **Scheduled Fund Transfers**
  - Set future-dated transfers using `@Stateless` EJB + `TimerService`.
- 📊 **Automated Monthly Transaction Reports**
  - EJB Timer auto-generates reports on the last day of each month.
- 📁 **Admin Dashboard**
  - View all users and transaction histories.
- 📤 **Export to PDF**
  - Export filtered reports to PDF for records or audits.
- 🧩 **Modular Architecture**
  - Clean separation between model, service, EJB, and UI layers.

---

## 🏗️ Technologies Used

- **Java EE** / **Jakarta EE**
- **Enterprise JavaBeans (EJB)** – Stateless Beans, TimerService
- **Jakarta Servlet API**
- **JavaServer Pages (JSP)**
- **MySQL** (Database)
- **Tailwind CSS** (UI Styling)
- **GlassFishr**
- **JDBC**

---

## ⚙️ How to Run

### Prerequisites

- Java 17+
- GlassFish 7 / Payara Server 6+
- MySQL or H2 Database
- Maven or NetBeans

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Kaveeshawj/NationsBank.git
   cd banking-system-ejb

Configure Database

Update persistence.xml with your database connection details.

Build and Deploy

Use NetBeans or Maven to deploy the project to your GlassFish or Payara Server.

Access the Application

Open your browser and navigate to:
http://localhost:8080/nations-bank/

---

📈 Performance & Best Practices
This project follows EJB best practices for scalability and maintainability:

Used @Stateless for lightweight transactional components

Leveraged @Schedule for automated monthly task execution

Centralized business logic in service layer for easy testing

Uses dependency injection to reduce boilerplate (@Inject, @EJB)

Metrics observed during testing:

Report generation completed under 1 second for 1000+ transactions

Low memory usage and no major GC pauses during scheduled tasks

Easy to scale due to stateless design and modular service beans

---

## 🧑‍💻 Author

Kaveesha Wijeweera
Undergraduate Software Engineer | Sri Lanka  
Linkedin: @kaveewijeweera 


