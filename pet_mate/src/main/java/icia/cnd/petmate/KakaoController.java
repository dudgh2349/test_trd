package icia.cnd.petmate;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.services.auth.Authentication;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class KakaoController {
	@Autowired
	private Authentication auth;
	
	
	
@RequestMapping(value = "/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
	
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				/* client id = rest api 주소입력 */
				+ "?client_id=5abf13c79142e59084f94c9751bb5d5e"
				+ "&redirect_uri=http://localhost/auth_kakao"
				+ "&response_type=code";
	
		return reqUrl;
	}
	
@RequestMapping(value = "/accessToken")
public @ResponseBody String outKakaoAuthUrl(
		ModelAndView mav) throws Exception {

	
	System.out.println("logout kakao");
	

	return "index";
}

	// 카카오 연동정보 조회
	@RequestMapping(value = "/auth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session) throws Exception {

		System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        UserBean user = new UserBean();
        
        
        user = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + user.getUserEmail());
        System.out.println("###nickname#### : " + user.getUserNickname());
        System.out.println("###userId#### : " + user.getUserId());
       
        
        System.out.println(user.getAccessToken());
        
    // JSONObject kakaoInfo =  new JSONObject(userInfo);
       
       model.addAttribute("user", user) ;
       session.setAttribute("access_Token", access_Token);
   
        auth.backController("API01", model);
       
        System.out.println("Session ="+session.getAttribute("access_Token"));
       
        return "PAGEtE"; //본인 원하는 경로 설정
	}
	
	
	
	
	
	
	
    //토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=5abf13c79142e59084f94c9751bb5d5e");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost/auth_kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public UserBean getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        UserBean user = null;
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            System.out.println(result.substring(6, 16));
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            System.out.println("kakao_account = "+ kakao_account);
            
            String Id = result.substring(6, 16);
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            user = new UserBean();
            
            user.setUserEmail(email);
            user.setUserNickname(nickname);
            user.setUserId(Id);
            user.setAccessToken(access_Token);
            user.setUserBirth("00/00/00");
//            userInfo.put("userId", Id);
//            userInfo.put("accessToken", access_Token);
//            userInfo.put("userNickname", nickname);
//            userInfo.put("userEmail", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

		return user;
    }
    
  /*  @RequestMapping(value = "/APINaverLogin", method = RequestMethod.GET)
	public String APIExamNaverLogin() throws Exception {
		return "APIExamNaverLogin";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다. 없는 페이지를 넣어도 무방합니다. 404가 떠도 제일 중요한건
		 * #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
	//}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String callback() throws Exception {
		return "user/main";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다. 없는 페이지를 넣어도 무방합니다. 404가 떠도 제일 중요한건
		 * #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
	}
	
	
	@RequestMapping(value = "/naverlogin", method = RequestMethod.POST)
	public String naverlogin(ModelAndView mav, @ModelAttribute UserBean user) throws Exception {
		mav.addObject("user", user) ;
		   
		System.out.println("naverlogin");
	     //   auth.backController("API01", mav);
	        return "main";
	}

    
    
    
   
    
 }