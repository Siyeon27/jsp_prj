package day1215;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 *  Parser를 사용한 XML 생성
 */
public class CreateJDOMXML {

	public static void main(String[] args) {

		//1.XML 문서객체(Document)를 생성
		Document doc=new Document();//<?xml version="1.0" encoding="UTF-8"?>
		
		//2.최상위 부모노드 생성
		Element rootNode=new Element("msgs");//<msgs/>
		
		//3.최상위 부모노드를 XML문서객체 추가 
		doc.addContent(rootNode);
		
		//4.자식 노드를 생성
		Element msgNode=new Element("msg");
		Element nameNode=new Element("name");
		//자식노드에 문자열 (String node) 추가
		msgNode.setText("오늘은 월요일 입니다.");
		nameNode.setText("민병조.");
		
		//5.자식노드를 부모노드에 추가
		rootNode.addContent(msgNode);
		rootNode.addContent(nameNode);
		
		//6.생성된 객체를 출력
		//XMLOutputter xout=new XMLOutputter( Format.getCompactFormat());
//		XMLOutputter xout=new XMLOutputter( Format.getRawFormat());
		XMLOutputter xout=new XMLOutputter( Format.getPrettyFormat());
		try {
			xout.output(doc, System.out);
			FileOutputStream fos=
			new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/msg.xml");
			xout.output(doc, fos);
		} catch (IOException e) {
			e.printStackTrace();
		}//end cathc
		
	}//main

}//class
