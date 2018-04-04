package com.yedam.erp.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {

	@Pointcut("execution(* com.yedam.app..*Impl.*(..))")
	public void allpointcut() {
		
	}
	
	@Before("allpointcut()")
	public void beforeLog(JoinPoint jp) {
		String method = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		System.out.println("[사전처리] 로직수행전" + method);
		
		if(args!=null && args.length>0) {
			System.out.println(args[0]);
		}
	}
	
}
