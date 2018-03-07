package com.jhy.error;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ExceptionHandlingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionHandlingController.class);
	
	public static final String DEFAULT_ERROR_VIEW = "/error/errorPage_500";
	
	/*@ExceptionHandler({SQLException.class,DataAccessException.class})
	public ModelAndView databaseError(HttpServletRequest req, Exception ex) {
		// Nothing to do.  Returns the logical view name of an error page, passed
		// to the view-resolver(s) in usual way.
		// Note that the exception is NOT available to this view (it is not added
		// to the model) but see "Extending ExceptionHandlerExceptionResolver"
		// below.
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", req.getRequestURL());
		mav.addObject("exception", ex);
		mav.setViewName(DEFAULT_ERROR_VIEW);
	 	return mav;
	}*/
	
	  
	  /*// Convert a predefined exception to an HTTP Status code
	  @ResponseStatus(value=HttpStatus.CONFLICT,
	                  reason="Data integrity violation")  // 409
	  @ExceptionHandler(DataIntegrityViolationException.class)
	  public void conflict() {
	    // Nothing to do
	  }*/
	  
	  @ExceptionHandler(Exception.class)
	  public ModelAndView handleError(HttpServletRequest req, Exception ex) {
	    logger.error("Request: " + req.getRequestURL() + " raised " + ex);
	    ModelAndView mav = new ModelAndView();
	    StringBuffer sb = new StringBuffer();
	    for(String str : ex.getMessage().split("###")) {
	    	sb.append(str).append("<br>");
	    }
	    mav.addObject("exception", ex);
	    mav.addObject("message", sb.toString());
	    mav.addObject("url", req.getRequestURL());
	    mav.setViewName(DEFAULT_ERROR_VIEW);
	    return mav;
	  }
	
}
