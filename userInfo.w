<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:54px;top:529px;" onModelConstruct="modelModelConstruct"/>  
  <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card x-has-iosstatusbar"
    xid="panel1"> 
    <div xid="div28" class="text-center o-use"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="个人资料"> 
        <div class="x-titlebar-left" xid="div2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="userBackBtn" icon="icon-chevron-left" onClick="userBackBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span3"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div3">个人资料</div>  
        <div class="x-titlebar-right reverse" xid="div4"/> 
      </div> 
    </div>  
    <ul class="list-group x-tuniu" xid="ul1"> 
      <li class="list-group-item" xid="userNameLi">账户名
        <span class="pull-right text-muted" xid="userNameSpan" id="userNameSpan">空</span> 
      </li>  
      <li class="list-group-item" xid="userNickLi">用户昵称
        <span class="pull-right text-muted" xid="userNick" id="userNick">空</span> 
      </li> 
    </ul> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn x-black btn-only-label btn-block"
    label="退出账户" xid="cancelBtn" onClick="cancelBtnClick"> 
    <i xid="cancelI"/>  
    <span xid="cancelSpan">退出账户</span>
  </a> 
</div>
