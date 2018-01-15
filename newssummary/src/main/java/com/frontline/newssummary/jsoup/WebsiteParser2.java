package com.frontline.newssummary.jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WebsiteParser2 {
	public static void main (String args[]) throws IOException{

		Document doc;
		doc = Jsoup.connect("http://news.naver.com/main/history/mainnews/index.nhn?date=2018-01-11&time=10:00").get();
		//웹사이트의 링크를 리스트 형식으로 받아온다.

		Elements links = doc.getElementsByTag("div");
		for(Element link: links){
//			String l = link.getElementsByClass("nlb_");
//			if(l.length()>0){
//				if(l.length()<4)
//					l = doc.baseUri()+l.substring(1);
//				else if(!l.substring(0,4).equals("http"))
//					l = doc.baseUri()+l.substring(1);
//			}
//			System.out.println(l);
		}
	}
	
}