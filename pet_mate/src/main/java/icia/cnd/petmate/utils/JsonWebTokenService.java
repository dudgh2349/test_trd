package icia.cnd.petmate.utils;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

import icia.cnd.petmate.beans.JWTBean;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JsonWebTokenService {
	private long[] expiredDate = {1000L * 60 * 60, 1000L * 60 * 3};
	
	public String tokenIssuance(JWTBean tokenBody, String userKey) {
		
		int expiredIdx = 0;
//		String subject = tokenBody.getUserId() != null? "AccessToken":"AuthToken";
		
		/* JWT Specification Configure 1 : Header */
		Map<String, Object> jwtHeaders = new HashMap<>();
		jwtHeaders.put("typ", "JWT");
		jwtHeaders.put("alg", "HS256");
		
		/* JWT Specification Configure 2-1 : SignatureAlgorithm */
		SignatureAlgorithm sa = SignatureAlgorithm.HS256;
		/* JWT Specification Configure 2-2 : SecretKey */
		Key secretKey = new SecretKeySpec(userKey.getBytes(), sa.getJcaName());
		
		return Jwts.builder()
				.setHeader(jwtHeaders)  // .setHeaderParam("typ", "JWT");
				.setSubject("petmateJWT")
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + expiredDate[expiredIdx]))
				.claim("TokenBody", tokenBody)
				.signWith(sa, secretKey) // .signWith(SignatureAlgorithm.HS256, secretKey.getBytes())
				.compact();
	}
	
	public Map<String, Object> getTokenInfo(String userToken, String userKey) throws Exception{
		Claims claims = null;
		try {
		claims = Jwts.parser().setSigningKey(userKey.getBytes())
							  .parseClaimsJws(userToken)
							  .getBody();
		}catch(Exception e) {throw new Exception("Token does Not Exist");}
		return claims;
	}
	
	public boolean tokenExpiredDateCheck(
			String userToken, String userKey) throws Exception {
		boolean result = false;
		try {
			Claims claims = Jwts.parser().setSigningKey(userKey.getBytes())
										 .parseClaimsJws(userToken)
										 .getBody();
			result = !claims.getExpiration().before(new Date());
		}catch(ExpiredJwtException e) {
			throw new Exception("Token does not contain Expiration date");
		}
		
		return result;
	}
}
