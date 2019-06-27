<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css"/>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<!--查看图片插件 -->
	<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
    <link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
    <script type="text/javascript" src="plugins/zoomimage/js/jquery.js"></script>
    <script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
    <script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
    <script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
    <script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>
	<!--查看图片插件 -->
	</head>
	<style type="text/css">
		li {list-style-type:none;}
	</style>
	
	
	<!--  -->
	<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/galler/css/bootstrap.min.css" />
		<link rel="stylesheet" href="static/galler/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/galler/css/colorbox.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="static/galler/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href=static/galler/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="static/galler/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/galler/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="static/galler/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="static/galler/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="static/galler/js/html5shiv.min.js"></script>
		<script src="static/galler/js/respond.min.js"></script>
		<![endif]-->
	<style>
	.ace-thumbnails>li{
	border: none;
	}
	 #toGoPage{   
	 width: 60px !important;;
    line-height:30px !important;;
    height: 30px !important;
    }
</style>
	
<body >
	
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
<!--   <div class="row-fluid"> -->

<!-- 	<div class="row-fluid"> -->

	<form action="worklist_verify/worklist_verify_select_goto.do" method="post" name="Form" id="Form">
		<input type="hidden" id="SerialNum" name="SerialNum" value="${varList[0].SerialNum}"/>
		<input type="hidden" id="taskNum" name="taskNum" value="${varList[0].taskNum}"/>
		<table id="table_search"  class="table">
			<tr>
				<td style="width:70px;text-align: left;white-space:nowrap;">
							<span>出产编号:</span>
							<span>${varList[0].SerialNum}</span>
						</td>
						<td style="width:70px;text-align: center;white-space:nowrap;">
							<span>用户名:</span>
							<span>${varList[0].UserName}</span>
						</td>
						<td style="width:150px;text-align: left;white-space:nowrap;">
							<span>任务单号:</span>
							<span>${varList[0].taskNum}</span>
						</td>
						<td style="width:150px;text-align: center;white-space:nowrap;">
							<span>规格型号:</span>
							<span>${varList[0].ModelCode}</span>
						</td>			
					    <td style="width:70px;text-align: center;white-space:nowrap;">
					   		 <span>类型:</span>
					   		 <span>
					   		 <c:forEach items="${devTypeList}" var="devType">
								<c:if test="${devType.DevTypeCode==varList[0].DeviceType}">${devType.DevTypeName}</c:if>	
							</c:forEach>
					   		 </span>
					    </td>
						<td style="width:70px;text-align: center;white-space:nowrap;" >
							 <span>口径:</span>
					   		 <span>${varList[0].Caliber}</span>
						</td>
						<td style="width:70px;text-align: right;white-space:nowrap;" >
							<span>
								
							<c:if test="${varList[0].addInfo=='1'}">
								<a href="javascript:void(0)"  class="btn btn-small btn-danger " target="_blank" data-toggle="modal" data-target=".bs-example-modal-sm2" style="text-decoration:none">
									+新增记录
								</a>
							</c:if>
							<c:if test="${varList[0].addInfo=='0'}">
								<a  style="text-decoration:none" class="btn btn-small btn-grey"  >
									+新增记录
								</a>
							</c:if>
							</span>		
					</td>
			</tr>
		</table>
	</form>	
		
		<!-- 检索结果  -->
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
				<tr  style="white-space:nowrap;">
					<th>序号</th>
                    <th>计划日期</th>
                    <th>拆装日期</th>
                    <th>安装日期</th>
                    <th>检定日期</th>
                    <th>任务单号</th>
                    <th>是否换件</th>
                    <th>换件内容</th>
                    <th>清洗</th>
                    <th>检定数据</th>
                    <th style="width:200px;">详细</th>
				</tr>
			</thead>
		<!--  CalibraResult1, CalibraResult2, CalibraResult3, CalibraResult4 -->							
			<tbody>
			<input type="hidden" id="varListSize" value="${varList1.size() }"/>	
			<!-- 开始循环 -->	
			<c:choose>
				<c:when test="${not empty varList1}">

					<c:forEach items="${varList1}" var="var" varStatus="vs">
						<tr>
							<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${vs.index+1}</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<fmt:formatDate value="${var.OPERATETIME}" pattern="yyyy-MM-dd"/> 
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<fmt:formatDate value="${var.DOWNTIME}" pattern="yyyy-MM-dd"/>
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<fmt:formatDate value="${var.InsertTime}" pattern="yyyy-MM-dd"/>
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<fmt:formatDate value="${var.planTime}" pattern="yyyy-MM-dd"/>
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									${var.taskNum}
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">	
									<c:if test="${var.VerifyType=='0'}">
									 	是
									</c:if>
									<c:if test="${var.VerifyType=='1'}">
									 	否
									</c:if>
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									${var.VerifyReason}
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<c:if test="${var.filterClean=='0'}">
									 	是
									</c:if>
									<c:if test="${var.filterClean=='1'}">
									 	否
									</c:if>
								</td>
								<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
								
									<c:if test="${var.VerifyValue=='1'}">
										 有
									</c:if>
									<c:if test="${var.VerifyValue=='0'}">
									 	无
									</c:if>
								</td>
								<td >
									<ul class="ace-thumbnails clearfix">
										<li>
											<!-- href="uploadFiles/uploadImgs/${var.PATH}" -->
											<a  href="1" id="d${vs.index+1}"   onclick=" return  showDown('${vs.index+1}','${var.taskNum}')" title="拆卸记录单"  data-rel="colorbox">
												拆卸记录单
											</a>
										</li>
									
										<li>
											<!-- href="uploadFiles/uploadImgs/${var.PATH}" -->
											<a  href="1" id="i${vs.index+1}"   onclick=" return  showInsert('${vs.index+1}','${var.taskNum}')" title="安装记录单"  data-rel="colorbox">
												安装记录单
											</a>
										</li>
										
										<li>
											<!-- href="uploadFiles/uploadImgs/${var.PATH}" -->
											<a  href="1" id="p${vs.index+1}"   onclick=" return  showParts('${vs.index+1}','${var.taskNum}')"  title="配件照片"  data-rel="colorbox">
												配件照片
											</a>
										</li>		
										<li>
											<!-- href="uploadFiles/uploadImgs/${var.PATH}" -->
											<a href="1" id="a${vs.index+1}"   onclick=" return  showInfo('${vs.index+1}','${var.taskNum}')" title="过滤清理照片"  data-rel="colorbox">
												过滤清理照片
											</a>
										</li>
									
									</ul>						
								</td>
														
                    </tr>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td colspan="100" class="center" >没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>

		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->	
