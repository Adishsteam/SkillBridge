<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SkillBridge</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<div class="mouse-glow" id="mouseGlow"></div>

<div class="landing-wrapper">
<div class="animated-grid"></div>
<i class="fa-solid fa-code floating-icon code-icon"></i>

<i class="fa-solid fa-laptop-code floating-icon laptop-icon"></i>

<i class="fa-solid fa-brain floating-icon brain-icon"></i>

<i class="fa-solid fa-database floating-icon db-icon"></i>

<i class="fa-brands fa-java floating-icon java-icon"></i>

<i class="fa-solid fa-microchip floating-icon chip-icon"></i>
    <div class="bg-gradient-mesh"></div>
    <div class="glow-blob blob-blue"></div>
    <div class="glow-blob blob-purple"></div>
    <div class="glow-blob blob-emerald"></div>

    <div class="particles-container" id="particlesContainer"></div>

   <main class="welcome-card">

    <div class="card-content">
        <header class="brand-showcase">
            <div class="brand-icon-wrapper">
                <i class="fa-solid fa-graduation-cap"></i>
            </div>
            <h1>Welcome to <span class="gradient-text">SkillBridge</span></h1>
            
            <p class="brand-tagline"><span id="typing-text"></span><span class="cursor">|</span></p>
        </header>

        <section class="feature-highlights">
            <div class="feature-item">
                <i class="fa-solid fa-chart-pie accent-blue"></i>
                <div>
                    <h4>Skill Matrix Mapping</h4>
                    <p>Inventory your technological proficiencies against live framework domains dynamically.</p>
                </div>
            </div>

            <div class="feature-item">
                <i class="fa-solid fa-route accent-green"></i>
                <div>
                    <h4>Gap Analysis Pathways</h4>
                    <p>Instantly discover targeted upskilling requirements and certified external coursework.</p>
                </div>
            </div>
        </section>

        <div class="action-gateways">
            <a href="register.jsp" class="btn-primary-action">
                <span>Create Account</span>
                <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="login.jsp" class="btn-secondary-action">
                <span>Sign In to Console</span>
                <i class="fa-solid fa-right-to-bracket"></i>
            </a>
        </div>

        <footer class="landing-footer">
            <p>&copy; 2026 SkillBridge Analytics Platform. All rights reserved.</p>
</footer>

</div>

</main>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {

    // ---------------- Typing Animation ----------------
    const textToType = "Dynamic Job-Skill Gap Analyzer & Training Pathway Recommender.";
    const typingSpeed = 40;
    let index = 0;

    const textContainer = document.getElementById("typing-text");

    function startTyping() {
        textContainer.textContent = "";
        index = 0;
        typeEffect();
    }

    function typeEffect() {
        if (index < textToType.length) {
            textContainer.textContent += textToType.charAt(index);
            index++;
            setTimeout(typeEffect, typingSpeed);
        } else {
            setTimeout(startTyping, 3000);
        }
    }

    setTimeout(startTyping, 800);


    // ---------------- Floating Particles ----------------
    const container = document.getElementById("particlesContainer");

    for (let i = 0; i < 60; i++) {

        const particle = document.createElement("div");
        particle.classList.add("particle");

        const size = Math.random() * 6 + 4;

        particle.style.width = size + "px";
        particle.style.height = size + "px";

        particle.style.left = Math.random() * 100 + "%";
        particle.style.top = Math.random() * 100 + "%";

        particle.style.animationDuration = (12 + Math.random() * 10) + "s";
        particle.style.animationDelay = (Math.random() * 8) + "s";

        container.appendChild(particle);
    }


    // ---------------- 3D Mouse Tilt ----------------
   
const card = document.querySelector(".welcome-card");
const content = document.querySelector(".card-content");

card.addEventListener("mousemove", (e) => {

    const rect = card.getBoundingClientRect();

    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    const rotateY = ((x / rect.width) - 0.5) * 18;
    const rotateX = ((0.5 - y / rect.height)) * 18;

    content.style.transform =
        `perspective(1000px)
         rotateX(${rotateX}deg)
         rotateY(${rotateY}deg)
         scale(1.02)`;

});

card.addEventListener("mouseleave", () => {

    content.style.transform =
        "perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1)";

});

    // ===========================
    // Mouse Glow
    // ===========================

    const glow = document.getElementById("mouseGlow");

    document.addEventListener("mousemove", function(e){

        glow.style.left = e.clientX + "px";
        glow.style.top = e.clientY + "px";

    });

});
</script>
</body>
</html>