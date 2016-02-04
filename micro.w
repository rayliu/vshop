<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:213px;height:auto;left:137px;top:190px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="rootClassData" idColumn="fID" onCustomRefresh="rootClassDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="default6"/>  
      <column label="标题" name="fClassName" type="String" xid="xid6"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="secondClassData" idColumn="fID" onCustomRefresh="secondClassDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="一级分类ID" name="fRootID" type="String" xid="xid2"/>  
      <column label="分类名称" name="fClassName" type="String" xid="xid3"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="threeClassData" onCustomRefresh="threeClassDataCustomRefresh" idColumn="fID"> 
      <column label="id" name="fID" type="String" xid="xid4"/>  
      <column label="二级分类ID" name="fSecondID" type="String" xid="xid5"/>  
      <column label="分类名称" name="fClassName" type="String" xid="xid7"/>  
      <column label="分类图片" name="fClassImg" type="String" xid="xid8"/> 
    </div> 
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="baasCategoryDataLevel0" queryAction="queryCategory" tableName="category" url="/eeda/shop" idColumn="id" onAfterRefresh="baasCategoryDataLevel0AfterRefresh"><column label="id" name="id" type="String" xid="default5"></column>
  <column label="name" name="name" type="String" xid="default7"></column>
  <column label="parent_id" name="parent_id" type="String" xid="default8"></column>
  <column label="level" name="level" type="Integer" xid="default9"></column>
  <filter name="filter0" xid="filter1"><![CDATA[level = 0]]></filter>
  </div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="baasCategoryDataLevel1" queryAction="queryCategory" tableName="category" url="/eeda/shop" idColumn="id">
   <column label="id" name="id" type="String" xid="default10"></column>
   <column label="name" name="name" type="String" xid="default11"></column>
   <column label="parent_id" name="parent_id" type="String" xid="default12"></column>
   <column label="level" name="level" type="Integer" xid="default13"></column>
   </div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="baasCategoryDataLevel2" queryAction="queryCategory" tableName="category" url="/eeda/shop" idColumn="id">
   <column label="id" name="id" type="String" xid="default4"></column>
  <column label="name" name="name" type="String" xid="default3"></column>
  <column label="parent_id" name="parent_id" type="String" xid="default2"></column>
  <column label="level" name="level" type="Integer" xid="default1"></column>
  <column label="fImg" name="fImg" type="String" xid="xid9"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card x-has-iosstatusbar"> 
    <div class="x-panel-top" height="49"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="宝贝分类"> 
        <div class="x-titlebar-left"> 
          </div>  
        <div class="x-titlebar-title">宝贝分类</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div xid="content" class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row tb-box"> 
        <div class="col col-xs-3" xid="col10"> 
          <div component="$UI/system/components/justep/list/list" class="x-list tb-root"
            xid="rootClassList" data="baasCategoryDataLevel0" dataItemAlias="rootClassRow"> 
            <ul class="x-list-template list-group" xid="listTemplateUl1"> 
              <li xid="li1" bind-css="{'current':rootClassRow.val('id')==$model.baasCategoryDataLevel0.val('id')}"
                class="list-group-item text-center tb-nopadding" bind-click="li1Click"> 
                <h5 xid="h52" bind-text="ref('name')" class="text-black"><![CDATA[]]></h5> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="col col-xs-9" xid="col11"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="secondClassList" data="baasCategoryDataLevel1" dataItemAlias="secondClassRow" autoLoad="true"> 
            <ul class="x-list-template" xid="listTemplateUl2"> 
              <li xid="li2"> 
                <h5 bind-text="ref('name')" class="text-muted"><![CDATA[]]></h5>  
                <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
                  xid="threeClassList" data="baasCategoryDataLevel2" filter="$row.val('parent_id')==secondClassRow.val('id')" dataItemAlias="threeClassRow" autoLoad="true"> 
                  <ul class="x-list-template" xid="listTemplateUl3"> 
                    <li xid="li3" class="col col-xs-4 text-center tb-listBox text-black" bind-click="li3Click"> 
                      <div><img src="" alt="" class="img-responsive" dir="ltr" bind-attr-src='$model.getImageUrl(val("fImg"))'/><p bind-text='val("name")'/></div>
                       
                    </li> 
                  </ul> 
                </div> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
