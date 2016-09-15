<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <fn name="encryptPassword" category="通用函数" code-model="/system/logic/code" code="CommonFn.encryptPassword"
    type="List"> 
    <label language="zh_CN">密码加密</label>  
    <parameter name="password" type="String"/> 
  </fn>  
  <fn name="list" category="通用函数" code-model="/system/logic/code" code="CommonFn.list"
    type="List"> 
    <label language="zh_CN">创建List</label>  
    <parameter name="objs" type="Object..."/> 
  </fn>  
  <fn name="guid" category="通用函数" code-model="/system/logic/code" code="CommonFn.guid"
    type="String"> 
    <label language="zh_CN">生成32位的唯一标识</label> 
  </fn>  
  <fn name="shortGuid" category="通用函数" code-model="/system/logic/code" code="CommonFn.shortGuid"
    type="String"> 
    <label language="zh_CN">生成19位的唯一标识</label> 
  </fn>  
  <!-- 类型转换 -->  
  <fn name="toString" category="通用函数" code-model="/system/logic/code" code="CommonFn.toString1"
    type="String"> 
    <label language="zh_CN">转换为字符串</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="toInteger" category="通用函数" code-model="/system/logic/code" code="CommonFn.toInteger"
    type="Integer"> 
    <label language="zh_CN">转换为整型</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="toFloat" category="通用函数" code-model="/system/logic/code" code="CommonFn.toFloat"
    type="Float"> 
    <label language="zh_CN">转换为Float</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  
  <fn name="toDecimal" category="通用函数" code-model="/system/logic/code" code="CommonFn.toDecimal"
    type="Decimal"> 
    <label language="zh_CN">转换为高精度</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="toDate" category="通用函数" code-model="/system/logic/code" code="CommonFn.toDate"
    type="Date"> 
    <label language="zh_CN">转换为日期</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="toDateTime" category="通用函数" code-model="/system/logic/code" code="CommonFn.toDateTime"
    type="DateTime"> 
    <label language="zh_CN">转换为日期时间</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="toTime" category="通用函数" code-model="/system/logic/code" code="CommonFn.toTime"
    type="Time"> 
    <label language="zh_CN">转换为时间</label>  
    <parameter name="obj" type="Object"/> 
  </fn>  
  <fn name="dateToMillisecond" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.dateToMillisecond" type="long"> 
    <label language="zh_CN">将日期时间转换成毫秒</label>  
    <parameter name="d" type="Date"/> 
  </fn>  
  <fn name="dateDiff" category="通用函数" code-model="/system/logic/code" code="CommonFn.dateDiff"
    type="long"> 
    <label language="zh_CN">返回指定的 startdate 和 enddate 之间所跨的指定 datepart 边界的计数（带符号的整数）</label>  
    <parameter name="String" type="datePart"/>  
    <parameter name="Date" type="startDate"/>  
    <parameter name="Date" type="endDate"/> 
  </fn>  
  <fn name="toChineseNumber" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.toChineseNumber" type="String"> 
    <label language="zh_CN">转换为中文数字</label>  
    <parameter name="num" type="Number"/>  
    <parameter name="isCaptial" type="Boolean"/> 
  </fn>  
  <fn name="toChineseMoney" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.toChineseMoney" type="String"> 
    <label language="zh_CN">转换为人民币数值</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <!-- 数值操作 -->  
  <fn name="ceil" category="通用函数" code-model="/system/logic/code" code="CommonFn.ceil"
    type="Integer"> 
    <label language="zh_CN">大于num的最小整数</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <fn name="floor" category="通用函数" code-model="/system/logic/code" code="CommonFn.floor"
    type="Integer"> 
    <label language="zh_CN">小于num的最大整数</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <fn name="remainder" category="通用函数" code-model="/system/logic/code" code="CommonFn.remainder"
    type="Integer"> 
    <label language="zh_CN">余数</label>  
    <parameter name="dividend" type="Number"/>  
    <parameter name="divisor" type="Number"/> 
  </fn>  
  <fn name="round" category="通用函数" code-model="/system/logic/code" code="CommonFn.round"
    type="Integer"> 
    <label language="zh_CN">四舍五入</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <fn name="abs" category="通用函数" code-model="/system/logic/code" code="CommonFn.abs"
    type="Number"> 
    <label language="zh_CN">绝对值</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <fn name="sqrt" category="通用函数" code-model="/system/logic/code" code="CommonFn.sqrt"
    type="Number"> 
    <label language="zh_CN">平方根</label>  
    <parameter name="num" type="Number"/> 
  </fn>  
  <fn name="power" category="通用函数" code-model="/system/logic/code" code="CommonFn.power"
    type="Number"> 
    <label language="zh_CN">开方</label>  
    <parameter name="num" type="Number"/>  
    <parameter name="n" type="Number"/> 
  </fn>  
  <!-- 字符串操作 -->  
  <fn name="concat" category="通用函数" code-model="/system/logic/code" code="CommonFn.concat"
    type="String"> 
    <label language="zh_CN">连接字符串</label>  
    <parameter name="strs" type="String..."/> 
  </fn>  
  <fn name="upper" category="通用函数" code-model="/system/logic/code" code="CommonFn.upper"
    type="String"> 
    <label language="zh_CN">大写</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="lower" category="通用函数" code-model="/system/logic/code" code="CommonFn.lower"
    type="String"> 
    <label language="zh_CN">小写</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="startsWith" category="通用函数" code-model="/system/logic/code" code="CommonFn.startsWith"
    type="Boolean"> 
    <label language="zh_CN">是否有指定前缀</label>  
    <parameter name="str" type="String"/>  
    <parameter name="prefix" type="String"/> 
  </fn>  
  <fn name="endsWith" category="通用函数" code-model="/system/logic/code" code="CommonFn.endsWith"
    type="Boolean"> 
    <label language="zh_CN">是否有指定后缀</label>  
    <parameter name="str" type="String"/>  
    <parameter name="suffix" type="String"/> 
  </fn>  
  <fn name="trim" category="通用函数" code-model="/system/logic/code" code="CommonFn.trim"
    type="String"> 
    <label language="zh_CN">去掉两端空白字符</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="ltrim" category="通用函数" code-model="/system/logic/code" code="CommonFn.ltrim"
    type="String"> 
    <label language="zh_CN">去掉左边空白字符</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="rtrim" category="通用函数" code-model="/system/logic/code" code="CommonFn.rtrim"
    type="String"> 
    <label language="zh_CN">去掉右边空白字符</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="stringLength" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.stringLength" type="Integer"> 
    <label language="zh_CN">字符长度</label>  
    <parameter name="str" type="String"/> 
  </fn>  
  <fn name="replaceFirst" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.replaceFirst" type="String"> 
    <label language="zh_CN">替换第一次出现的子串</label>  
    <parameter name="srcString" type="String"/>  
    <parameter name="regex" type="String"/>  
    <parameter name="replacement" type="String"/> 
  </fn>  
  <fn name="replaceAll" category="通用函数" code-model="/system/logic/code" code="CommonFn.replaceAll"
    type="String"> 
    <label language="zh_CN">替换子串</label>  
    <parameter name="srcString" type="String"/>  
    <parameter name="regex" type="String"/>  
    <parameter name="replacement" type="String"/> 
  </fn>  
  <fn name="stringPosition" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.stringPosition" type="String"> 
    <label language="zh_CN">查找子串的位置</label>  
    <parameter name="srcString" type="String"/>  
    <parameter name="dst" type="String"/> 
  </fn>  
  <fn name="subString" category="通用函数" code-model="/system/logic/code" code="CommonFn.subString"
    type="String"> 
    <label language="zh_CN">截取子串</label>  
    <parameter name="srcString" type="String"/>  
    <parameter name="start" type="Integer"/>  
    <parameter name="end" type="Integer"/> 
  </fn>  
  <fn name="format" category="通用函数" code-model="/system/logic/code" code="CommonFn.format"
    type="String"> 
    <label language="zh_CN">字符串格式化</label>  
    <parameter name="str" type="String"/>  
    <parameter name="values" type="Object..."/> 
  </fn>  
  <fn name="decimalFormat" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.decimalFormat" type="String"> 
    <label language="zh_CN">高精度数值格式化</label>  
    <parameter name="value" type="Decimal"/>  
    <parameter name="pattern" type="String"/> 
  </fn>  
  <fn name="dateFormat" category="通用函数" code-model="/system/logic/code" code="CommonFn.dateFormat"
    type="String"> 
    <label language="zh_CN">日期格式化</label>  
    <parameter name="value" type="Object"/>  
    <parameter name="pattern" type="String"/> 
  </fn>  
  <!-- 日期时间 -->  
  <fn name="currentDateTime" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.currentDateTime" type="DateTime"> 
    <label language="zh_CN">当前日期时间</label> 
  </fn>  
  <fn name="currentDate" category="通用函数" code-model="/system/logic/code" code="CommonFn.currentDate"
    type="Date"> 
    <label language="zh_CN">当前日期</label> 
  </fn>  
  <fn name="currentTime" category="通用函数" code-model="/system/logic/code" code="CommonFn.currentTime"
    type="Time"> 
    <label language="zh_CN">当前时间</label> 
  </fn>  
  <fn name="yearOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.yearOf"
    type="Integer"> 
    <label language="zh_CN">获取年</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="monthOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.monthOf"
    type="Integer"> 
    <label language="zh_CN">获取月</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="dayOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.dayOf"
    type="Integer"> 
    <label language="zh_CN">获取日</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="hourOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.hourOf"
    type="Integer"> 
    <label language="zh_CN">获取小时</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="minuteOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.minuteOf"
    type="Integer"> 
    <label language="zh_CN">获取分钟</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="secondOf" category="通用函数" code-model="/system/logic/code" code="CommonFn.secondOf"
    type="Integer"> 
    <label language="zh_CN">获取秒</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="firstDateOfMonth" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.firstDateOfMonth" type="Date"> 
    <label language="zh_CN">所在月第一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="firstDateOfWeek" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.firstDateOfWeek" type="Date"> 
    <label language="zh_CN">所在星期第一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="firstDateOfYear" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.firstDateOfYear" type="Date"> 
    <label language="zh_CN">所在年第一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="lastDateOfMonth" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.lastDateOfMonth" type="Date"> 
    <label language="zh_CN">所在月最后一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="lastDateOfWeek" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.lastDateOfWeek" type="Date"> 
    <label language="zh_CN">所在星期最后一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="lastDateOfYear" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.lastDateOfYear" type="Date"> 
    <label language="zh_CN">所在年最后一天</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="dayOfWeek" category="通用函数" code-model="/system/logic/code" code="CommonFn.dayOfWeek"
    type="Integer"> 
    <label language="zh_CN">星期</label>  
    <parameter name="date" type="Date"/> 
  </fn>  
  <fn name="addMonths" category="通用函数" code-model="/system/logic/code" code="CommonFn.addMonths"
    type="date"> 
    <label language="zh_CN">增加月</label>  
    <parameter name="date" type="Date"/>  
    <parameter name="num" type="int"/> 
  </fn>  
  <fn name="addDays" category="通用函数" code-model="/system/logic/code" code="CommonFn.addDays"
    type="date"> 
    <label language="zh_CN">增加日</label>  
    <parameter name="date" type="Date"/>  
    <parameter name="num" type="int"/> 
  </fn>  
  <fn name="addHours" category="通用函数" code-model="/system/logic/code" code="CommonFn.addHours"
    type="date"> 
    <label language="zh_CN">增加小时</label>  
    <parameter name="date" type="Date"/>  
    <parameter name="num" type="int"/> 
  </fn>  
  <!-- 路径操作， -->  
  <fn name="extOfFile" category="通用函数" code-model="/system/logic/code" code="CommonFn.extOfFile"
    type="String"> 
    <label language="zh_CN">获取后缀名</label>  
    <parameter name="path" type="String"/> 
  </fn>  
  <fn name="pathOfFile" category="通用函数" code-model="/system/logic/code" code="CommonFn.pathOfFile"
    type="String"> 
    <label language="zh_CN">获取路径</label>  
    <parameter name="path" type="String"/> 
  </fn>  
  <fn name="nameOfFile" category="通用函数" code-model="/system/logic/code" code="CommonFn.nameOfFile"
    type="String"> 
    <label language="zh_CN">获取文件名</label>  
    <parameter name="path" type="String"/> 
  </fn>  
  <fn name="nameNoExtOfFile" category="通用函数" code-model="/system/logic/code"
    code="CommonFn.nameNoExtOfFile" type="String"> 
    <label language="zh_CN">获取不含扩展名的文件名</label>  
    <parameter name="path" type="String"/> 
  </fn>  
  <fn name="iff" category="通用函数" code-model="/system/logic/code"
  	code="CommonFn.iff" type="Object">
  	<parameter name="condition" type="Boolean"/>
  	<parameter name="trueResult" type="Object"/>
  	<parameter name="falseReault" type="Object"/>
    <label language="zh_CN">条件函数</label> 
  </fn> 
  <fn name="getInputStreamByFile" category="通用函数" code-model="/system/logic/code"
  	code="CommonFn.getInputStreamByFile" type="Object">
  	<parameter name="path" type="String"/>
    <label language="zh_CN">获取文件流</label> 
  </fn> 
</model>
