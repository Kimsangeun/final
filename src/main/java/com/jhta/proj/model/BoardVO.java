package com.jhta.proj.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("boardVo")
public class BoardVO {
	Integer start, end;
	Integer bid, gid, seq, lev, cnt;
	Date regdate;
	String pid, pw, title, content, upfile, kind, reply,schCol, id;
	MultipartFile mmfile;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm");

	ArrayList<BoardVO> arr;

	public BoardVO() {
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public String getSchCol() {
		return schCol;
	}

	public void setSchCol(String schCol) {
		this.schCol = schCol;
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

	public String getRegdateStr() {
		return sdf.format(regdate);
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getPid() {
		return pid;
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
//		content = content.replace("\n", "<br>");
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arr == null) ? 0 : arr.hashCode());
		result = prime * result + ((bid == null) ? 0 : bid.hashCode());
		result = prime * result + ((cnt == null) ? 0 : cnt.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((end == null) ? 0 : end.hashCode());
		result = prime * result + ((gid == null) ? 0 : gid.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((kind == null) ? 0 : kind.hashCode());
		result = prime * result + ((lev == null) ? 0 : lev.hashCode());
		result = prime * result + ((mmfile == null) ? 0 : mmfile.hashCode());
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((reply == null) ? 0 : reply.hashCode());
		result = prime * result + ((schCol == null) ? 0 : schCol.hashCode());
		result = prime * result + ((sdf == null) ? 0 : sdf.hashCode());
		result = prime * result + ((seq == null) ? 0 : seq.hashCode());
		result = prime * result + ((start == null) ? 0 : start.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((upfile == null) ? 0 : upfile.hashCode());
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
		BoardVO other = (BoardVO) obj;
		if (arr == null) {
			if (other.arr != null)
				return false;
		} else if (!arr.equals(other.arr))
			return false;
		if (bid == null) {
			if (other.bid != null)
				return false;
		} else if (!bid.equals(other.bid))
			return false;
		if (cnt == null) {
			if (other.cnt != null)
				return false;
		} else if (!cnt.equals(other.cnt))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (end == null) {
			if (other.end != null)
				return false;
		} else if (!end.equals(other.end))
			return false;
		if (gid == null) {
			if (other.gid != null)
				return false;
		} else if (!gid.equals(other.gid))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (kind == null) {
			if (other.kind != null)
				return false;
		} else if (!kind.equals(other.kind))
			return false;
		if (lev == null) {
			if (other.lev != null)
				return false;
		} else if (!lev.equals(other.lev))
			return false;
		if (mmfile == null) {
			if (other.mmfile != null)
				return false;
		} else if (!mmfile.equals(other.mmfile))
			return false;
		if (pid == null) {
			if (other.pid != null)
				return false;
		} else if (!pid.equals(other.pid))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (reply == null) {
			if (other.reply != null)
				return false;
		} else if (!reply.equals(other.reply))
			return false;
		if (schCol == null) {
			if (other.schCol != null)
				return false;
		} else if (!schCol.equals(other.schCol))
			return false;
		if (sdf == null) {
			if (other.sdf != null)
				return false;
		} else if (!sdf.equals(other.sdf))
			return false;
		if (seq == null) {
			if (other.seq != null)
				return false;
		} else if (!seq.equals(other.seq))
			return false;
		if (start == null) {
			if (other.start != null)
				return false;
		} else if (!start.equals(other.start))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (upfile == null) {
			if (other.upfile != null)
				return false;
		} else if (!upfile.equals(other.upfile))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", gid=" + gid + ", seq=" + seq + ", lev=" + lev + ", cnt=" + cnt + ", regdate="
				+ regdate + ", pid=" + pid + ", pw=" + pw + ", title=" + title + ", content=" + content + ", upfile="
				+ upfile + ", kind=" + kind + ", reply=" + reply + ", mmfile=" + mmfile + ", arr=" + arr + "]";
	}

}
