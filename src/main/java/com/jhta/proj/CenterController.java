package com.jhta.proj;

import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.proj.model.BoardDAO;
import com.jhta.proj.model.BoardVO;
import com.jhta.proj.model.MemberVO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.ScreenDAO;
import com.jhta.proj.model.admin.TimeTableDAO;

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

		case "replyForm":

			break;
		}
		return res;
	}

	@RequestMapping(method = RequestMethod.POST)
	String aaa(@PathVariable String service) {
		String res = "home";
		if (service.equals("insertReg") || service.equals("modifyReg") || service.equals("replyReg")) {
			res = "/admin/alert";
			System.out.println("얼ㄹ랏");
		}
		return res;
	}

	@ModelAttribute("data")
	Object list(@PathVariable String service, BoardVO bvo, Model model, HttpServletRequest request,
			HttpSession session) {
		System.out.println("데이타 탄다");
		Object res = null;
		if (service.equals("notice") || service.equals("faq") || service.equals("qna")) {
			kind = service;
		}
		MemberVO v1 = (MemberVO) session.getAttribute("mem");
		if (v1 != null)
			bvo.setId(v1.getId());
		// System.out.println(vo);

		/* * * * * * * * * 페이징.* * * * * * * * * * * * * * * */
		int page = 1, limit = 7, pageLimit = 3;
		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int start = (page - 1) * limit + 1;
		int end = page * limit;

		int startPage = (page - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;

		int total = 0;

		// 삽입수정에서 파라미터 없는거 처리.
		if (request.getParameter("schCol") != null) {
			System.out.println("title::" + request.getParameter("title"));
			if (kind.equals("qna") && !v1.getId().equals("admin")) {
				total = (int) boardDao.totalCount(kind, request.getParameter("title"), request.getParameter("schCol"), v1.getId());
			} else {
				total = (int) boardDao.totalCount(kind, request.getParameter("title"), request.getParameter("schCol"));
			}
		} else {
			System.out.println("schCol 널이다");
			if (kind.equals("qna") && !v1.getId().equals("admin")) {
				total = (int) boardDao.totalCount(kind, v1.getId());
				System.out.println("total::"+total);
			} else {
				total = (int) boardDao.totalCount(kind);
			}
		}

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

		bvo.setStart(start);
		bvo.setEnd(end);
		/* * * * * * * * * 페이징.* * * * * * * * * * * * * * * */

		switch (service) {
		case "notice":
			System.out.println("서비스 타긴 하지");
			System.out.println("centercontrol_공지사항 ㄱㄱ");

			kind = "notice";
			bvo.setKind("notice");
			request.setAttribute("kind", kind);
			System.out.println(bvo);
			// boardListSch
			res = boardDao.someList(bvo);
			break;

		case "faq":
			System.out.println("centercontrol_faq ㄱㄱ");
			kind = "faq";

			bvo.setKind("faq");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			res = boardDao.someList(bvo);

			break;

		case "qna":

			kind = "qna";

			bvo.setKind("qna");
			request.setAttribute("kind", kind);
			System.out.println(bvo);

			String id = ((MemberVO) request.getSession().getAttribute("mem")).getId();
			bvo.setPid(id);
			if (id.equals("admin"))
				res = boardDao.someList(bvo);
			else {
				res = boardDao.qnaList(bvo);
			}
			break;

		case "insertReg":

			System.out.println("insertReg!");
			bvo.setKind(kind);
			bvo.setPid(((MemberVO) request.getSession().getAttribute("mem")).getId());
			System.out.println("centercontrol_insetreg::" + bvo);
			System.out.println(":::" + bvo.getMmfile());
			if (bvo.getMmfile() != null) {
				System.out.println("asdasdasdasdasdasdasd" + bvo.getMmfile());
				bvo.setUpfile(fileUP(bvo.getMmfile(), request));
			}
			res = boardDao.insert(bvo);
			model.addAttribute("msg", "작성완료");
			model.addAttribute("url", "detail?bid=" + bvo.getBid());
			break;

		case "delete":
			System.out.println("centercontrol_delete...");
			BoardVO boardvo = (BoardVO) boardDao.detail(bvo);

			deleteFile(boardvo.getUpfile(), request);

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
			System.out.println("--------------------------------------------------------------");
			bvo = (BoardVO)boardDao.detail(bvo);
/*			if(request.getAttribute("fdelete").equals(true)) {
				deleteFile(bvv.getUpfile(), request);
				bvv.setUpfile("");
				bvv.setMmfile(null);
				request.setAttribute("fdelete", false);
			}*/
			
			System.out.println("centercontrol_modify...");
			System.out.println(bvo);


			// res = boardDao.detail(bvo);
			// bvo = boardDao.findBoard(bvo.getBid());
			res = bvo;
			break;

		case "modifyReg":
			System.out.println("centercontrol_modifyreg...");
			System.out.println(bvo);
			if (bvo.getMmfile() != null) {
				System.out.println("asdasdasdasdasdasdasd" + bvo.getMmfile());
				bvo.setUpfile(fileUP(bvo.getMmfile(), request));
			}
			res = boardDao.modify(bvo);
			model.addAttribute("url", "detail?bid=" + bvo.getBid());
			model.addAttribute("msg", "수정완료");
			break;

		case "replyForm":
			System.out.println("centercontrol_reply...");
			res = boardDao.detail(bvo);
			break;

		case "replyReg":
			System.out.println("centercontrol_replyreg...");

			System.out.println("디테일로 가져오기전 bvo" + bvo);
			String content = bvo.getContent();
			String title = bvo.getTitle();

			bvo = (BoardVO) boardDao.detail(bvo);

			System.out.println("디테일로 가져온 bvo" + bvo);

			bvo.setTitle(title);
			bvo.setContent(content);
			bvo.setPid(((MemberVO) request.getSession().getAttribute("mem")).getId());

//			System.out.println((int)boardDao.maxBid(bvo)+1);
			model.addAttribute("url", "qna");
			model.addAttribute("msg", "답변완료");

			boardDao.nextSeq(bvo);
			res = boardDao.reply(bvo);
			break;
		}
		return res;
	}

	String fileUP(MultipartFile up, HttpServletRequest request) {
		String changeName = up.getOriginalFilename();
		System.out.println(changeName + "gogo");
		try {
			String filePath = request.getRealPath("resources/board") + "/" + up.getOriginalFilename();
			int i = 1;
			String fileName = up.getOriginalFilename().substring(0, up.getOriginalFilename().lastIndexOf("."));
			String exp = up.getOriginalFilename().substring(up.getOriginalFilename().lastIndexOf(".") + 1);

			System.out.println(fileName + "::" + exp);
			while (new File(filePath).exists()) {
				System.out.println("파일명 중복됨");
				changeName = fileName + "_" + i + "." + exp;
				filePath = request.getRealPath("resources/board") + "/" + changeName;
				i++;
			}

			System.out.println("new filePath = " + filePath);

			FileOutputStream fos = new FileOutputStream(filePath);

			fos.write(up.getBytes());

			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return changeName;
	}

	// 파일삭제
	void deleteFile(String filename, HttpServletRequest request) {
		System.out.println(filename);
		String filePath = request.getRealPath("resources/board") + "/" + filename;
		File file = new File(filePath);

		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((boardDao == null) ? 0 : boardDao.hashCode());
		result = prime * result + ((kind == null) ? 0 : kind.hashCode());
		result = prime * result + ((movieDao == null) ? 0 : movieDao.hashCode());
		result = prime * result + ((screenDao == null) ? 0 : screenDao.hashCode());
		result = prime * result + ((timeDao == null) ? 0 : timeDao.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CenterController other = (CenterController) obj;
		if (boardDao == null) {
			if (other.boardDao != null)
				return false;
		} else if (!boardDao.equals(other.boardDao))
			return false;
		if (kind == null) {
			if (other.kind != null)
				return false;
		} else if (!kind.equals(other.kind))
			return false;
		if (movieDao == null) {
			if (other.movieDao != null)
				return false;
		} else if (!movieDao.equals(other.movieDao))
			return false;
		if (screenDao == null) {
			if (other.screenDao != null)
				return false;
		} else if (!screenDao.equals(other.screenDao))
			return false;
		if (timeDao == null) {
			if (other.timeDao != null)
				return false;
		} else if (!timeDao.equals(other.timeDao))
			return false;
		return true;
	}
	
	
}
