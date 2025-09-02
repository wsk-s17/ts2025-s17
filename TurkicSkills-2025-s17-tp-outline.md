# Skill 17 – Web Technologies  
## Competition Task Overview  

### INTRODUCTION  
This document briefly describes the competition task for **Skill 17 – Web Technologies**.  
The document contains only the basic information.  

The final version of the competition task, using this document as a guideline, will be presented to all experts on **C-1**.  
The marking scheme will not be presented or supplied to competitors or experts during the competition.  

---

### DESCRIPTION OF PROJECT AND TASKS  
The Test Project will consist of **6 modules** with the following topics:  

- **Module A**: Static Website Design (HTML/CSS)  
- **Module B**: Dynamic Website with Server-Side Rendering  
- **Module C**: REST API  
- **Module D**: Interactive Frontend using an API  
- **Module E**: Speed Tasks  
- **Module F**: Collaborative Challenge  

These modules will be further described in this document.  

---

## OUTLINE OF THE MODULES  

### Module A – Static Website Design  
**Competition time**: 3 hours  

#### Introduction  
Module A will focus on the creation of a static website using HTML and CSS only.  

#### Description of project and tasks  
Competitors will be asked to create a **static website** for a specified client.  

- The website will consist of subpages, each reachable under separate paths.  
- The design of all subpages should be aligned.  
- The website must conform with **WCAG (at least level AA)** accessibility standards.  
- Implement **SEO best practices**, as the site will be used to attract new users.  
- Responsiveness is important: the site must look good on **mobile, tablet, and desktop**.  

The client will provide:  
- Defined website structure (all pages and sections)  
- Content (text, images, media)  
- Exact definitions of responsive breakpoints  

⚠️ Restrictions:  
- No server-side or client-side frameworks allowed.  
- CSS preprocessors may be used, but the generated code must still pass **W3C validation**.  

---

### Module B – Dynamic Website with Server-Side Rendering  
**Competition time**: 4 hours  

#### Introduction  
Module B will focus on the creation of a **dynamic website** using a server-side framework.  

#### Description of project and tasks  
Competitors will create a **dynamically and server-side rendered website** for users to manage accounts and related information.  

- Website is **protected** and only accessible after login.  
- Must implement **OWASP guidelines**.  
- The client provides detailed functionality requirements.  
- Competitors must design a **database schema** and implement it.  
- Example data will be provided (not normalized). Competitors must adapt it.  

⚠️ Restrictions:  
- Must use a **server-side framework**.  
- Frontend libraries allowed for interactivity.  
- Rendering must be done on the server side (not via client-side frameworks calling an API).  

---

### Module C – REST API  
**Competition time**: 3 hours  

#### Introduction  
Module C will focus on the implementation of a **REST API**.  

#### Description of project and tasks  
Competitors will develop a **secure, database-backed REST API**.  

- Backend must **fetch and interpret external API data resiliently**.  
- Must serve a **frontend-ready API**.  
- Implement **security and role-based access control (RBAC)**.  
- Public endpoints → basic data.  
- Protected endpoints → control features.  
- Use a **relational database** for storage.  
- Must follow **OpenAPI specification**, including error responses.  

⚠️ Note:  
Any modifications to backend from previous modules (including DB changes) will **not** be taken into account.  

---

### Module D – Interactive Frontend using an API  
**Competition time**: 4 hours  

#### Introduction  
Module D will focus on the **implementation of a frontend** for a REST API.  

#### Description of project and tasks  
Competitors will build a **Single Page Application (SPA)** that consumes the provided REST API.  

- Some endpoints require **authentication & login**.  
- Module D builds on Module C → competitors are given a working solution of Module C.  
- ⚠️ Competitors cannot use their own Module C implementation.  
- Frontend must:  
  - Consume the API  
  - Display pages based on API responses  
  - Send user-triggered actions back to the API  
- Allowed: frontend frameworks & libraries  

Requirements:  
- Must be an **SPA**.  
- Page reloads must present **consistent state** (except unsaved user input).  

---

### Module E – Speed Tasks  
**Competition time**: 3 hours  

#### Introduction  
Module E will focus on **small web development tasks** (frontend).  

#### Description of project and tasks  
Competitors will complete a variety of **short tasks**, such as:  

- Implementing JavaScript functions from given documentation  
- Creating and styling UI elements  
- Building interactive features with JavaScript  

Tasks will be divided into **three levels**:  
- Easy  
- Medium  
- Hard  

Scoring will depend on difficulty level.  

---

### Module F – Collaborative Challenge  
**Competition time**: 2 hours  

#### Introduction  
Module F emphasizes **creativity and collaboration**.  

#### Description of project and tasks  
- Competitors form **groups** and create a **small web experience**.  
- Groups present results to other competitors and experts.  
- Presentation must include:  
  - What they created  
  - How they came up with the idea  
  - A **demo**  

---
