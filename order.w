<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:178px;height:auto;left:67px;top:571px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="goodsData" idColumn="id" limit="20" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="goodsDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="column1"/>  
      <column label="店铺ID" name="fShopID" type="String" xid="xid1"/>  
      <column label="标题" name="fTitle" type="String" xid="column2"/>  
      <column label="图片" name="fImg" type="String" xid="column3"/>  
      <column label="价格" name="fPrice" type="Float" xid="column4"/>  
      <column label="原价格" name="fOldPrice" type="Float" xid="column5"/>  
      <column label="邮费" name="fPostage" type="String" xid="column6"/>  
      <column label="买出数量" name="fRecord" type="Integer" xid="column7"/>  
      <column label="所在地区" name="fAddress" type="String" xid="column8"/>  
      <column label="颜色" name="fColor" type="String" xid="xid2"/>  
      <column label="尺寸" name="fSize" type="String" xid="xid3"/>  
      <column label="选择" name="fChoose" type="Integer" xid="xid4"/>  
      <column label="数量" name="fNumber" type="Integer" xid="xid5"/>  
      <column label="总价" name="fSum" type="Float" xid="xid6"/>  
      <rule xid="rule1">
   <col name="fColor" xid="ruleCol1">
    <constraint xid="constraint1">
     <expr xid="default1"></expr></constraint> 
    <calculate xid="calculate1">
     <expr xid="default2"></expr></calculate> 
    <readonly xid="readonly1">
     <expr xid="default6"></expr></readonly> </col> 
   <col name="fSize" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default3"></expr></calculate> </col> 
   <col name="fSum" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default4">$row.val('fPrice')*$row.val('fNumber')</expr></calculate> </col> 
   <col name="fNumber" xid="ruleCol4">
    <calculate xid="calculate4">
     <expr xid="default5"></expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="shopData" idColumn="id" confirmDelete="false" confirmRefresh="false" onCustomRefresh="shopDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid9"/>  
      <column label="店名" name="fShopName" type="String" xid="xid10"/>  
      <column label="等级" name="fLevel" type="Integer" xid="xid11"/>  
      <column label="店标" name="fShopImg" type="String" xid="xid16"/>  
      <column label="描述相符" name="fConsistent" type="Float" xid="xid12"/>  
      <column label="服务态度" name="fService" type="Float" xid="xid13"/>  
      <column label="商品数量" name="fGoodsNumber" type="Integer" xid="xid14"/>  
      <column label="关注人数" name="fFocusNumber" type="Integer" xid="xid15"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sendData" idColumn="id" onCustomRefresh="sendDataCustomRefresh">
      <column label="id" name="id" type="String" xid="xid7"/>  
      <column label="配送方式" name="fSendName" type="String" xid="xid8"/>  
      <column label="费用" name="fCost" type="String" xid="xid18"/>  
      <column label="状态" name="fState" type="Integer" xid="xid17"/>
    </div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="baasOrderGoodsData" queryAction="queryOrderGoods" tableName="order_goods" url="/eeda/shop" idColumn="id"><column label="id" name="id" type="String" xid="default20"></column>
  <column label="fShopID" name="fShopID" type="String" xid="default21"></column>
  <column label="fTitle" name="fTitle" type="String" xid="default22"></column>
  <column label="fImg" name="fImg" type="String" xid="default23"></column>
  <column label="fPrice" name="fPrice" type="Float" xid="default24"></column>
  <column label="fOldPrice" name="fOldPrice" type="Float" xid="default25"></column>
  <column label="fPostage" name="fPostage" type="String" xid="default26"></column>
  <column label="卖出数量" name="fRecord" type="Integer" xid="default27"></column>
  <column label="fAddress" name="fAddress" type="String" xid="default28"></column>
  <column label="fSize" name="fSize" type="String" xid="default29"></column>
  <column label="fColor" name="fColor" type="String" xid="default30"></column>
  <column label="fNumber" name="fNumber" type="Integer" xid="default31"></column>
  <column label="fSum" name="fSum" type="Float" xid="default32"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="baasOrderShopData" queryAction="queryOrderShop" tableName="order_shop" url="/eeda/shop" idColumn="id"><column label="id" name="id" type="String" xid="default41"></column>
  <column label="fShopName" name="fShopName" type="String" xid="default42"></column>
  <column label="fLevel" name="fLevel" type="String" xid="default43"></column>
  <column label="fShopImg" name="fShopImg" type="String" xid="default44"></column>
  <column label="fConsistent" name="fConsistent" type="String" xid="default45"></column>
  <column label="fService" name="fService" type="String" xid="default46"></column>
  <column label="fGoodsNumber" name="fGoodsNumber" type="String" xid="default47"></column>
  <column label="fFocusNumber" name="fFocusNumber" type="String" xid="default48"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="calculateData" idColumn="allSum" autoNew="true">
  	<column label="合计" name="allSum" type="Float" xid="xid19"></column>
  <column label="总数量" name="allNumber" type="String" xid="xid20"></column>
  <rule xid="rule2">
   <col name="allSum" xid="ruleCol5">
    <calculate xid="calculate5">
     <expr xid="default7">$model.goodsData.sum(&quot;fSum&quot;)</expr></calculate> </col> 
   <col name="allNumber" xid="ruleCol6">
    <calculate xid="calculate6">
     <expr xid="default8">$model.goodsData.sum('fSum')</expr></calculate> </col> </rule></div>
  
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="payMethodData" idColumn="payMethodCode"><column label="支付方式Code" name="payMethodCode" type="String" xid="xid21"></column>
  <column label="支付方式" name="payMethodName" type="String" xid="xid22"></column>
  <column label="状态" name="state" type="String" xid="xid23"></column>
  <data xid="default9">[{&quot;payMethodCode&quot;:&quot;alipay&quot;,&quot;payMethodName&quot;:&quot;支付宝&quot;,&quot;state&quot;:&quot;true&quot;},{&quot;payMethodCode&quot;:&quot;wechatPay&quot;,&quot;payMethodName&quot;:&quot;微信&quot;,&quot;state&quot;:&quot;false&quot;},{&quot;payMethodCode&quot;:&quot;creditCard&quot;,&quot;payMethodName&quot;:&quot;信用卡&quot;,&quot;state&quot;:&quot;false&quot;},{&quot;payMethodCode&quot;:&quot;arrivalPay&quot;,&quot;payMethodName&quot;:&quot;到付&quot;,&quot;state&quot;:&quot;false&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver"> 
    <div class="x-popOver-overlay" xid="div9"/>  
    <div class="x-popOver-content" xid="div10">
      <div class="x-cards panel-heading">
        <h5><![CDATA[选择配送方式：]]></h5>
      </div>
      <div class="panel-body">
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list2" data="sendData"> 
          <ul class="x-list-template" xid="ul1"> 
            <li xid="li2" class="list-group-item tb-noborder" bind-click="sendLiClick">
              <span component="$UI/system/components/justep/button/radio" class="x-radio"
                bind-value="ref('fState')" checkedValue="1" checked="false" xid="state"/>  
              <span bind-text="ref('fSendName')"/>  
              <span bind-text="ref('fCost')"/>
            </li>
          </ul> 
        </div> 
      </div> 
    </div>
  </div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="popOverPay">
   <div class="x-popOver-overlay" xid="div15"></div>
   <div class="x-popOver-content" xid="div14">
    <div class="x-cards panel-heading" xid="div16">
     <h5 xid="h51"><![CDATA[选择支付方式：]]></h5></div> 
    <div class="panel-body" xid="div17">
     <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="payMethodData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li3" class="list-group-item tb-noborder" bind-click="payMethodLiClick">
     <span component="$UI/system/components/justep/button/radio" class="x-radio" bind-value="ref('state')" checkedValue="1" checked="false" xid="radio1"></span>
     <span bind-text="ref('payMethodName')" xid="span11"></span>
     </li> </ul> </div></div> </div> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left text-white" label="确认订单" xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
          <i xid="i1" class="icon-chevron-left" />  
          <span xid="span1">确认订单</span> 
        </a></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"></div></div></div>  
    <div class="x-panel-content x-cards" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card tb-noborder media"
        xid="panel2"> 
        <div class="media-left media-middle"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon text-black"
            label="button" xid="button3" icon="icon-ios7-location"> 
            <i xid="i3" class="icon-ios7-location"/>  
            <span xid="span7"/> 
          </a> 
        </div>  
        <div class="media-body"> 
          <h4 class="text-black"><![CDATA[收货人：张三]]>  
            <span xid="span9" class="pull-right"><![CDATA[13758547152]]></span> 
          </h4>  
          <h5 class="text-black"><![CDATA[收货地址：云南省昆明市高新区昌源北路300号城市新A座1508室]]></h5>  
          <h5 class="text-warning"><![CDATA[（收货不方便时，可选择代收货服务）]]></h5> 
        </div>  
        <div class="media-right media-middle"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon text-black"
            label="button" xid="button4" icon="icon-ios7-arrow-forward"> 
            <i xid="i4" class="icon-ios7-arrow-forward"/>  
            <span xid="span8"/> 
          </a> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default tb-noborder x-card x-tuniu"
        xid="panel3"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="shopData" limit="-1" xid="shopList" disablePullToRefresh="true" disableInfiniteLoad="true"
          autoLoad="true" dataItemAlias="shopRow"> 
          <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl"
            id="undefined_listTemplateUl1"> 
            <li xid="li1" class="tb-noborder"> 
              <div class="panel-body"> 
                <i xid="i5" class="icon-chevron-right"></i>  
                <img src="" alt="" xid="image3" bind-attr-src="$model.getImageUrl(val(&quot;fShopImg&quot;))" class="img-circle tb-img-shop" /><span bind-text="ref('fShopName')" class="text-black"></span> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                data="goodsData" filter="$row.val('fShopID')==shopRow.val('id')" xid="list4"
                disablePullToRefresh="true" disableInfiniteLoad="true" limit="-1"> 
                <ul class="x-list-template x-min-height" xid="listTemplateUl4"
                  componentname="$UI/system/components/justep/list/list#listTemplateUl"
                  id="undefined_listTemplateUl4"> 
                  <li xid="li4" class="panel-body media" componentname="li(html)"
                    id="undefined_li4"> 
                    <div class="media-left"> 
                      <img src="" alt="" xid="image4" bind-attr-src="$model.getImageUrl(val(&quot;fImg&quot;))"
                        class="tb-img-good"/> 
                    </div>  
                    <div class="media-body"> 
                      <span bind-text="ref('fTitle')" class="text-black h5"
                        xid="span33"/>  
                      <div class="text-muted" xid="div1"> 
                        <span xid="span34">颜色：</span>  
                        <span bind-text="ref('fColor')" xid="span35"/>  
                        <span xid="span36">；</span>  
                        <span xid="span37">尺寸：</span>  
                        <span bind-text="ref('fSize')" xid="span38"/> 
                      </div>  
                      <div class="text-muted" xid="div2"> 
                        <span xid="span32" class="text-danger">￥</span>  
                        <span xid="span21" bind-text="ref('fPrice')" class="h4 text-danger"/> 
                      </div>  
                      <div class="numberOperation" xid="div3"> 
                        <span class="pull-right text-black h4" bind-text="ref('fNumber')"
                          xid="span39"/>  
                        <span class="pull-right text-black h4" xid="span40">x</span> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <div> 
          <div class="panel-heading" bind-click="sendClick"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right"
              label="button" xid="button2" icon="icon-ios7-arrow-right"> 
              <i class="icon-ios7-arrow-right text-muted"/>  
              <span xid="span12"/>
            </a>
            <span class="pull-right text-muted" xid="sendTitle"><![CDATA[快递 免邮
]]></span>  
            <span xid="span6"><![CDATA[配送方式]]></span> 
          </div>  
          <div class="panel-heading" bind-click="payMethodClick" xid="div5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right" label="button" xid="button6" icon="icon-ios7-arrow-right">
    <i class="icon-ios7-arrow-right text-muted" xid="i6"></i>
    <span xid="span4"></span></a> 
   <span class="pull-right text-muted" xid="payTitle"><![CDATA[支付宝]]></span>
   <span xid="span3"><![CDATA[支付方式]]></span></div><div class="panel-heading"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right"
              label="button" xid="button5" icon="icon-ios7-arrow-right"> 
              <i class="icon-ios7-arrow-right text-muted" xid="i7"/>  
              <span xid="span13"/>
            </a>
            <span xid="span10"><![CDATA[运费险]]></span> 
          </div>  
          <div class="panel-heading"> 
            <div class="media-left media-middle"> 
              <span class="x-flex" style="width:80px;"><![CDATA[买家留言：]]></span> 
            </div>  
            <div class="media-body"> 
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm tb-noborder text-muted"
                xid="input1" placeHolder="选填，可填写您和卖家达成的协议"/> 
            </div> 
          </div>  
          <div class="panel-heading text-right" bind-text="'共'+ $model.goodsData.count(&quot;id&quot;)+'种商品'"></div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div> 
        <div class="col col-xs-8" xid="col7"> 
          <div class="h4 text-right" xid="div4"> 
            <span xid="span15" class="text-muted">合计：</span>  
            <span xid="span17" class="text-danger"><![CDATA[￥]]></span> 
          <span xid="sum" class="text-danger" bind-text='$model.calculateData.sum("allSum")'></span></div> 
        </div>  
        <div class="col col-xs-4 tb-settlement" xid="col6"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg btn-only-label text-white"
              label="确认" xid="confirmBtn" onClick="confirmBtnClick"> 
              <i xid="i2"/>  
              <span xid="span2">确认</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
