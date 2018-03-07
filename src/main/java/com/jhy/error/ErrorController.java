package com.jhy.error;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/error")
public class ErrorController {
	
	@RequestMapping(value="/nologin")
	public String loginError(Locale locale, Model model, @RequestParam Map map) {
		
		return "/common/nologin_alert";
	}
	
	@RequestMapping(value="/noadmin")
	public String noAdminError(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("success_flag", "N");
		model.addAttribute("forward_url", "/member/Login");
		
		return "/common/admin_alert";
	}
	
	@RequestMapping(value="/common")
	public String commonError(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("success_flag", "N");
		model.addAttribute("forward_url", "/");
		
		return "/common/common_alert";
	}
	@RequestMapping(value="/db_error")
	public String db_error(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("success_flag", "N");
		model.addAttribute("forward_url", "/");
		
		return "/common/common_alert";
	}
	@RequestMapping(value="/error")
	public String common_error(Locale locale, Model model, @RequestParam Map map, Exception e) {
		model.addAttribute("success_flag", "N");
		model.addAttribute("forward_url", "/");
		
		return "/common/common_alert";
	}
	@RequestMapping(value = "errors", method = RequestMethod.GET)
    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
         
        ModelAndView errorPage = new ModelAndView("/error/error");
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);
 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "Http Error Code: 400. Bad Request";
                break;
            }
            case 401: {
                errorMsg = "Http Error Code: 401. Unauthorized";
                break;
            }
            case 404: {
                errorMsg = "Http Error Code: 404. Resource not found";
                break;
            }
            case 500: {
                errorMsg = "Http Error Code: 500. Internal Server Error";
                break;
            }
        }
        errorPage.addObject("errorMsg", errorMsg);
        return errorPage;
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
}
