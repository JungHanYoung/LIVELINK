<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>


<html>
<div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">우편번호</span>
                <input type = "text" class = "form-control" id = "zip_code" name = "zip_code">
                <span class = "input-group-addon"><a href = "#" id = "zip_codeBtn" data-toggle="modal" data-target="#zip_codeModal">검색하기</a></span>                
            </div>
        </div>
    </div>
    <div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">주소</span>
                <input type = "text" class = "form-control" id = "address1">                
            </div>
        </div>
    </div>        
    <div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">상세주소</span>
                <input type = "text" class = "form-control" id = "address2">        
            </div>
        </div>
    </div>    



</html>