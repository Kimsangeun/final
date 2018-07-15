package com.jhta.proj;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    

    @ModelAttribute("datelist") //현재 날짜로부터 2주
    public Object datelist(Model model) {
    	
    	ArrayList datearr = new ArrayList<>();
    	
    	SimpleDateFormat sdfd = new SimpleDateFormat("YYYY-MM-dd");
    	
    	Date now = new Date();
		
		for (int i = 0; i < 14; i++) {
			Date dlist = new Date(now.getYear(), now.getMonth(), now.getDate()+i);
			datearr.add(sdfd.format(dlist));
		}
		 
    	return datearr;
    }
     
    
    @ModelAttribute("reserdata")
    public Object rese(Model model, ReserVO vo) {
        
        Object res=null;
        
        res = rdao.list(vo);
        
        return res;
    }
    
    @ModelAttribute("moviedata")
    public Object mov(Model model, MovVO vo) {
        Object res=null;
        
        res = mdao.list(vo);
    
        return res;
    }
    
    @ModelAttribute("datedata")
    public Object dat(Model model, ScreenInfoVO vo) {
        Object res = null;
        
        res = sdao.datelist(vo);
        //System.out.println(res);
        return res;
    }
    
    @RequestMapping("/reser")
    public Object cine2(Model model) {
        model.addAttribute("menu","reservation");
        
        String mm = "reser";
        
        model.addAttribute("main", mm);
        
        return "home";
    }
    
    
    @RequestMapping("/timetable")
    public Object cine3(Model model, ScreenInfoVO svo) {
        Object res = null;
        model.addAttribute("menu","reservation");
        
        String mm = "timetable";      
        res = mdao.dateTitleList(svo);
        System.out.println(res);
        model.addAttribute("main", mm);
        model.addAttribute("dateTitleList", res);
        return "home";
    }
    
    @RequestMapping("/payment")
    public Object cine4(Model model, HttpSession session, ReserVO rvo){
        model.addAttribute("menu", "reservation");
        rvo.setId(session.getAttribute("id")+"");
        
        System.out.println(rvo);
        String mm = "payment";
        model.addAttribute("rvo", rvo);
        model.addAttribute("main", mm);
        return "home";
    }
    
    @RequestMapping(value = "/payend", method = RequestMethod.POST)
    public Object cine5(Model model, HttpServletRequest request, ReserVO rvo) {
        System.out.println("포스트로 받았다.");
        model.addAttribute("menu", "reservation");
        
        if (request.getParameter("paytype").equals("csh")) {
            rvo.setCoc("cash");
        } else
            rvo.setCoc("card");
        System.out.println(rvo);
        System.out.println("paytype::" + request.getParameter("paytype"));
        System.out.println("banknum::" + request.getParameter("banknum"));
        System.out.println("bankpw::" + request.getParameter("bankpw"));
        System.out.println("sendbank::" + request.getParameter("sendbank"));
        System.out.println("cardnum1::" + request.getParameter("cardnum1"));
        System.out.println("cardnum2::" + request.getParameter("cardnum2"));
        System.out.println("cardnum3::" + request.getParameter("cardnum3"));
        System.out.println("cardnum4::" + request.getParameter("cardnum4"));
        System.out.println("cardpw::" + request.getParameter("cardpw"));
        System.out.println("birth::" + request.getParameter("birth"));
        System.out.println("cardchk::" + request.getParameter("cardchk"));
        String mm = "payend";
        
        rdao.insert(rvo);
        
        model.addAttribute("rvo", rvo);
        model.addAttribute("main", mm);
        return "home";
    }
    
    @RequestMapping("/screenchoice")
    public Object cine6(Model model, @RequestParam String sid) {
        model.addAttribute("menu", "reservation");
        //영화, 날짜, 시간, 등등?
        
        ReserVO rvo = new ReserVO();
        ScreenInfoVO svo = new ScreenInfoVO();
        
        svo.setsId(Integer.parseInt(sid));
        
        svo = sdao.findSInfo(svo);
        
        rvo.setId("gwakki");
        rvo.setmId(svo.getmId());
        //rvo.setrId(15);
        //rvo.setSeatNum("c3,c4");
        rvo.setsId(svo.getsId());
        //rvo.setCnt(2);
        
        String mm = "screenchoice";
        model.addAttribute("rvo", rvo);
        model.addAttribute("main", mm);
        return "home";
    }
    
    @RequestMapping("/forbidden")
    public Object cine4(Model model) {
        
        model.addAttribute("menu","reservation");
        
        String mm = "forbidden";
        
        
        model.addAttribute("main", mm);
        return "home";
    }
}
