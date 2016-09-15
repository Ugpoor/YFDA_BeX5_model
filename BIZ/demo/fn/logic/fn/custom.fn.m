<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <fn name="getStock" category="自定义函数" code-model="/demo/fn/logic/code" code="CustomFn.getStock"
    type="Integer">
    <label language="zh_CN">获取某个产品的库存数量</label>  
    <parameter type="String" name="productName"/> 
  </fn>  
  <fn name="isStockOver" category="自定义函数" code-model="/demo/fn/logic/code"
    code="CustomFn.isStockOver" type="Boolean">
    <label language="zh_CN">判断产品数量是否超出库存</label>  
    <parameter type="String" name="productName"/>
    <parameter type="Integer" name="quantity"/> 
  </fn> 
</model>