<div class="container" style="width: 100%; height: 100%;">
	<div
		style="background: 	#FFFFFF; margin: 0 auto; width: 800px; height: 300px;">
		<div id="main" style="width: 500px; height: 300px;"></div>
	</div>
</div>	
<div class="modal fade bs-example-modal-sm2" tabindex="-1" role="dialog" style="width: 500px; height:480px;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel2">新增检定记录</h4>
			</div>
			<div class="modal-body">
				<form id="repairOrderForm" class="form-inline"
					style="height:305px;">

					<div class="form-group" style="margin-bottom: 3px;">
						<label style="width: 100px;">检定日期</label> <input
						class="span10 date-picker" id="lastDate" style="width: 206px"
						type="text" name="lastDate" autocomplete="off"
						data-date-format="yyyy-mm-dd" value="${pd.lastDate }" />
						<span class="add-on"><i class="icon-calendar"></i></span>
					</div>
					<div class="form-group" style="margin-bottom: 3px;">
						<label for="username2" style="width: 100px;">是否换件</label> 
						<div class="radio inline">
							<label> <input name="situations" type="radio"
								class="ace" id="s1" value="1" checked> <span
								class="lbl">是</span>
							</label>
						</div>
						<div class="radio inline">
							<label> <input name="situations" type="radio"
								class="ace" id="s2" value="0"> <span class="lbl">否</span>
							</label>
						</div>
						
					</div>
					<div style="margin-bottom: 3px;" id="maintainContextId">
						<label style="width: 100px;">更换内容</label>
						<div class="radio inline">
							<select class="chzn-select" id="selectMaintainContext">
								<option value="1">易损件</option>
								<option value="2">机蕊</option>
								<option value="4">其他</option>
							</select> 
							<input autocomplete="off" id="maintainContext" type="text" name="maintainContext"style="width: 126px !important; display: none" />
						</div>
					</div>
					<div class="form-group" style="margin-bottom: 3px;">
						<label for="describetion" style="width: 100px;">检定数据:</label>
					</div>
					<div class="form-group" style="width:260px; margin-left: 90px;">
						<span>
							<label for="describetion" style="width: 30px;">Qmin</label>
							<input type="text" class="form-control" id="CalibraResult1"style="width: 40px;margin-left: 5px;" />
							<label for="describetion" style="width: 10px;">%</label>
						</span>
						<span style=" margin-left: 10px;">
							<label for="describetion" style="width: 30px;">0.2Qmax</label>
							<input type="text" class="form-control" id="CalibraResult2"style="width: 40px;margin-left: 30px;" />
							<label for="describetion" style="width: 10px;">%</label>
						</span>
					</div>
					<div class="form-group" style="width:  260px;margin-left: 90px; margin-top: 5px;">
						<span>
							<label for="describetion" style="width: 30px;">Qmax</label>
							<input type="text" class="form-control" id="CalibraResult3"style="width: 40px;margin-left: 5px;" />
							<label for="describetion" style="width: 10px;">%</label>
						</span>
						<span style=" margin-left: 10px;">
							<label for="describetion" style="width: 30px;">0.4Qmax</label>
							<input type="text" class="form-control" id="CalibraResult4"style="width: 40px;margin-left: 30px;" />
							<label for="describetion" style="width: 10px;">%</label>
						</span>
					</div>
				</form>
			</div>
			<div class="modal-footer" style=" height: 12px; margin-top: 24px;">
				<button id="orderCloseBtn" type="button" class="btn  btn-small  btn-grey"
					data-dismiss="modal" style="margin-top: -12px;">关闭</button>
				<button id="orderSubmitBtn" type="button" class="btn  btn-small  btn-info"
					onclick="save()" style="margin-top: -12px;">提交</button>
			</div>
		</div>
	</div>
