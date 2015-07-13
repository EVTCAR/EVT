<%@ page language="java" import="java.util.*" import="myBean.usInformation" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>充电导航</title>

<link href="css/evtcar.css" rel="stylesheet">
<link href="css/search.css" rel="stylesheet">
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" /> 
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/evtcar.css" rel="stylesheet">
<link rel="stylesheet" href="lib/jquery.raty.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=r6bfCVxPZTpoKGGNthyuupYh"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>

<script src="js/WdatePicker.js" type="text/javascript"></script>
<script src="js/calendar.js" type="text/javascript"></script>
<script src="js/jquery-2.1.3.min.js"></script> 
<script src="js/staticinfo.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

<script src="js/UserCheck.js"></script> 
<script >
	<%
		HttpSession sess = request.getSession();
		usInformation usInf = (usInformation)sess.getAttribute("usInf");

	%>
	window.MAINURL = "<%=basePath%>";
	STATICINFO.USERINFO.URL = "<%=basePath%>";
	STATICINFO.USERINFO.name = "<%= usInf==null ? "" : usInf.getUsId()%>";
	
</script>

<style>
body {
	font-size: 14px;
	line-height: 1.428571429;
	color: #333333;
}
.map{

	width:100%;
	height:500px;
}
</style>

</head>

<body>
<%
 if ((String)request.getAttribute("message")=="true") {
 %>
 <script>
 alert("操作成功");
 </script>
 <%
 }
 %>

<!-- Modal -->
<div class="modal fade" id="csintro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text"><strong>充电站详细信息</strong></h4>
      </div>
      <div class="modal-body">
        <div class="info"></div>
        
         <div class="content">
        	<hr>
        	<div class="op-bar">
        		<div class="op-total">*评价是用户对本充电站的服务及设施点评</div>
        		<div class="op-statis">
        			<div class="item font-show">
        				<div class="c-total"></div>
        				<div class="star-rating"></div>        				
        				<div class="c-num"></div>
        			</div>
        			<div class="item fig-show">
        				<p class="list">
        					<span>5分</span>
        					<span class="o-bg">
	        					<span class="n-bg" id="p5-bg" style="width: 57px;">
	        						<span class="p-num" id="p5"></span>
	        					</span>
        					</span>
        				</p>
        				<p class="list">
        					<span>4分</span>
        					<span class="o-bg">
	        					<span class="n-bg" id="p4-bg" style="width: 57px;">
	        						<span class="p-num" id="p4"></span>
	        					</span>
        					</span>
        				</p>
        				<p class="list">
        					<span>3分</span>
        					<span class="o-bg">
	        					<span class="n-bg" id="p3-bg" style="width: 57px;">
	        						<span class="p-num" id="p3"></span>
	        					</span>
        					</span>
        				</p>
        				<p class="list">
        					<span>2分</span>
        					<span class="o-bg">
	        					<span class="n-bg" id="p2-bg" style="width: 57px;">
	        						<span class="p-num" id="p2"></span>
	        					</span>
        					</span>
        				</p>
        				<p class="list">
        					<span>1分</span>
        					<span class="o-bg">
	        					<span class="n-bg" id="p1-bg" style="width: 57px;">
	        						<span class="p-num" id="p1"></span>
	        					</span>
        					</span>
        				</p>
        			</div>
        		</div>
        		
        	</div>
        	<div class="commentbtn">
        			<span class="r ">想说点什么？</span>
	        </div>
	        <div class="clearfix commentcontent">
	            <form  method="post" action="dealMessage">
	                <input name="act" id="act" value="comment" style="display: none;">
	                <input name="csid"  id="csidv"  value="" style="display: none;">
	        		<textarea rows="3" cols="20" maxlength="100" class="comment" id="comment" name="comment" placeholder="在此输入您的简短评论，不得超过100字"></textarea>
	        		<br><span>服务、基础设施评星 :</span><div><div id="starcomment"></div><input type="text"  id="starsum" name="starsum" style="display: none;" value="5" /></div>
	        		<div class="r">
	        		<% if(usInf!=null){ %>
	        		<!-- <span >点评完毕?<input type="submit" class='btn btn-success btn-sm' value="提交"></input>  -->
	        		<span>点评完毕? <a id="makeComment" class='btn btn-success btn-sm'>提交</a>
	        		<%}else{ %>
	        		<span >登录后可点评。<a href="login.jsp" >点此登录</a>
	        		<%} %>
	        		</span></div>
	            </form>
	        </div>
	        
	       <div class="commentinfo" >
	       		<ul class="cminfo"></ul>
	       </div>
        	
        	<ul class="pagination r pagination-sm">
			  <li><a href="#">&laquo;</a></li>
			  <li><a href="#">1</a></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">4</a></li>
			  <li><a href="#">5</a></li>
			  <li><a href="#">&raquo;</a></li>
			</ul>
			<br>
			<br>
        </div>
        
     </div>
      
    </div>
  </div>
