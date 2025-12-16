<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/octet-stream"
    pageEncoding="UTF-8"%>
<%
 //응답 헤더를 변경( download.jsp 에서 사용자가 선택한 파일명이 응답되도록 변경)
 String fileName=request.getParameter("fileName");
 String downFileName=fileName;
//한글은 URL형식으로 encoding해야한다. (2%EC%B0%A8%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_Scope)
if( downFileName != null ){
	downFileName=URLEncoder.encode(downFileName, "UTF-8");
}//end if
 response.setHeader("Content-Disposition", "attachment;fileName="+downFileName);
 
//다운로드할 파일의 정보를 얻기위해서 File 객체 생성.
File file
	=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);
//다운로드할 파일에 읽기 스트림을연결
FileInputStream fis=new FileInputStream(file);
//연결된 파일을 접속자에게 보내기 위해서, 접속자와 연결된 출력스트림을 얻는다.
 OutputStream os =response.getOutputStream();
// 읽어 들인 파일을 저장할 배열을 생성. 파일에서 읽어들여 출력스트림으로 출력.
byte[] readData=new byte[512];

int readSize=0;
while( (readSize=fis.read(readData)) != -1 ){ //파일의 끝 (EOF)까지 읽어들임.
	os.write( readData, 0, readSize); //읽어들인 데이터를 출력 스트림에 기록
}//end while
//출력스트림 초기화
out.clear();
//응답헤더를 HTML을 출력할 수 있게 초기화
out=pageContext.pushBody();


%>
