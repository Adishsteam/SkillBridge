# 🎓 SkillBridge
### Dynamic Job-Skill Gap Analyzer & Training Pathway Recommender

![Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk)
![JSP](https://img.shields.io/badge/JSP-Java-blue?style=for-the-badge)
![Servlet](https://img.shields.io/badge/Servlet-Jakarta-red?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![Tomcat](https://img.shields.io/badge/Apache-Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat)
![HTML](https://img.shields.io/badge/HTML5-orange?style=for-the-badge&logo=html5)
![CSS](https://img.shields.io/badge/CSS3-blue?style=for-the-badge&logo=css3)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 📖 Overview

**SkillBridge** is a Java-based web application that helps bridge the gap between a user's existing skills and current industry job requirements.

The application analyses a user's selected skills, compares them with job requirements stored in the database, calculates the match percentage, identifies missing skills, and recommends learning resources to improve employability.

This project was developed using **JSP, Servlets, JDBC, MySQL, HTML, CSS, and Apache Tomcat**.

---

# ✨ Features

✅ User Registration

✅ Secure User Login

✅ Interactive Dashboard

✅ Skill Selection Module

✅ Skill Gap Analysis

✅ Job Recommendation System

✅ Match Percentage Calculation

✅ Missing Skills Identification

✅ Course Recommendation Engine

✅ Modern Responsive UI

---

# 🖥️ Application Modules

## 🏠 Landing Page

- Modern animated homepage
- Responsive design
- Login & Registration navigation

---

## 👤 User Authentication

### Login
- Secure login system
- Session management

### Registration
- User account creation
- Database storage using JDBC

---

## 📊 Dashboard

- Personalized welcome screen
- Navigation sidebar
- Quick access to modules

---

## 🛠 Skill Selection

Users can select multiple technical skills such as:

- Java
- HTML
- CSS
- JavaScript
- SQL
- MySQL
- Python
- React
- Spring Boot
- Git
- C
- C++

---

## 📈 Skill Gap Analysis

The system compares user skills against company requirements and displays:

- Matching Skills
- Missing Skills
- Match Percentage
- Recommended Courses

---

# 🏗️ Technology Stack

| Technology | Purpose |
|------------|----------|
| Java | Backend |
| JSP | View Layer |
| Servlet | Controller |
| JDBC | Database Connectivity |
| MySQL | Database |
| HTML5 | Structure |
| CSS3 | Styling |
| Apache Tomcat | Web Server |
| Eclipse IDE | Development |

---

# 📂 Project Structure

```
SkillBridge
│
├── src
│   ├── main
│   │   ├── java
│   │   │   ├── dao
│   │   │   ├── database
│   │   │   ├── model
│   │   │   └── servlet
│   │   │
│   │   └── webapp
│   │       ├── css
│   │       ├── login.jsp
│   │       ├── register.jsp
│   │       ├── dashboard.jsp
│   │       ├── skills.jsp
│   │       ├── analyze.jsp
│   │       └── index.jsp
│
└── build
```

---

# 🗄️ Database

### Tables Used

- users
- skills
- user_skills
- jobs
- courses

---

# ⚙️ Installation Guide

## Clone Repository

```bash
git clone https://github.com/Adishsteam/SkillBridge.git
```

---

## Open Project

Import the project into **Eclipse IDE**.

---

## Configure Database

1. Install MySQL Server
2. Create a database
3. Import the required tables
4. Update database credentials inside:

```
DBConnection.java
```

Example:

```java
String url="jdbc:mysql://localhost:3306/skillbridge";
String user="root";
String password="your_password";
```

---

## Configure Apache Tomcat

- Install Apache Tomcat 9
- Add Tomcat Server in Eclipse
- Deploy the project

---

## Run Project

Visit

```
http://localhost:8080/SkillBridge
```

---

# 📸 Screenshots

## 🏠 Landing Page

> Add screenshot here


<img width="2596" height="1388" alt="image" src="https://github.com/user-attachments/assets/2f1da863-cb30-4562-b5b9-5c423ea8b598" />

---

## 🔐 Login Page

<img width="2596" height="1036" alt="image" src="https://github.com/user-attachments/assets/413b383b-857e-430f-b726-45ef81fc3aa6" />


---

## 📝 Registration Page

<img width="2596" height="1674" alt="image" src="https://github.com/user-attachments/assets/a7e86ebf-eb9d-4972-aed2-c49ffc331eb2" />



---

## 📊 Dashboard

<img width="2596" height="1292" alt="image" src="https://github.com/user-attachments/assets/6007b69b-861e-4b5e-8556-a41eb2a0fec4" />


---

## 🛠 Skill Selection

<img width="2596" height="1470" alt="image" src="https://github.com/user-attachments/assets/d181caee-ccf2-4679-a749-4099b1627ab2" />


---

## 📈 Skill Gap Analysis

<img width="2596" height="5340" alt="image" src="https://github.com/user-attachments/assets/99ca05af-54dc-4256-84d5-5d896bc88adc" />

---

# 🚀 Future Enhancements

- AI-based Career Recommendation
- Resume Analyzer
- Admin Dashboard
- Learning Progress Tracking
- Company Portal
- Email Notifications
- Certificate Verification
- Machine Learning Based Recommendation Engine

---

# 👨‍💻 Author

**Adish Moolya**

GitHub:
https://github.com/Adishsteam

---

# ⭐ Support

If you found this project useful,

⭐ Star this repository.

It helps others discover the project.

---

# 📄 License

This project is developed for educational and learning purposes.
