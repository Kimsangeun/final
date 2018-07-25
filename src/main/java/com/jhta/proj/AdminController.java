package com.jhta.proj;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.proj.model.BoardDAO;
import com.jhta.proj.model.BoardVO;
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

	//private static final Logger logger = LoggerFactory.getLogger(MyBatisController.class);

	@Resource
	TimeTableDAO timeDao;

	@Resource
	MovieDAO movieDao;

	@Resource
	ScreenDAO screenDao;

	@Resource
	AdminDAO adminDao;
	
	@Resource
	BoardDAO boardDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	/*@ModelAttribute("menu")
	String menu() {
		return "admin";
	}

	@ModelAttribute("main")
	String main(@PathVariable String service) {
		String res = service;

		switch (service) {		 

			case "insert":
				res = "alert";
				break;

		}

		return res;
	}
	 */

	@RequestMapping()
	String selectList(@PathVariable String service, TimeTableVO vo, Model model) {


		String res = "home";
		//		System.out.println(vo);
		System.out.println("안녕하세요12344");
		model.addAttribute("main", service);
		model.addAttribute("menu", "admin");
		System.out.println("포비든킹덤");
		if(service.equals("deleteMovie")||service.equals("deadlineReg")) {
			res = "admin/alert";
		}
		

		return res;
	}

	@RequestMapping(method=RequestMethod.POST)
	String sss(@PathVariable String service,SettleVO svo,BoardVO bvo ,TimeTableVO vo, Model model) {

		//System.out.println("보이루" + vo);
		System.out.println("포스트");
		String res = "home";
		//		System.out.println(vo);

		if(service.equals("insert")||service.equals("insertMovie")
				||service.equals("modifyReg")||service.equals("deadlineReg")
				||service.equals("promoReg")) {
			res = "admin/alert";
			System.out.println("zzzz");
			
		}
		
		if(service.equals("time")){
			model.addAttribute("main", service);
			model.addAttribute("menu", "admin");
		}
		

		return res;
	}

	@ModelAttribute("data")
	Object res(@PathVariable String service,MovieVO mvo,TimeTableVO tvo,SettleVO svo,BoardVO bovo
			,Model model,HttpServletRequest request) {
		System.out.println("데이타만");
		Object res = null;
		HashMap<String, Object> mapp = new HashMap<>();
		BoardVO bvo = new BoardVO();
		//System.out.println("날짜르"+vo.getShowtime());
		
		if(service.equals("member")||service.equals("resv")||service.equals("movie")) {
			/* * * * * * * * * 페이징.* * * * * * * * * * * * * * * */
			int page = 1, limit = 10, pageLimit = 10;
			if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			int start = (page - 1) * limit + 1;
			int end = page * limit;

			int startPage = (page - 1) / pageLimit * pageLimit + 1;
			int endPage = startPage + pageLimit - 1;

			int total = 0;

			// 삽입수정에서 파라미터 없는거 처리.
			total = (int) adminDao.totalCount(service.equals("resv") ? "reser" : service);

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
			
			
			mapp.put("start", start);
			mapp.put("end", end);

			bvo.setStart(start);
			bvo.setEnd(end);
			/* * * * * * * * * 페이징.* * * * * * * * * * * * * * * */
		}

		switch (service) {

		case "time":
			mapp.put("time", timeDao.list(tvo));
			mapp.put("movie", movieDao.selectDayMovieList(tvo));
			mapp.put("screen", screenDao.list());

			res = mapp;

			//한글코오딩
			break;
			

		
		case "member":
			System.out.println("회원");
			res = adminDao.memList(bvo);
			System.out.println(res);
			break;

		case "resv":
			System.out.println("예약");
			res = adminDao.resvList(bvo);
			
			System.out.println(res);
			break;

		case "movie":
			System.out.println("쿵쿵따리쿵쿵따");
			mapp.put("movie", movieDao.getlist(bvo));
			res = mapp;

			break;

		case "insert":

			model.addAttribute("msg", "동일한 시간에 다른관에서 상영예정입니다.");
			//TimeTableVO chkVo = (TimeTableVO)timeDao.timeChk(vo);

			Object chk1 = timeDao.timeChk(tvo);
			if(chk1!=null)
				System.out.println("chk1="+chk1);

			Object chk2 = timeDao.screenChk(tvo);
			if(chk2!=null)model.addAttribute("msg", "상영예정인 영화가 있습니다.");
			System.out.println("chk2="+chk2);

			Object chk3 = timeDao.timeOverlap(tvo);			
			System.out.println("chk3="+chk3);

			Object chk4 = timeDao.timeOverlapEnd(tvo);
			System.out.println("chk4="+chk4);

			if(chk1==null && chk2==null && chk3==null && chk4==null) {
				System.out.println("들어오느냐");
				timeDao.insert(tvo);
				model.addAttribute("msg", 
						tvo.getShowtime()+"//"+tvo.getScNum()+"관 추가완료");
			}

			model.addAttribute("url", "time?mstart="+tvo.getShowdate());
			break;

		case "insertMovie":
			System.out.println("가공전"+mvo);
			//fileUp()
			if(mvo.getSteelcuts()!=null) {
				mvo.setSteelcutsName(filesUP(mvo.getSteelcuts(),request));
				mvo.getSteelcut();
			}
			if(mvo.getPoster1()!=null)
				mvo.setPosterName(fileUP(mvo.getPoster1(),request,"poster"));

			System.out.println("가공후"+mvo);

			movieDao.insertMovie(mvo);

			model.addAttribute("url", "movie");
			model.addAttribute("msg", mvo.getTitle()+"추가완료");
			break;

			
		case "deleteMovie":
			System.out.println(mvo);
			MovieVO deleteFileVO = (MovieVO)movieDao.detailMovie(mvo);
			System.out.println(deleteFileVO);
			deleteFile(deleteFileVO.getPoster(),request,"poster");
			
			//스틸컷들 지우기
			for(String filename : deleteFileVO.getSteelcut().split("[|]"))
			{deleteFile(filename,request,"cut");}
			
			movieDao.deleteMovie(mvo);
			model.addAttribute("url", "movie");
			model.addAttribute("msg", "삭제완료");

			break;
			
		case "modifyForm":
			System.out.println("수정궁"+mvo);
			res = movieDao.detailMovie(mvo);
			
			break;
		
		case "modifyReg":
			System.out.println("수정할 녀석스"+mvo);
			MovieVO modifyFileVO = (MovieVO)movieDao.detailMovie(mvo);
			if(modifyFileVO.getSteelcut()!=null && modifyFileVO.getSteelcut().equals("")) {
				for(String filename : modifyFileVO.getSteelcut().split("[|]"))
				{deleteFile(filename,request,"cut");}
				
				deleteFile(modifyFileVO.getPoster(),request,"poster");
			}
			
			
			if(mvo.getSteelcuts()!=null) {
				mvo.setSteelcutsName(filesUP(mvo.getSteelcuts(),request));
				mvo.getSteelcut();
			}
			if(mvo.getPoster1()!=null)
				mvo.setPosterName(fileUP(mvo.getPoster1(),request,"poster"));

			System.out.println("가공후"+mvo);

			movieDao.modifyMovie(mvo);

			model.addAttribute("url", "/proj/movie/detailMovie?mid="+mvo.getMid());
			model.addAttribute("msg", mvo.getTitle()+" 수정완료");

		case "detailMovie":
			System.out.println(mvo);
			MovieVO resVO = (MovieVO) movieDao.detailMovie(mvo);
			resVO.setRealpath(request.getRealPath("resources/"));
			res = resVO;

			System.out.println(res);
			break;

		case "settle":
			System.out.println("정산");
			System.out.println(svo);
			if(svo.getStart()!=null && !svo.getStart().equals("")) {
				System.out.println("aasdf");
				mapp.put("settle",adminDao.dateSettle(svo));
				//res = adminDao.dateSettle(svo);
			}
			mapp.put("movie", movieDao.list());
			res = mapp;
			break;
		
		case "deadlineReg":

			System.out.println("데드데드");
			movieDao.movieDeadline(mvo);
			model.addAttribute("url", "/proj/movie/detailMovie?mid="+mvo.getMid());
			model.addAttribute("msg", "마감완료");
			
			break;
			
		case "promotion":
			//mapp.put("promo",)
			mapp.put("promo", adminDao.promo());
			mapp.put("movie", movieDao.list());
			res = mapp;
			break;
			
		case "promoReg":
			//mapp.put("promo",)
			System.out.println(bovo);
			
			bovo.setUpfile(fileUP(bovo.getMmfile(),request,"promo"));
			adminDao.promoUpdate(bovo);
			deleteFile(bovo.getContent(), request, "promo");
			
			model.addAttribute("url", "promotion");
			model.addAttribute("msg", "완료");
/*			mapp.put("promo", adminDao.promoUpdate(bovo));
			mapp.put("movie", movieDao.list());
			res = mapp;*/
			break;
		}
		
		return res;
	}

	String fileUP(MultipartFile up, HttpServletRequest request,String root) {

		String changeName = up.getOriginalFilename();
		System.out.println(changeName+"gogo");
		try {
			String filePath = 
					"F:\\STSWork\\mvcProj\\src\\main\\webapp\\resources\\fff\\"
							+up.getOriginalFilename();

			String folder = root.equals("poster") ? "movposter" : "movcut";
			if(root.equals("promo")) folder="board";
			filePath = request.getRealPath("resources/")+folder+"/"+up.getOriginalFilename();
			//String changeName = up.getOriginalFilename();
			int i = 1;
			String fileName = up.getOriginalFilename().substring(0, up.getOriginalFilename().lastIndexOf("."));
			String exp = up.getOriginalFilename().substring(up.getOriginalFilename().lastIndexOf(".")+1);

			System.out.println(fileName+"::"+exp);
			while(new File(filePath).exists()) {
				System.out.println("파일명 중복됨");
				changeName= fileName+"_"+i+"."+exp;
				filePath = request.getRealPath("resources/")+folder+"/"+changeName;
				i++;
			}

			System.out.println("new filePath = "+filePath);

			FileOutputStream fos = new FileOutputStream(filePath);

			fos.write(up.getBytes());

			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return changeName;
	}

	ArrayList<String> filesUP(ArrayList<MultipartFile> ups, HttpServletRequest request) {
		ArrayList<String> steelcutsNames = new ArrayList<>();
		for(MultipartFile up:ups) {
			String bb = fileUP(up,request,"cut");
			steelcutsNames.add(bb);
		}
		return steelcutsNames;
	}

	//파일삭제
	void deleteFile(String filename,HttpServletRequest request,String root) {

		System.out.println(filename);
		String folder = root.equals("poster") ? "movposter" : "movcut";
		if(root.equals("promo")) folder="board";
		String filePath = request.getRealPath("resources/")+folder+"/"+filename;
		File file = new File(filePath);

		if( file.exists() ){
			if(file.delete()){
				System.out.println("파일삭제 성공");
			}else{
				System.out.println("파일삭제 실패");
			}
		}else{
			System.out.println("파일이 존재하지 않습니다.");
		}

	}

}
