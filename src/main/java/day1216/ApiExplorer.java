package day1216;



import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ApiExplorer {
	
	public void createRss(String rssName,String fileName)throws IOException {
		StringBuilder urlBuilder = new StringBuilder("https://news-ex.jtbc.co.kr/v1/get/rss/"+rssName); /*URL*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        FileWriter fw=null;
        
        fw=new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day1216/"+fileName+".xml");
        while ((line = rd.readLine()) != null) {
            sb.append(line);
            fw.write(line);
        }
        fw.close();
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());		
	}
}
