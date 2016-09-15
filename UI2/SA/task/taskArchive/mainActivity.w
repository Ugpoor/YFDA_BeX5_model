<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="filterData" idColumn="id"> 
      <column label="begin" name="begin" type="Date" xid="xid1"/>  
      <column label="end" name="end" type="Date" xid="xid2"/>  
      <column name="id" type="String" xid="xid3"/>  
      <data xid="default1">[{"id":"1"}]</data>
    </div> 
  </div>  
  <div xid="view" class="container-fluid" style="margin-top: 100px;"> 
    <div xid="form" class="form-horizontal" style="max-width: 600px;margin: 0 auto;padding: 0 15px;"> 
      <h4 xid="title">任务归档是将指定时间范围内已结束的流程相关任务迁移到归档表中。</h4>  
      <h5 style="color:red;font-weight:bold">为保证数据的一致性，必须在没有其它用户登录期间执行任务归档相关操作！</h5>
      <div>任务归档涉及的表：SA_Task、SA_TaskRelation和SA_TokenInstance。</div>
      <ol xid="content"> 
        <li xid="first" style="margin-top:10px;"> 
          <div style="font-weight:bold">第一步：任务备份（必须）</div>  
          <div style="margin-top:5px">任务备份有两种方式：</div>  
          <div style="margin-left:30px">方式一：使用数据库管理工具将BeX5平台的系统库(system)或任务相关表进行备份；</div>  
          <div style="margin-left:30px">方式二：使用
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="任务备份" xid="bakBtn" onClick="bakBtnClick"> 
              <i xid="i2"/>  
              <span xid="span2">任务备份</span> 
            </a>进行备份，系统将自动把任务相关表备份到对应的备份表中（SA_Task_SysBak、SA_TaskRelation_SysBak和SA_TokenInstance_SysBak）。
          </div>  
          <div style="margin-top:5px">如果想还原任务数据，根据任务备份的方式不同，任务还原的方式也不同：</div>  
          <div style="margin-left:30px">方式一：如果任务备份使用的是方式一，任务还原也使用数据库管理工具实现；</div>  
          <div style="margin-left:30px">方式二：使用
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="任务还原" xid="resetBtn" onClick="resetBtnClick"> 
              <i xid="i3"/>  
              <span xid="span3">任务还原</span> 
            </a>进行还原（系统将任务相关表的所有数据清空后，把备份表中的数据还原到任务相关表）。
          </div> 
        </li>  
        <li xid="second" style="margin-top:10px;"> 
          <div style="font-weight:bold; margin-top:5px">第二步：任务归档</div> 
          <div>以流程实例的结束时间为依据，将指定范围内已经结束的流程实例相关的任务迁移到归档表中（SA_Task_Histroy、SA_TaskRelation_Histroy和SA_TokenInstance_Histroy）。</div> 
          <div xid="beginGroup" class="form-group" style="margin-top:10px;"> 
            <div class="input-group"> 
              <span class="input-group-addon">开始时间：</span>  
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="begin" bind-ref="filterData.ref('begin')"/> 
            </div> 
          </div>  
          <div xid="endGroup" class="form-group"> 
            <div class="input-group"> 
              <span class="input-group-addon">结束时间：</span>  
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="end" bind-ref="filterData.ref('end')"/> 
            </div> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-primary pull-right"
            label="任务归档" xid="archiveBtn" onClick="archiveBtnClick"> 
            <i xid="i1"/>  
            <span xid="span1">任务归档</span> 
          </a> 
        </li> 
      </ol>  
    </div> 
  </div> 
</div>
