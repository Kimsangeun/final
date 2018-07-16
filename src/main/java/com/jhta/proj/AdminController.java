package com.jhta.proj;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.proj.model.admin.AdminDAO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.MovieVO;
import com.jhta.proj.model.admin.ScreenDAO;
import com.jhta.proj.model.admin.SettleVO;
import com.jhta.proj.model.admin.TimeTableDAO;
import com.jhta.proj.model.admin.TimeTableVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("admin/{service}")
public class AdminController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(MyBatisController.class);

	@Resource
	TimeTableDAO timeDao;

	@Resource
	MovieDAO movieDao;

	@Resource
	ScreenDAO screenDao;

	@Resource
	AdminDAO adminDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	/*
	 * @ModelAttribute("menu") String menu() { return "admin"; }
	 * 
	 * @ModelAttribute("main") String main(@PathVariable String service) { String
	 * res = service;
	 * 
	 * switch (service) {
	 * 
	 * case "insert": res = "alert"; break;
	 * 
	 * }
	 * 
	 * return res; }
	 */

	@RequestMapping()
	String selectList(@PathVariable String service, TimeTableVO vo, Model model) {

		String res = "home";
		// System.out.println(vo);
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "admin");
		System.out.println("포비든킹덤");
		if (service.equals("deleteMovie")) {
			res = "admin/alert";
		}

		return res;
	}

	@RequestMapping(method = RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo, BindingResult errors) {

		// System.out.println("보이루" + vo);
		System.out.println("포스트");
		String res = "home";
		// System.out.println(vo);

		if (service.equals("insert") || service.equals("insertMovie")) {
			res = "admin/alert";
			System.out.println("zzzz");
			/*
			 * new timeChk().validate(vo, errors); if(errors.hasErrors()) return res;
			 */
		}
		return res;
	}

	@ModelAttribute("data")
	Object res(@PathVariable String service, MovieVO mvo, TimeTableVO tvo, SettleVO svo, Model model,
			HttpServletRequest request) {
		System.out.println("데이타만");
		Object res = null;
		HashMap<String, Object> mapp = new HashMap<>();
		// System.out.println("날짜르"+vo.getShowtime());
		switch (service) {

		case "time":
			mapp.put("time", timeDao.list(tvo));
			mapp.put("movie", movieDao.selectDayMovieList(tvo));
			mapp.put("screen", screenDao.list());

			res = mapp;

			// 한글코오딩
			break;
		case "movie":
			System.out.println("쿵쿵따리쿵쿵따");
			mapp.put("movie", movieDao.getlist());
			res = mapp;
			try {
				// bb();
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;

		case "insert":

			model.addAttribute("msg", "동일한 시간에 다른관에서 상영예정입니다.");
			// TimeTableVO chkVo = (TimeTableVO)timeDao.timeChk(vo);

			Object chk1 = timeDao.timeChk(tvo);
			if (chk1 != null)
				System.out.println("chk1=" + chk1);

			Object chk2 = timeDao.screenChk(tvo);
			if (chk2 != null)
				model.addAttribute("msg", "상영예정인 영화가 있습니다.");
			System.out.println("chk2=" + chk2);

			Object chk3 = timeDao.timeOverlap(tvo);
			System.out.println("chk3=" + chk3);

			Object chk4 = timeDao.timeOverlapEnd(tvo);
			System.out.println("chk4=" + chk4);

			if (chk1 == null && chk2 == null && chk3 == null && chk4 == null) {
				System.out.println("들어오느냐");
				timeDao.insert(tvo);
				model.addAttribute("msg", tvo.getShowtime() + "//" + tvo.getScNum() + "관 추가완료");
			}

			model.addAttribute("url", "time?mstart=" + tvo.getShowdate());
			break;

		case "insertMovie":
			System.out.println("가공전" + mvo);

			// fileUp()
			if (mvo.getPoster1() != null)
				mvo.setPosterName(fileUP(mvo.getPoster1(), request, "poster"));
			if (mvo.getSteelcut1() != null)
				mvo.setSteelcut1Name(fileUP(mvo.getSteelcut1(), request, "cut"));
			if (mvo.getSteelcut2() != null)
				mvo.setSteelcut2Name(fileUP(mvo.getSteelcut2(), request, "cut"));
			System.out.println("가공후" + mvo);

			movieDao.insertMovie(mvo);

			model.addAttribute("url", "movie");
			model.addAttribute("msg", mvo.getTitle() + "추가완료");
			break;

		case "deleteMovie":
			System.out.println(mvo);
			MovieVO deleteFileVO = (MovieVO) movieDao.detailMovie(mvo);
			System.out.println(deleteFileVO);
			deleteFile(deleteFileVO.getPoster(), request, "poster");
			deleteFile(deleteFileVO.getSteelcut().split("[|]")[0], request, "cut");
			deleteFile(deleteFileVO.getSteelcut().split("[|]")[1], request, "cut");
			movieDao.deleteMovie(mvo);
			model.addAttribute("url", "movie");
			model.addAttribute("msg", "삭제완료");

			break;

		case "detailMovie":
			System.out.println(mvo);
			MovieVO resVO = (MovieVO) movieDao.detailMovie(mvo);
			resVO.setRealpath(request.getRealPath("resources/"));
			res = resVO;

			System.out.println(res);
			break;

		case "member":
			System.out.println("회원");
			res = adminDao.memList();
			System.out.println(res);
			break;

		case "resv":
			System.out.println("예약");
			res = adminDao.resvList();
			System.out.println(res);
			break;

		case "settle":
			System.out.println("정산");
			System.out.println(svo);
			// if()
			if (svo.getType() != null) {
				System.out.println("띠용");
				res = adminDao.yearList(svo);
				System.out.println(res);
			}

			/*
			 * if(svo.getType().equals("month")) System.out.println("디용"); res =
			 * adminDao.monthList(svo);
			 */
			// System.out.println(res);
			/**/
			break;

		}

		return res;
	}

	String fileUP(MultipartFile up, HttpServletRequest request, String root) {

		String changeName = up.getOriginalFilename();
		System.out.println(changeName + "gogo");
		try {
			String filePath = "F:\\STSWork\\mvcProj\\src\\main\\webapp\\resources\\fff\\" + up.getOriginalFilename();

			String folder = root.equals("poster") ? "movposter" : "movcut";
			filePath = request.getRealPath("resources/") + folder + "/" + up.getOriginalFilename();
			// String changeName = up.getOriginalFilename();
			int i = 1;
			String fileName = up.getOriginalFilename().substring(0, up.getOriginalFilename().lastIndexOf("."));
			String exp = up.getOriginalFilename().substring(up.getOriginalFilename().lastIndexOf(".") + 1);

			System.out.println(fileName + "::" + exp);
			while (new File(filePath).exists()) {
				System.out.println("파일명 중복됨");
				changeName = fileName + "_" + i + "." + exp;
				filePath = request.getRealPath("resources/") + folder + "/" + changeName;
				i++;
			}

			System.out.println("new filePath = " + filePath);

			FileOutputStream fos = new FileOutputStream(filePath);

			fos.write(up.getBytes());

			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return changeName;
	}

	// 파일삭제
	void deleteFile(String filename, HttpServletRequest request, String root) {

		System.out.println(filename);
		String folder = root.equals("poster") ? "movposter" : "movcut";
		String filePath = request.getRealPath("resources/") + folder + "/" + filename;
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
}