</div>
<ul class="navigationTabs">
     <li><a></a></li>
     <li></li>
  </ul>
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>




		<!--[if !IE]> -->
		<script src="static/galler/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script src="static/galler/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="static/galler/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="static/galler/js/jquery.colorbox.min.js"></script>

		<!-- ace scripts -->
		<script src="static/galler/js/ace-elements.min.js"></script>
		<script src="static/galler/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				var $overflow = '';
				var colorbox_params = {
					rel: 'colorbox',
					reposition: true,
					scalePhotos: true,
					scrolling: false,
					close: '&times;',
					maxWidth: '70%',
					maxHeight: '85%',
					onOpen: function() {
						$overflow = document.body.style.overflow;
						document.body.style.overflow = 'hidden';
						$("#cboxCurrent").remove()
						$("#cboxPrevious").remove();
						$("#cboxNext").remove();
						$("#cboxLoadingOverlay").remove();
						$("#cboxSlideshow").remove();
						$("#cboxSlideshow").remove();
						$("#cboxLoadingGraphic").remove();
						$("#cboxMiddleLeft").remove();
						$("#cboxMiddleRight").remove();
						$("#colorbox").click(function(){
						$("#colorbox").hide();
						$("#cboxError").text("没有此图片信息");
						})
					},
					onClosed: function() {
						document.body.style.overflow = $overflow;
					},
					onComplete: function() {
						$.colorbox.resize();
					}
				};
			
			$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
			
			})
		</script>


<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="static/js/jquery.dataTables.bootstrap.js"></script>
		
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
<!-- 引入 -->
<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->

<script type="text/javascript">

