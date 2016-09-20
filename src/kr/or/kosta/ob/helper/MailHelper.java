package kr.or.kosta.ob.helper;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailHelper {
	// -------- 싱글톤 객체 생성 시작 --------
	private static MailHelper current = null;

	public static MailHelper getInstance() {
		if (current == null) {
			current = new MailHelper();
		}
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private MailHelper() {
		super();
	}
	// -------- 싱글톤 객체 생성 끝 --------

	public class SMTPAuthenticator extends Authenticator {
		/** 메일 발송시 계정 정보를 리턴해 주는 역할을 한다. */
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			// 네이버일 경우 자신의 아이디와 비밀번호 입력
			// Gmail의 경우 자신의 메일 주소와 비밀번호 입력.
			return new PasswordAuthentication("hotis050@gmail.com", "hiimolaf@@");
		}
	}

	public boolean sendMail(String sender, String receiver, String subject, String content) {
		// 성공 실패 여부를 저장할 변수 (일단 실패로 설정함)
		boolean result = false;
		// 발송 정보를 담기 위한 객체
		Properties p = new Properties();

		// Naver와 연결할 경우 네이버 아이디로 계정 설정
		// Google과 연결할 경우 본인의 Gmail 주소로 계정 설정
		p.put("mail.smtp.user", "hotis050@gmail.com");

		// 네이버일 경우 SMTP 서버 정보 설정
		// p.put("mail.smtp.host", "smtp.naver.com");
		// p.put("mail.smtp.port", "995");
		// Google일 경우 SMTP 서버 정보 설정
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");

		// 아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		/****** 설정한 정보에 따른 메일 발송 처리 *****/
		try {

			// helper 패키지에 준비한 인증정보 리턴 기능을 갖는 클래스의 객체 생성
			Authenticator auth = new SMTPAuthenticator();

			// 발송서버에 대한 설정정보와 인증정보를 사용하여
			// 메일 서버 인증 객체 생성
			Session ses = Session.getInstance(p, auth);

			// 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
			ses.setDebug(true);

			// 메일의 내용을 담기 위한 객체
			MimeMessage msg = new MimeMessage(ses);

			// 제목 설정
			msg.setSubject(subject);

			// 보내는 사람의 메일주소
			Address fromAddr = new InternetAddress(sender);
			msg.setFrom(fromAddr);

			// 받는 사람의 메일주소
			Address toAddr = new InternetAddress(receiver);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
			msg.setContent(content, "text/html;charset=UTF-8");

			// 발송하기
			Transport.send(msg);

			// try 구문이 끝난다는 것은 발송 성공이라는 의미
			// --> 처리 결과 값을 변경한다.
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
