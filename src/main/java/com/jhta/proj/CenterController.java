package com.jhta.proj;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.proj.model.BoardDAO;
import com.jhta.proj.model.BoardVO;
import com.jhta.proj.model.MemberVO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.MovieVO;
import com.jhta.proj.model.admin.ScreenDAO;
import com.jhta.proj.model.admin.TimeTableDAO;
import com.jhta.proj.model.admin.TimeTableVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("info/{service}")
public class CenterController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(MyBatisController.class);

	@Resource
	TimeTableDAO timeDao;

	@Resource
	MovieDAO movieDao;

	@Resource
	ScreenDAO screenDao;

	@Resource
	BoardDAO boardDao;

	String kind = "notice";

	@RequestMapping()
	String selectList(@PathVariable String service, BoardVO bvo, Model model, HttpServletRequest request) {

		String res = "home";
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "info");
		System.out.println("포비든킹덤");

		if (service.equals("delete")) {
			res = "admin/alert";
		}
		
		if(service.equals("modify")) {

			System.out.println("modify_bvo:"+bvo);
			
			model.addAttribute("bvo", bvo);
			model.addAttribute("main", "modify");
			model.addAttribute("menu", "info");
		}

		return res;
	}

	@RequestMapping(method = RequestMethod.POST)
	String aaa(@PathVariable String service, Model model, BoardVO bvo, BindingResult errors) {
		String res = "home";
		if (service.equals("insertReg") || service.equals("modifyReg")) {
			res = "/admin/alert";
			System.out.println("얼ㄹ랏");
		}
		

		return res;
	}

	@ModelAttribute("data")
	Object list(@PathVariable String service, BoardVO bvo, Model model, HttpServletRequest request) {
		System.out.println("데이타 탄다");
		Object res = null;
		// System.out.println(vo);
		switch (service) {
		case "notice":
			System.out.println("서비스 타긴 하지");
			System.out.println("공지사항 ㄱㄱ");

			kind = "notice";
			bvo.setKind("notice");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			res = boardDao.boardlist(bvo);
			break;

		case "faq":
			System.out.println("faq ㄱㄱ");
			kind = "faq";

			bvo.setKind("faq");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			res = boardDao.boardlist(bvo);

			break;

		case "qna":
			System.out.println("qna ㄱㄱ");
			kind = "qna";

			
			bvo.setKind("qna");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

//			String id = ((MemberVO)request.getSession().getAttribute("mem")).getId();
			//ㄴ여기서 에러
//			if(id.equals("admin"))
				res = boardDao.boardlist(bvo);
/*			else if(request.getSession().getAttribute("mem")!=null) {
				//화원이라면 마이페이지의 1:1문의 링크로
			}
			else {
				//비회원이면 ㄲㅈ
			}*/
			break;

		case "insertReg":

			System.out.println("insertReg!");
			bvo.setKind(kind);
			System.out.println("controller__insetreg::" + bvo);
			res = boardDao.insert(bvo);
			model.addAttribute("msg", "작성완료");
			model.addAttribute("url", "detail?bid=" + bvo.getBid());
			break;

		case "delete":
			System.out.println("delete...");
			System.out.println("del bvo1" + bvo);
			BoardVO boardvo = (BoardVO) boardDao.detail(bvo);
			System.out.println("del bvo2" + bvo);

			boardDao.delete(bvo);
			model.addAttribute("url", kind);
			model.addAttribute("msg", "삭제완료");
			break;

		case "detail":
			System.out.println("detail...");
			System.out.println(bvo);
			res = boardDao.detail(bvo);
			boardDao.cntplus(bvo);
			break;
			
		case "modify":
			System.out.println("modidi...");
			System.out.println(bvo);
//			res = boardDao.detail(bvo);
//			bvo = boardDao.findBoard(bvo.getBid());
			res = boardDao.detail(bvo);
			break;

		case "modifyReg":
			System.out.println("modify...");
			System.out.println(bvo);

			res = boardDao.modify(bvo);
			model.addAttribute("url", "detail?bid="+bvo.getBid());
			model.addAttribute("msg", "수정완료");
			break;
		}

		return res;
	}
}
