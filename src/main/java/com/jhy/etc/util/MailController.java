package com.jhy.etc.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jhy.member.service.MemberService;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;

	private String from = "8735132@gmail.com";			//硫붿씪�쓣 蹂대궪 怨꾩젙
	private String subject = "LIVELINK 인증코드";	//硫붿씪 �젣紐�

	// �쉶�썝媛��엯 �씠硫붿씪 �씤利앸쾲�샇 諛쒖넚愿��젴
    @RequestMapping(value = "/member/emailcheck", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam Map<String, Object> map) {
    	//System.out.println(map);
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999 �씤利앸쾲�샇瑜� �옖�뜡�쑝濡� �깮�꽦
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);	//�꽭�뀡�뿉 �씤利앸쾲�샇 ���옣
        StringBuilder sb = new StringBuilder();
        sb.append("LIVELINK 인증코드는 ").append(joinCode).append(" 입니다.");	//硫붿씪�궡�슜
        StringBuffer emailtotal = new StringBuffer();
        emailtotal.append(map.get("emailid").toString()).append("@").append(map.get("emailaddress").toString());	//諛쏆쓣 �씠硫붿씪 怨꾩젙 �꽕�젙
        MimeMessage message = mailSender.createMimeMessage();	//鍮꾩뼱�엳�뒗 硫붿씪 硫붿꽭吏� �깮�꽦
        try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");	//硫붿씪 硫붿꽭吏� �꽕�젙	
			messageHelper.setTo(emailtotal.toString());//硫붿씪�쓣 諛쏆쓣 怨꾩젙
			System.out.println(emailtotal.toString());
			messageHelper.setText(sb.toString());		//硫붿씪 �궡�슜
			System.out.println(sb.toString());
			messageHelper.setFrom(from);				//硫붿씪�쓣 蹂대궪 怨꾩젙
			System.out.println(from);
			messageHelper.setSubject(subject);			//硫붿씪 �젣紐�
			System.out.println(subject);
			mailSender.send(message);					//JavaMailSender瑜� �넻�븳 硫붿씪諛쒖넚
        } catch(Exception e) {
        	e.printStackTrace();
        	session.removeAttribute("joinCode");
        	return false;				//硫붿씪諛쒖넚�떎�뙣�떆�뿉 false
        }
        System.out.println(session.getAttribute("joinCode"));
        return true;
    }

    //�씤利앸쾲�샇泥댄겕
    @RequestMapping(value = "/member/codecheck", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean codecheck(HttpSession session, @RequestParam Map<String, Object> map) {
    	System.out.println(map.get("code"));
    	System.out.println(session.getAttribute("joinCode"));
    	boolean codecheck_flag = false;
    	if(((String)session.getAttribute("joinCode")).equals(map.get("code").toString())) {//�꽭�뀡�뿉 �꽕�젙�맂 �씤利앸쾲�샇�� �엯�젰�븳 踰덊샇�� �씪移섏뿬遺�寃�利�
    		codecheck_flag = true;
    	}
    	System.out.println(codecheck_flag);
        return codecheck_flag;		
    }
    //鍮꾨�踰덊샇 �씤利앹퐫�뱶 �쟾�넚
    @RequestMapping(value = "/member/sendpasswordcode", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendpasswordcode(@RequestParam Map<String, Object> map, HttpSession sess) {
    	
    	boolean sendpassword_flag = false;
    	List<Map<String,Object>> member_list = memberService.select(map);
    	if(member_list != null) {
    		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String passwordCode = String.valueOf(ran);
            sess.setAttribute("passwordCode", passwordCode);
            sess.setAttribute("tempid", map.get("id"));
            MimeMessage message = mailSender.createMimeMessage();
    		try {
    			StringBuilder sb = new StringBuilder();
    	        sb.append("洹��븯�쓽 �뙣�뒪�썙�뱶 �씤利� 肄붾뱶�뒗 ").append(passwordCode).append(" �엯�땲�떎.");
    	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    			messageHelper.setTo(map.get("email").toString());
    			System.out.println(map.get("email").toString());
    			messageHelper.setText(sb.toString());
    			System.out.println(sb.toString());
    			messageHelper.setFrom(from);
    			System.out.println(from);
    			messageHelper.setSubject(subject);
    			System.out.println(subject);
    			mailSender.send(message);
    			sendpassword_flag = true;
        	}catch(Exception e) {
        		e.printStackTrace();
        		sendpassword_flag = false;
        	}
    	}
    	
    	return sendpassword_flag;
    }
    
  //�뙣�뒪�썙�뱶�씤利앸쾲�샇泥댄겕
    @RequestMapping(value = "/member/passwordcodecheck", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String passwordcodecheck(HttpSession session, @RequestParam Map<String, Object> map) {
    	System.out.println(map.get("code"));
    	System.out.println(session.getAttribute("passwordCode"));
    	boolean codecheck_flag = false;
    	if(((String)session.getAttribute("passwordCode")).equals(map.get("code").toString())) {
    		codecheck_flag = true;
    	}
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("codecheck_flag", codecheck_flag);
    	
        return new Gson().toJson(model);
    }
	

}