$(top.hangge());
 function inputErrorTip( tipstr )
{
            bootbox.dialog(tipstr, 
				[
				  {
					"label" : "关闭",
					"class" : "btn-small btn-success",
					"callback": function() {
						//Example.show("great success");
						}
					}
				 ]
			);
            return;
} 

 function numValid( numstr )
 {
	 if((numstr.indexOf(",")==0) || (numstr.lastIndexOf(",")==(numstr.length-1)) )
     {
        return 0;
     }
     if((numstr.indexOf("-")==0) || (numstr.lastIndexOf("-")==(numstr.length-1)) )
     {
        return 0;
     }
     if(numstr.indexOf(",,")!=-1 || numstr.indexOf(",-")!=-1||numstr.indexOf("-,")!=-1||numstr.indexOf("--")!=-1)
     {
         return 0;
     }
 }
 
 function dateValid(datestr)
{
	if((datestr.indexOf(":")==0) || (datestr.lastIndexOf(":")==(datestr.length-1)) || datestr.indexOf("::")!=-1 )
	{
		return 0;
	}
    if( datestr.length==8 && isDate(datestr))
    {
        return 1;
    }    
    if(datestr.length==17)
    {
        var dateArray=datestr.split(":");
        if(dateArray.length!=2)
        {
        	return 0;	
        }
        var date1=dateArray[0];
        var date2=dateArray[1];
        if(isDate(date1) && isDate(date2))
        {
            return 1;
        }
    }
    return 0;     
} 

 function isDate( datestr )
{
    if(datestr.length!=8 || datestr.indexOf(":")!=-1)
    {
    	return 0;
    }
    var year=datestr.substr(0,4);
    var month=datestr.substr(4,2);
    var day=datestr.substr(6,2);
    if(year.localeCompare("1900")==-1 )
    {
        return 0;
    }
    if(month.localeCompare("01")==-1 || month.localeCompare("12")==1)
    {
        return 0;
    }
    if(day.localeCompare("01")==-1 || day.localeCompare("31")==1)
    {
        return 0;
    }
    if( month.localeCompare("02")==0)
    {
        if(day.localeCompare("29")==1)
        {
            return 0;
        }
    }
    if( month.localeCompare("04")==0 || month.localeCompare("06")==0 ||month.localeCompare("09")==0||month.localeCompare("11")==0)
    {
        if(day.localeCompare("30")==1)
        {
            return 0;
        }
    } 
    return 1;         

}  
 

</script>
<!-- 引入 -->
		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 	window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<!-- 引入 -->

<script type="text/javascript">
//卸载图片查看
function showDown(index_,taskNum){
	var flageIs_=false;
	//数据的获取信息
	var seriaNum='${varList[0].SerialNum}';
	console.log(seriaNum+""+taskNum);
	//数据的绑定
	var jsonDate={"seriaNum":seriaNum,"taskNum":taskNum};
	//获取图片路径设置到标签上 然后跳到对应的位置  
    $.ajax({
        url:"worklist_verify/getPathDown",
        type: 'GET',
        dataType : 'json', 
        data: jsonDate,
        cache: false, 
        async: false,
        success: function(date){ 
        	if(date.length>0){
    			//数据的获取
    			var path=date[0].CLEANPHOTO;
    			$("#d"+index_).attr('href',"uploadFiles/uploadImgs/"+path);
    			console.log(path);
    			
    			lay({
    			    type: 'image',
    			    content: path,
    			    before: function() {
    			        console.log('你打开了图片层')
    			    }
    			});
    			flageIs_=true;
    			
    		}else{
    			flageIs_=false;
    			
    		}
        }
    });
	return flageIs_;
}
//安装图片查看
function showInsert(index_,taskNum){
	var flageIs_=false;
	//数据的获取信息
	var seriaNum='${varList[0].SerialNum}';
	console.log(seriaNum+""+taskNum);
	//数据的绑定
	var jsonDate={"seriaNum":seriaNum,"taskNum":taskNum};
	//获取图片路径设置到标签上 然后跳到对应的位置  
    $.ajax({
        url:"worklist_verify/getPathInsert",
        type: 'GET',
        dataType : 'json', 
        data: jsonDate,
        cache: false, 
        async: false,
        success: function(date){ 
        	if(date.length>0){
    			//数据的获取
    			var path=date[0].CLEANPHOTO;
    			$("#i"+index_).attr('href',"uploadFiles/uploadImgs/"+path);
    			console.log(path);
    			
    			lay({
    			    type: 'image',
    			    content: path,
    			    before: function() {
    			        console.log('你打开了图片层')
    			    }
    			});
    			flageIs_=true;
    			
    		}else{
    			flageIs_=false;
    			
    		}
        }
    });
	return flageIs_;
}
//配件图片查看
function showParts(index_,taskNum){
	var flageIs_=false;
	//数据的获取信息
	var seriaNum='${varList[0].SerialNum}';
	console.log(seriaNum+""+taskNum);
	//数据的绑定
	var jsonDate={"seriaNum":seriaNum,"taskNum":taskNum};
	//获取图片路径设置到标签上 然后跳到对应的位置  
    $.ajax({
        url:"worklist_verify/getPathParts",
        type: 'GET',
        dataType : 'json', 
        data: jsonDate,
        cache: false, 
        async: false,
        success: function(date){ 
        	if(date.length>0){
    			//数据的获取
    			var path=date[0].CLEANPHOTO;
    			$("#p"+index_).attr('href',"uploadFiles/uploadImgs/"+path);
    			console.log(path);
    			lay({
    			    type: 'image',
    			    content: path,
    			    before: function() {
    			        console.log('你打开了图片层')
    			    }
    			});
    			flageIs_=true;
    			
    		}else{
    			flageIs_=false;
    			
    		}
        }
    });
	return flageIs_;
}
//清洗图片查看
function showInfo(index_,taskNum){
	var flageIs_=false;
	//数据的获取信息
	var seriaNum='${varList[0].SerialNum}';
	console.log(seriaNum+""+taskNum);
	//数据的绑定
	var jsonDate={"seriaNum":seriaNum,"taskNum":taskNum};
	//获取图片路径设置到标签上 然后跳到对应的位置  
    $.ajax({
        url:"worklist_verify/getPathPri",
        type: 'GET',
        dataType : 'json', 
        data: jsonDate,
        cache: false, 
        async: false,
        success: function(date){ 
        	if(date.length>0){
    			//数据的获取
    			var path=date[0].CLEANPHOTO;
    			$("#a"+index_).attr('href',"uploadFiles/uploadImgs/"+path);
    			console.log(path);
    			
    			lay({
    			    type: 'image',
    			    content: path,
    			    before: function() {
    			        console.log('你打开了图片层')
    			    }
    			});
    			flageIs_=true;
    			
    		}else{
    			flageIs_=false;
    			
    		}
        }
    });
	return flageIs_;
}
//其他
$("#maintainContextId").change(function(){
	 var maintainContext=$("#maintainContextId #selectMaintainContext option:checked").text();
	
		if(maintainContext !=null && maintainContext=="其他"){
			 $('#maintainContext').show();
		}else{
			 $('#maintainContext').hide();
		}
});
$(function() {
	//下拉框
	$(".chzn-select").chosen({search_contains: true}); 
	//日期框
	$('.date-picker').datepicker();
});


