package day1215;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import kr.co.sist.emp.DeptDTO;
import kr.co.sist.emp.EmployeeDAO;

public class CreateDeptXML {

	public void createXml( List<DeptDTO> list,JspWriter out)throws IOException {
		//1.XML문서 객체 생성
		Document doc=new Document();
		//2.최상위 부모노드 생성
		Element deptsNode=new Element("depts");
		//3.최상위 부모노드를 문서객체에 추가
		doc.addContent( deptsNode );
		
		//4.자식 노드중 부모노드 선언
		Element deptNode=null;
		//5.자식노드 선언
		Element deptnoNode=null;
		Element dnameNode=null;
		
		for( DeptDTO dDTO : list) {
			deptNode=new Element("dept");//<dept>
			deptnoNode=new Element("deptno");//<deptno>
			dnameNode=new Element("dname");//<dname>
			
			//생성된 자식 노드를 자식노드중 부모노드에 배치
			deptNode.addContent(deptnoNode);//<dept><deptno/></dept>
			deptNode.addContent(dnameNode);//<dept><deptno/><dname/></dept>
			//자식을 가진 부모노드를 최상위 부모노드에 배치
			deptnoNode.setText( String.valueOf( dDTO.getDeptno() ));
			dnameNode.setText( dDTO.getDname() );
			
			deptsNode.addContent(deptNode);
		}//end for
		
		//6.생성된 객체를 출력
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, System.out); //콘솔출력
		FileOutputStream fos=new FileOutputStream
				("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/deptInfo.xml");
		xOut.output(doc, fos); //파일출력
		xOut.output(doc, out); //웹브라우저 출력
		
		if( fos != null ) { fos.close(); }//end if
		
	}//createXml

}//class
