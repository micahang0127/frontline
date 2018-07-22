package com.frontline.newssummary.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.frontline.newssummary.Service.CardBoardService;
import com.frontline.newssummary.Service.WordCloudService;
import com.frontline.newssummary.vo.ArticleVO;
import com.frontline.newssummary.vo.MainSummaryListVO;
import com.frontline.newssummary.vo.SummaryListVO;
import com.frontline.newssummary.vo.WordCloudVO;

@Controller
public class CardBoardController {

	
	@Inject
	CardBoardService cardBoardService;
	
	@Inject
	WordCloudService wordCloudService;
	
	@RequestMapping("index")
	String showIndex(MainSummaryListVO msvo, HttpServletRequest request) {
		List<MainSummaryListVO> MainSummarylist = cardBoardService.getMainSummaryList(msvo);
		if(MainSummarylist !=null) {
			request.setAttribute("list", MainSummarylist);
		}
		return"index";
	}
	
	@RequestMapping("politics")
	String politics(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 100;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("Economy")
	String Economy(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 101;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("society")
	String society(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 102;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("culture")
	String culture(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 103;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("world")
	String world(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 104;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("science")
	String science(SummaryListVO slvo, HttpServletRequest request, @RequestParam("pageNo") int pageNo) {
		int sid = 105;
		int pageNoFront = (pageNo -1) * 10;
		int pageNoBack = pageNo * 10;
		List<SummaryListVO> Summarylist = cardBoardService.getSubSummaryList(sid, pageNoFront, pageNoBack);
		if(Summarylist !=null) {
			request.setAttribute("list", Summarylist);
		}
		return"ListIndex";
	}
	
	@RequestMapping("word")
	String word(WordCloudVO wcvo, HttpServletRequest request) {
		List<WordCloudVO> WordCloud = wordCloudService.getWordCloud();
		System.out.println("?ш린??/word ??WordCloud?? "+ WordCloud);
		if(WordCloud != null){
			request.setAttribute("wordCloud", WordCloud);
			System.out.println("/word ??WordCloud ??if not null : "+WordCloud);
		}
		
		return"ListIndex";
	}
	
	@RequestMapping(value="/tags/{keyword}", produces="application/json;charset=UTF-8")
	public String searchByKeyword (@PathVariable String keyword, WordCloudVO wcvo,HttpServletRequest request ) {
		List<ArticleVO> articles = wordCloudService.findByKeyword ( keyword );
		System.out.println("肄섑듃濡ㅻ윭 articles:"+ articles);
		System.out.println("肄섑듃濡ㅻ윭 keyword:"+ keyword );
		if(articles != null){
			request.setAttribute("articles", articles);
			
			
		}

		return "keyword_news";
	}
	
	@RequestMapping(value="/cloudwords", produces="application/json;charset=UTF-8")
	@ResponseBody
	String word(HttpServletRequest request) throws JsonProcessingException {
		/*
		 * pc-a - 硫붾え由ъ뿉 ?대뼡 ?뺣낫媛 ?덉쓬
		 * 1) ?꾩썝??爰쇱?硫??뺣낫(?곹깭)媛 ?좎븘媛?
		 * 2) ?대뵒????μ쓣 ?대넃?꾩빞??
		 * 
		 * ???곹깭瑜??대뵒????μ쓣 ?좎?, ??λ? ?좊븣? ?ㅼ떆 蹂듭썝?좊븣??洹쒖튃!
		 * 
		 * 
		 */
//		String tags = "{k:r}".replace("k", qt("korea"));
		List<WordCloudVO> words = wordCloudService.getWordCloud();
//		return words;
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(words);
		System.out.println("?ш린??/coludwordsword(OK): "+words);
		return jsonString;
		/*
		StringBuilder sb = new StringBuilder(); // stringbuffer
		sb.append("[");
		for ( WordCloudVO w : words) {
			
			sb.append( "{\"word\": $k, \"freq\": $v}".replace("$k", qt(w.getKeyword())).replace("$v", "" + w.getRank() ) ) ;
			sb.append(",");
		}
		sb.delete(sb.length()-1, sb.length()); // 留??앹뿉 ?쇳몴 ?쒓굅 
		sb.append("]");
		
		String tags = sb.toString(); // "[{\"word\" : \"kor\", \"freq\": 10}, {\"word\" : \"jpn\", \"freq\": 12}]";
		return tags; // [{\"kor\" : 10}, {\"jpn\" : 30}].jsp
		*/
	}
	private WordCloudVO asWord(String key, int freq) {
		WordCloudVO v = new WordCloudVO();
		v.setWord(key);
		v.setCnt(freq);
		return v;
	}

	private String qt ( String s ) { return "\"" + s + "\"";}
	
	
}
