package kr.or.kosta.ob.mysite;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnectionFactory {
	/** 데이터베이스 접속 객체 */
	private static SqlSessionFactory sqlSessionFactory;

	/** XML에 명시된 접속 정보를 읽어들인다. */
	static {
		try {
		Reader reader = Resources.getResourceAsReader("study/jsp/mysite/config.xml");
		
		if (sqlSessionFactory == null) {
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}
	} catch (FileNotFoundException fileNotFoundException) {
		System.out.println("--- FileNotFoundException ---");
		fileNotFoundException.printStackTrace();
	} catch (IOException ioException) {
		System.out.println("--- IOException ---");
		ioException.printStackTrace();
	}
	}

	/** 데이터베이스 접속 객체를 리턴한다. */
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
