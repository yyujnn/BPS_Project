<%@page import="kr.smhrd.model.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 지시자 사용해서 jstl 라이브러리 안쪽에서도 어떤 도구를 사용할 것인지 지정 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/LoginPage.css" />
    <title>SOORE</title>
</head>
<body>
    <main class="main">
        <section class="home">
          <h1>Welcome to the <span>SOORE</span></h1>
          <button id="sign-up" class="btn">SIGN UP</button>
          <button id="sign-in" class="btn">SIGN IN</button>
          <p class="link-copy">as comfortable as a cart</p>
        </section>
      
        <section class="sign-up">
          <article class="signup-left">
            <h1>SOORE</h1>
            <div class="btn-back">
              <i class="fas fa-2x fa-angle-left angle-left-color"></i>
              HOME
            </div>
          </article>
      
          <article class="form-area">
            <!-- Form area Sign Up -->
            <div class="organize-form form-area-signup">
              <h2>SIGN UP</h2>
              <form class="form" action="Join.do" method="post">
                <div class="form-field">
                <div class="form-field">
                  <label for="email">ID</label>
                  <input type="text" id="email" name = "USER_ID" />
                
                <div class="form-field">
                  <label for="password">Password</label>
                  <input type="text" id="password" name = "USER_PW"/>
                </div>
      
                </div>
                  <label for="name">Name</label>
                  <input type="text" id="name" name ="USER_NAME" />
                </div>
      
      
                <button type="submit" class="btn-sign btn-up">Sign Up</button>
              </form>
              <p>Have an account? <a href="#" class="link-in">Sign In</a></p>
      
            </div>
      
            <!-- Form area Sign In -->
            <div class="organize-form form-area-signin">
              <h2>SIGN IN</h2>
              <form class="form" action="Login.do" method="post">
                <div class="form-field">
                  <label for="email-in">ID</label>
                  <input type="text" name="USER_ID" id="email-in" />
                </div>
      
                <div class="form-field">
                  <label for="password-in">Password</label>
                  <input type="password" name="USER_PW" id="password-in" />
                </div>
      
                <button type="submit" class="btn-sign btn-in">Sign In</button>
              </form>
              <p>Haven't an account? <a href="#" class="link-up">Sign Up</a></p>
            </div>
          </article>
      
          <article class="signup-right">
            <i class="fas fa-2x fa-bars bars-style"></i>
            <p><a class="link-copy" href="http://collectui.com/designers/dnes/sign-up" target="_blank">©Copyright 2020</a></p>
      
          </article>
        </section>
      </main>

      <script src="assets/js/LoginPage.js"></script>
</body>
</html>