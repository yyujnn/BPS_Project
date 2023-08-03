package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// FrontController ---> 매니저급 직원
	// ~~~Service(일반클래스 / POJO) ---> 아르바이트생
	// Command ---> 아르바이트생이라면 지켜야하는 업무 메뉴얼
	
	// 추상메소드 ---> {} 없고 틀만 정해져 있음!
	// 추상메소드는 반드시 자식클래스가 오버라이딩(재정의) 해줘야한다!
	// ----> 규격의 강제화가 가능!

	public String excute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

}
