package com.yedam.erp.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect

public class AroundAdvice {

	@Around("BeforeAdvice.allpointcut()")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[around before] 로직수행전");
		Object returnObj = pjp.proceed();
		System.out.println("[around after] 로직수행후");
		return returnObj;
	}
	
}
