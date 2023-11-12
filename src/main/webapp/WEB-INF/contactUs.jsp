<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/form.css">
</head>

<body>
<div class="containerForm">
  <div class="form">
    <div class="contact-info">
      <h3 class="title">Ask us anything !</h3>
      <p class="text">
        An issue ? A question ? A recommendation ? Or you just want to leave a message ? Please use this form to contact the Pixel Paradise team. !
      </p>
      <a href="index">Go back</a>
    </div>

    <div class="contact-form">
      <form action="FormServlet" method="post" id="formMsg">
        <h3 class="title">Contact us</h3>
        <div class="input-container">
          <input class="input" type="text" name="name" size='40' maxlength='40' id="name" required/>
          <label for="name">Name</label>
          <span>Name</span>
        </div>
        <div class="input-container">
          <input class="input" type="email" name="email" size='40' maxlength='40' id="email" required>
          <label for="email">Email address</label>
          <span>Email address</span>
        </div>
        <div class="input-container">
          <select required name="typeMessage" class="select-type">
            <option selected value="issue">Issue</option>
            <option value="question">Question</option>
            <option value="suggestion">Recommendation</option>
          </select>
        </div>

        <div class="input-container">
          <input class="input" type="text" name="subject" size='40' maxlength='40' id="about" required>
          <label for="about">Object of the message</label>
          <span>Object of the message</span>
        </div>

        <div class="input-container textarea">
          <textarea required name="message" class="input" size='500' maxlength='500' id="message"></textarea>
          <label for="message">Message</label>
          <span>Message</span>
        </div>
        <input type="submit" value="Send the form" class="btn" />
      </form>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/JS/form.js"></script>
</body>
</html>