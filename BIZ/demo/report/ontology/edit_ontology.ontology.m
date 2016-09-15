<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fUNIT" data-type="String"/>  
  <relation name="fDWFZR" data-type="String"/>  
  <relation name="f2" data-type="String"/>  
  <relation name="fBH" data-type="String"/>  
  <relation name="f4" data-type="String"/>  
  <relation name="fXZQH" data-type="String"/>  
  <relation name="f9" data-type="String"/>  
  <relation name="f3" data-type="String"/>  
  <relation name="fBM" data-type="String"/>  
  <relation name="f5" data-type="String"/>  
  <relation name="f10" data-type="String"/>  
  <relation name="fX" data-type="String"/>  
  <relation name="fPZWH" data-type="String"/>  
  <relation name="fREFID" data-type="String"/>  
  <relation name="f7" data-type="String"/>  
  <relation name="fS" data-type="String"/>  
  <relation name="fTJFZR" data-type="String"/>  
  <relation name="fBCRQ" data-type="DateTime"/>  
  <relation name="fTBR" data-type="String"/>  
  <relation name="fZBJG" data-type="String"/>  
  <relation name="f11" data-type="String"/>  
  <relation name="fID" data-type="String"/>  
  <relation name="fY" data-type="String"/>  
  <relation name="fCODE" data-type="Integer"/>  
  <relation name="fN" data-type="String"/>  
  <relation name="fSF" data-type="String"/>  
  <relation name="fPZJG" data-type="String"/>  
  <relation name="f8" data-type="String"/>  
  <relation name="fYXQZ" data-type="String"/>  
  <relation name="fTBDW" data-type="String"/>  
  <relation name="f1" data-type="String"/>  
  <relation name="f6" data-type="String"/>  
  <relation name="fINDEXTYPE" data-type="String"/>  
  <concept name="R_BB" default-value-expr="guid()"> 
    <has-relation relation="fBM"> 
      <label language="zh_CN">表名</label> 
    </has-relation>  
    <has-relation relation="fBH"> 
      <label language="zh_CN">表号</label> 
    </has-relation>  
    <has-relation relation="fZBJG"> 
      <label language="zh_CN">制表机关</label> 
    </has-relation>  
    <has-relation relation="fPZJG"> 
      <label language="zh_CN">批准机关</label> 
    </has-relation>  
    <has-relation relation="fPZWH"> 
      <label language="zh_CN">批准文号</label> 
    </has-relation>  
    <has-relation relation="fYXQZ"> 
      <label language="zh_CN">有效期至</label> 
    </has-relation>  
    <has-relation relation="fDWFZR"> 
      <label language="zh_CN">单位负责人</label> 
    </has-relation>  
    <has-relation relation="fTJFZR"> 
      <label language="zh_CN">统计负责人</label> 
    </has-relation>  
    <has-relation relation="fTBR"> 
      <label language="zh_CN">填表人</label> 
    </has-relation>  
    <has-relation relation="fBCRQ" data-type="Date"> 
      <label language="zh_CN">报出日期</label> 
    </has-relation>  
    <has-relation relation="fXZQH"> 
      <label language="zh_CN">行政区划</label> 
    </has-relation>  
    <has-relation relation="fTBDW"> 
      <label language="zh_CN">填报单位</label> 
    </has-relation>  
    <has-relation relation="fN"> 
      <label language="zh_CN">年</label> 
    </has-relation>  
    <has-relation relation="fY"> 
      <label language="zh_CN">月</label> 
    </has-relation>  
    <has-relation relation="fSF"> 
      <label language="zh_CN">省份</label> 
    </has-relation>  
    <has-relation relation="fS"> 
      <label language="zh_CN">市</label> 
    </has-relation>  
    <has-relation relation="fX"> 
      <label language="zh_CN">县</label> 
    </has-relation>  
    <has-relation relation="f1"> 
      <label language="zh_CN">f1</label> 
    </has-relation>  
    <has-relation relation="f2"> 
      <label language="zh_CN">f2</label> 
    </has-relation>  
    <has-relation relation="f3"> 
      <label language="zh_CN">f3</label> 
    </has-relation>  
    <has-relation relation="f4"> 
      <label language="zh_CN">f4</label> 
    </has-relation>  
    <has-relation relation="f5"> 
      <label language="zh_CN">f5</label> 
    </has-relation>  
    <has-relation relation="f6"> 
      <label language="zh_CN">f6</label> 
    </has-relation>  
    <has-relation relation="f7"> 
      <label language="zh_CN">f7</label> 
    </has-relation>  
 	<has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">报表</label>  
     
  
</concept>  
  <concept name="R_ZB" default-value-expr="guid()"> 
    <has-relation relation="fCODE"> 
      <label language="zh_CN">代码</label> 
    </has-relation>  
    <has-relation relation="fUNIT"> 
      <label language="zh_CN">单位</label> 
    </has-relation>  
    <has-relation relation="fINDEXTYPE"> 
      <label language="zh_CN">指标</label> 
    </has-relation>  
    <has-relation relation="fREFID"> 
      <label language="zh_CN">主表关联</label> 
    </has-relation>  
    <has-relation relation="f1"> 
      <label language="zh_CN">f1</label> 
    </has-relation>  
    <has-relation relation="f2"> 
      <label language="zh_CN">f2</label> 
    </has-relation>  
    <has-relation relation="f3"> 
      <label language="zh_CN">f3</label> 
    </has-relation>  
    <has-relation relation="f4"> 
      <label language="zh_CN">f4</label> 
    </has-relation>  
    <has-relation relation="f5"> 
      <label language="zh_CN">f5</label> 
    </has-relation>  
    <has-relation relation="f6"> 
      <label language="zh_CN">f6</label> 
    </has-relation>  
    <has-relation relation="f7"> 
      <label language="zh_CN">f7</label> 
    </has-relation>  
    <has-relation relation="f8"> 
      <label language="zh_CN">f8</label> 
    </has-relation>  
    <has-relation relation="f9"> 
      <label language="zh_CN">f9</label> 
    </has-relation>  
    <has-relation relation="f10"> 
      <label language="zh_CN">f10</label> 
    </has-relation>  
    <has-relation relation="f11"> 
      <label language="zh_CN">f11</label> 
    </has-relation>   
 <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">指标</label>  
     
</concept>  




</model>
