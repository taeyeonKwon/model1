package kwon_bean2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kwon_bean2.BoardDataBean2;

public class BoardDBBean02 {
	private static BoardDBBean02 instance = new BoardDBBean02();
	public static BoardDBBean02 getInstance() {
		return instance;
	}

	private BoardDBBean02() {
	}

	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("oracle connect");
			
		}catch(Exception e){
			System.out.println("oracle error");
			e.printStackTrace();
		}
		return conn;
	}
	//오라클 연결 확인!
	
	
	public void insertArticle(BoardDataBean2 article) throws Exception {
			System.out.println("insertArticle");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int readcount=article.getReadcount();
			int num = article.getNum();
			int number = 0;
			String sql = "";
		
			conn=getConnection();
			
			pstmt = conn.prepareStatement("SELECT BoardSer02.nextVal from dual");
			rs = pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}else {
				number=1;
				
			}
			System.out.println(number+"number");
			
			
			sql ="INSERT into board02(num,writer,subject,passwd,reg_date,readcount,content,ip)";
			sql	+= "values(BoardSer02.currVal,?,?,?,sysdate,?,?,?)";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,article.getWriter());
			pstmt.setString(2,article.getSubject());
			pstmt.setString(3,article.getPasswd());
			pstmt.setInt(4, article.getReadcount());
			pstmt.setString(5,article.getContent());
			pstmt.setString(6,article.getIp());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		} finally {
			if( rs !=null)try{rs.close();}catch(SQLException ex){ }
			if( pstmt !=null)try{pstmt.close();}catch(SQLException ex){ }
			if( conn !=null)try{conn.close();}catch(SQLException ex){ }
		}
		}
	
	public int getArticleCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board02");
			rs = pstmt.executeQuery();
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();} catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}return x;
	}
		
	public List getArticles(int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String query ="";
		String prn_query="";
		
		try{
			conn = getConnection();
			query = "select * from"
					+"(select rownum rnum,a.*"
					+" from (select num,writer,subject,passwd,reg_date,readcount,content,ip"
					+" from board02 order by num desc ) a )"
					+" where rnum between ? and ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			prn_query = "select * from"
					+"(select rownum rnum,a.*"
					+" from (select num,writer,subject,passwd,reg_date,readcount,content,ip"
					+" from board02 order by num desc) a )"
					+" where rnum between "+start+" and "+end;
			System.out.println(prn_query);
			rs=pstmt.executeQuery();
				if(rs.next()){
					articleList = new ArrayList(end);
					do{ 
						BoardDataBean2 article = new BoardDataBean2();
						article.setNum(rs.getInt("num"));
						article.setWriter(rs.getString("writer"));
						article.setSubject(rs.getString("subject"));
						article.setPasswd(rs.getString("passwd"));
						article.setReg_date(rs.getTimestamp("reg_date"));
						article.setReadcount(rs.getInt("readcount"));
						article.setContent(rs.getString("content"));
						article.setIp(rs.getString("ip"));
						articleList.add(article);
						System.out.println(article);
					} while(rs.next());
				}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		System.out.println(articleList+"=============");
		return articleList;
	}
	

public BoardDataBean2 getArticle(int num) throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDataBean2 article = null;
	try{
		conn = getConnection();
		pstmt = conn.prepareStatement("update board02 set readcount = readcount+1 where num=?");
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("select * from board02 where num=?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			article = new BoardDataBean2();
			article.setNum(rs.getInt("num"));
			article.setWriter(rs.getString("writer"));
			article.setSubject(rs.getString("subject"));
			article.setPasswd(rs.getString("passwd"));
			article.setReg_date(rs.getTimestamp("reg_date"));
			article.setReadcount(rs.getInt("readcount"));
			article.setContent(rs.getString("content"));
			article.setIp(rs.getString("ip"));
			
					
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
		
	}return article;
}
/*
public void modify(VO vo, int idx) {
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	
	try {
		sql = "UPDATE board1 SET TITLE=?, MEMO=? where NUM=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pasing(vo.getTitle()));
		pstmt.setString(2, pasing(vo.getMemo()));
		pstmt.setInt(3, idx);
		pstmt.executeUpdate();
		
	}catch(Exception e) {
		
	}finally {
		DBClose.close(con,pstmt);
	}
}*/

public int updateArticle(BoardDataBean2 article)throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	String dbpasswd;
	int x=-1;
	try{

		conn = getConnection();
		pstmt = conn.prepareStatement("select passwd from board02 where num=?");
		pstmt.setInt(1, article.getNum());
		rs = pstmt.executeQuery();
		if(rs.next()){
			dbpasswd=rs.getString("passwd");
			if(dbpasswd.equals(article.getPasswd())){
				sql="update board02 set subject=?,passwd=?,content=? where num=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,article.getSubject());
				pstmt.setString(2,article.getPasswd());
				pstmt.setString(3, article.getContent());
				pstmt.setInt(4, article.getNum());
				int check = pstmt.executeUpdate();
				return check;

			}else{
				//x=0;
				System.out.println("asdf");
			}
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}

	}
	return x;
}

public BoardDataBean2 getArticleUpdate(int num) throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDataBean2 article = null;
	try{
		conn = getConnection();
		pstmt = conn.prepareStatement("select * from board where num=?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			article = new BoardDataBean2();
			article.setNum(rs.getInt("num"));
			article.setWriter(rs.getString("writer"));
			article.setSubject(rs.getString("subject"));
			article.setPasswd(rs.getString("passwd"));
			article.setReg_date(rs.getTimestamp("reg_date"));
			article.setReadcount(rs.getInt("readcount"));
			article.setContent(rs.getString("content"));
			article.setIp(rs.getString("ip"));


		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}

	}return article;

}
public int deleteArticle(int num, String passwd) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	String dbpasswd;
	int x=-1;
	try{

		conn = getConnection();
		pstmt = conn.prepareStatement("select passwd from board02 where num=?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			dbpasswd=rs.getString("passwd");
			if(dbpasswd.equals(passwd)){
				 sql="delete from board02 where num = ?";
				 pstmt = conn.prepareStatement(sql);
	             pstmt.setInt(1, num);
	             pstmt.executeUpdate();
	             x=1;	
			}else{
				x=0;
			}
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}

	}
	return x;
}
}




