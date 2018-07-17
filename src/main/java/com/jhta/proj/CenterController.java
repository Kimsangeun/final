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

		switch (service) {
		case "delete":
			res = "admin/alert";
			break;
		case "modify":

			System.out.println("modify_bvo:" + bvo);

			model.addAttribute("bvo", bvo);
			model.addAttribute("main", "modify");
			model.addAttribute("menu", "info");
			break;
		case "qna":
			if (!((MemberVO) request.getSession().getAttribute("mem")).getId().equals("admin")) {
				System.out.println("내문의 로 가자");
				model.addAttribute("data", request.getSession().getAttribute("mem"));
				res = "mypage/qna";
			}
			break;
		case "replyForm":

			break;
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

		int page = 1, limit = 10, pageLimit = 4;
		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int start = (page - 1) * limit + 1;
		int end = page * limit;

		int startPage = (page - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;

		int total = 0;

		total = (int) boardDao.totalCount(kind);

		int totalPage = total / limit;

		if (total % limit != 0)
			totalPage++;
		if (endPage > totalPage)
			endPage = totalPage;

		request.setAttribute("page", page);
		request.setAttribute("total", total);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);

		switch (service) {
		case "notice":
			System.out.println("서비스 타긴 하지");
			System.out.println("centercontrol_공지사항 ㄱㄱ");

			kind = "notice";
			bvo.setKind("notice");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			res = boardDao.someList(start, end, kind);
			break;

		case "faq":
			System.out.println("centercontrol_faq ㄱㄱ");
			kind = "faq";

			bvo.setKind("faq");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			res = boardDao.someList(start, end, kind);

			break;

		case "qna":
			System.out.println("centercontrol_qna ㄱㄱ");
			kind = "qna";

			bvo.setKind("qna");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			String id = ((MemberVO) request.getSession().getAttribute("mem")).getId();
			// ㄴ여기서 에러
			if (id.equals("admin"))
				res = boardDao.someList(start, end, kind);
			break;

		case "insertReg":

			System.out.println("insertReg!");
			bvo.setKind(kind);
			System.out.println("centercontrol_insetreg::" + bvo);
			res = boardDao.insert(bvo);
			model.addAttribute("msg", "작성완료");
			model.addAttribute("url", "detail?bid=" + bvo.getBid());
			break;

		case "delete":
			System.out.println("centercontrol_delete...");
			System.out.println("del bvo1" + bvo);
			BoardVO boardvo = (BoardVO) boardDao.detail(bvo);
			System.out.println("del bvo2" + bvo);

			boardDao.delete(bvo);
			model.addAttribute("url", kind);
			model.addAttribute("msg", "삭제완료");
			break;

		case "detail":
			System.out.println("centercontrol_detail...");
			System.out.println(bvo);
			boardDao.cntplus(bvo);
			res = boardDao.detail(bvo);
			break;

		case "modify":
			System.out.println("centercontrol_modidi...");
			System.out.println(bvo);
			// res = boardDao.detail(bvo);
			// bvo = boardDao.findBoard(bvo.getBid());
			res = boardDao.detail(bvo);
			break;

		case "modifyReg":
			System.out.println("centercontrol_modify...");
			System.out.println(bvo);

			res = boardDao.modify(bvo);
			model.addAttribute("url", "detail?bid=" + bvo.getBid());
			model.addAttribute("msg", "수정완료");
			break;

		case "replyForm":
			System.out.println("centercontrol_reply...");

			res = boardDao.detail(bvo);
			break;
		}

		return res;
	}
}
