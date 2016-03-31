<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:213px;height:auto;left:725px;top:281px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="分类表" idColumn="编号" onCustomRefresh="分类表CustomRefresh">
      <column label="编号" name="编号" type="String" xid="xid13"></column>
  <column label="名称" name="名称" type="String" xid="xid14"></column>
  <column label="图片外链" name="图片外链" type="String" xid="xid15"></column></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card x-has-iosstatusbar"> 
    <div class="x-panel-top" height="49"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="宝贝分类"> 
        <div class="x-titlebar-left"/>  
        <div class="x-titlebar-title">宝贝分类</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div> 
 
    <div xid="content" class="x-panel-content x-cards bg-white  x-scroll-view" _xid="C701417CB57000019D7CE6BA8520C500" style="bottom: 0px; top: 49px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1" onPullDown="scrollView1PullDown">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2">
   <div component="$UI/system/components/justep/list/list" class="x-list x-flex"
        xid="list1" data="分类表" limit="10" disablePullToRefresh="false" disableInfiniteLoad="false"
        > 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-4" bind-click="listClick"> 
            <div class="x-card" xid="div3" style="margin-top:20px;">
              <div class="" xid="div4" style="height:90%;width:90%;"> 
                 <img bind-attr-src=' $object.val("图片外链")' alt="" class="img-responsive" pagename="./class.w" xid="image3" dir="ltr"></img>
              </div>  
              <div class="caption" xid="div5"> 
                <h5 class="text-black text" xid="h52" style="font-size:15px" bind-text=" $object.val(&quot;名称&quot;)"/>  
              </div>  
            </div> 
          </li> 
        </ul> 
      </div>
   </div>
  </div>
    </div> 
  </div> 
</div>
