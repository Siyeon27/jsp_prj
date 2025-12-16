<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 //1.업로드된 파일을 저장할 경로 설정
File saveDir=new File( "C:/dev/workspace/jsp_prj/src/main/webapp/upload");
//2. 최대 크기 설정.
int maxSize=1024 * 1024 * 10;// 10MByte로 제한.
//업로드 크기를 설정
int uploadSize=1024 * 1024 * 600;// 600MByte로 제한.
//3 FileUpload 객체( MultipartRequest )를 생성. => 생성하자마자 업로드 된다. 
MultipartRequest mr=new MultipartRequest( request, saveDir.getAbsolutePath(),
		uploadSize,"UTF-8",new DefaultFileRenamePolicy());

String originalName=mr.getOriginalFileName("upfile");//원본명
String fileSystemName=mr.getFilesystemName("upfile");//변경된 이름

//업로드된 파일의 크기를 얻어서, 업로드가능 크기와 비교한다.
//파일이 크다면 사용자에게 "에러메시지를 보여준다." 파일을 삭제한다. 
File compareFile=new File(saveDir.getAbsolutePath()+File.separator+fileSystemName);

boolean flag=false;
if( flag = (compareFile.length() > maxSize)){
	compareFile.delete();
}//end if

JSONObject jsonObj=new JSONObject();
jsonObj.put("resultFlag", !flag );
jsonObj.put("uploadName", fileSystemName );
%>
<%= jsonObj.toJSONString() %>




