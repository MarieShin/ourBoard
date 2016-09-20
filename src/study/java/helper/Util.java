package study.java.helper;

/**
 * 기본적인 공통 기능들을 묶어 놓은 클래스
 */
public class Util {
	// -------- 싱글톤 객체 생성 시작 --------
	private static Util current = null;

	public static Util getInstance() {
		if (current == null) {
			current = new Util();
		}
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private Util() {
		super();
	}
	// -------- 싱글톤 객체 생성 끝 --------

	/**
	 * 범위를 갖는 랜덤값을 생성하여 리턴하는 메서드
	 * 
	 * @param min
	 *            - 범위 안에서의 최소값
	 * @param max
	 *            - 범위 안에서의 최대값
	 * @return min ~ max 안에서의 랜덤값
	 */
	public int random(int min, int max) {
		int num = (int) ((Math.random() * (max - min + 1)) + min);
		return num;
	}

	/**
	 * 주어진 글자 수만큼의 임시 비밀번호를 생성한다.
	 * 
	 * @param strlen - 글자수
	 * @return String - 임시 비밀번호 값
	 */
	public String randomPassword(int strlen) {
		String password = ""; // 생성될 비밀번호

		while (password.length() < strlen) { // 비밀번호의 길이가 충족될 동안 수행
			int random = this.random(48, 122);

			if ((random >= 48 && random <= 57) || // 숫자의 아스키코드 값 범위
					(random >= 65 && random <= 90) || // 알파벳 대문자의 아스키 코드 범위
					(random >= 97 && random <= 122)) { // 알파벳 소문자의 아스키 코드 범위
				// 허용된 범위 안에서 생성된 값이라면 비밀번호 문자열에 병합
				char c = (char) random;
				password += c;
			}
		}
		return password;
	}
}