</script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<!-- echarts -->
<script>

var info=[];
var  info2=[];	
var  info1=[];
'<c:if test="${not empty varList1}">'
	for (var i = 0; i < '${varList1.size()}'; i++) {
		info[i]='序号'+(i+1);
		
	}
	//数据获取问题
	/*
	for (var i = 0; i < '${varList1.size()}'; i++) {
		info2[i]=[1+i,2+i,i,i+1];
		
	}
	*/
	'<c:forEach items="${varList1}" var="var" varStatus="vs">'
		var  infoDate=[];
		infoDate[0]='${var.CalibraResult1}';
		infoDate[1]='${var.CalibraResult2}';
		infoDate[2]='${var.CalibraResult3}';
		infoDate[3]='${var.CalibraResult4}';
		info2['${vs.index}']=infoDate;
	'</c:forEach>'
	
	for (var i = 0; i < '${varList1.size()}'; i++) {
		info1[i]={
			name:info[i],
			type:'line',
			data:info2[i],
			smooth:true
		};
	}
	'</c:if>'
	'<c:if test="${empty varList1}">'
		info=[''];
		info1=[{
				name:[''],
				//type:'line',
				data:[''],
				//smooth:true
			}];
	
	'</c:if>'

var date=new Date;
var year=date.getFullYear(); 
var month=date.getMonth()+1;
	//配置图表路径
	require.config({
		paths:{ 
			echarts : 'http://echarts.baidu.com/build/dist'
        }
	});
	//加载图表js文件
	require([ 'echarts', 'echarts/chart/line', //要什么图表类型配置什么类型
	], function(ec) {
		//基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('main'));
		var option = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			       data:info
			    },
			    toolbox: {
			        show : false,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			          //  boundaryGap : false,
			            data : ['Qmin','0.2Qmax','0.4Qmax','Qmax']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            min: 0,
			            max: 10,
			            axisLabel : {
			                formatter: '{value} %'
			            }
			        }
			    ],
			    series :info1
			   
			    
			};

		var ecConfig = require('echarts/config');
		myChart.on(ecConfig.EVENT.CLICK, function(param) {
			//点击后执行操作
			alert(param.name)
		});
		myChart.setOption(option);
	});
	//不足两位自动补充零
	function returnFloat(value){
		 var value=Math.round(parseFloat(value)*100)/100;
		 var xsd=value.toString().split(".");
		 if(xsd.length==1){
		 value=value.toString()+".00";
		 return value;
		 }
		 if(xsd.length>1){
		 if(xsd[1].length<2){
		 value=value.toString()+"0";
		 }
		 return value;
		 }
		}
	
	//插入数据的显示
	function save(){
	 //数据的获取
	 //日期的选择
	var DATE_FORMAT = /^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$/;
	var lastDate=$("#lastDate").val();
	if(!DATE_FORMAT.test(lastDate)){
		inputErrorTip("抱歉，您输入的日期格式有误，正确格式应为2012-01-01");
		 return;
	}
	 //是否换件
	 var VerifyType = 1;// 0 换  1 不换
	 if ($("#s1:checked").val()==1) {
		 VerifyType = 0;  	
	 }
	 //更换内容
	 var maintainContext=$("#maintainContextId #selectMaintainContext option:checked").text();
		if(maintainContext !=null && maintainContext=="其他"){
			maintainContext=$("#maintainContext").val();
			if(maintainContext == null ||  maintainContext.trim()==""){
				inputErrorTip("更换内容不为空");
				 return;
			} 
		}
	 //检定数据
	 
	var num=/^[0-9]+([.]{1}[0-9]{1,2})?$/;  
	var CalibraResult1=$("#CalibraResult1").val();
	 if(CalibraResult1 == null ||  CalibraResult1 == ""){
		 inputErrorTip("检定数据不为空Qmin");
		 return;
	 }
	 if(!num.test(CalibraResult1)){
		 inputErrorTip("只能输入整数或两位小数");
		 return;
	 }
	 CalibraResult1=returnFloat(CalibraResult1);
	 var CalibraResult2=$("#CalibraResult2").val();
	 if(CalibraResult2 == null || CalibraResult2 == ""){
		 inputErrorTip("检定数据不为空0.2Qmax");
		 return;
	 }
	 if(!num.test(CalibraResult2)){
		 inputErrorTip("只能输入整数或两位小数");
		 return;
	 }
	 CalibraResult2 =returnFloat(CalibraResult2)
	 var CalibraResult3=$("#CalibraResult3").val();
	 if(CalibraResult3 == null || CalibraResult3 == ""){
		 inputErrorTip("检定数据不为空Qmax");
		 return;
	 }
	 if(!num.test(CalibraResult3)){
		 inputErrorTip("只能输入整数或两位小数");
		 return;
	 }
	 CalibraResult3=returnFloat(CalibraResult3)
	 var CalibraResult4=$("#CalibraResult4").val();
	 if(CalibraResult4 == null ||  CalibraResult4 == ""){
		 inputErrorTip("检定数据不为空0.4Qmax");
		 return;
	 }
	 if(!num.test(CalibraResult4)){
		 inputErrorTip("只能输入整数或两位小数");
		 return;
	 }
	 CalibraResult4 =returnFloat(CalibraResult4);
	 //序列号的获取
	 var serialNum='${varList[0].SerialNum}';
	 
	 var taskNum='${varList[0].taskNum}';
	 console.log(taskNum);
	//数据总结
	var jsonDate={
		 		"lastDate":lastDate,
		 		"maintainContext":maintainContext,
		 		"VerifyType":VerifyType,
		 		"CalibraResult1":CalibraResult1,
		 		"CalibraResult2":CalibraResult2,
		 		"CalibraResult3":CalibraResult3,
		 		"CalibraResult4":CalibraResult4,
		 		"serialNum":serialNum,
		 		"taskNum":taskNum
		 		};
	
	console.log(jsonDate);
	$.getJSON("worklist_verify/selectVerifyAdd",jsonDate,function(result){
		if(result.mgs==200){
			//inputErrorTip("新增成功，继续添加");
			location.reload(true);
		}else{
			inputErrorTip("新增失败");
		}
		
	});
	}
	
</script>
	</body>
</html>