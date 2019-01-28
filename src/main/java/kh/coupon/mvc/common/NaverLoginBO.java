package kh.coupon.mvc.common;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class NaverLoginBO {

	private final static String CLIENT_ID = "YEbvqrjLGhpLr9Tv4j0D";
	private final static String CLIENT_SECRET = "j_nT7EcgYd";
	private final static String REDIRECT_URI = "http://localhost:8787/final/callback";
	private final static String SESSION_STATE = "oauth_state";
	
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(123, random).toString(32);
	}
	
	/* 네아로 인증  URL 생성  Method */
	public String getAuthorizationUrl(HttpSession session) {

		 String state = generateState();
		 setSession(session, state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());

		return oauthService.getAuthorizationUrl();
	}
	
	
	/* 네아로 Callback 처리 및  AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		System.out.println("<<========== session : " +session);
		String sessionState = getSession(session);
		
		System.out.println("<<========== session state : " + sessionState);
		if(StringUtils.pathEquals(sessionState, state)){
		
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
					
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);		
	}

	/* http session에서 데이터 가져오기 */
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	
	
}