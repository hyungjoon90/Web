/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.85
 * Generated at: 2018-06-01 10:32:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.view.bbs.jobaf;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class jobaf_005fdetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/view/bbs/jobaf/../../../template/nav.jsp", Long.valueOf(1527736111693L));
    _jspx_dependants.put("/view/bbs/jobaf/../../../template/header.jsp", Long.valueOf(1527818795881L));
    _jspx_dependants.put("/view/bbs/jobaf/../../../template/footer.jsp", Long.valueOf(1527818791026L));
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
	String urlThis = (String)request.getAttribute("urlThis");
	pageContext.setAttribute("urlThis", urlThis);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>비트캠프 구로점 - 상담게시판</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${rootPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("template/main.css\"/>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${rootPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("template/button.css\"/>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Jua\" rel=\"stylesheet\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${rootPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("js/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction returnList(){\r\n");
      out.write("\t\twindow.location.href=\"?mode=list\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction edit(num){\r\n");
      out.write("\t\twindow.location.href=\"?mode=edit&idx=\"+num;\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction deleteon(num){\r\n");
      out.write("\t\tif(confirm(\"해당 게시글을 삭제하시겠습니까?\")){\r\n");
      out.write("\t\t\t$.post('?mode=del',{'idx':num},function(){\r\n");
      out.write("\t\t\t\twindow.location.href='?mode=list';\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("\t .detail{\r\n");
      out.write("        width: 80%;\r\n");
      out.write("        margin: 0px auto;\r\n");
      out.write("    }\r\n");
      out.write("    .cell{\r\n");
      out.write("        width: 100px;\r\n");
      out.write("        display: inline-block;\r\n");
      out.write("    }\r\n");
      out.write("    .toprow{\r\n");
      out.write("        border-bottom: 1px solid black;\r\n");
      out.write("        border-top: 1px solid black;\r\n");
      out.write("    }\r\n");
      out.write("    .row{\r\n");
      out.write("        border-bottom: 1px solid black;\r\n");
      out.write("    }\r\n");
      out.write("    .sub{\r\n");
      out.write("        border-right: 1px solid lightgray;\r\n");
      out.write("        text-align: center;\r\n");
      out.write("        background-color: lightgray;\r\n");
      out.write("    }\r\n");
      out.write("    .content{\r\n");
      out.write("    \tdisplay:inline-block;\r\n");
      out.write("    \twidth:100%;\r\n");
      out.write("    \theight: 350px;\r\n");
      out.write("    \tborder-bottom: 1px solid black;\r\n");
      out.write("    }\r\n");
      out.write("    .btn{\r\n");
      out.write("    \tfloat: right;\r\n");
      out.write("    \tmargin-top: 10px;\r\n");
      out.write("    \tmargin-bottom: 20px;\r\n");
      out.write("    }\r\n");
      out.write("    .clear{\r\n");
      out.write("    clear: both;\r\n");
      out.write("    }\r\n");
      out.write("    .til{\r\n");
      out.write("    \ttext-align: center;\r\n");
      out.write("    }\r\n");
      out.write("    .answer{\r\n");
      out.write("    \tdisplay:inline-block;\r\n");
      out.write("    \twidth:100%;\r\n");
      out.write("    \theight: 100px;\r\n");
      out.write("    \tborder-bottom: 1px solid black;\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"body\">\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<header id=\"header\">\r\n");
      out.write("\t\t<a href=\"#\"><img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${rootPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("img/main/logo.png\" class=\"logo\"></a>\r\n");
      out.write("</header>");
      out.write('\r');
      out.write('\n');
      out.write('	');
      out.write("\r\n");
      out.write("\t<nav id=\"nav\">\r\n");
      out.write("\t\t<ul id=\"menu\">\r\n");
      out.write("\t\t\t<li class=\"topmenu\"><a href=\"#\" class=\"topmenuLink\">학원소개</a>\r\n");
      out.write("\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">개요</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">인사말</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink longlink\">찾아오시는길</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">교수진소개</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"topmenu\"><a href=\"#\" class=\"topmenuLink\">강의소개</a>\r\n");
      out.write("\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">강의목록</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">수강후기</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"topmenu\"><a href=\"#\" class=\"topmenuLink\">상담신청</a></li>\r\n");
      out.write("\t\t\t<li class=\"topmenu\"><a href=\"#\" class=\"topmenuLink\">취업센터</a>\r\n");
      out.write("\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink longlink\">취업프로세스</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">취업정보</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"submenuLink\">취업현황</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t\t<div id=\"login\">\r\n");
      out.write("\t\t\t<span><a href=\"#\" class=\"login in\">로그인</a></span>\r\n");
      out.write("\t\t\t<span class=\"login in\">&nbsp;&#124;&nbsp;</span>\r\n");
      out.write("\t\t\t<span><a href=\"#\" class=\"join in\">회원가입</a></span>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>");
      out.write("\r\n");
      out.write("\t<!-- 각 회원에 맞게 바꿔 주셔야 합니다. -->\r\n");
      out.write("\t<!-- 학생이면 nav_student 강사면 nav_teacher template 폴더를 확인하세요 -->\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<hr class=\"bar\"/>\r\n");
      out.write("\t\t<span class=\"navigator deps\">홈</span>\r\n");
      out.write("\t\t<span class=\"navigator deps\">&nbsp;&rsaquo;&nbsp;</span>\r\n");
      out.write("\t\t<span class=\"navigator deps\">취업센터</span>\r\n");
      out.write("\t\t<span class=\"navigator deps\">&nbsp;&rsaquo;&nbsp;</span>\r\n");
      out.write("\t\t<span class=\"navigator final\">취업현황게시판</span>\r\n");
      out.write("\t\t<!-- 뎁스영역을 직접 적어 주셔야 합니다. \"홈 > 학원소개 > 찾아오시는 길\" 이런식으로 적어주세요\r\n");
      out.write("\t\t\t> 표시는 &rsaquo; 입니다.\r\n");
      out.write("\t\t -->\r\n");
      out.write("\t<hr class=\"bar\"/>\r\n");
      out.write("\t<article id=\"article\">\r\n");
      out.write("\t\t<div id=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"til\">\r\n");
      out.write("\t\t\t\t\t<h1>취업현황게시판 상세페이지</h1>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"innerCon\">\r\n");
      out.write("\t\t\t\t\t<div class=\"toprow\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">제목</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">글번호</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.num }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">취업업체명</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.company }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">교육과정</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.lec_code }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">취업자명</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"cell sub\">취업분야</span>\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.field }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"content\">\r\n");
      out.write("\t\t\t\t\t\t<span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.contents }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"btn\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" onclick=\"returnList()\" class=\"button\">목록</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" onclick=\"edit(");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.num }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(")\" class=\"button\">수정</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" onclick=\"deleteon(");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dtoJobAf.num }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(")\" class=\"button\">삭제</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"clear\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</article>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("    <!--내용끝-->\r\n");
      out.write(" <footer id=\"footer\">\r\n");
      out.write("   <div class=\"footer1\">\r\n");
      out.write("   </div>\r\n");
      out.write("   <div class=\"footer2\">\r\n");
      out.write("       <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${rootPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("img/main/logo.png\" class=\"footerlogo\">\r\n");
      out.write("   </div>\r\n");
      out.write("   <div id=\"address\" class=\"footer3\">\r\n");
      out.write("       <address id=\"address\">\r\n");
      out.write("       비트캠프 서울시 서초구 서초동 1327-15 비트아카데미빌딩사업자등록번호 : 214-85-24928 ┃ (주)비트컴퓨터 서초지점 대표이사 : 조현정\r\n");
      out.write("         <br>문의 : 02-3486-9600 / 팩스 : 02-6007-1245 ┃통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 권도혁\r\n");
      out.write("         <br>Copyright (c) 비트캠프 All rights reserved.\r\n");
      out.write("      </address>\r\n");
      out.write("   </div>\r\n");
      out.write("   <div class=\"footer4\">\r\n");
      out.write("   </div>\r\n");
      out.write(" </footer>");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
