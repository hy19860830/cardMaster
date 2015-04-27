<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="default"/>
   <style type="text/css">

                     

* {
	margin: 0px;
	padding: 0px;
}

html{
	max-width: 640px;
	margin: 0 auto;
	
}

a {
	text-decoration: none;
	color: #FFFFFF;
}

body {
	width: 100%;
	background-image: url('/images/webcard-bg.jpg');
	color: #FFFFFF;
	word-break: break-all;word-wrap: break-word;
	font-family: Microsoft YaHei,Helvitica,Verdana,Tohoma,Arial,san-serif;
	font-weight: bolder;
	font-size: 14px;
}

.div3 div{
	height: 30px;
	
}

.div1{
	margin: 0 auto;
}

.div2{
	width: 320px;
	position: relative;
	display: table;
	margin: 0 auto;
	top: expression_r(document.body.clientWidth <= 320? "300px": "auto" );
}

.div3{
	width: 100%;
	position: absolute;
	z-index: 1;
	display: table;
}

.div4{
	display: table;
	padding-top: 50px;
}

.div5{
	float: left;
	margin-left: 15px;
}

.div6{
	display: table;
	font-size: 18px;
}

.div7{
	float: left;
	margin-left: 15px;
	margin-top: 11px;
	line-height: 30px;
}

.div8{
	font-size: 28px;
	overflow: hidden;
}

.div9{
	font-size: 20px;
	line-height: 40px;
}

.divBottom{
	height: 65px;
	top: 415px;
	z-index: 3;
}

.divBtm2{
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 55px;
/*	background-image: url('/images/bg.png'); */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#555555), color-stop(100%,#2a2a2a)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #555555 0%,#2a2a2a 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #555555 0%,#2a2a2a 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #555555 0%,#2a2a2a 100%); /* IE10+ */
	text-align: center;
}

.divBtm2 a{
	text-decoration: none;
	color: #e3e3e3;
}

.divBtmShow a{
	text-decoration: none;
	color: black;
}



.divBtm3{
	float: left;
	list-style: none;
	width: 100%;
	text-align: center;
	line-height: 50px;
	color: #e3e3e3;
}

.divBtm4{
	width: 19%;
	float: left;
	border-right: 1px solid #5A5A5A;
}

.divSaveBtn{
	position: absolute;
	right: 0px;
	z-index: 2;
	bottom: 50px;
}

.divBtmShow{
	width: 200px;
	bottom: 60px;
	position: absolute;
	z-index: 3;
	background: #dfdfdf;
	text-align: center;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px; 
	border-radius:15px;
	line-height: 25px;
	margin-left: -100px;
	left: 50%;
	color: black;
	display: none;
}

.divBtmShow div{
	font-size: 16px;
	line-height: 37px;
}

.divBtmShow1{
	border-bottom: dotted 1px #9e9c9c;
	cursor: pointer;
}

.divFull{
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
}

.divTop{
	position: fixed;
	margin: auto;
	left: 0;
	right: 0;
	top: 0;
	max-width: 640px;
	z-index: 3;
}

.divTop2{
	position: static;
	height: 48px;
}

.span1{
	width: 255px;
	display: inline-block;
	overflow: hidden;
	max-height: 50px;
	vertical-align: text-top;
}

.registerbtn{
	margin-top: 20px;
	margin-left: 4%;
	margin-right: auto;
	width: 92%;
	height: 38px;
	border: 1px dashed #42b6f2;
	color: #FFF;
	line-height: 38px;
	text-align: center;
	font-size: 15px;
	margin-bottom: 20px;
	display: inline-block;
}

.closeXX{
	float: right;
	height: 35px;
	cursor: pointer;
	transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
}

.topColumn{
	width: 100%;
	height: 48px;
	display: -webkit-box;
	position: relative;
	background-color: #424242;
	border-bottom: 1px solid #A2A2A2;
}

.topLeft{
	width: 70px;
	height: 100%;
	background-size: 24px;
	text-align: center;
	line-height: 48px;
}

.topCentent{
	-webkit-box-flex: 1;
	text-align: center;
	line-height: 48px;
}

.topRight{
	width: 70px;
	height: 100%;
	background-size: 24px;
	text-align: center;
	line-height: 48px;
}

.downLoad{
	width: initial;
	padding-bottom: 0px;
	line-height: 27px;
	z-index: 3;
	padding-top: 0px;
	display: -webkit-inline-box;
	margin: 12px;
}

