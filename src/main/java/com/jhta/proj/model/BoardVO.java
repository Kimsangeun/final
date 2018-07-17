package com.jhta.proj.model;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("boardVo")
public class BoardVO {
	Integer bid, gid, seq, lev, cnt;
	Date regdate;
	String pid, pw, title, content, upfile, kind, reply;

	MultipartFile mmfile;

	ArrayList<BoardVO> arr;

	public BoardVO() {
	}

	
	
	public BoardVO(String pid, String pw, String title, String content) {
		this.pid = pid;
		this.pw = pw;
		this.title = title;
		this.content = content;
	}

	public ArrayList<BoardVO> getArr() {
		return arr;
	}

	public void setArr(ArrayList<BoardVO> arr) {
		this.arr = arr;
	}


	
	
	public String getKind() {
		return kind;
	}



	public void setKind(String kind) {
		this.kind = kind;
	}



	public String getReply() {
		return reply;
	}



	public void setReply(String reply) {
		this.reply = reply;
	}



	public MultipartFile getMmfile() {
		return mmfile;
	}



	public void setPid(String pid) {
		this.pid = pid;
	}



	public void setMmfile(MultipartFile mmfile) {
		this.mmfile = mmfile;

		upfile = mmfile.getOriginalFilename();
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getLev() {
		return lev;
	}

	public void setLev(Integer lev) {
		this.lev = lev;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getPid() {
		return pid;
	}

	public void setPname(String pid) {
		this.pid = pid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpfile() {

		if (upfile == null)
			upfile = "";

		return upfile;
	}

	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}

	public boolean isImg() {
		if (upfile == null || upfile.equals(""))
			return false;

		ArrayList<String> imgs = new ArrayList<>();
		imgs.add("jpg");
		imgs.add("jpeg");
		imgs.add("gif");
		imgs.add("png");
		imgs.add("bmp");

		String exp = upfile.substring(upfile.lastIndexOf(".") + 1).toLowerCase();

		return imgs.contains(exp);
	}



	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", gid=" + gid + ", seq=" + seq + ", lev=" + lev + ", cnt=" + cnt + ", regdate="
				+ regdate + ", pid=" + pid + ", pw=" + pw + ", title=" + title + ", content=" + content + ", upfile="
				+ upfile + ", kind=" + kind + ", reply=" + reply + ", mmfile=" + mmfile + ", arr=" + arr + "]";
	}

	

}