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

public class QnaDBBean {
	private static QnaDBBean instance = new QnaDBBean();
	
	public static QnaDBBean getInstance(){
		return instance;
	}
	private QnaDBBean(){}
	
	private static Connection getConnection() throws Exception{
		Connection conn=null;
		try{
			Context init = new InitialContext();
			DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("oracle connect");
		}catch(Exception e){
			System.out.println("oracle error");
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public int deleteArticle(int num, String passwd) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String dbpasswd ="";
		int x=-1;
		
		try{
			conn=getConnection();
			pstmt= conn.prepareStatement("select passwd from qna00 where num =?");
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd =rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from qna00 where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x=1;
				}else x=0;
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
	
	
	public int updateArticle(QnaDataBean article) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String dbpasswd ="";
		String sql ="";
		int x=-1;
		
		try{
			conn=getConnection();
			pstmt= conn.prepareStatement("select passwd from qna00 where num =?");
			pstmt.setInt(1, article.getNum());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dbpasswd =rs.getString("passwd");
				System.out.println(dbpasswd+":"+article.getPasswd());
				if(dbpasswd.equals(article.getPasswd())){
					sql ="update qna00 set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					
					pstmt =conn.prepareStatement(sql);
					pstmt.setString(1,article.getWriter());
					pstmt.setString(2,article.getEmail());
					pstmt.setString(3,article.getSubject());
					pstmt.setString(4,article.getPasswd());
					pstmt.setString(5,article.getContent());
					pstmt.setInt(6,article.getNum());
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
	
	public QnaDataBean getArticleUpdate(int num) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		QnaDataBean article = null;
		
		try{
			conn=getConnection();
			pstmt= conn.prepareStatement("select * from qna00 where num =?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				  article = new QnaDataBean();
				  article.setNum(rs.getInt("num"));
	              article.setWriter(rs.getString("writer"));
	              article.setEmail(rs.getString("email"));
	              article.setSubject(rs.getString("subject"));
	              article.setPasswd(rs.getString("passwd"));
	              article.setReg_date(rs.getTimestamp("reg_date"));
	              article.setReadcount(rs.getInt("readcount"));
	              article.setRef(rs.getInt("ref"));
	              article.setRe_step(rs.getInt("re_step"));
	              article.setRe_level(rs.getInt("re_level"));
	              article.setContent(rs.getString("content"));
	              article.setIp(rs.getString("ip"));
				
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return article;
		
	}

public QnaDataBean getArticle(int num) throws Exception{
	Connection conn=null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	QnaDataBean article = null;
	
	try{
		conn=getConnection();
		pstmt = conn.prepareStatement("update qna00 set readcount = readcount+1 where num =?");
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		pstmt= conn.prepareStatement("select * from qna00 where num =?");
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			  article =new QnaDataBean();
			  article.setNum(rs.getInt("num"));
              article.setWriter(rs.getString("writer"));
              article.setEmail(rs.getString("email"));
              article.setSubject(rs.getString("subject"));
              article.setPasswd(rs.getString("passwd"));
              article.setReg_date(rs.getTimestamp("reg_date"));
              article.setReadcount(rs.getInt("readcount"));
              article.setRef(rs.getInt("ref"));
              article.setRe_step(rs.getInt("re_step"));
              article.setRe_level(rs.getInt("re_level"));
              article.setContent(rs.getString("content"));
              article.setIp(rs.getString("ip"));
              article.setBoardId(rs.getString("boardId"));
              	//컬럼 추가. boardId
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
	}
	return article;
	
}

public void insertArticle(QnaDataBean article ,String boardId ) throws Exception{
	
	Connection conn=null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	int num=article.getNum();
	int ref=article.getRef();
	int re_step = article.getRe_step();
	int re_level = article.getRe_level();
	int number =0;
	String sql="";
	try{
		conn =getConnection();
		pstmt = conn.prepareStatement("select qna00ser.nextval from dual");
		rs= pstmt.executeQuery();
		if(rs.next())
			number=rs.getInt(1);
		else 
		number=1;
		if(num!=0){
			sql="Update qna00 set re_step=re_step+1 where ref=?and re_step>? and boardId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,ref);
			pstmt.setInt(2,re_step);
			pstmt.setString(3,boardId);
			pstmt.executeUpdate();
			re_step =re_step+1;
			re_level = re_level+1;
			
		}else{
			ref=number;
			re_step =0;
			re_level=0;
			
		}
		sql = "insert into qna00(num,writer,email,subject,passwd,reg_date,";
		sql+= "ref,re_step,re_level,content,ip,boardId)"+ "values(qna00ser.currval,?,?,?,?,sysdate,?,?,?,?,?,?)";
		
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1,article.getWriter());
		pstmt.setString(2,article.getEmail());
		pstmt.setString(3,article.getSubject());
		pstmt.setString(4,article.getPasswd());
		pstmt.setInt(5, ref);
		pstmt.setInt(6, re_step);
		pstmt.setInt(7, re_level);
		pstmt.setString(8,article.getContent());
		pstmt.setString(9,article.getIp());
		pstmt.setString(10,boardId);
		pstmt.executeUpdate();
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
	}
					
}

public int getArticleCount(String boardId) throws Exception{
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	int x= 0;
 	
 	try{
 		
 		conn= getConnection();
 		pstmt =conn.prepareStatement("select count(*) from qna00 where boardId=?");
 		pstmt.setString(1,boardId);
 		rs=pstmt.executeQuery();
 		
 		if(rs.next()){
 			x= rs.getInt(1);}
 		
 		
 	}catch(Exception ex){
 		ex.printStackTrace();
 	}finally{
 		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
 		
 	}return x;
	
}

public List getArticles(int start,int end,String boardId)throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List articleList=null;
	String query ="";
	String prn_query="";
	
	try{
    conn = getConnection();
    query = "select * from" + "( select rownum rnum, a.* " + 
    "from (select num, writer, email, subject, passwd, reg_date, readcount, "
          + "  ref, re_step, re_level, content, ip   from qna00 where boardId=? order by ref desc, re_step) a )" + 
    "where rnum between ? and ? ";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, boardId);;
    pstmt.setInt(2, start);
    pstmt.setInt(3, end);;
    prn_query = "select * from " + "(select rownum rnum, a.* " + 
    "from (select num, writer, email, subject, passwd, reg_date, readcount, "
          + "  ref, re_step, re_level, content, ip from qna00 where boardId=? order by ref desc, re_step) a )" +
    "where rnum between" + start + " and " + end;
    
 System.out.println(prn_query);
 rs = pstmt.executeQuery();
    if(rs.next()){
       articleList = new ArrayList(end);
       do{
          QnaDataBean article = new QnaDataBean();
          article.setNum(rs.getInt("num"));
          article.setWriter(rs.getString("writer"));
          article.setEmail(rs.getString("email"));
          article.setSubject(rs.getString("subject"));
          article.setPasswd(rs.getString("passwd"));
          article.setReg_date(rs.getTimestamp("reg_date"));
          article.setReadcount(rs.getInt("readcount"));
          article.setRef(rs.getInt("ref"));
          article.setRe_step(rs.getInt("re_step"));
          article.setRe_level(rs.getInt("re_level"));
          article.setContent(rs.getString("content"));
          article.setIp(rs.getString("ip"));
          
          
          articleList.add(article);
       } while(rs.next());
    }         
} catch(Exception ex)   {
 ex.printStackTrace();
} finally {
 if(rs != null) try { rs.close();} catch(SQLException ex){}
 if(pstmt != null) try { pstmt.close();} catch(SQLException ex){}
 if(conn != null) try { conn.close();} catch(SQLException ex){}
}
return articleList;
}

}
