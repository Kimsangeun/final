package com.jhta.proj;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.proj.model.MemberVO;
import com.jhta.proj.model.MovDAO;
import com.jhta.proj.model.MovVO;
import com.jhta.proj.model.ReserDAO;
import com.jhta.proj.model.ReserVO;
import com.jhta.proj.model.ScreenInfoDAO;
import com.jhta.proj.model.ScreenInfoVO;

@Controller
@RequestMapping("reservation")
public class ReserController {

	@Resource
	ReserDAO rdao;

	@Resource
	MovDAO mdao;

	@Resource
	ScreenInfoDAO sdao;

	ReserVO rvo;

	/*
	 * @ModelAttribute("top") public ArrayList top() {
	 * 
	 * ArrayList<String> res = new ArrayList<String>();
	 * 
	 * res.add("info"); res.add("reservation"); res.add("movie"); res.add("screen");
	 * return res; }
	 */

	SimpleDateFormat sdft=new SimpleDateFormat("HH:mm");
	SimpleDateFormat sdfd = new SimpleDateFormat("YYYY-MM-dd ");
	SimpleDateFormat sdfe = new SimpleDateFormat("E");


	@ModelAttribute("datelist") // 현재 날짜로부터 2주
	public Object datelist(Model model) {
		ArrayList datearr = new ArrayList<>();

		SimpleDateFormat sdfd = new SimpleDateFormat("YYYY-MM-dd");

		Date now = new Date();

		for (int i = 0; i < 14; i++) {
			Date dlist = new Date(now.getYear(), now.getMonth(), now.getDate() + i);
			datearr.add(sdfd.format(dlist));
		}

		return datearr;
	}
	

	@ModelAttribute("reserdata")
	public Object rese(Model model, ReserVO vo) {

		Object res = null;

		res = rdao.list(vo);

		return res;
	}

	@ModelAttribute("moviedata")
	public Object mov(Model model, MovVO vo) {
		Object res = null;

		res = mdao.list(vo);
		// System.out.println(res);
		return res;
	}

	@ModelAttribute("datedata")
	public Object dat(Model model, ScreenInfoVO vo) {
		Object res = null;

		res = sdao.datelist(vo);
		// System.out.println(res);
		return res;
	}

	@ModelAttribute("titlelist")
	public Object tit(Model model, MovVO vo) {
		Object res = null;

		res = mdao.titlelist(vo);
		// System.out.println(res);
		return res;
	}


	@ModelAttribute("dateTitleList")
	public Object datetitlelist(Model model, ScreenInfoVO vo) {
		Object res = null;
		res = mdao.dateTitleList(vo);
		// System.out.println(res);
		return res;
	}


	@RequestMapping("/reser")
	public Object cine2(Model model) {
		model.addAttribute("menu", "reservation");

		String mm = "reser";

		model.addAttribute("main", mm);

		return "home";
	}

	@RequestMapping(value = "/screenchoice")
	public Object cine6(Model model, @RequestParam Integer sid, @RequestParam Integer mid, HttpSession session) {
		model.addAttribute("menu", "reservation");
		// 영화, 날짜, 시간, 등등?
		System.out.println("sid::" + sid);
		ScreenInfoVO svo = new ScreenInfoVO();
		svo.setsId(sid);
		svo = sdao.findSInfo(svo);

		rvo = new ReserVO();
		rvo.setId(((MemberVO) session.getAttribute("mem")).getId());
		rvo.setmId(mid);
		rvo.setsId(sid);
		System.out.println("/screenchoice::" + rvo);

		ArrayList<String> seatarr = (ArrayList<String>) rdao.seatlist(rvo);
		String allSeat = "";
		for (String ss : seatarr) {
			allSeat += ss;
		}
		
		System.out.println("STRING::"+allSeat);
		Set<String> seatList = new HashSet<>();

		for (String ss : allSeat.split(",")) {
			seatList.add(ss);
		}
		System.out.println("SET::"+seatList);

		
		String mm = "screenchoice";
		model.addAttribute("seatList", seatList);
		model.addAttribute("rvo", rvo);
		model.addAttribute("svo", svo);
		model.addAttribute("main", mm);
		return "home";
	}

	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public Object cine24(Model model, @RequestParam String seatnum, @RequestParam int cnt) {
		System.out.println("병수1");
		model.addAttribute("menu", "reservation");

		// rvo.setCnt(request.getParameter("cnt"));
		// rvo.setSeatNum(request.getParameter("seatnum"));

		rvo.setCnt(cnt);
		rvo.setSeatNum(seatnum);
		System.out.println("병수2");

		System.out.println("/payment::" + rvo);
		String mm = "payment";
		model.addAttribute("rvo", rvo);
		model.addAttribute("main", mm);
		return "home";
	}


	@RequestMapping("/timetable")
    public Object cine3(Model model, ScreenInfoVO svo) {
        
    	Date now = new Date();
    	
    	String nowtime = sdft.format(now);
    	
    	model.addAttribute("nowtime", nowtime);
    	
    	//System.out.println(nowtime);
    	
    	model.addAttribute("menu","reservation");
        
        String mm = "timetable";      
       
        model.addAttribute("main", mm);
        return "home";
    }

	@RequestMapping(value = "/payend", method = RequestMethod.POST)
	public Object cine5(Model model, HttpServletRequest request) {
		System.out.println("포스트로 받았다.");
		model.addAttribute("menu", "reservation");

		if (request.getParameter("paytype").equals("csh")) {
			rvo.setCoc("cash");
		} else
			rvo.setCoc("card");
		System.out.println(rvo);

		if (rvo.getCoc().equals("cash")) {
			rvo.setAccNum(request.getParameter("banknum"));
		} else if (rvo.getCoc().equals("card")) {
			String card = request.getParameter("cardchk") + "_" + request.getParameter("cardnum1") + "-"
					+ request.getParameter("cardnum2") + "-" + request.getParameter("cardnum3") + "-"
					+ request.getParameter("cardnum4");
			rvo.setAccNum(card);
		}

		rvo.setCost(rvo.getCnt() * 3000);

		System.out.println("/payend::" + rvo);

		String mm = "payend";

		rdao.insert(rvo); // 인서트가 안돼. 마이바티스에서 rvo 널값있다고 에러처리. // 됨

		ScreenInfoVO svo = new ScreenInfoVO();
		svo.setsId(rvo.getsId());
		svo = (ScreenInfoVO) sdao.findSInfo(svo);

		model.addAttribute("svo", svo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("main", mm);
		return "home";
	}

	@RequestMapping("/forbidden")
	public Object cine4(Model model) {

		model.addAttribute("menu", "reservation");

		String mm = "forbidden";

		model.addAttribute("main", mm);
		return "home";
	}

}