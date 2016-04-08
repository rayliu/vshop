<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:233px;top:433px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="购物车商品表" idColumn="编号" limit="20" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="购物车商品表DataCustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid1"/>  
      <column label="商店编号" name="商店编号" type="String" xid="column2"/>  
      <column label="商品编号" name="商品编号" type="String" xid="column3"/>  
      <column label="图片外链" name="图片外链" type="String" xid="column4"/>  
      <column label="现价" name="现价" type="Float" xid="column5"/>  
      <column label="标题" name="标题" type="String" xid="xid3"/>  
      <column label="原价" name="原价" type="Float" xid="xid4"/>  
      <column label="规格" name="规格" type="String" xid="xid5"/>  
      <column label="是否选中" name="是否选中" type="Integer" xid="xid6"/>  
      <rule xid="rule1"> 
        <col name="fSize" xid="ruleCol2"> 
          <calculate xid="calculate2"> 
            <expr xid="default3"/>
          </calculate> 
        </col>  
        <col name="总价" xid="ruleCol3"> 
          <calculate xid="calculate3"> 
            <expr xid="default4">$row.val('是否选中')==1?$row.val('现价')*$row.val('数量'):'0'</expr>
          </calculate> 
        </col>  
        <col name="数量" xid="ruleCol4"> 
          <calculate xid="calculate4"> 
            <expr xid="default5"/>
          </calculate> 
        </col> 
      </rule>  
      <column label="数量" name="数量" type="String" xid="xid2"/>  
      <column label="总价" name="总价" type="String" xid="xid9"/>  
      <column label="用户编号" name="用户编号" type="String" xid="xid12"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商店表" idColumn="编号" confirmDelete="false" confirmRefresh="false" onCustomRefresh="商店表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid10"/>  
      <column label="名称" name="名称" type="Integer" xid="xid11"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid16"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="calculateData" idColumn="allSum"> 
      <column label="合计" name="allSum" type="String" xid="xid7"/>  
      <column label="总数量" name="allNumber" type="String" xid="xid8"/>  
      <rule xid="rule2"> 
        <col name="allSum" xid="ruleCol5"> 
          <calculate xid="calculate5"> 
            <expr xid="default7">$model.购物车商品表.sum('总价')</expr> 
          </calculate> 
        </col>  
        <col name="allNumber" xid="ruleCol6"> 
          <calculate xid="calculate6"> 
            <expr xid="default9">$model.购物车商品表.sum('是否选中')</expr> 
          </calculate> 
        </col> 
      </rule>  
      <column label="是否返回" name="isBack" type="Integer" xid="xid17"/>  
      <data xid="default8">[{"allSum":"0","isBack":0}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card x-has-iosstatusbar"> 
    <div class="x-panel-top" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="backBtn" icon="icon-chevron-left" bind-visible="$model.calculateData.val(&quot;isBack&quot;)==1"
            onClick="backBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title"> 
          <span xid="span1"><![CDATA[购物车（]]></span>  
          <span xid="span11" bind-text=" $model.购物车商品表.count()"/>  
          <span xid="span2"><![CDATA[）]]></span> 
        </div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="delBtn" icon="icon-ios7-trash-outline" onClick="delBtnClick"> 
            <i xid="i4" class="icon-ios7-trash-outline"/>  
            <span xid="span20"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div xid="content" class="x-panel-content x-scroll-view x-cards" supportpulldown="true"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView" onPullDown="scrollViewPullDown"> 
        <div class="x-content-center x-pull-down container" xid="div8"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2"/>  
          <span class="x-pull-down-label" xid="span9">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div7"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            data="商店表" limit="-1" xid="shopList" disablePullToRefresh="true" disableInfiniteLoad="true"
            autoLoad="true" dataItemAlias="shopRow"> 
            <ul class="x-list-template x-min-height" xid="listTemplateUl1"
              componentname="$UI/system/components/justep/list/list#listTemplateUl"
              id="undefined_listTemplateUl1"> 
              <li xid="li1" class="panel panel-default x-card tb-box"> 
                <div class="panel-heading"> 
                  <i xid="i5" class="icon-chevron-right"/>  
                  <img src="" alt="" xid="image3" class="img-circle tb-img-shop"
                    bind-attr-src=" $object.val(&quot;图片外链&quot;)"/>  
                  <span xid="span4" bind-text="ref('名称')"/> 
                </div>  
                <div component="$UI/system/components/justep/list/list" class="x-list bg-white"
                  data="购物车商品表" filter="$row.val('商店编号')==shopRow.val('编号')" xid="goodsList"
                  disablePullToRefresh="true" disableInfiniteLoad="true"> 
                  <ul class="x-list-template x-min-height" xid="listTemplateUl4"
                    componentname="$UI/system/components/justep/list/list#listTemplateUl"
                    id="undefined_listTemplateUl4"> 
                    <li xid="li4" class="x-min-height tb-goodList" componentname="li(html)"
                      id="undefined_li4"> 
                      <div component="$UI/system/components/justep/row/row"
                        class="x-row"> 
                        <div class="x-col x-col-fixed" xid="col1" style="width:auto;"> 
                          <span component="$UI/system/components/justep/button/checkbox"
                            class="x-checkbox x-radio choose" xid="checkbox2" bind-ref="ref('是否选中')"
                            checkedValue="1"/> 
                        </div>  
                        <div class="x-col x-col-fixed tb-nopadding" xid="col2"> 
                          <img src="" alt="" xid="image1" class="tb-img-good"
                            bind-click="listClick" bind-attr-src="$object.val(&quot;图片外链&quot;)"/> 
                        </div>  
                        <div class="x-col  tb-nopadding" xid="col3"> 
                          <span class="x-flex text-black h5 tb-nomargin" xid="span26"
                            bind-text=" $object.val(&quot;标题&quot;)"/>  
                          <div class="text-muted h6" xid="div6"> 
                            <span xid="span12"><![CDATA[规格:]]></span>  
                            <span bind-text="ref('规格')" xid="span18"/> 
                          </div>  
                          <div class="text-muted" xid="div5"> 
                            <span xid="span22" class="text-danger">￥</span>  
                            <span xid="span28" bind-text="ref('现价')" class="h4 text-danger"/>  
                            <span xid="span19" class="tb-del-line">￥</span>  
                            <span xid="span24" bind-text="ref('原价')" class="tb-del-line"/> 
                          </div>  
                          <div class="tb-numberOperation" xid="div4"> 
                            <a component="$UI/system/components/justep/button/button"
                              class="btn x-gray btn-sm btn-only-icon pull-left" label="button"
                              xid="button1" icon="icon-android-remove" onClick="reductionBtnClick"> 
                              <i xid="i3" class="icon-android-remove"/>  
                              <span xid="span13"/> 
                            </a>  
                            <span bind-text="ref('数量')" class="pull-left"/>  
                            <a component="$UI/system/components/justep/button/button"
                              class="btn x-gray btn-sm btn-only-icon pull-left" label="button"
                              xid="button2" icon="icon-android-add" onClick="addBtnClick"> 
                              <i xid="i6" class="icon-android-add"/>  
                              <span xid="span29"/> 
                            </a> 
                          </div> 
                        </div> 
                      </div> 
                    </li> 
                  </ul> 
                </div> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div7"> 
          <span class="x-pull-up-label" xid="span8"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row tb-nopadding"
        xid="row2"> 
        <div class="x-col x-col-20 x-col-center" xid="col4"> 
          <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
            xid="allChoose" label="全选" checked="false" onChange="allChooseChange"/> 
        </div>  
        <div class="x-col" xid="col8"> 
          <div class="text-right" xid="div9"> 
            <span xid="span15" class="text-muted">合计：</span>  
            <span xid="span17" class="text-danger">￥</span>  
            <span xid="sum" class="h4 text-danger" bind-text="calculateData.ref('allSum')"/> 
          </div>  
          <div class="text-right" xid="div10"> 
            <span xid="span16">不含运费</span> 
          </div> 
        </div>  
        <div class="x-col x-col-33 text-center tb-settlement" xid="col9" bind-click="settlementClick"> 
          <span xid="span10">结算(</span>  
          <span xid="number" class="allNumber" bind-text="calculateData.ref('allNumber')"/>  
          <span xid="span14">)</span> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
