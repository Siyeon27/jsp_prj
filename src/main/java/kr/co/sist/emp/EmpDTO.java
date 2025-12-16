package kr.co.sist.emp;

import java.sql.Date;

/**
 * hiredateStr : Oracle에서 to_char함수를 사용하여 고정된 날짜 형식으로 얻기
 * hiredate : Java에서 rs.getDate() method로 얻어서 다양한 날짜형식으로 보여줄 때.
 */
public class EmpDTO extends DeptDTO {
private int empno,		mgr,		sal,	comm;
private String ename,	job, hiredateStr;
private Date hiredate;

public EmpDTO() {
}

public EmpDTO(int empno, int mgr, int sal, int comm, String ename, String job, String hiredateStr, Date hiredate) {
	this.empno = empno;
	this.mgr = mgr;
	this.sal = sal;
	this.comm = comm;
	this.ename = ename;
	this.job = job;
	this.hiredateStr = hiredateStr;
	this.hiredate = hiredate;
}

public int getEmpno() {
	return empno;
}

public void setEmpno(int empno) {
	this.empno = empno;
}

public int getMgr() {
	return mgr;
}

public void setMgr(int mgr) {
	this.mgr = mgr;
}

public int getSal() {
	return sal;
}

public void setSal(int sal) {
	this.sal = sal;
}

public int getComm() {
	return comm;
}

public void setComm(int comm) {
	this.comm = comm;
}

public String getEname() {
	return ename;
}

public void setEname(String ename) {
	this.ename = ename;
}

public String getJob() {
	return job;
}

public void setJob(String job) {
	this.job = job;
}

public String getHiredateStr() {
	return hiredateStr;
}

public void setHiredateStr(String hiredateStr) {
	this.hiredateStr = hiredateStr;
}

public Date getHiredate() {
	return hiredate;
}

public void setHiredate(Date hiredate) {
	this.hiredate = hiredate;
}

@Override
public String toString() {
	return "EmpDTO [empno=" + empno + ", mgr=" + mgr + ", sal=" + sal + ", comm=" + comm + ", ename=" + ename + ", job="
			+ job + ", hiredateStr=" + hiredateStr + ", hiredate=" + hiredate + "]";
}

}
