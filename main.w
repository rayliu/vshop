<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"
    onModelConstruct="modelModelConstruct" onLoad="modelLoad" onunLoad="modelUnLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="图片" name="fImgUrl" type="String" xid="xid2"/>  
      <column label="链接地址" name="fUrl" type="String" xid="xid9"/>
    <master xid="default1" data="imgData"></master></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="goodsData" idColumn="id" onCustomRefresh="goodsDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="column1"/>  
      <column label="店铺ID" name="fShopID" type="String" xid="xid3"/>  
      <column label="标题" name="fTitle" type="String" xid="column2"/>  
      <column label="图片" name="fImg" type="String" xid="column3"/>  
      <column label="价格" name="fPrice" type="Float" xid="column4"/>  
      <column label="邮费" name="fPostage" type="String" xid="column6"/>  
      <column label="月销量" name="fRecord" type="Integer" xid="column7"/> 
    </div> 
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="baasImgData" queryAction="queryCarousel" tableName="carousel" url="/eeda/shop" idColumn="id" onAfterRefresh="baasImgDataAfterRefresh"><column label="id" name="id" type="String" xid="default5"></column>
  <column label="fImgUrl" name="fImgUrl" type="String" xid="default6"></column>
  <column label="fUrl" name="fUrl" type="String" xid="default7"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="baasGoodsData" queryAction="queryGoods" tableName="goods" url="/eeda/shop" idColumn="id" onAfterRefresh="baasGoodsDataAfterRefresh"><column label="id" name="id" type="String" xid="default15"></column>
  <column label="fShopID" name="fShopID" type="String" xid="default16"></column>
  <column label="fTitle" name="fTitle" type="String" xid="default17"></column>
  <column label="fImg" name="fImg" type="String" xid="default18"></column>
  <column label="fPrice" name="fPrice" type="String" xid="default19"></column>
  <column label="fPostage" name="fPostage" type="String" xid="default20"></column>
  <column label="fRecord" name="fRecord" type="String" xid="default21"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-content tb-trans"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents2" swipe="false" wrap="false" slidable="false" onActiveChange="contents2ActiveChange"> 
        <div class="x-contents-content x-cards" xid="homeContent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-has-iosstatusbar"> 
              
            <div class="x-panel-top" xid="top1"> 
              <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1"> 
                <div class="x-titlebar-left" xid="div6"> 
                  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="Logo" icon="icon-android-settings" style="width:40px;"> 
                    <i xid="i6" class="icon-android-settings" />  
                    <span xid="span6">Logo</span> 
                  </a> 
                </div>  
                <div class="x-titlebar-title tb-searchBox" xid="div1" bind-click="searchBtnClick"> 
                  <i xid="i10" class="icon-ios7-search-strong" />  
                  <span><![CDATA[等你来淘]]></span>  
                  <div /> 
                </div>  
                <div class="x-titlebar-right reverse" xid="div5"> 
                  </div> 
              </div> 
            </div><div class="x-panel-content  x-scroll-view" xid="content3" style="bottom: 0px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView" onPullDown="scrollViewPullDown"> 
                <div class="x-content-center x-pull-down container" style="display:none;" xid="div16"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i9"/>  
                  <span class="x-pull-down-label" xid="span17">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div17"> 
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel1"> 
                    <div component="$UI/system/components/bootstrap/carousel/carousel"
                      class="x-carousel carousel" xid="carousel1" auto="true" style="height:133px;"> 
                      <ol class="carousel-indicators" xid="ol1"/>  
                      <div class="x-contents carousel-inner" role="listbox"
                        component="$UI/system/components/justep/contents/contents"
                        active="0" slidable="true" wrap="true" swipe="true" xid="contentsImg" routable="false"> 
                        <div class="x-contents-content" xid="content2"> 
                          <img  src="./main/img/carouselBox61.jpg" alt="" xid="image13" bind-click="openPageClick"
                            class="tb-img1" pagename="./detail.w"/> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel2"> 
                    </div><div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel5"> 
                    <h4 xid="h41" class="list-group-item text-black"><![CDATA[精选商品]]>
  </h4>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list x-flex" xid="list1" data="baasGoodsData" limit="6"
                      disablePullToRefresh="false" disableInfiniteLoad="false" bind-click="listClick"> 
                      <ul class="x-list-template" xid="listTemplateUl1"> 
                        <li xid="li1" class="col col-xs-6 tb-twoColList"> 
                          <div> 
                            <img alt="" class="img-rounded img-responsive media-object"
                              xid="image18" bind-attr-src="$model.getImageUrl(val(&quot;fImg&quot;))"/>  
                             
                          <div class="caption"> 
                              <h5 bind-text="ref('fTitle')" class="text-black" xid="h52" />  
                              <div xid="div12"> 
                                <span class="text-danger" xid="span14">￥</span>  
                                <span bind-text="ref('fPrice')" class="text-danger" xid="span15" /> 
                              </div>  
                              <div xid="div13" class="text-muted"> 
                                <span xid="span24">月销</span>  
                                <span xid="span26" bind-text="ref('fRecord')" />  
                                <span xid="span27">笔</span>  
                                <span xid="span28" bind-text="ref('fPostage')" class="pull-right" /> 
                              </div> 
                            </div></div> 
                        </li> 
                      </ul> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-content-center x-pull-up" xid="div18"> 
                  <span class="x-pull-up-label" xid="span18">加载更多...</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content x-cards" xid="microContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="navContainer2" src="./micro.w" autoLoad="false"/> 
        </div>  
        <div class="x-contents-content x-cards" xid="foundContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="navContainer3" src="./found.w" autoLoad="false"/> 
        </div>  
        <div class="x-contents-content x-cards" xid="shoppingContent" onInactive="shoppingContentInactive"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="navContainer4" src='./cart.w' autoLoad="false"/> 
        </div>  
        <div class="x-contents-content x-cards" xid="userContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="navContainer5" src="./user.w" autoLoad="false"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="55"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card"
        tabbed="true" xid="buttonGroup1" style="height:55px;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top active"
          label="首页" xid="homeBtn" icon="icon-home" target="homeContent"> 
          <i xid="i1" class="icon-home icon"/>  
          <span xid="span1">首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="分类" xid="microBtn" icon="icon-radio-waves" target="microContent"> 
          <i xid="i2" class="icon-radio-waves icon"/>  
          <span xid="span2">分类</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" style="display:none;"
          label="发现" xid="foundBtn" icon="icon-eye" target="shoppingContent"> 
          <i xid="i3" class="icon icon-eye"/>  
          <span xid="span3">发现</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="购物车" xid="shoppingCartBtn" icon="icon-ios7-cart"
          target="shoppingContent"> 
          <i xid="i4" class="icon-ios7-cart icon"/>  
          <span xid="span4">购物车</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="我的商城" xid="userBtn" icon="icon-person" target="userContent"> 
          <i xid="i5" class="icon icon-person"/>  
          <span xid="span5">我的商城</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
