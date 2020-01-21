package com.champion.mvc01;

import java.sql.ResultSet;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import org.springframework.web.servlet.ModelAndView;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

import sun.text.normalizer.NormalizerBase.Mode;

@Controller
public class MemberController {

	/* GoogleLogin */
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private AuthInfo authInfo;
	@Autowired
	private GoogleOAuth2Template googleOAuth2Template;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	MemberDAO dao;

	// 네이버
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping("insert")
	public String insert(MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "redirect:index.jsp";
	}

	@RequestMapping("update")
	public String update(MemberDTO memberDTO) throws Exception {
		System.out.println(memberDTO);
		dao.update(memberDTO);
		return "redirect:logout.jsp";
	}

	@RequestMapping("delete")
	public String delete(MemberDTO memberDTO) throws Exception {
		dao.delete(memberDTO);
		return "redirect:logout.jsp";
	}

	@RequestMapping("loginCheck")
	public void loginCheck(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		String id = memberDTO.getId();
		String pw = memberDTO.getPw();
		System.out.println(id + "------------------------");
		MemberDTO dto = new MemberDTO();
		MemberDTO dto2 = dao.select(memberDTO);
		System.out.println(dto2 + "---dto2--");
		System.out.println(dto + "---dto--");
		String result = null;
		System.out.println(id.equals(dto.getId()) + "23426523623");
		System.out.println(pw.equals(dto.getPw()) + "-=----------");
		System.out.println(id.equals(dto2.getId()) + "123-----23426523623");
		System.out.println(pw.equals(dto2.getPw()) + "123-=----------");
		if (id.equals(dto2.getId()) && pw.equals(dto2.getPw())) {
			session.setAttribute("id", id);
			result = "0";
		} else {
			result = "1";
		}
		model.addAttribute("result", result);
	}

	@RequestMapping("Mypage")
	public String Mypage(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		System.out.println(memberDTO.getId());
		MemberDTO dto2 = dao.select(memberDTO);
		// String id = memberDTO.getId();
		// session.setAttribute("id", id);
		model.addAttribute("dto", dto2);
		return "Mypage";
	}

	@RequestMapping("idcheck")
	public void idcheck(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		String id = memberDTO.getId();
		MemberDTO dto2 = dao.select(memberDTO);
		System.out.println(id + "---중ㅗㄱ---");
		System.out.println(memberDTO.getId());
		String result = null;
		System.out.println(id.equals(dto2.getId()));
		if (id.equals(dto2.getId())) {
			result = "0";
		} else {
			result = "1";
		}
		model.addAttribute("result", result);
	}

	// 네이버
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session, HttpServletResponse response) {
		System.out.println("와라라라라라라");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
//		구글 login
		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("/googleLogin, url : " + url);
		model.addAttribute("google_url", url);
		return "login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println(apiResult);
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String email = (String)response_obj.get("email");
		System.out.println(email);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", email); // 세션 생성
		model.addAttribute("result", apiResult);
		return "redirect:index.jsp";
	}

	// 구글
	// 회원 가입 페이지
	/*@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(HttpServletResponse response, Model model) {
		// URL을 생성한다.
		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("/googleLogin, url : " + url);
		model.addAttribute("google_url", url);
		return "login";
	}*/

	@RequestMapping(value = "/gcallback")
	public String doSessionAssignActionPage(Model model,HttpServletRequest request, HttpSession session) throws Exception {

		String code = request.getParameter("code");
		System.out.println(code);

		// RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("code", code);
		parameters.add("client_id", authInfo.getClientId());
		parameters.add("client_secret", authInfo.getClientSecret());
		parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
		parameters.add("grant_type", "authorization_code");

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(
				parameters, headers);
		ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token",
				HttpMethod.POST, requestEntity, Map.class);
		Map<String, Object> responseMap = responseEntity.getBody();

		// id_token 라는 키에 사용자가 정보가 존재한다.
		// 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두
		// 번째는 우리가 필요한 내용이 존재한다.
		// 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
		// Base 64로 인코딩 되어 있으므로 디코딩한다.

		String[] tokens = ((String) responseMap.get("id_token")).split("\\.");
		Base64 base64 = new Base64(true);
		String body = new String(base64.decode(tokens[1]));

		System.out.println(tokens.length);
		System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
		System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));

		// Jackson을 사용한 JSON을 자바 Map 형식으로 변환
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(mapper.readValue(body, Map.class));
		Map<String, String> result = mapper.readValue(body, Map.class);
		System.out.println(result.get("name"));
		String name =(String)result.get("name");
		session.setAttribute("GosessonId", name);
		/*model.addAttribute("goresult", result);*/
		return "redirect:index.jsp";
	}
//	구글 리캡챠 
	   @ResponseBody
	    @RequestMapping(value="VerifyRecaptcha", method = RequestMethod.POST)
	    public int VerifyRecaptcha(HttpServletRequest request) {
	        VerifyRecaptcha.setSecretKey("6LceFM4UAAAAAG8HZZWarHNvYLYkFTOsdpt6ZBzY");
	        String gRecaptchaResponse = request.getParameter("recaptcha");
	        System.out.println(gRecaptchaResponse);
	        //0 = 성공, 1 = 실패, -1 = 오류
	        try {
	            if(VerifyRecaptcha.verify(gRecaptchaResponse))
	                return 0;
	            else return 1;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
}
