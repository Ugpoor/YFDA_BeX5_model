<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:108px;top:222px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <h1 xid="h11" style="text-align:center;">表单标题</h1>
    </div>  
    <div class="x-panel-content" xid="content1" style="text-align:center;"> 
      <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
        xid="table1"> 
        <tr xid="tr2"> 
          <td xid="td1">用户名：</td>  
          <td xid="td2">
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1"/>
          </td> 
        </tr>  
        <tr> 
          <td>密码：</td>  
          <td>
            <input type="password" component="$UI/system/components/justep/input/input"
              class="form-control" xid="input2"/>
          </td> 
        </tr>  
        <tr> 
          <td>民族：</td>  
          <td>
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select1"> 
              <option selected="selected">汉族</option>  
              <option selected="selected">汉族</option>  
              <option selected="selected">汉族</option> 
            </select>
          </td> 
        </tr>  
        <tr> 
          <td>常用地址：</td>  
          <td>
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1"/>
          </td> 
        </tr> 
      </table>  
      <span>
        <button>提交</button>
        <button>重置</button>
      </span> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>
</div>
