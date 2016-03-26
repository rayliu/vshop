<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:132px;top:75px;"
    onModelConstruct="" onLoad="modelLoad" onunLoad="modelUnLoad" onParamsReceive="modelParamsReceive"> 
    
    
    
    <div component="$UI/system/components/justep/data/data" autoLoad="true" queryAction="queryCarousel" tableName="轮播图片表" url="/eeda/shop"
      xid="轮播图片表" idColumn="编号" onCustomRefresh="轮播图片表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid1"/>  
      <column label="图片图片" name="图片外链" type="String" xid="xid2"/>  
      <column label="链接地址" name="图片超链接" type="String" xid="xid9"/> 
    <master xid="default13" data="轮播图片表"></master></div>  
    
    
    <!-- <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="baasCarouselData" queryAction="queryCarousel" tableName="carousel" url="/eeda/shop"
      idColumn="id"> 
      <column label="id" name="id" type="String" xid="default5"/>  
      <column label="fImgUrl" name="fImgUrl" type="String" xid="default6"/>  
      <column label="fUrl" name="fUrl" type="String" xid="default7"/> 
    </div>   -->
    
    
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="商品表" idColumn="编号" limit="6" onCustomRefresh="商品表CustomRefresh"> 
      <column label="编号" name="编号" type="String" xid="xid8"/>  
      <column label="商店编号" name="商店编号" type="String" xid="xid10"/>  
      <column label="商店名称" name="商店名称" type="String" xid="xid11"/>  
      <column label="标题" name="标题" type="String" xid="xid12"/>  
      <column label="图片外链" name="图片外链" type="String" xid="xid13"/>  
      <column label="现价" name="现价" type="Float" xid="xid14"/>  
      <column label="原价" name="原价" type="Float" xid="xid15"/>  
      <master data="商品表" xid="default1"/>  
      <column label="送货方式" name="送货方式" type="String" xid="xid5"/>  
      <column label="销量" name="销量" type="String" xid="xid6"/>  
      <column label="地址" name="地址" type="String" xid="xid7"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-content tb-trans"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents2" swipe="false" wrap="false" slidable="false" onActiveChange="contents2ActiveChange"> 
        <div class="x-contents-content x-cards" xid="homeContent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-has-iosstatusbar"> 
            <div class="x-panel-top" xid="top1"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="titleBar1"> 
                <div class="x-titlebar-left" xid="div6"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" icon="img:./main/img/logo.png"
                    style="width:40px;"> 
                    <img src="./main/img/logo.png" xid="image1" height="38px"
                      width="38px"/> 
                  </a> 
                </div>  
                <div class="x-titlebar-title tb-searchBox" xid="div1" bind-click="searchBtnClick"> 
                  <span><![CDATA[搜索]]></span>  
                  <i xid="i10" class="icon-ios7-search-strong"/>  
                  <div/> 
                </div>
 
                <div class="x-titlebar-right reverse" xid="div5"><a component="$UI/system/components/justep/button/button" class="btn x-yellow btn-block" xid="搜索" icon="icon-ios7-search-strong" style="height:100%;width:70%;" bind-click="searchBtnClick">
   <i xid="i6" class="icon-android-search icon-ios7-search-strong"></i>
   <span xid="span6"></span></a></div> 
              </div> 
            </div>  
            <div class="x-panel-content  x-scroll-view" xid="content3" style="bottom: 0px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView" onPullDown="scrollViewPullDown"> 
                <div class="x-content-center x-pull-down container" style="display:none;"
                  xid="div16"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i9"/>  
                  <span class="x-pull-down-label" xid="span17">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div17"> 
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel1"> 
                    <div component="$UI/system/components/bootstrap/carousel/carousel"
                      class="x-carousel carousel" xid="carousel1" auto="true" style="height:170px;"> 
                      <ol class="carousel-indicators" xid="ol1" style="height:14px;"/>  
                      <div class="x-contents carousel-inner" role="listbox"
                        component="$UI/system/components/justep/contents/contents"
                        active="0" slidable="true" wrap="true" swipe="true" xid="contentsImg"
                        routable="false"> 
                        <div class="x-contents-content" xid="content2"> 
                          <img alt="" xid="image13" bind-click="openPageClick"  bind-attr-src="轮播图片表.ref('图片外链')"
                            class="tb-img1" pagename="" style="height:170px;" align="middle"/> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel2"> 
                    <table class="table tb-menu" component="$UI/system/components/bootstrap/table/table"
                      xid="table1" style="height:78px;"> 
                      <tbody class="x-list-template" xid="listTemplate2"> 
                        <tr xid="tr1"> 
                          <td bind-click="openPageClick" pagename="./list.w"
                            xid="td1"> 
                            <div class="text-center" xid="div2"> 
                              <img src="./img/main/1.png" alt="" class="img-responsive center-block tb-img5"
                                pagename="./class.w" xid="image3" style="height:45px;width:45px;"
                                dir="ltr" height="450px"/>  
                              <span xid="span7"><![CDATA[全部分类]]></span> 
                            </div> 
                          </td>  
                          <td bind-click="openPageClick" pagename="./list.w"
                            xid="td2"> 
                            <div class="text-center" xid="div3"> 
                              <img src="./img/main/2.png" alt="" xid="image1"
                                class="img-responsive center-block tb-img5" style="height:45px;width:45px;"
                                height="60px"/>  
                              <span xid="span9"><![CDATA[个人中心]]></span> 
                            </div> 
                          </td>  
                          <td bind-click="openPageClick" pagename="./list.w"
                            xid="td3"> 
                            <div class="text-center" xid="div4"> 
                              <img src="./img/main/3.png" alt="" xid="image2"
                                class="img-responsive center-block tb-img5" style="height:45px;width:45px;"
                                height="60px"/>  
                              <span xid="span10"><![CDATA[大闸蟹]]></span> 
                            </div> 
                          </td>  
                          <td bind-click="openPageClick" pagename="./list.w"
                            xid="td4"> 
                            <div class="text-center" xid="div7"> 
                              <img alt="" xid="image8" src="./img/main/4.png"
                                class="img-responsive center-block tb-img5" style="height:45px;width:45px;"
                                height="60px"/>  
                              <span xid="span11"><![CDATA[积分商城]]></span> 
                            </div> 
                          </td> 
                        </tr> 
                      </tbody> 
                    </table> 
                  </div>  
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel5"> 
                    <h4 xid="h41" class="list-group-item text-black"><![CDATA[精选商品]]></h4>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list x-flex" xid="list1" data="商品表" limit="10" disablePullToRefresh="false"
                      disableInfiniteLoad="false" bind-click="listClick"> 
                      <ul class="x-list-template" xid="listTemplateUl1"> 
                        <li xid="li1" class="col-xs-12"> 
                          <div class="x-card"> 
                            <div align="center" class=""> 
                              <img alt="" class="image-wall tb-img" xid="image18"
                                bind-attr-src="$object.val('图片外链')"/> 
                            </div>  
                            <div class="caption"> 
                              <h5 class="text-black" xid="h52" style="font-size:15px"
                                bind-text=" $object.val(&quot;标题&quot;)"/>  
                              <div xid="div12" style="font-size:25px"> 
                                <span class="text-danger" xid="span14">￥</span>  
                                <span class="text-danger" xid="span15" bind-text=" $object.val(&quot;现价&quot;)"/> 
                              </div>  
                              <div xid="div13" class="text-muted"> 
                                <span xid="span24">月销</span>  
                                <span xid="span26" bind-text=" $object.val(&quot;销量&quot;)"/>  
                                <span xid="span27">笔</span>  
                                <span xid="span28" class="pull-right" bind-text=" $object.val(&quot;送货方式&quot;)"/> 
                              </div> 
                            </div>  
                            <hr style="border-bottom:1px dashed;" class="text-muted"/> 
                          </div> 
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
            class="x-window-container" xid="navContainer4" src="./cart.w" autoLoad="false"/> 
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
          label="分类" xid="microBtn" icon="icon-android-storage" target="microContent"> 
          <i xid="i2" class="icon icon-android-storage"/>  
          <span xid="span2">分类</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          style="display:none;" label="发现" xid="foundBtn" icon="icon-eye" target="shoppingContent"> 
          <i xid="i3" class="icon icon-eye"/>  
          <span xid="span3">发现</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="购物车" xid="shoppingCartBtn" icon="icon-ios7-cart" target="shoppingContent"
          onClick="shoppingCartBtnClick"> 
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
