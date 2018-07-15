package com.jhta.proj;

import java.util.ArrayList;

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

	@ModelAttribute("reserdata")
	public Object rese(Model model, ReserVO vo) {

		Object res = null;

		return res;
	}

	@ModelAttribute("moviedata")
	public Object mov(Model model, MovVO vo) {
		Object res = null;

		res = mdao.list(vo);
		System.out.println(res);
		return res;
	}

	@ModelAttribute("datedata")
	public Object dat(Model model, ScreenInfoVO vo) {
		Object res = null;

		res = sdao.datelist(vo);
		// System.out.println(res);
		return res;
	}

	@ModelAttribute("midlist")
	public ArrayList<MovVO> midlist(Model model, ScreenInfoVO vo, MovVO mvo) {
		ArrayList<ScreenInfoVO> scrArr = null;
		ArrayList<MovVO> movArr = null;

		ArrayList<MovVO> res = new ArrayList<>();

		scrArr = (ArrayList) mdao.midList(vo);
		movArr = (ArrayList) mdao.list(mvo);

		for (MovVO movVo : movArr) {
			for (ScreenInfoVO scrVo : scrArr) {
				if (scrVo.getmId() == movVo.getmId()) {
					res.add(movVo);
				}
			}
		}
		System.out.println(res);
		return res;
	}

	// @RequestMapping("/")
	/*
	 * public Object cine1(Model model, ReserVO vo) {
	 * 
	 * model.addAttribute("menu","reservation");
	 * 
	 * String mm = "reser";
	 * 
	 * model.addAttribute("main", mm); return "home"; }
	 */

	@RequestMapping("/timetable")
	public Object cine3(Model model) {

		model.addAttribute("menu", "reservation");

		String mm = "timetable";

		model.addAttribute("main", mm);
		return "home";
	}

	@RequestMapping("/reser")
	public Object cine2(Model model) {
		model.addAttribute("menu", "reservation");

		String mm = "reser";

		model.addAttribute("main", mm);

		return "home";
	}

	@RequestMapping(value = "/screenchoice")
	public Object cine6(Model model, @RequestParam Integer sid, HttpSession session) {
		model.addAttribute("menu", "reservation");
		// 영화, 날짜, 시간, 등등?

		ScreenInfoVO svo = new ScreenInfoVO();
		svo.setsId(sid);
		svo = sdao.findSInfo(svo);

		rvo = new ReserVO();
		rvo.setId(((MemberVO) session.getAttribute("mem")).getId());
		rvo.setmId(svo.getmId());
		rvo.setsId(svo.getsId());
		System.out.println("/screenchoice::" + rvo);

		String mm = "screenchoice";
		model.addAttribute("rvo", rvo);
		model.addAttribute("main", mm);
		return "home";
	}

	@RequestMapping(value="/payment", method=RequestMethod.POST)
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