</div>

<!-- Modal2  预约信息显示-->
<div class="modal fade" id="csorder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text"><strong>用户充电预约</strong></h4>
      </div>
      <div class="modal-body">
      	 <div  class="info">
      	 	
      	 </div>
        <div class="appoint">
        	<div class="errormsg"></div>
        	<div class="box">
        		<div class="text">充电桩类型</div>
        		<div class="cptype clearfix">
        			<input type="checkbox" name="cp" value="快充" /><span>快充</span>
	        		<input type="checkbox" name="cp" value="慢充" /><span>慢充</span>
	        		<input type="checkbox" name="cp" value="快慢充" /><span>快慢充</span>
        		</div>
        		
        	</div>

            <div class="box">
              <div class="text">开始时间</div>
              <div class="time clearfix">
              <input name="start-date" type="text" class="cal" onfocus="WdatePicker()" >
              <input name="start-time" type="text" class="time" onfocus="WdatePicker({dateFmt:'HH:mm:ss'})"/>
              </div>
            </div>
            <div class="box">
              <div class="text">结束时间</div>
              <div class="time clearfix">
              <input name="stop-date" type="text" class="cal" onfocus="WdatePicker()">
              <input name="stop-time" type="text" class="time" onfocus="WdatePicker({dateFmt:'HH:mm:ss'})"/>
              </div>
            </div>
            <div class="orderbutton">
                <a class="btn btn-success btn-lg"  id = "makeOrder">提交预约</a>
            </div>
        </div>
     </div>
      
    </div>
  </div>
</div>
<!--<div></div> -->

<!--顶部导航栏开始 -->
<%@include file="head.jsp" %>
<div class="nav-green nav-head" id="J_m_nav">
	<div class="nav-content">
		<div class="nav-btn "><a href="index.jsp">首页</a></div>
		<div class="nav-btn active"><a href="searchCS.jsp">我要充电</a></div>
		<div class="nav-btn"><a href="inq_sta.jsp">充电站分布</a></div>
		<div class="nav-btn "><a href="userInf.jsp">用户管理</a></div>
		<div class="nav-btn"><a href="#">关于我们</a></div>
	</div>
</div>
</header>
<!--顶部导航栏结束 -->
<div class="map-container">
<div class="map" id="r-map" style="min-width:1024px;height:600px;">
</div>
<div class="map-messagebox" style="display:none">
	<div class="message">
		请输入您的详细位置
	</div>
</div>
<div class="map-search">
	<ul class="select">
		<div class="select-section">
		<li class="select-list">
			<dl id="select1" data-csOperator="none">
				<dt>服务商：</dt>
				<dd class="select-all selected" data-value="all"><a href="#">全部</a></dd>
				<dd data-value="001"><a href="#">国家电网</a></dd>
				<dd data-value="002"><a href="#">普天</a></dd>
				<dd data-value="003"><a href="#">特锐德</a></dd>
				<dd data-value="004"><a href="#">富电科技</a></dd>
				<dd data-value="005"><a href="#">特斯拉</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select2" data-csRange="none">
				<dt>范围：</dt>
				<dd class="select-all selected"  data-value="5"><a href="#">0~5公里</a></dd>
				<dd data-value="10"><a href="#">0~10公里</a></dd>
				<dd data-value="20"><a href="#">0~20公里</a></dd>
				<dd data-value="30"><a href="#">0~30公里</a></dd>
				<dd data-value="40"><a href="#">0~40公里</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select3" data-csParkFee="none">
				<dt>停车费：</dt>
				<dd class="select-all selected" data-value="all"><a href="#">全部</a></dd>
				<dd data-value="0"><a href="#">免费</a></dd>
				<dd data-value="5"><a href="#">0~5元/h</a></dd>
				<dd data-value="10"><a href="#">0~10元/h</a></dd>
				<dd data-value="100"><a href="#">>10元/h</a></dd>
			</dl>
		</li>
		
		</div>
		<li class="select-result">
			<dl>
				<dt>已选条件：</dt>
				<dd class="select-no">暂时没有选择过滤条件</dd>
				
			</dl>
			
		</li>
		<li class="search-input clearfix">
			<dl>
				<dt>您的位置：</dt>
				<dd><input type="text" placeholder="请输入您的位置" id="suggestId"></dd>
				<div class="search btn btn-default" id="search"><a href="#">查询</a></div>
			</dl>
		</li>
		<div class="search-toggle"><a href="#">收起</a></div>
	</ul>
