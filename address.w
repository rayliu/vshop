<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:410px;top:223px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="收货地址表" idColumn="编号" onCustomRefresh="收货地址表CustomRefresh" limit="6"> 
      <column name="编号" type="String" xid="xid1"/>  
      <column name="用户编号" type="String" xid="xid2"/>  
      <column name="姓名" type="String" xid="xid3"/>  
      <column name="地址" type="String" xid="xid4"/>  
      <column name="邮编" type="String" xid="xid5"/>  
      <column name="电话" type="String" xid="xid6"/>  
      <column name="是否启用" type="String" xid="xid7"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full panel panel-default x-scroll-view"
    xid="panel1"> 
    <div xid="div28" class="x-panel-top"> 
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
        <div class="x-titlebar-right reverse" xid="div4"> 
          <a component="$UI/system/components/justep/button/button" style="background-color:#ff4400;color:white;width:68px;font-style:inherit;height:33px;"
            class="btn x-gray" label="新增" xid="button3" onClick="button3Click"> 
            <i xid="i8"/>  
            <span xid="span16">新增</span>
          </a>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-panel-content  x-scroll-view"
      active="0" xid="contents9"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView4"> 
        <div class="x-content-center x-pull-down container" xid="div13"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"/>  
          <span class="x-pull-down-label" xid="span8">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div14"> 
          <div component="$UI/system/components/justep/list/list" class="x-list x-cards"
            xid="list3" data="收货地址表"> 
            <ul class="x-list-template x-min-height list-group" xid="listTemplateUl2"
              componentname="$UI/system/components/justep/list/list#listTemplateUl"
              id="undefined_listTemplateUl2"> 
              <div class="x-list x-cards"> 
                <li xid="li3" class="x-min-height list-group-item" componentname="li(html)"
                  id="undefined_li3"> 
                  <div xid="div16"> 
                    <span xid="span10" bind-text="ref('姓名')" style="font-weight:bold;font-size:larger;"/>  
                    <span xid="span11" bind-text="ref('电话')" class="pull-right"
                      style="font-size:larger;"/> 
                  </div>  
                  <div xid="div17"> 
                    <span xid="span13" bind-text="ref('地址')"/> 
                  </div>  
                  <hr/>  
                  <div xid="div18">
                  	<span component="$UI/system/components/justep/button/radio"
                      class="x-radio" xid="radio1" bind-ref="ref('是否启用')" checkedValue="是"
                      uncheckedValue="否" label="设置为默认地址" name="default" bind-click="radio1Change"/>
                      <a xid="" style="float:right;text-align:center;width:50px;" name="delete" bind-click="a2Click"><![CDATA[删除]]></a>
                      <span style="width:10px;"/>
                  	  <a xid="" style="float:right;text-align:center;width:50px;" name="edit" bind-click="a1Click"><![CDATA[修改]]></a>
                   </div> 
                </li> 
              </div> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div15"> 
          <span class="x-pull-up-label" xid="span9">加载更多...</span> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
<!-- <a component="$UI/system/components/justep/button/button" class="btn x-orange btn-only-label btn-block"
    label="保存" xid="saveBtn" onClick="saveBtnClick"> 
    <i xid="cancelI"/>  
    <span xid="cancelSpan">保存</span>
  </a>  -->
