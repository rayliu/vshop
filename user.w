<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:16px;top:465px;"
    onModelConstruct="modelModelConstruct"></div>  
  <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card x-has-iosstatusbar"
    xid="panel1"> 
    <div xid="div28" class="text-center o-use"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div2"/>  
        <div class="x-titlebar-title" xid="div3"/>  
        <div class="x-titlebar-right reverse" xid="div4"></div> 
      </div>
      <img src="" alt="" xid="image1" class="img1" bind-attr-src="$model.getImageUrl('./img/user.png')"/>  
      <div id="userDivBtn" xid="userDivBtn" class="btn_padding" bind-load="userDivBtnLoad">
        <a component="$UI/system/components/justep/button/button" class="btn btn-success"
          label="登录" xid="loginBtn" onClick="userLoginBtn" style="height:100%;"> 
          <i xid="i17"/>  
          <span xid="span42">登录</span> 
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-warning"
          label="注册" xid="button12" onClick="button12Click"> 
          <i xid="i18"/>  
          <span xid="span43">注册</span> 
        </a>
      </div>  
      <div id="divinfo" xid="divinfo" class="btn_padding"> 
        <span id="userInfo" xid="userInfo" style="width:100%;"><![CDATA[]]></span> 
      </div> 
    </div>
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
      tabbed="true" xid="buttonGroup3"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="我的订单" xid="button7" icon="icon-document"> 
        <i xid="i14" class="icon-document icon text-muted"/>  
        <span xid="span39" class="text-muted">我的订单</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="商城" xid="button9" icon="icon-bag"> 
        <i xid="i15" class="icon-bag icon text-muted"/>  
        <span xid="span40" class="text-muted">商城</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="我的收藏" xid="button10" icon="icon-ios7-star-outline"> 
        <i xid="i16" class="icon-ios7-star-outline icon text-muted"/>  
        <span xid="span41" class="text-muted">我的收藏</span> 
      </a> 
    </div>  
    <ul class="list-group x-tuniu" xid="ul1"> 
      
        <li class="list-group-item" xid="li4" bind-click="li4Click">资料管家
          <span class="pull-right text-muted" xid="span4"><![CDATA[个人资料、常用资料]]></span>  
          <i xid="i20" class="icon-android-storage"/> 
        </li>
        <li class="list-group-item" xid="li5" bind-click="li5Click">收货地址
          <span class="pull-right text-muted" xid="span4"><![CDATA[常用收货地址]]></span>  
          <i xid="" class="icon-model-s"/> 
        </li>
      <li class="list-group-item" xid="li1">我的小金库
        <span class="pull-right text-muted" xid="span1"><![CDATA[抵用卷、佣金卷
        
      ]]></span>  
        <i xid="i7" class="icon-ios7-box-outline"/> 
      </li>  
      <li class="list-group-item" xid="li2">会员俱乐部
        <span class="pull-right text-muted" xid="span2"><![CDATA[活动、权益通知
        
      ]]></span>  
        <i xid="i9" class="icon-social-reddit-outline"/> 
      </li>  
      <li class="list-group-item" xid="li3">活动
        <span class="pull-right text-muted" xid="span3">抢购、红包、夺宝
          <i xid="i10" class="icon-ios7-arrow-forward"/> 
        </span>  
        <i xid="i11" class="icon-ios7-cart-outline"/> 
      </li> 
    </ul>
  </div> 
</div>
