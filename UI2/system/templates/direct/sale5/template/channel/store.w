<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="名称" name="name" type="String" xid="xid1"/>  
      <column label="地址" name="address" type="String" xid="xid2"/>  
      <column label="电话" name="tel" type="String" xid="xid3"/>  
      <data xid="default3">[{"id":"1","imgSrc":"./img/pic1.jpg","name":"HappyMiss鲜花饼烘焙坊","address":"五华区东风西路顺城购物中心负一楼","tel":"0871-65811882"},{"id":"2","imgSrc":"./img/pic2.jpg","name":"莱茵家乐自助餐","address":"五华区人民中路新西南商业大厦六楼 ","tel":"0871-65368687"},{"id":"3","imgSrc":"./img/pic3.jpg","name":"优私呆素食自助","address":"五华区祥云街59号银佳大厦19楼","tel":"0871-63389883"},{"id":"4","imgSrc":"./img/pic4.jpg","name":"城市花园","address":"五华区正义路36号景星恒隆百货6楼","tel":"0871-63633899"},{"id":"5","imgSrc":"./img/pic5.jpg","name":"莱莎公爵泰国海鲜火锅","address":"五华区威远街168号金鹰B座6楼6-02、6-03","tel":"0871-63104908/63161001"},{"id":"6","imgSrc":"./img/pic6.jpg","name":"芭堤雅泰国海鲜餐厅","address":"五华区霖雨路101号","tel":"0871-65123399"},{"id":"7","imgSrc":"./img/pic7.jpg","name":"莲泰泰国料理（正义坊店）","address":"五华区正义路正义坊购物中心北馆3楼","tel":"0871-68128899"},{"id":"8","imgSrc":"./img/pic8.jpg","name":"大哥笑自助烤肉","address":"盘龙区人民东路196号（新文化宫美食广场B1楼）","tel":"0871-63363537"},{"id":"9","imgSrc":"./img/pic9.jpg","name":"优昙逻树素食餐厅","address":"盘龙区欣都龙城V.CPark购物中心1栋2楼汉堡王旁边 ","tel":"18287163511"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li class="col-xs-12" xid="li1" bind-click="open"> 
            <div class="thumbnail media"> 
              <div class="media-left"> 
                <img bind-attr-src="$model.getImageUrl($object)" class="x-img1"
                  bind-click="open"/> 
              </div>  
              <div class="media-body"> 
                <h4 bind-text="ref('name')" class="text-black media-heading"><![CDATA[]]></h4>  
                <span bind-text="ref('address')"/>  
                <h5 class="text-danger" bind-text="ref('tel')"><![CDATA[]]></h5> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
