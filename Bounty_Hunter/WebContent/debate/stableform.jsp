<%@page import="data.dto.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberHashDTO"%>
<%@page import="data.db.MemberHashDB"%>
<%@page import="data.db.MemberDB"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.BoardDTO"%>
<%@page import="data.db.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Lobster|Nanum+Myeongjo&display=swap"
   rel="stylesheet">

<link href='https://fonts.googleapis.com/css?family=Nunito:400,700'
   rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 
<link rel="stylesheet" href="../css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="../css/style.css">
<!-- Resource style -->
<link rel="stylesheet" href="../css/stableform.css">
<link rel="stylesheet" href="../css/debateform_2.css">

<title>Bounty Hunter</title>

<script>
$(function(){
	
	$(document).on("click",".myimg",function(){
		
		var bnum = $(this).attr("bnum");
		
		location.href="debatecontent.jsp?bnum="+bnum;
		
		
	});
	
});
</script>

</head>
<%
   String myid = (String) session.getAttribute("myid");
   MemberDB db = new MemberDB();
   
   int mnum = db.getNumByMyid(myid);
   MemberDTO mdto = db.getMember(mnum);
   int bounty = mdto.getBounty();

   BoardDB bdb = new BoardDB();
   List<BoardDTO> list = bdb.getAllBoard(mnum);

   MemberHashDB hdb = new MemberHashDB();
   List<MemberHashDTO> hlist = hdb.getMemberHash(mnum);
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<body class="gummy-transition">
   <main class="cd-main-content">
   <div class="cover-gray">
   	<div id="super">
	  <div class="topinfo">
	  	<h3 id="logo">
         <div onclick="location.href='../main/main.jsp'" class="logo">Bounty Hunter</div>
      </h3>
	  <div class="userbounty"><%= myid %>님의 보유액: $<%= bounty %></div>
	  </div>
      <h1 id="h1"><%=myid%>'s &nbsp;&nbsp; Stable</h1>
      <br> <br>

      <div class="centerinfo">
      	<div id="superhash">
	         <div id="hash_wrapper">
	            <span id="hash"><%=myid%>님의 해시태그</span> <div class="modify" onclick="location.href='debatehash.jsp'">수정</div>
	         </div>
	         <div class="hashbox">
	            <%
	               for (MemberHashDTO hdto : hlist) {
	            %>
	            <span class="hashcontent">#<%=hdto.getHash()%></span>
	            <%
	               }
	            %>
	         </div>
	      </div>
	      <div class="img_wrapper">
	         <div class="content">
	            <h4 class="stampcontent">
	               <a href="#modal-1" class="cd-btn cd-modal-trigger">Create new <br>Debate
	               </a>
	            </h4>
	         </div>
	      </div>
      </div>

      <div style="clear: both"></div>
      <div id="board_super">
         <div id="board_wrapper1">
            <%
               for (int i=0; i<list.size(); i++) {
            	   if(i==0){%>
            		   <div class="board1" >
		               <div class="myimg" bnum="<%=list.get(i).getNum() %>">
		                  <img class="myimg" src="<%=list.get(i).getImage()%>" >
		               </div>
		               <br> <br> <br>
		               <div class="boardsee">
		                  <div id="title"><%=list.get(i).getTitle()%></div>
		                  <br>
		                  <span id="modday"> <img class ="timeimg" alt="Time" src="../image/icon-clock.png" > &nbsp;<%=sdf.format(list.get(i).getModday())%></span>
		                  &nbsp; &nbsp;
		                 <img class="bountyimg" alt="bountyimg" src="../image/usd2.png"> <span id="bounty" ><%=list.get(i).getBounty()%></span>
		               </div>
		            </div>
            	  <%}
               else if(i%4==0){%>
            		   <div class="board1" style="margin-right: 0;">
			               <div class="myimg" bnum="<%=list.get(i).getNum() %>">
			                  <img class="myimg" src="<%=list.get(i).getImage()%>" >
			               </div>
			               <br> <br> <br>
			               <div class="boardsee">
			                  <div id="title"><%=list.get(i).getTitle()%></div>
			                  <br>
			                  <span id="modday"> <img class ="timeimg" alt="Time" src="../image/icon-clock.png" > &nbsp;<%=sdf.format(list.get(i).getModday())%></span>
			                  &nbsp; &nbsp;
			                 <img class="bountyimg" alt="bountyimg" src="../image/usd2.png"> <span id="bounty" ><%=list.get(i).getBounty()%></span>
			               </div>
			            </div>
            	  <%} else{%>
            		  	<div class="board1" >
			               <div class="myimg" bnum="<%=list.get(i).getNum() %>">
			                  <img class="myimg" src="<%=list.get(i).getImage()%>" >
			               </div>
			               <br> <br> <br>
			               <div class="boardsee">
			                  <div id="title"><%=list.get(i).getTitle()%></div>
			                  <br>
			                  <span id="modday"> <img class ="timeimg" alt="Time" src="../image/icon-clock.png" > &nbsp;<%=sdf.format(list.get(i).getModday())%></span>
			                  &nbsp; &nbsp;
			                 <img class="bountyimg" alt="bountyimg" src="../image/usd2.png"> <span id="bounty" ><%=list.get(i).getBounty()%></span>
			               </div>
			            </div>
            	  <%}
               }
            %>
         </div>
      </div>
   </div>
   </div>
   
   </main>
   <!-- .cd-main-content -->

   <div class="cd-modal" id="modal-1">
      <div class="cover-gray"></div>
      <div class="debatecover"></div>
      <div class="logo_align">
      	  <div class="logo">
	        <span onclick="location.href='../main/main.jsp'">Bounty Hunter</span>
	      </div>
      </div>
      <div class="super">
         <form action="debateaction.jsp" method="post" id="frm">
            <table class="formtable">
               <tr>
                  <th style="position: absolute; top:-5px;">Subject</th>
                  <td style="width: 600px;"><input style="width: 458px;"
                     type="text" name="subject" /></td>
               </tr>
               <tr>
                  <th style="position: absolute; width: 458px; top:74px; left:265px;">Upload</th>
                  <td style="width: 600px;"><input style="width: 458px; top:-9px;"
                     type="text" name="upload" placeholder="Please choose the best picture for your debate" /></td>
               </tr>
               <tr>
                  <th style="width: 200px; position: absolute; top: 153px; left: 265.7px;">Content</th>
                  <td style="width: 600px;"><textarea style="width: 470px; height: 420px; position:relative; top:-15px; left:5px;"
                       placeholder="What would you like to discuss about?"
                       name="content" id="content" cols="30" rows="10"></textarea></td>
               </tr>
            </table>

            <div class="submitform"
               style="width: 800px; margin-left:290px; text-align: center; margin-top: -16px;">
               <input type="submit" value="Submit"
                  style="height: 50px; border-radius: 10px; background: #8862b2; border: none; font-family: 'Lobster'; font-size: 30px; cursor: pointer; color: white" />
         		  &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="Back" onclick="location.href='../debate/stableform.jsp'"
					style="height: 50px; border-radius: 10px; background: #8862b2; border: none; font-family: 'Lobster'; font-size: 30px; cursor: pointer; color: white; width:96px;" />
            </div>
         </form>
         <button type="button" class="mybutton" onclick="location.href='debateupload_search.jsp'">Search</button>
      </div>
      <a href="#0" class="modal-close">Close</a>
   </div>
   <!-- .cd-modal -->

   <div class="cd-transition-layer" data-frame="25">
      <div class="bg-layer"></div>
   </div>
   <!-- .cd-transition-layer -->

   <script src="js/modernizr.js"></script>
   <!-- Modernizr -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
   <script>
      if (!window.jQuery)
         document.write('<script src="js/jquery-2.2.1-min.js"><\/script>');
   </script>
   <script src="js/main.js"></script>
   <!-- Resource jQuery -->
</body>
</html>