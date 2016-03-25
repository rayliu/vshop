<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:54px;top:529px;" onModelConstruct="modelModelConstruct"/>  
  <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card x-has-iosstatusbar"
    xid="panel1"> 
    <div xid="div28" class="text-center o-use"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="收货地址管理"> 
        <div class="x-titlebar-left" xid="div2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="userBackBtn" icon="icon-chevron-left" onClick="userBackBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span3"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div3">收货地址管理</div>  
        <div class="x-titlebar-right reverse" xid="div4"/> 
      </div> 
    </div>  
    <ul class="list-group x-tuniu" xid="ul1"> 
      <li class="list-group-item" xid="name">
        <span class="pull-left " xid="nameSpan" id="">姓名</span> 
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="nameInput"></input></li>  
      <li class="list-group-item" xid="phone">
        <span class="pull-left " xid="phoneSpan" id="">电话</span> 
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="phoneInput"></input></li> 
      <li class="list-group-item" xid="address">
        <span class="pull-left " xid="addressSpan" id="">地址</span> 
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="addressInput"></input></li>
      <li class="list-group-item" xid="mail">
        <span class="pull-left " xid="mailSpan" id="">邮政编码</span> 
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="mailInput"></input></li>
       <li class="list-group-item" xid="lock">
        <span class="pull-left " xid="mailSpan" id="">是否设置为默认地址(是/否)</span> 
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="lockInput"></input></li>
    </ul> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn x-orange btn-only-label btn-block"
    label="保存" xid="saveBtn" onClick="saveBtnClick"> 
    <i xid="cancelI"/>  
    <span xid="cancelSpan">保存</span>
  </a> 
</div>