</div>


<div id="searchResultPanel">
	<div class="search-box">
		<div class="search-head">您的位置：<span>北京交通大学</span></br>
			<div class="search-tip">我们为您推荐的充电站:</div>
		</div>
		<!--以下显示推荐充电桩-->
			<div class="resultAll">
			</div>
		</div>
	</div>
</div>


<%@include file="footer.jsp" %>

<!--下面是左侧导航栏的代码-->
<script src="js/bootstrap.min.js"></script>
<script src="js/mapcontrol.js" type="text/javascript"></script>
<script src="js/search.js"></script> 
<script src="js/showInf.js" type="text/javascript"></script>
<script src="js/jquery.raty.js" type="text/javascript"></script>
<script>
$(function(){
	$("[name='start-date']").val(CurentDateTime(0));
	$("[name='start-time']").val(CurentTime());
	$("[name='stop-date']").val(CurentDateTime(1));
	$("[name='stop-time']").val(CurentTime());
	//$("#csid").val(CsAllData[i].CSId);
	$("#starcomment").raty();
	$(".commentbtn a").click(function(){ 
		$(".commentcontent").show();
	});
	$("#starcomment").click(function(){
		var starsum=$('#starcomment').raty('getScore');
		$("#starsum").val(starsum);
		//alert(CsAllData[i].CSId);
	});
})
function CurentDateTime(i)
{ 
    var now = new Date();
    var year = now.getFullYear();    //年
    var month = now.getMonth()+1;     //月
    var day = now.getDate()+i;        //日
    var clock = year + "-";
    if(month < 10)
        clock += "0";
    clock += month + "-";
    if(day < 10)
        clock += "0";
    clock += day;
    return(clock); 
}
//点击提交评价信息----张伟增加
$("#makeComment").click(function(){
	USERCheck.isLogin(function(isok,error){
        if(isok != 'false'){
        	
        	var act=$("#act").val();
        	var starsum=$("#starsum").val();
        	var comment=$("#comment").val();
        	var csid=$("#csidv").val();
        	var usordid="1";
        	var AjaxURL="dealMessage?act="+act+"&starsum="+starsum+"&comment="+comment+"&csid="+csid+"&usordid="+usordid;
        	$.ajax({
                type: "POST",
                dataType: "html",
                url: AjaxURL,
                success: function (data) {
                	
                	if(data.isSuccess=="false"){
	            		alert("提交评价失败，请重新提交!");
	            		//$("#csorder .errormsg").html(error);
	            			          
                	}else { 
	            		alert("提交评价成功!");
	            		$("#comment").val("");
			            var AjaxURL="dealMessage?CSId="+csid;
			            $.ajax({
			                        type: "GET",
			                        dataType: "html",
			                        url: AjaxURL,
			                        data:{act:'commentinfo'},
			                       // data: {VehData:JSON.stringify(VehData)},
			                        success: function (data) {
			                                  var CommentInfo = JSON.parse(data);//存放评价信息的数组
	            							 
			                                  coo();
			                                  //将评论信息显示在面板上
			                        	      function coo(){
			                        	    	  $("#csintro .modal-body .commentinfo .cminfo li").remove();
				                                  for(var j=0;j<CommentInfo.length;j++){
				                              		$("#csintro .modal-body .commentinfo .cminfo").append(
				                              				"<li><div class='comment-body'><span class='star-rating1'><span class='syellowstar50 star-icon'></span></span><span class='name'>"+CommentInfo[j].USId+"</span>&nbsp;&nbsp;<div class='Star' data-starnum='"+CommentInfo[j].Star+"'></div>"+
				                                  			"<span class='date'>"+CommentInfo[j].Time+
				                                  			"</span><div class='commentdetail'>"+CommentInfo[j].Content+
				                                  			"</div></div></li>");
				                              		
				                              	   }
				                                   $("#csidv").attr("value",csid);
					                                $(".Star").each(function(){
					                              		var num = $(this).data("starnum");
					                              		$(this).raty({readOnly:true,score:num}); 
					                              	});
				                                  //统计评星并显示
				                                  $.ajax({
				                                      type: "GET",
				                                      dataType: "html",
				                                      url: AjaxURL,
				                                      data:{act:'analysiscminfo'},
				                                     // data: {VehData:JSON.stringify(VehData)},
				                                      success: function (data) {
				                                                var AnalysisCmInfo = JSON.parse(data);//存放评价信息的数组
				                                                
				                                                //alert(AnalysisCmInfo);
				                                                analysis();
				                                                //将评星信息显示在面板上
				                                      	      	function analysis(){
				                                      	    	   $(".c-total").empty();	                                      	    	   
				                                      	    	   $(".star-rating").raty({readOnly:true,score:0});
				                                      	    	   $(".c-total").empty();
				                                      	    	   $(".c-num").empty();
				                                                    for(var j=0;j<AnalysisCmInfo.length;j++){
				                                                    	var avg = AnalysisCmInfo[j].StarAvg;
					                                                    //alert(avg);
					                                                	$(".star-rating").raty({readOnly:true,score:avg});
				                                                		$(".c-total").html("<P>"+AnalysisCmInfo[j].StarAvg+"</p>");
				                                                		$(".c-num").html("<P>共有"+AnalysisCmInfo[j].ussum+"人评价</p>");
				                                                		$("#p5").html("<p>"+AnalysisCmInfo[j].Star5+"人</p>");
				                                                		$("#p4").html("<p>"+AnalysisCmInfo[j].Star4+"人</p>");
				                                                		$("#p3").html("<p>"+AnalysisCmInfo[j].Star3+"人</p>");
				                                                		$("#p2").html("<p>"+AnalysisCmInfo[j].Star2+"人</p>");
				                                                		$("#p1").html("<p>"+AnalysisCmInfo[j].Star1+"人</p>");
				                                                		if(AnalysisCmInfo[j].ussum!=0){
					                                                		var p5=(AnalysisCmInfo[j].Star5/AnalysisCmInfo[j].ussum)*100;
					                                                		var p4=(AnalysisCmInfo[j].Star4/AnalysisCmInfo[j].ussum)*100;
					                                                		var p3=(AnalysisCmInfo[j].Star3/AnalysisCmInfo[j].ussum)*100;
					                                                		var p2=(AnalysisCmInfo[j].Star2/AnalysisCmInfo[j].ussum)*100;
					                                                		var p1=(AnalysisCmInfo[j].Star1/AnalysisCmInfo[j].ussum)*100;
				                                                		}else{
				                                                			var p5=0;
					                                                		var p4=0;
					                                                		var p3=0;
					                                                		var p2=0;
					                                                		var p1=0;
				                                                		}
				                                                		$("#p5-bg").width(""+p5+"px");
				                                                		$("#p4-bg").width(""+p4+"px");
				                                                		$("#p3-bg").width(""+p3+"px");
				                                                		$("#p2-bg").width(""+p2+"px");
				                                                		$("#p1-bg").width(""+p1+"px");
				                                                		
				                                                		
				                                                	}                   		
				                                              }
				                                                
				                                      },
				                                      error: function(data) {
				                                          alert("查询评价信息失败");
				                                      }
				                                  }); 
			                        	    }
			                                  
			                        },
			                        error: function(data) {
			                            alert("查询评价信息失败");
			                        }
			                    });
				            		//$("#csorder .errormsg").html("您的预约请求已提交，请到用户管理中查看订单详情。");
				            		//window.location.href = 'userInf.html';
			                	}
			                },
			                error: function(data) {
			                    alert("error:"+data.message);
			                 }
			            });
        }else { 
        	alert("您好，请先登录！登录后才能预约");
            window.location.href = "login.jsp";
        }
    },window.MAINURL);
});
function CurentTime()
{ 
    var now = new Date();
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
    var ss = now.getSeconds();           //秒
    var clock = hh + ":";
    if (mm < 10) clock += '0'; 
    clock += mm + ":"; 
    if (ss < 10) clock += '0'; 
    clock += ss; 
    return(clock); 
}
</script>
</body>
</html>
