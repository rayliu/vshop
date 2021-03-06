<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:225px;top:44px;"
    onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商品轮播图片表" idColumn="编号" onCustomRefresh="商品轮播图片表CustomRefresh" confirmDelete="false"
      confirmRefresh="false" onAfterRefresh="商品轮播图片表AfterRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid2"/>  
      <column label="商品编号" name="商品编号" type="String" xid="xid1"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid37"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="commentsData" idColumn="id" onCustomRefresh="commentsDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid3"/>  
      <column label="用户名" name="fUserName" type="String" xid="xid4"/>  
      <column label="用户头像" name="fUserImg" type="String" xid="xid7"/>  
      <column label="评分" name="fScore" type="Float" xid="xid5"/>  
      <column label="评论内容" name="fContent" type="String" xid="xid6"/>  
      <column label="评论日期" name="fDate" type="Date" xid="xid8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="stateData" idColumn="state"> 
      <column label="显示状态" name="state" type="Integer" xid="xid26"/>  
      <data xid="default4">[{"state":0}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商品表" idColumn="编号" onCustomRefresh="商品表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid27"/>  
      <column label="商店编号" name="商店编号" type="String" xid="xid28"/>  
      <column label="商店名称" name="fShopName" type="String" xid="xid29"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid30"/>  
      <column label="标题" name="标题" type="String" xid="xid31"/>  
      <column label="现价" name="现价" type="Float" xid="xid32"/>  
      <column label="原价" name="原价" type="Float" xid="xid33"/>  
      <column label="送货方式" name="送货方式" type="String" xid="xid34"/>  
      <column label="销量" name="销量" type="String" xid="xid35"/>  
      <column label="库存" name="库存" type="Integer" xid="xid36"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="图文详情表" idColumn="编号" onCustomRefresh="图文详情表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid38"/>  
      <column label="商品编号" name="商品编号" type="String" xid="xid39"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid40"/>  
      <column label="图片解析" name="图片解析" type="String" xid="xid41"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商店表" idColumn="编号" onCustomRefresh="商店表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid53"/>  
      <column label="名称" name="名称" type="String" xid="xid54"/>  
      <column label="等级" name="等级" type="String" xid="xid55"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid56"/>  
      <column label="商品描述" name="商品描述" type="String" xid="xid57"/>  
      <column label="店铺服务" name="店铺服务" type="String" xid="xid58"/>  
      <column label="商品数量" name="商品数量" type="Integer" xid="xid59"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商品规格表" idColumn="编号" onCustomRefresh="商品规格表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid60"/>  
      <column label="商品编号" name="商品编号" type="String" xid="xid61"/>  
      <column label="规格信息" name="规格信息" type="String" xid="xid62"/>  
      <column label="选中状态" name="选中状态" type="String" xid="xid63"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="数量" idColumn="编号"> 
      <column label="数量" name="数量" type="Integer" xid="xid64"/>  
      <column label="编号" name="编号" type="String" xid="xid65"/>  
      <data xid="default5">[{"数量":1,"编号":"1"}]</data> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="相关推荐表" idColumn="编号" onCustomRefresh="相关推荐表CustomRefresh"><column name="编号" type="String" xid="xid9"></column>
  <column name="标题" type="String" xid="xid10"></column>
  <column name="图片外链" type="String" xid="xid11"></column>
  <column name="现价" type="String" xid="xid12"></column>
  <column name="原价" type="String" xid="xid13"></column>
  <column name="送货方式" type="String" xid="xid14"></column>
  <column name="销量" type="String" xid="xid15"></column>
  <column name="商品类别" type="String" xid="xid16"></column>
  <column name="商店编号" type="String" xid="xid17"></column></div></div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver" position="bottom"> 
    <div class="x-popOver-overlay" xid="div2"/>  
    <div class="x-popOver-content" xid="div3"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right tb-close text-black"
        icon="icon-ios7-close-outline" onClick="{operation:'popOver.hide'}"> 
        <i xid="i17" class="icon-ios7-close-outline"/>  
        <span xid="span35"/> 
      </a>  
      <img bind-attr-src="商品表.val(&quot;图片外链&quot;)" alt="" class="img-thumbnail tb-colorImg"/>  
      <div class="tb-title"> 
        <span class="text-danger h4"><![CDATA[￥]]></span>  
        <span bind-text="商品表.val('现价')" class="text-danger h4"><![CDATA[]]></span>  
        <div xid="div7"/>  
        <span><![CDATA[库存]]></span>  
        <span bind-text="商品表.val('库存')"/>  
        <span xid="span47"><![CDATA[件]]></span>  
        <div class="tb-numberOperation" xid="div44"> 
          <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left"
            label="button" xid="button11" icon="icon-android-remove" onClick="reductionBtnClick"> 
            <i xid="i33" class="icon-android-remove"/>  
            <span xid="span133"/> 
          </a>    
          <span bind-text="数量.ref('数量')" class="pull-left" style="margin-left:10px;margin-right:10px;padding:0px 0px 0px 0px;"/>  
          <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left"
            label="button" xid="button22" icon="icon-android-add" onClick="addBtnClick"> 
            <i xid="i66" class="icon-android-add"/>  
            <span xid="span291"/> 
          </a> 
        </div> 
      </div>  
      <div class="panel-body"> 
        <h4 class="text-black"><![CDATA[规格]]></h4>  
        <div component="$UI/system/components/justep/list/list" class="x-list tb-colorList"
          xid="colorList" data="商品规格表" bind-click="colorLiClick" dataItemAlias="colorRow"> 
          <ul class="x-list-template" xid="ul2" componentname="ul(html)" id="undefined_ul2"> 
            <li xid="li2" class="col col-xs-6" componentname="li(html)" id="undefined_li2"> 
              <div class="text-center" bind-css="{'current':$object.val('选中状态')=='1'}"> 
                <span bind-text=" $object.val(&quot;规格信息&quot;)"/> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <div class="clearfix"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label btn-block tb-colorOk"
        label="确定" onClick="confirmBtn" bind-visible="$model.stateData.val(&quot;state&quot;)==0" id="confirmBtn"> 
        <i xid="i18"/>  
        <span xid="span50">确定</span> 
      </a>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified tb-shopping"
        tabbed="true" xid="buttonGroup4" bind-visible="$model.stateData.val(&quot;state&quot;)==1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          onClick="addCardClick" label="加入购物车" id="addCard"> 
          <i xid="i16"/>  
          <span xid="span34">加入购物车</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          onClick="addOrderClick" label="立即购买" id="addOrder"> 
          <i xid="i19"/>  
          <span xid="span37">立即购买</span> 
        </a> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card tb-trans x-has-iosstatu  x-scroll-view"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar tb-box"
        xid="titleBar"> 
        <div class="x-titlebar-left" xid="left1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon tb-backBtn"
            xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick" style="margin-left:10px;"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">关闭</span> 
          </a> 
        </div>  
        <div class="x-titlebar-right reverse" xid="right1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon tb-moreBtn"
            xid="homeBtn" icon="icon-home" onClick="homeBtnClick" style="margin-right:10px;"> 
            <i xid="i13" class="icon-home"/>  
            <span xid="span23"/> 
          </a> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/bar/bar" class="tb-box" xid="bar1" style="margin:300px 0px 0px 0px;">
        <div class="x-titlebar-title pull-right" xid="title1" style="margin:0px 10px 0px 0px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon tb-cartBtn pull-right"
            xid="cartBtn" icon="icon-ios7-cart" onClick="shoppingCartBtnClick"> 
            <i xid="i12" class="icon-ios7-cart"/>  
            <span xid="span4"/> 
          </a> 
        </div>
      </div>
      <div component="$UI/system/components/justep/bar/bar" class="tb-box" xid="bar2"  style="margin:350px 0px 0px 0px;">
        <div class="x-titlebar-title pull-right" xid="title1" style="margin:0px 10px 0px 0px;"> 
          <a component="$UI/system/components/justep/button/button"  class="btn btn-link btn-only-icon tb-cartBtn pull-right"
            xid="topBtn" icon="icon-chevron-up" href="#topper" onClick="topBtnClick"> 
            <i xid="i12" class="icon-chevron-up"/>  
            <span xid="span4"/> 
          </a> 
        </div>
      </div>
    </div>  
    <div class="x-panel-content x-cards tb-trans"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1" onPullDown="scrollView1PullDown"> 
        <div class="x-content-center x-pull-down container" xid="div1"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"/>  
          <span class="x-pull-down-label" xid="span1">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div6">
          <div component="$UI/system/components/bootstrap/carousel/carousel"
            class="x-carousel carousel" xid="carousel1" auto="true" style="" interval="3"> 
            <ol class="carousel-indicators" xid="default1" />  
            <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
              active="0" slidable="true" wrap="true" swipe="true" xid="contentsImg"
              routable="false"> 
              <div class="x-contents-content" xid="content1"  id="topper"> 
                <img src="" alt="" xid="image1" class="image-wall tb-img" bind-attr-src=" 商品轮播图片表.val(&quot;图片外链&quot;)"/> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card panel-body"
            xid="panel1"> 
            <div component="$UI/system/components/bootstrap/row/row" data="商品表"
              class="row tb-nopadding" xid="row1"> 
              <div class="col col-xs-12 center-block tb-nopadding " style="text-align:center;"
                xid="col8"> 
                <h4 xid="h41" class="text-black" bind-text="商品表.val(&quot;标题&quot;)"/>  
                <div xid="div4" style="text-align:center;"> 
                  <span xid="span17" class="text-danger h3">￥</span>  
                  <span xid="span29" class="text-danger h3" bind-text="商品表.val('现价')"/> 
                </div>  
                <div xid="div5" class="text-muted" style="text-align:center;"> 
                  <span xid="span19">价格：</span>  
                  <span xid="span18" class="tb-text-del">￥</span>  
                  <span xid="span13" class="tb-text-del" bind-text="商品表.val(&quot;原价&quot;)"/> 
                </div> 
              </div>  
              </div>  
            <!--   <div component="$UI/system/components/bootstrap/row/row" class="row text-muted h5 tb-nopadding"
              xid="row2"> 
              <div class="col col-xs-4  tb-nopadding" xid="col11"> 
                <span xid="span14">快递</span>  
                <span xid="span15" bind-text="商品表.ref('送货方式')"/>
              </div>  
              <div class="col col-xs-4 text-center" xid="col12"> 
                <span xid="span24">月销</span>  
                <span xid="span26" bind-text="商品表.ref('销量')"/>  
                <span xid="span27">笔</span>
              </div>  
              <div class="col col-xs-4 text-center" xid="col13"> 
                <span xid="span16" bind-text="商品表.ref('地址')"/>
              </div> 
            </div> --> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel panel-heading x-card"
            bind-click="popOverClick" xid="panel2"> 
            <i xid="i4" class="text-muted icon-chevron-right pull-right btn-sm"/>  
            <span xid="span20">选择商品规格</span> 
          </div>  
          <!-- <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card"
            xid="panel3"> 
            <div class="panel-body" xid="div9"> 
              <div class="h5 text-black" xid="div10"> 
                <span xid="span22">宝贝评价（</span>1
                <span xid="span28">）</span>
              </div>  
              <div class="media-left" xid="div11"> 
                <img src="" alt="" xid="image3" class="img-circle" bind-attr-src="commentsData.ref('fUserImg')"
                  height="40px" style="width:40px;"/>
              </div>  
              <div class="media-body" xid="div12"> 
                <span xid="span30" bind-text="commentsData.ref('fUserName')"/>
              </div>  
              <div xid="div13"> 
                <span xid="span32" bind-text="commentsData.ref('fContent')"/>
              </div>  
              <div class="text-muted" xid="div14"> 
                <span xid="span36" bind-text="commentsData.ref('fDate')"/>
              </div>  
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup3"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label text-black" label="查看更多评论" xid="button4"> 
                  <i xid="i11"/>  
                  <span xid="span5">查看更多评论</span>
                </a> 
              </div> 
            </div> 
          </div>-->  
          <!-- <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card"
            xid="panel4"> 
            <div xid="div9" class="panel-body tb-nopadding"> 
              <div class="panel-body media" xid="div15"> 
                <div class="media-left" xid="div16"> 
                  <img src="" alt="" xid="image4" class="img-rounded" bind-attr-src="商店表.ref(&quot;图片外链&quot;)"
                    height="50px" style="width:50px;"/>
                </div>  
                <div class="media-body" xid="div17"> 
                  <span xid="span46" bind-text="商店表.ref('名称')" class="show"/>  
                  <span xid="span48" bind-text="商店表.ref('等级')"/>
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row3"> 
                <div class="col col-xs-5" xid="col17"> 
                  <span class="text-muted" xid="span9">描述相符</span>  
                  <span bind-text="商店表.ref('商品描述')" class="text-danger" xid="span11"/>
                </div>  
                <div class="col col-xs-7" xid="col18"> 
                  <span class="text-muted" xid="span12">服务态度</span>  
                  <span bind-text="商店表.ref('店铺服务')" class="text-success" xid="span21"/>
                </div> 
              </div> 
            </div>  
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row4"> 
              <div class="col col-xs-6 tb-line" xid="col1"> 
                <span xid="span41" bind-text="商店表.ref('商品数量')" class="show text-center"/>  
                <span xid="goodsBtn" class="show text-center text-muted" bind-click="goodsBtnClick">全部宝贝</span>
              </div>  
              <div class="col col-xs-6" xid="col2"> 
                <span xid="span44" bind-text="999" class="show text-center"/>  
                <span xid="span43" class="show text-center text-muted">关注人数</span>
              </div> 
            </div>  
            <div component="$UI/system/components/bootstrap/row/row" class="row panel-body"
              xid="row5"> 
              <div class="col col-xs-6" xid="col4"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left btn-block thumbnail text-black"
                  label="查看宝贝分类" xid="classBtn" icon="icon-navicon" onClick="classBtnClick"> 
                  <i xid="i9" class="icon-navicon"/>  
                  <span xid="span40">查看宝贝分类</span>
                </a> 
              </div>  
              <div class="col col-xs-6" xid="col5"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left btn-block thumbnail text-black"
                  label="进店逛逛" xid="storeBtn" icon="icon-bag" onClick="storeBtnClick"> 
                  <i xid="i5" class="icon-bag"/>  
                  <span xid="span39">进店逛逛</span>
                </a> 
              </div> 
            </div> 
          </div>   -->  
          <div component="$UI/system/components/justep/panel/panel" class="panel x-card"
            xid="panel5"> 
            <div component="$UI/system/components/justep/button/buttonGroup"
              class="btn-group btn-group-justified tb-tabs" tabbed="true" xid="buttonGroup5"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active"
                label="图文详情" xid="detailsBtn" target="detailsContent"> 
                <i xid="i14"/>  
                <span xid="span31">图文详情</span> 
              </a>  
              <!-- <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
                label="产品参数" xid="parameterBtn" target="parameterContent"> 
                <i xid="i15"/>  
                <span xid="span33">产品参数</span>
              </a>  --> 
            </div>  
            <div component="$UI/system/components/justep/contents/contents"
              class="x-contents" active="0" xid="contents2"> 
              <div class="x-contents-content panel-body" xid="detailsContent"> 
                <div component="$UI/system/components/justep/list/list" class="x-list x-cards"
                  xid="list2" data="图文详情表"> 
                  <ul class="x-list-template" xid="listTemplateUl1" componentname="ul(html)"
                    id="undefined_ul1"> 
                    <li xid="li1" componentname="li(html)" id="undefined_li2"
                      class="list-group-item"> 
                      <img src="" alt="" xid="image5" class="image-wall tb-img"
                        bind-attr-src="ref('图片外链')"/>  
                      <span bind-text="ref('图片解析')" class="tb-nopadding text-muted"
                        xid="span38"/>  
                      <div class="clearfix" xid="div18"/> 
                    </li> 
                  </ul> 
                </div> 
              </div>  
              <!-- <div class="x-contents-content panel-body" xid="parameterContent"> 
                <div component="$UI/system/components/justep/list/list" class="x-list x-cards"
                  xid="list1" data="详情参数表"> 
                  <ul class="x-list-template" xid="ul1" componentname="ul(html)"
                    id="undefined_ul1"> 
                    <li xid="li1" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span42">商品类别</span>  
                      <span bind-text="ref('商品类别')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span45"/>  
                      <div class="clearfix" xid="div19"/>
                    </li>  
                    <li xid="li1" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span49">销售渠道</span>  
                      <span bind-text="ref('销售渠道')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span51"/>  
                      <div class="clearfix" xid="div20"/>
                    </li>  
                    <li xid="li3" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span52">品牌</span>  
                      <span bind-text="ref('品牌')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span53"/>  
                      <div class="clearfix" xid="div21"/>
                    </li>  
                    <li xid="li4" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span54">规格</span>  
                      <span bind-text="ref('规格')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span55"/>  
                      <div class="clearfix" xid="div22"/>
                    </li>  
                    <li xid="li5" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span56">售后服务</span>  
                      <span bind-text="ref('售后服务')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span57"/>  
                      <div class="clearfix" xid="div23"/>
                    </li>  
                    <li xid="li6" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span58">地址</span>  
                      <span bind-text="ref('地址')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span59"/>  
                      <div class="clearfix" xid="div24"/>
                    </li>  
                    <li xid="li7" componentname="li(html)" id="undefined_li1"
                      class="list-group-item"> 
                      <span class="col col-xs-4 tb-nopadding text-muted" xid="span60">保质期</span>  
                      <span bind-text="ref('保质期')" class="x-flex col col-xs-8 tb-nopadding"
                        xid="span61"/>  
                      <div class="clearfix" xid="div25"/>
                    </li> 
                  </ul> 
                </div> 
              </div> --> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel x-card"
            xid="panel6"> 
	          <div component="$UI/system/components/justep/button/buttonGroup"
	              class="btn-group btn-group-justified tb-tabs" tabbed="true" xid="buttonGrou"> 
	              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active"
	                label="相关推荐" xid=""> 
	                <i xid="i14"/>  
	                <span xid="spa">相关推荐</span> 
	              </a>
	         </div>  
	         <div class="x-scroll-content">
	         	<div class="col-xs-6 tb-twoColList"> 
                <div component="$UI/system/components/justep/list/list" class="x-list x-flex"
                  data="相关推荐表" limit="4" filter="$row.index()%2==0" xid="list2"
                  bind-click="listClick" disablePullToRefresh="false" disableInfiniteLoad="false"> 
                  <ul class="x-list-template" xid="ul3"> 
                    <li xid="li4"> 
                      <div xid="div8"> 
                        <img src="" alt="" bind-attr-src="ref('图片外链')"
                          class="img-responsive" style="width:100%;" xid="image2"/>  
                        <div xid="div19"> 
                          <h5 bind-text="ref('标题')" class="text-black"
                            xid="h52"/>  
                          <div xid="div12"> 
                            <span class="text-danger" xid="span3">￥</span>  
                            <span bind-text="ref('现价')" class="text-danger"
                              xid="span4"/> 
                          </div>  
                          <div xid="div13" class="text-muted"> 
                            <span xid="span24">月销</span>  
                            <span xid="span26" bind-text="ref('销量')"/>  
                            <span xid="span27">笔</span>  
                            <span xid="span28" bind-text="ref('送货方式')" class="pull-right"/> 
                          </div> 
                        </div> 
                      </div> 
                    </li> 
                  </ul> 
                </div> 
              </div>  
              <div class="col-xs-6 tb-twoColList"> 
                <div component="$UI/system/components/justep/list/list" class="x-list x-flex"
                  data="相关推荐表" limit="4" bind-click="listClick" filter="$row.index()%2==1"
                  xid="list4"> 
                  <ul class="x-list-template" xid="ul4"> 
                    <li xid="li5"> 
                      <div xid="div24"> 
                        <img src="" alt="" bind-attr-src="ref('图片外链')"
                          class="img-responsive" style="width:100%;" xid="image3"/>  
                        <div xid="div25"> 
                          <h5 bind-text="ref('标题')" class="text-black"
                            xid="h53"/>  
                          <div xid="div23"> 
                            <span class="text-danger" xid="span23">￥</span>  
                            <span bind-text="ref('现价')" class="text-danger"
                              xid="span19"/> 
                          </div>  
                          <div xid="div22" class="text-muted"> 
                            <span xid="span18">月销</span>  
                            <span xid="span14" bind-text="ref('销量')"/>  
                            <span xid="span17">笔</span>  
                            <span xid="span13" bind-text="ref('送货方式')" class="pull-right"/> 
                          </div> 
                        </div> 
                      </div> 
                    </li> 
                  </ul> 
                </div> 
              </div>
              <div class="clearfix" xid="div2"/> 
        	 </div>
         </div>
         
         
         
        </div>  
        <div class="x-content-center x-pull-up" xid="div8"> 
          <span class="x-pull-up-label" xid="span25">加载更多...</span> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"> 
        <div class="col col-xs-5 tb-nopadding" xid="col3"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              xid="serviceBtn" icon="icon-chatbubble-working" style="height:48px;"> 
              <i xid="i3" class="icon-chatbubble-working" style="font-size:x-large;color:orange;"/>  
              <span xid="span3"></span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              xid="menuCartBtn" icon="icon-heart" onClick="menuCartBtnClick"> 
              <i xid="i2" class="icon icon-heart" style="font-size:x-large;color:orange;"/>  
              <span xid="span2"></span> 
            </a> 
          </div> 
        </div>  
        <div class="col col-xs-7 tb-nopadding" xid="col6"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified tb-shopping" tabbed="true" xid="buttonGroup2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
              label="加入购物车" xid="joinCartBtn" icon="icon-radio-waves" onClick="joinCartBtnClick"> 
              <i xid="i8" class="icon-radio-waves icon"/>  
              <span xid="span7">加入购物车</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
              label="立即购买" xid="buyBtn" icon="icon-android-display" onClick="buyBtnClick"> 
              <i xid="i7" class="icon-android-display icon"/>  
              <span xid="span8">立即购买</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