.downLoadLink{
	display: inline-block;
	vertical-align: top;
	border-color: rgba(0,0,0,.5);
	border-style: solid;
	border-width: 1px;
	border-radius: 3px;
	padding: 1px 5px 0;
	height: 27px;
	background-image: url(/images/btn-x.png);
	background-repeat: repeat-x;
	text-shadow: 0 -1px rgba(0,0,0,.8);
	_background-image: none;
	_filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#50000000,endColorstr=#50000000);
	background-color: rgba(0, 0, 0, 0);
}

.downLoadIcon{
	background-image: url(/images/icon1.png);
	background-repeat: repeat-x;
	width: 20px;
	height: 20px;
	display: inline-block;
	vertical-align: top;
	background-position: -234px -68px;
}

.downLoadFont{
	font-weight: 100;
}


.downLoadRound{
	position: fixed;
	left: 8px;
	top: 8px;
	width: 50px;
	height: 56px;
	overflow: hidden;
	border-radius: 200px;
	-webkit-border-radius: 200px;
	text-align: center;
	line-height: 50px;
	font-size: 11px;
	z-index: 999;
	opacity: 0.7;
}

.codeText{
	font-weight: 100;
	font-size: smaller;
	text-align: left;
	padding: 7px 0px 0px 15px;
	color: rgb(148, 138, 138);
}

.code{
	width: 171px;
	height: 171px;
	border: 1px solid #e3e3e3;
}

.shadeDiv1{
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	text-align: center;
	display: none;
}

.BottomImgDiv1{
	width: 100%;
	height: 100%;
	
	z-index: -1;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.shadeCen1{
	width: 100%;
	height: 100%;
	text-align: center;
	position: absolute;
	display: none;
}

.divVetically{
	display: inline-table;
	width: 232px;
}

.cenConDiv1{
	color: rgb(185, 185, 185);
	background-color: white;
	text-align: center;
	padding: 20px;
	border-radius: 15px;
	width: 192px;
	display: none;
}

.ringText{
	line-height: 75px;
	display: block;
	font-size: 20px;
	color: black;
}

.ringLine{
	border-bottom: #A7A0A0 dotted 1px;
	display: block;
	color: black;
}

.topMenu_font{
	text-align: left;
	position: absolute;
	z-index: 500;
	border-radius: 5px;
	width: 150px;
	margin-top: 10px;
	padding: 0;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
	display: none;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(rgb(99, 99, 99)), to(rgb(46, 45, 45)), color-stop(0.6, rgb(75, 75, 75)));
}
.topMenu{
	left: 50%;
	margin-left: -75px;
	font-size: 14px;
}

.topMenu_font:before {
	top: -6px;
	border-color: rgba(255, 255, 255, 0) rgba(194, 132, 132, 0) rgba(92, 92, 92, 1);
	border-width: 0px 6px 6px;
	position: absolute;
	content: "";
	display: inline-block;
	width: 0;
	height: 0;
	border-style: solid;
	left: 45%;
}

.topMenu_font li {
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
}

.topMenu_font li a {
	text-decoration: none;
	-webkit-box-flex: 1;
	margin-right: 1px;
	height: 40px;
	line-height: 40px !important;
	position: relative;
	color: #fff;
	display: block;
	width: 100%;
	text-indent: 15px;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left !important;
}

.moreHide{
	display: block;
}

.moreHide:after{
	border-color: rgba(255, 255, 255, 1) rgba(194, 132, 132, 0) rgba(255, 253, 253, 1);
	border-width: 5px 5px 0px;
	content: "";
	border-style: solid;
	position: absolute;
	top: 22px;
	margin-left: 5px;
}

.moreShow{
	
}

.moreShow:after{
	border-color: rgba(255, 255, 255, 1) rgba(194, 132, 132, 0) rgba(255, 253, 253, 1);
	border-width: 0px 5px 5px;
	content: "";
	border-style: solid;
	position: absolute;
	top: 22px;
	margin-left: 5px;
}

.tipSpan{
	top: 50%;
	display: block;
	position: relative;
}

.loadingDiv{
	display: block;
	position: absolute;
	height: 187px;
	background: url('/images/loading32.gif') 50% 50% no-repeat;
	background-color: white;
}

.showRank{
	display: table;
}

.paddingDiv{
	padding-left: 10px;
}


.bottomDot{
	width: 16%;
	float: left;
	display: block;
	background-image: url('../images/pin_4.png');
	background-repeat: no-repeat;
	background-size: 30px;
	background-position: 50% 10px;
}

.d-share{
	position: fixed;
	z-index: 9;
	bottom: 1.9375rem;
	right: 1.25rem;
	width: 3.5625rem;
	height: 3.5625rem;
	background: #000;
	border-radius: 1.78125rem;
	opacity: .6;
	text-align: center;
	color: #ccc;
	font-size: 0.65625rem;
	-webkit-transform: translate3d(0, 0, 0);
}

