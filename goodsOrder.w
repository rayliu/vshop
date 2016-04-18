<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:107px;top:430px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="订单表" idColumn="编号" onCustomRefresh="订单表CustomRefresh"> 
      <column isCalculate="false" name="编号" type="String" xid="xid1"/>  
      <column name="商店名称" type="String" xid="xid2"/>  
      <column name="总价" type="Float" xid="xid3"/>  
      <column name="收货地址" type="String" xid="xid4"/>  
      <column name="配送方式" type="String" xid="xid5"/>  
      <column name="买家留言" type="String" xid="xid6"/>  
      <column name="配送时间" type="String" xid="xid7"/>  
      <column name="提货点" type="String" xid="xid8"/>  
      <column name="门店信息" type="String" xid="xid9"/>  
      <column name="状态" type="String" xid="xid10"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="订单商品表" idColumn="编号" onCustomRefresh="订单商品表CustomRefresh"> 
      <column name="编号" type="String" xid="xid11"/>  
      <column name="订单编号" type="String" xid="xid12"/>  
      <column name="商店编号" type="String" xid="xid13"/>  
      <column name="商店名称" type="String" xid="xid14"/>  
      <column name="商品编号" type="String" xid="xid15"/>  
      <column name="商品名称" type="String" xid="xid16"/>  
      <column name="图片外链" type="String" xid="xid17"/>  
      <column name="现价" type="String" xid="xid18"/>  
      <column name="原价" type="String" xid="xid19"/>  
      <column name="数量" type="String" xid="xid20"/>  
      <column name="规格" type="String" xid="xid21"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full panel panel-default x-scroll-view"
    xid="panel1"> 
    <div xid="div28" class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="我的订单"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="userBackBtn" icon="icon-chevron-left" onClick="userBackBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div3">我的订单</div>  
        <div class="x-titlebar-right reverse" xid="div4"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-panel-content  x-scroll-view"
      active="0" xid="contents9"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView4" onPullDown="scrollView4PullDown" pullDownMoveLabel="松开刷新..."> 
        <div class="x-content-center x-pull-down container" xid="div13"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"/>  
          <span class="x-pull-down-label" xid="span8">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div14"> 
          <div component="$UI/system/components/justep/list/list" class="x-list x-cards"
            data="订单表" limit="-1" xid="shopList" disablePullToRefresh="true" disableInfiniteLoad="true"
            autoLoad="true" dataItemAlias="orderRow"> 
            <ul class="x-list-template x-min-height" xid="listTemplateUl1"
              componentname="$UI/system/components/justep/list/list#listTemplateUl"
              id="undefined_listTemplateUl1"> 
              <li xid="li1" class="panel panel-default x-card tb-box"> 
                <div class="panel-heading" xid="div9"> 
                  <span xid="span4" bind-text="ref('商店名称')"/>  
                  <i xid="i4" class="icon-chevron-right"/>  
                  <span xid="" bind-text="ref('状态')" style="color:red;clip:rect(auto auto auto auto);float:right;"/> 
                </div>  
                <div component="$UI/system/components/justep/list/list" class="x-list bg-white"
                  data="订单商品表" filter="$row.val('订单编号')==orderRow.val('编号')" xid="goodsList"
                  disablePullToRefresh="true" disableInfiniteLoad="true"> 
                  <ul class="x-list-template x-min-height" xid="listTemplateUl4"
                    componentname="$UI/system/components/justep/list/list#listTemplateUl"
                    id="undefined_listTemplateUl4"> 
                    <li xid="li4" class="x-min-height tb-goodList" componentname="li(html)"
                      id="undefined_li4"> 
                      <div component="$UI/system/components/justep/row/row"
                        class="x-row" xid="row2" style="height:100px;"> 
                        <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:110px;"> 
                          <img src="" alt="" xid="image1" bind-click="listClick" bind-attr-src="ref(&quot;图片外链&quot;)" style="width:95%;" height="100%"/> 
                        </div>  
                        <div class="x-col tb-nopadding" xid="col3"> 
                          <div xid="div16"> 
                            <span class="text-black h5 tb-nomargin" xid="span26"
                              bind-text=" ref(&quot;商品名称&quot;)"/> 
                          </div>  
                          <div class="text-muted h6" xid="div6"> 
                            <span xid="span12">规格:</span>  
                            <span bind-text="ref('规格')" xid="span18"/> 
                          </div> 
                        </div>  
                        <div class="text-muted h6" xid="div16"></div>  
                        <div class="x-col x-col-20 x-col-15 tb-nopadding" xid="col4"> 
                          <div class="text-muted fright" xid="div5"> 
                            <span xid="span22" class="text-danger">￥</span>  
                            <span xid="span28" bind-text="ref('现价')" class="text-danger h5"/> 
                          </div>  
                          <div class="text-muted tb-del-line fright" xid="div10"> 
                            <span xid="span6" class="">￥</span>  
                            <span xid="span10" bind-text="ref('原价')"/> 
                          </div>  
                          <div class="text-muted fright" xid="div11"> 
                            <span xid="span19" class="fright">x</span>  
                            <span xid="span24" bind-text="ref('数量')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </li> 
                  </ul> 
                </div>  
                <div xid="div12"> 
                  <div xid="div22" style="position:absolute">
                    <span xid="span" style="text-align:left;"><![CDATA[订单号：]]></span>
                    <span xid="span16" bind-text=' $object.val("订单号")'/>
                  </div>
                  <div xid="div23" style="text-align:right;">
                    <span xid="" class="">合计：</span>
                    <span xid="">￥</span>
                    <span xid="" bind-text="ref('总价')"><![CDATA[]]></span>
                    <span xid="">(含运费)</span>
                  </div>
                </div>  
                <div xid="div1" style="height:1px;background-color:#C0C0C0;"/>  
                <div xid="div7" style="text-align:right;height:50px;" bind-visible=" $object.val(&quot;状态&quot;) =='未付款'"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn x-gray" label="取消订单" xid="cancel" onClick="cancelClick" style="margin:5px 10px 5px 0px;"> 
                    <i xid="i2"/>  
                    <span xid="span1">取消订单</span> 
                  </a>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" label="付款" xid="pay" style="margin:5px 0px 10px 5px;display:none;"
                    onClick="payClick"> 
                    <i xid="i3"/>  
                    <span xid="span2">付款</span> 
                  </a> 
                </div>  
                <div xid="div8" style="text-align:right;height:50px;" bind-visible="$object.val(&quot;状态&quot;) =='买家已付款' || $object.val(&quot;状态&quot;) =='订单已取消'"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-warning" label="删除订单" xid="delete" style="margin:5px 10px 10px 5px;"
                    onClick="deleteClick"> 
                    <i xid="i7"/>  
                    <span xid="span7">删除订单</span> 
                  </a> 
                </div> 
              </li> 
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
