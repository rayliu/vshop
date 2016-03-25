<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:178px;height:auto;left:312px;top:123px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sendData" idColumn="id" onCustomRefresh="sendDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid7"/>  
      <column label="配送方式" name="fSendName" type="String" xid="xid8"/>  
      <column label="费用" name="fCost" type="String" xid="xid18"/>  
      <column label="状态" name="fState" type="Integer" xid="xid17"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="calculateData" idColumn="allSum" autoNew="true"> 
      <column isCalculate="true" label="合计" name="allSum" type="Float" xid="xid19"></column>
  <column label="总数量" name="allNumber" type="String" xid="xid20"></column>
  <rule xid="rule2">
   <col name="allSum" xid="ruleCol5">
    <calculate xid="calculate5">
     <expr xid="default7">$model.购物车商品表.sum(&quot;总价&quot;)</expr></calculate> </col> 
   <col name="allNumber" xid="ruleCol6">
    <calculate xid="calculate6">
     <expr xid="default8">$model.购物车商品表.sum('数量')</expr></calculate> </col> </rule>
  <column label="id" name="id" type="String" xid="xid46"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="payMethodData" idColumn="payMethodCode">
      <column label="支付方式Code" name="payMethodCode" type="String" xid="xid21"/>  
      <column label="支付方式" name="payMethodName" type="String" xid="xid22"/>  
      <column label="状态" name="state" type="String" xid="xid23"/>  
      <data xid="default9">[{"payMethodCode":"weixin","payMethodName":"微信支付","state":"true"},{"payMethodCode":"creditCard","payMethodName":"7Eleven代收","state":"false"},{"payMethodCode":"goPay","payMethodName":"到店支付","state":"false"},{"payMethodCode":"arrivalPay","payMethodName":"货到付款","state":"false"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="收货地址表" idColumn="编号" onCustomRefresh="收货地址表CustomRefresh">
      <column name="编号" type="String" xid="xid39"/>  
      <column name="用户编号" type="String" xid="xid40"/>  
      <column name="姓名" type="String" xid="xid41"/>  
      <column name="地址" type="String" xid="xid42"/>  
      <column name="邮编" type="Integer" xid="xid43"/>  
      <column name="电话" type="Integer" xid="xid44"/>  
      <column name="是否启用" type="String" xid="xid45"/>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商店表" idColumn="编号">
      <column name="编号" type="String" xid="xid36"/>  
      <column name="名称" type="String" xid="xid37"/>  
      <column name="图片外链" type="String" xid="xid38"/>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="订单表" idColumn="编号">
      <column name="编号" type="String" xid="xid24"/>  
      <column name="商店编号" type="String" xid="xid25"/>  
      <column name="商店名称" type="String" xid="xid26"/>  
      <column name="商品编号" type="String" xid="xid27"/>  
      <column name="图片外链" type="String" xid="xid28"/>  
      <column name="标题" type="String" xid="xid29"/>  
      <column name="规格" type="String" xid="xid30"/>  
      <column name="现价" type="Double" xid="xid31"/>  
      <column name="原价" type="Double" xid="xid32"/>  
      <column name="数量" type="Integer" xid="xid33"/>  
      <column name="总价" type="Double" xid="xid34"/>  
      <column name="状态" type="String" xid="xid35"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="购物车商品表" idColumn="编号" limit="20" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="购物车商品表DataCustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="column11"></column>
  <column label="商店编号" name="商店编号" type="String" xid="column16"></column>
  <column label="商品编号" name="商品编号" type="String" xid="column15"></column>
  <column label="图片外链" name="图片外链" type="String" xid="column19"></column>
  <column label="现价" name="现价" type="Float" xid="column18"></column>
  <column label="标题" name="标题" type="String" xid="column9"></column>
  <column label="原价" name="原价" type="Float" xid="column10"></column>
  <column label="规格" name="规格" type="String" xid="column12"></column>
  <column label="数量" name="数量" type="String" xid="column13"></column>
  <column label="总价" name="总价" type="String" xid="column17"></column></div>
  </div>  
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
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOverPay"> 
    <div class="x-popOver-overlay" xid="div15"/>  
    <div class="x-popOver-content" xid="div14"> 
      <div class="x-cards panel-heading" xid="div16"> 
        <h5 xid="h51"><![CDATA[选择支付方式：]]></h5>
      </div>  
      <div class="panel-body" xid="div17"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="payMethodData"> 
          <ul class="x-list-template" xid="listTemplateUl2"> 
            <li xid="li3" class="list-group-item tb-noborder" bind-click="payMethodLiClick"> 
              <span component="$UI/system/components/justep/button/radio" class="x-radio"
                bind-value="ref('state')" checkedValue="1" checked="false" xid="radio1"/>  
              <span bind-text="ref('payMethodName')" xid="span11"/> 
            </li> 
          </ul> 
        </div>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar"> 
        <div class="x-titlebar-left" xid="left1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left text-white"
            label="订单确认" xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1">订单确认</span> 
          </a>
        </div>  
        <div class="x-titlebar-title" xid="title1"/>  
        <div class="x-titlebar-right reverse" xid="right1"/>
      </div>
    </div>  
    <div class="x-panel-content x-cards" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card tb-noborder media"
        xid="panel2" data="收货地址表"> 
        <div class="media-left media-middle"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon text-black"
            data="商店表" limit="1" label="button" xid="button3" icon="icon-ios7-location"> 
            <i xid="i3" class="icon-ios7-location"/>  
            <span xid="span7"/> 
          </a> 
        </div>  
        <div class="media-body"> 
          <h4 class="text-black"><![CDATA[收货人：]]>  
            <span xid="span20" class="pull-right" bind-text="收货地址表.ref('姓名')"></span>  
            
          </h4>  
          <h5 class="text-black"><![CDATA[联系方式：]]>  
          		<span xid="span55" class="pull-right" bind-text="收货地址表.ref('电话')"></span> 
          </h5> 
          <h5 class="text-black"><![CDATA[收货地址：]]>  
            <span xid="span5" class="pull-right" bind-text="收货地址表.ref('地址')"/>
          </h5>  
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
        <!-- <div component="$UI/system/components/justep/list/list" class="x-list"
          data="商店表" limit="-1" xid="shopList" disablePullToRefresh="true" disableInfiniteLoad="true"
          autoLoad="true" dataItemAlias="shopRow"> 
          <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl"
            id="undefined_listTemplateUl1"> 
            <li xid="li1" class="tb-noborder">  -->  
        <!-- <div class="panel-body"> 
                <i xid="i5" class="icon-chevron-right"></i>  
                <img src="" alt="" xid="image3" bind-attr-src="ref('图片外链')" class="img-circle tb-img-shop" /><span bind-text="ref('名称')" class="text-black"></span> 
              </div>   -->
        <!-- filter="$row.val('商店编号')==shopRow.val('编号')" -->  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="购物车商品表" xid="list4" disablePullToRefresh="true" disableInfiniteLoad="true"
          limit="-1"> 
          <ul class="x-list-template x-min-height" xid="listTemplateUl4" componentname="$UI/system/components/justep/list/list#listTemplateUl"
            id="undefined_listTemplateUl4"> 
            <li xid="li4" class="panel-body media" componentname="li(html)"
              id="undefined_li4"> 
              <div class="media-left"> 
                <img src="" alt="" xid="image4" bind-attr-src="ref('图片外链')"
                  class="tb-img-good"/> 
              </div>  
              <div class="media-body"> 
                <span bind-text="ref('标题')" class="text-black h5" xid="span33"/>  
                <div class="text-muted" xid="div1"> 
                  <span xid="span37">规格：</span>  
                  <span bind-text="ref('规格')" xid="span38"/> 
                </div>  
                <div class="text-muted" xid="div2"> 
                  <span xid="span32" class="text-danger">￥</span>  
                  <span xid="span21" bind-text="ref('现价')" class="h4 text-danger"/>  
                  <span xid="span33" class="tb-text-del">￥</span>  
                  <span xid="span34" class=" tb-text-del" bind-text="ref(&quot;原价&quot;)"/> 
                </div>  
                <div class="numberOperation" xid="div3"> 
                  <span class="pull-right text-black h4" bind-text="ref('数量')"
                    xid="span39"/>  
                  <span class="pull-right text-black h4" xid="span40">x</span> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <!-- </li> 
          </ul>
        </div>   -->  
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
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right"
              label="button" xid="button6" icon="icon-ios7-arrow-right"> 
              <i class="icon-ios7-arrow-right text-muted" xid="i6"/>  
              <span xid="span4"/>
            </a>  
            <span class="pull-right text-muted" xid="payTitle"><![CDATA[支付宝]]></span>  
            <span xid="span3"><![CDATA[支付方式]]></span>
          </div>
          <!-- <div class="panel-heading"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right"
              label="button" xid="button5" icon="icon-ios7-arrow-right"> 
              <i class="icon-ios7-arrow-right text-muted" xid="i7"/>  
              <span xid="span13"/>
            </a>
            <span xid="span10"><![CDATA[运费险]]></span> 
          </div>   -->  
          <div class="panel-heading"> 
            <div class="media-left media-middle"> 
              <span class="x-flex" style="width:80px;"><![CDATA[买家留言：]]></span> 
            </div>  
            <div class="media-body"> 
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm tb-noborder text-muted"
                xid="input1" placeHolder="选填，可填写您和卖家达成的协议"/> 
            </div> 
          </div>  
          <div class="panel-heading text-right" bind-text="'共'+ $model.购物车商品表.count(&quot;id&quot;)+'种商品'"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div> 
        <div class="col col-xs-8" xid="col7"> 
          <div class="h4 text-right" xid="div4"> 
            <span xid="span15" class="text-muted">合计：</span>  
            <span xid="span17" class="text-danger"><![CDATA[￥]]></span>  
            <span xid="sum" class="text-danger" bind-text="$model.calculateData.sum(&quot;allSum&quot;)"/>
          </div> 
        </div>  
        <div class="col col-xs-4 tb-settlement" xid="col6"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg btn-only-label text-white"
              label="提交订单" xid="confirmBtn" onClick="confirmBtnClick"> 
              <i xid="i2"/>  
              <span xid="span2">提交订单</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