.bottom{
	bottom: 7rem;
}

.d-share i {
	display: block;
	height: 2.0625rem;
	font-family: 'iconfont';
	font-size: 1.5rem;
	font-style: normal;
	text-align: center;
	color: #ffffff;
}

.icon-share{
	background: url('/images/icon-share.png') no-repeat;
	background-position: 14px 7px;
	background-size: 20px;
}

.icon-downLoad{
	background: url('/images/icon-downLoad.png') no-repeat;
	background-position: 12px 7px;
	background-size: 25px;
}

.icon-store{
	background: url('/images/icon-store.png') no-repeat;
	background-position: 14px 7px;
	background-size: 20px;
}

.icon-illustrate{
	background: url('/images/icon-illustrate.png') no-repeat;
	background-position: 14px 7px;
	background-size: 20px;
}



.baseRadis{
	width: 50px;
	height: 50px;
	overflow: hidden;
	border-radius: 200px;
	-webkit-border-radius: 200px;
	display: block;
	background: red;
}

.base-icon{
	display: block;
	height: 27px;
	font-size: 20px;
	text-align: center;
	color: #ffffff;
}

.backColor-downLoad{
	background-color: green;
}


.backColor-share{
	background-color: #FF7300;
}

.backColor-store{
	background-color: #42b6f2;
}

.backColor-illustrate{
	background-color: #ea65fb;
}

.span-font{
	line-height: normal;
}

.icon-hold-on{
	background: url('/images/hold_spread.png') top center;
	height: 50px;
	background-size: 50px;
}

.grey{
	background-color: grey !important;
}

.fui-wormhole-wap-list{

}

.fui-wormhole-wap-list div{
	display: block;
	height: 50;
	line-height: 50px;
	padding: 3px 0px 3px 0px;
}

.full-mask{
	-webkit-transition: opacity 200ms ease;
	transition: opacity 200ms ease;
	opacity: 1;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
	opacity: 0.8;
	background: rgba(0,0,0,1) center center no-repeat;
}

        </style>
    </head>
    <body>
        <div class="div1">
            <div id="topSpacebar" class="divTop divTop2">
            </div>
            <div class="div2">
                <div id="cenContent" class="div3">
                    <!-- 头部 -->
                    <div class="div4" style="width: 310px;padding-left: 10px;">
                        <div class="div6">
                            <span id="temComName" style="font-size: 18px;color:#000000">
                                ${user.company.name}                            </span>
                        </div>
                        <div class="showRank">
                            <div class="div5" style="color:#000000">
                                                            </div>
                            <div class="div5" style="color:#000000">
                               ${user.position}                            </div>
                        </div>
                        <!-- 中部 -->
                        <div class="div4" style="top: 160px;">
                            <div id="bigCodeInfo" style="display: table;float: left;">
                                                                <img id="smallCode" src="${pageContext.request.contextPath}/qrcodeimage/${user.id}.png" height="150" width="150">
                                                            </div>
                            <div class="div7">
                                <div class="div8"style="color:#000000">
                                    ${user.name}                                </div>
                                <div class="div9" style="color:#000000">
                                    ${user.mobile}                             </div>
                            </div>
                        </div>
                        <!-- 底部 -->
                        <div class="div4" style="width: 100%;color:#000000">
                          <span style="line-height: 25px;">电话：</span>
                                <span >&nbsp;${user.phone}</span>
                                                          <div>
                                <span >邮箱：</span>
                                <span>${user.email}</span>
                            </div>
                                                                                    <div>
                                <span>Q&nbsp;&nbsp;Q：</span>
                                <span>${user.qq}</span>
                            </div>
                                                        <div style="height: auto;">
                                <span>地址：</span>
                                <span class="span1">
                                    ${user.address}                               </span>
                            </div>

                        </div>
                        <!-- 自定义 -->
                        <div class="div4" style="width: 100%;">

                        </div>
                    </div>
                    <div class="divFull"></div>
                </div>
                <!-- 顶替浮动栏 -->
                <div style="height: 52px;"></div>

                <!--透明顶层遮罩层 -->
                <div id="topShadeDiv" class="divTop shadeDiv1" style="z-index: 1;opacity: 0;">
                </div>

                <!-- 遮罩层 -->
                <div style="display: none;" id="shadeDiv" class="divTop shadeDiv1">
                </div>

                <div id="BottomImgDiv" class="divTop BottomImgDiv1"
                     style="background-image:url('${user.background}') ;   center;">
                </div>

                
            </div>
            
        </div>
    </body>
</html>