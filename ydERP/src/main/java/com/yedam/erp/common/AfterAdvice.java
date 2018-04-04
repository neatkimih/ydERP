package com.yedam.erp.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect

public class AfterAdvice {

	@AfterReturning(pointcut="BeforeAdvice.allpointcut()",returning="returnObj")
	public void finallylLog(JoinPoint jp,Object returnObj) {
		
		
		
		String method = jp.getSignature().getName();
		
		System.out.println("[사후처리] 무조건동작"+method);
		System.out.println("리턴결과 : "+returnObj);
	}
	
}
