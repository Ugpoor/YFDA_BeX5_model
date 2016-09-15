/**
 * officeViewer 相关
 */
define(function(require){
	var justep = require('$UI/system/lib/justep');

	/*cab文件的动态版本*/
	var _ocx_version = "8.0.0.398";
	
	var $OV,OV;
	if (!$OV) $OV =  function (id) {
		var element = document.getElementById(id);
		if (element.OV_OfficeViewer_extended) return element;
		element.OV_OfficeViewer_extended = true;
		element.resCellRegExp_t = /\.\w*$/;
		element.resCellRegExp_f = /\.[^\.]+$/;
		return OV.extend(element, OV.OfficeViewer);
	};
	
	if (!OV) OV = (function() {
		var ProgramID = {
			Word:		"Word.Application",
			Excel:		"Excel.Application",
			PowerPoint:	"PowerPoint.Application",
			Visio:		"Visio.Application",
			Project:	"MSProject.Application"
		};
		
		function extend(original, extended) {
			for (var key in (extended || {})) {
				if(typeof original[key] == "undefined"){
					original[key] = extended[key];
				}
			}
			return original;
		}
		
		function IsWin(){
			var UserAgent = navigator.userAgent;
			if(UserAgent.indexOf("Windows NT")>-1){
				return true;
			}else{
				return false;
			}
		}
		
		function IsIE(){
			if(justep.Browser.IE){
				return true;
			}else {
				return false;
			}
		}
		function getMultiLine(fn) {
			var lines = new String(fn);
			if(lines.indexOf("/*ie") == -1){
				lines = lines.substring(lines.indexOf("/*") + 2, lines.lastIndexOf("*/"));
			}else{
				if(OV.IsWin()){
					if(OV.IsIE()){
						lines = lines.substring(lines.indexOf("/*ie") + 4, lines.lastIndexOf("ie*/"));
					}else{
						lines = lines.substring(lines.indexOf("/*webkit") + 8, lines.lastIndexOf("webkit*/"));
					}
				}else{
					alert(new justep.Message(justep.Message.JUSTEP232002).getMessage());
				}
			}
			return lines;
		}
		function trim(str) {
			return str.replace(/^\s+|\s+$/g, '');
		}
		function substitute(str, object, regexp) {
			return str.replace(regexp || (/\\?\{([^{}]+)\}/g), function(match, name) {
				if (match.charAt(0) == '\\') return match.slice(1);
				return OV.isClear(object[name]) ? '' : object[name];
			});
		}
		function truncate(str, length, truncation) {
			length = length || 30;
			truncation = OV.isClear(truncation) ? '...' : truncation;
			return str.length > length ?
				str.slice(0, length - truncation.length) + truncation : String(str);
		}
		function tryThese(source) {
			for (var i = OV.isFunction(source) ? 0 : 1, l = arguments.length; i < l; i++) {
				try {
					return arguments[i](OV.isFunction(source) ? undefined : source);
				} catch(e) {}
			}
			return null;
		}
		function escape(str) {
			var lines = new String(str);
			return lines.replace(/\&/g, "&amp;")
				.replace(/\ /g, "&nbsp;")
				.replace(/\t/g, "&nbsp;&nbsp;&nbsp;&nbsp;")
				.replace(/\=/g, "&#61;")
				.replace(/\</g, "&lt;")
				.replace(/\>/g, "&gt;")
				.replace(/\r\n/g, "<br/>")
				.replace(/\r/g, "<br/>")
				.replace(/\n/g, "<br/>")
				.replace(/\'/g, "&#39;")
				.replace(/\"/g, "&quot;");
		}
		function getClass(object) {
			return Object.prototype.toString.call(object)
				.match(/^\[object\s(.*)\]$/)[1];
		}
		function isArray(object) {
			return OV.getClass(object) === "Array";
		}
		function isString(object) {
			return OV.getClass(object) === "String";
		}
		function isNumber(object) {
			return OV.getClass(object) === "Number";
		}
		function isFunction(object) {
			return typeof object === "function";
		}
		function isObject(object) {
			return typeof object === 'object';
		}
		function isUndefined(object) {
			return typeof object === "undefined";
		}
		function isNull(object) {
			return object == null;
		}
		function isClear(object) {
			return OV.isUndefined(object) || OV.isNull(object);
		}
		function isJSON(str) {
			return OV.isString(str) && Boolean(str.length) && 
				/^[\],:{}\s]*$/.test(str.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@').
				replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
				replace(/(?:^|:|,)(?:\s*\[)+/g, '')) && !/^[\d\s\+\-\*\/]*$/.test(str);
		}
		var OfficeViewer = (function() {
			/**
			 * 断言函数
			 * @expr 断言表达式
			 * @msg 错误信息
			 * @return 返回断言表达式的值
			 */
			function Assert(expr, msg) {
				if (expr === false) alert(new justep.Message(justep.Message.JUSTEP232003,msg).getMessage());
				return expr;
			}
			/**
			 * 获取OfficeViewer的classid
			 * @retrun 返回OfficeViewer的classid
			 */
			function OfficeViewerClassID() {
				return "clsid:7677E74E-5831-4C9E-A2DD-9B1EF9DF2DB4";
			}
			
			function OfficeViewerClsID() {
				return "7677E74E-5831-4C9E-A2DD-9B1EF9DF2DB4";
			}
			/**
			 * 判断是否是OfficeViewer
			 * @retrun 返回是否是OfficeViewer
			 */
			function IsOfficeViewer() {
				return this.classid == this.OfficeViewerClassID() || this.getAttribute('clsid') == "{"+this.OfficeViewerClsID()+"}";
			}
			
			/**
			 * 创建OfficeViewer
			 * @width 宽度，默认650
			 * @height 高度，默认450
			 * @return 返回是否执行了创建操作
			 */
			function CreateOfficeViewer(width, height) {
				var fn = function() {
					/*ie
					<object id="{id}" classid="{classid}" width="{width}" height="{height}" 
						codebase="{codebase}">
						<param name="BorderColor" value="-2147483632"/>
						<param name="BackColor" value="-2147483643"/>
						<param name="ForeColor" value="-2147483640"/>
						<param name="TitlebarColor" value="-2147483635"/>
						<param name="TitlebarTextColor" value="-2147483634"/>
						<param name="BorderStyle" value="0"/>
						<param name="Titlebar" value="0"/>
						<param name="Toolbars" value="{toolbar}"/>
						<param name="Menubar" value="0"/>
						<param name="ActivationPolicy" value="1"/>
						<param name="FrameHookPolicy" value="0"/>
						<param name="MenuAccelerators" value="1"/>
					</object>
					ie*/
					
					/*webkit
					<object id="{id}" clsid="{clsid}" width="{width}" height="{height}" 
						codebase="{codebase}"
						type="application/justep-activex" 
						param_BorderColor="-2147483632"
						param_BackColor="-2147483643"
						param_BorderColor="-2147483643"
						param_ForeColor="-2147483632"
						param_TitlebarColor="-2147483632"
						param_TitlebarTextColor="-2147483632"
						param_Titlebar="1"
						param_Toolbars="{toolbar}"
						param_BorderStyle="1"
						param_BorderColor="-2147483632"
						param_LicenseName="3AYYK3L-B3V5RU"
						param_LicenseCode="EDO8-550D-124A-ABEB"
						param_Menubar="1"
						param_ActivationPolicy="1"
						param_FrameHookPolicy="1"
						param_MenuAccelerators="1">
					</object>
					webkit*/
					
				}
				if (!this.IsOfficeViewer()) {
					this.removeAttribute('OV_OfficeViewer_extended');
					var s = this.outerHTML;
					var version = OV.isClear(_ocx_version) ? 0 : _ocx_version;
					var codebaseUrl = require.toUrl("$UI/system/service/doc/office/office2.cab#version="+version);
					if(OV.IsIE()){
						this.outerHTML = OV.substitute(OV.getMultiLine(fn), {
							id: this.id,
							classid: this.OfficeViewerClassID(),
							width: OV.isClear(width) ? 650 : width,
							height: OV.isClear(height) ? 450 : height,
							codebase:codebaseUrl,
							toolbar: $('#'+this.id).attr('showToolbar') == 'false' ? 0 : 1		
						});
					}else{
						this.outerHTML = OV.substitute(OV.getMultiLine(fn), {
							id: this.id,
							clsid: "{"+this.OfficeViewerClsID()+"}",
							width: OV.isClear(width) ? 650 : width,
							height: OV.isClear(height) ? 450 : height,
							codebase:codebaseUrl,
							toolbar: $('#'+this.id).attr('showToolbar') == 'false' ? 0 : 1
						});
					}
					$OV(this.id).$outerHTML = s;
					if(justep.Browser.IE){
						//修复ie下对object的100%属性感知缺陷,刺激重绘一次
						$('html').css('overflow',$('html').css('overflow'));
					}
					var OVObj = $OV(this.id);
					OVObj.LicenseName = "3AYYK3L-B3V5RU";
					OVObj.LicenseCode = "EDO8-550D-124A-ABEB";
					if(justep.Browser.IE){
						OVObj.WordDisableDragAndDrop(true);
						OVObj.DisableFileCommand(1, true);// wdUIDisalbeOfficeButton
						OVObj.DisableFileCommand(2, true);// wdUIDisalbeNew
						OVObj.DisableFileCommand(4, true);// wdUIDisalbeOpen
						OVObj.DisableFileCommand(16, true);// wdUIDisalbeSave
						OVObj.DisableFileCommand(32, true);// wdUIDisalbeSaveAs1
						OVObj.DisableFileCommand(64, true);// wdUIDisalbeSaveAsAttachment
						OVObj.DisableFileCommand(256, true);// wdUIDisalbeClose
						OVObj.DisableFileCommand(4096, true); // wdUIDisalbeSaveAsMenu
						//this.ShowRibbonTitlebar(false); 这个函数和 f11全屏有冲突
						OVObj.ShowMenubar(false);
						OVObj.DisableStandardCommand(1,true); //cmdTypeSave = 0x00000001,
						OVObj.DisableStandardCommand(2,true); //cmdTypeClose = 0x00000002,
					}
					
					
					return true;
				} else {
					return false;
				}
			}
			
			function DisablePrint(disable){
				if(justep.Browser.IE){
					this.DisableFileCommand(512, disable); // wdUIDisalbePrint (Ctrl+P)
					this.DisableFileCommand(1024, disable); // wdUIDisalbePrintQuick
					this.DisableFileCommand(2048, disable); // wdUIDisalbePrintPreview
					this.DisableStandardCommand(4,disable); //cmdTypePrint = 0x00000004
					try{
						this.WordDisablePrintHotKey(disable);
					}catch(e){};
				}
			}
			
			function GetProgIDByDocType(docType){
				var progID = OV.ProgramID.Word;
				if(docType.indexOf('doc')!=-1){
					progID = OV.ProgramID.Word;
				}else if(docType.indexOf('xls')!=-1){
					progID = OV.ProgramID.Excel;
				}else if(docType.indexOf('ppt')!=-1){
					progID = OV.ProgramID.PowerPoint;
				}else if(docType.indexOf('vsd')!=-1){
					progID = OV.ProgramID.Visio;
				}else if(docType.indexOf('mpp')!=-1){
					progID = OV.ProgramID.Project; 
				}
				return progID;
			}
			
			function GetHttpResult(url){
				var result;
				$.ajax({
				  async: false,
				  type: "POST",
				  url: url,
				  dataType: "json",
				  success: function(msg){
					  result = msg;
				  },
				  error:function(XmlHttpRequest,textStatus, errorThrown){
					  throw justep.Error.create(new justep.Message(justep.Message.JUSTEP232016,XmlHttpRequest.responseText).getMessage());
				  }
				});
				if(result && result.size == 0){
					throw justep.Error.create(new justep.Message(justep.Message.JUSTEP232017).getMessage());
				}
				return result;
			}
			
			function GetOpenedFileExt(){
				return "." + this.GetDocumentName().split('.')[1];
			}
			function DisableSaveHotKey(disable){
				try{
					this.WordDisableSaveHotKey(disable);
				}catch(e){}
				
			}
			function DisableCopyHotKey(disable){
				try{
					this.WordDisableCopyHotKey(disable);
				}catch(e){}
				
			}
			
			function DisablePrintHotKey(disable){
				this.WordDisablePrintHotKey(disable);
			}
			function DisableHotKey(disable){
				try{
					this.WordDisableSaveHotKey(disable);
					this.WordDisablePrintHotKey(disable);
					this.WordDisableCopyHotKey(disable);
				}catch(e){
				}
			}
			
			/**
			 * 检查source是否为OfficeViewer
			 * @return 返回是否为OfficeViewer的布尔值
			 */
			function CheckViewer() {
				return this.Assert(
					this.IsOfficeViewer(),
					OV.substitute("The {nodeName}[{id}] is not OfficeViewer.", {nodeName: this.nodeName, id: this.id}));
			}
			
			/**
			 * 检查操作系统是否安装了MSOffice中某个应用程序
			 * @programID 应用程序标识，参考ProgramID
			 * @return 返回是否安装了MSOffice中某个应用程序的布尔值
			 */
			function CheckInstalled(programID) {
				return this.CheckViewer() && this.Assert(
							this.IsOfficeInstalled(programID),
							OV.substitute("The computer hasn't installed Microsoft {pid}.", {pid: programID.replace(/MS|\.\w*/, "")}));
			}
			/**
			 * 创建MSOffice中某个应用程序的文档
			 * @programID 应用程序标识，参考ProgramID
			 * @return 返回是否安装了该程序
			 */
			function CreateDoc(programID) {
				if (this.CheckViewer() && this.CheckInstalled(programID)) {
					this.CreateNew(programID);
					this.SetAppFocus();
					return true;
				} else {
					return false;
				}
			}
			/**
			 * 创建MSWord
			 * @return 返回是否安装了MSWord
			 */
			function CreateWord() {
				return this.CreateDoc(OV.ProgramID.Word);
			}
			/**
			 * 创建MSExcel
			 * @return 返回是否安装了MSExcel
			 */
			function CreateExcel() {
				return this.CreateDoc(OV.ProgramID.Excel);
			}
			/**
			 * 创建MSPowerPoint
			 * @return 返回是否安装了MSPowerPoint
			 */
			function CreatePowerPoint() {
				return this.CreateDoc(OV.ProgramID.PowerPoint);
			}
			/**
			 * 创建MSVisio
			 * @return 返回是否安装了MSVisio
			 */
			function CreateVisio() {
				return this.CreateDoc(OV.ProgramID.Visio);
			}
			/**
			 * 创建MSProject
			 * @return 返回是否安装了MSProject
			 */
			function CreateProject() {
				return this.CreateDoc(OV.ProgramID.Project);
			}
			/**
			 * 判断是否打开了MSOffice中某个应用程序的文档
			 * @programID 应用程序标识，参考ProgramID
			 * @return 返回是否打开了该文档
			 */
			function IsDocOpened(programID) {
				if (!this.CheckViewer()) {
					return false;
				} else if (OV.isClear(programID)) {
					return this.IsOpened;
				} else if (OV.isString(programID)) {
					return this.GetCurrentProgID() == programID;
				} else {
					return false;
				}
			}
			/**
			 * 判断是否打开了MSWord
			 * @return 返回是否打开了MSWord
			 */
			function IsWordOpened() {
				return this.IsDocOpened(OV.ProgramID.Word);
			}
			/**
			 * 判断是否打开了MSExcel
			 * @return 返回是否打开了MSExcel
			 */
			function IsExcelOpened() {
				return this.IsDocOpened(OV.ProgramID.Excel);
			}
			/**
			 * 判断是否打开了MSPowerPoint
			 * @return 返回是否打开了MSPowerPoint
			 */
			function IsPowerPointOpened() {
				return this.IsDocOpened(OV.ProgramID.PowerPoint);
			}
			/**
			 * 判断是否打开了MSVisio
			 * @return 返回是否打开了MSVisio
			 */
			function IsVisioOpened() {
				return this.IsDocOpened(OV.ProgramID.Visio);
			}
			/**
			 * 判断是否打开了MSProject
			 * @return 返回是否打开了MSProject
			 */
			function IsProjectOpened() {
				return this.IsDocOpened(OV.ProgramID.Project);
			}
			
			/**
			 * 书签相关用法
			 	function readbookmarkExample() {
					var officeObj = $OV('ov');
				  	var count = officeObj.GetWordBookmarkCount(); 
				  	for(var i=1; i <= count; i++) {
				  		var name = officeObj.GetWordBookmarkInfo(i, true); 
				  		officeObj.WriteWordBookmarkInfo(name,"test");
				  	}
				}
			 */
			function GetWordBookmarkCount() {
				return this.WordGetBookmarkCount();
			}
			function ReadWordBookmarkInfo(pos) {
				return this.WordReadBookmarkInfo(pos,true);
			}
			
			function WriteWordBookmarkInfo(name,value) {
				var selection = this.GetApplication().Selection;
				var endName = name + "End";
				var isAppend = true;
				// 查找结束书签
				var count = this.WordGetBookmarkCount();
				for(var i=1; i<=count; i++){
					var bmName = this.WordReadBookmarkInfo(i, true);
					if(bmName == endName){
						isAppend = false;
						break;
					}
				}
				if(isAppend){
					return this.WordWriteBookmarkInfo(name,value);
				}else{
					//这次在上次内容插入前缀
					this.WordWriteBookmarkInfo(name,'--BMPrefix2DB');
					//定位到书签内容结束
					this.WordWriteBookmarkInfo(endName,'');
					//移动到上次插入内容的最后2位
					selection.MoveLeft(1,1);
					this.WordInsertText("BMSuffix2DB--",1);
					//切换到上一页
					selection.GoTo(1,3,1);
					return selection.Find.Execute('--BMPrefix2D*BMSuffix2DB--', false, false, true,false, false, 1,false, false, value, 2, false, false, false, false);
				}
			}
			
			/**
			 * 初始化MSWord的痕迹保留，主要用于保留MSWord修订历史，具体操作如下：
			 * 		接受当前文件的所有修订内容
			 * 		不显示修订痕迹
			 * 		启动痕迹保留
			 * @acceptAllRevisions 是否接受所有修订
			 * @userName 用户名，为undefined则保留原来的用户名
			 * @userInitials 简称，为undefined则保留原来的简称
			 * @return 返回是否打开了MSWord
			 */
			function WordRevisionInit(acceptAllRevisions, userName, userInitials) {
				if (this.CheckViewer() && this.IsWordOpened()) {
					if (acceptAllRevisions) {
						this.ActiveDocument().AcceptAllRevisions();
					}
					this.ActiveDocument().ShowRevisions = false;
					this.ActiveDocument().TrackRevisions = true;
					if (!OV.isClear(userName)) {
						this.GetApplication().UserName = userName;
					}
					if (!OV.isClear(userInitials)) {
						this.GetApplication().UserInitials = userInitials;
					}
					return true;
				} else {
					return false;
				}
			}
			/**
			 * 复位MSWord的痕迹保留状态，主要用于查看MSWord修订历史，具体操作如下：
			 * 		关闭痕迹保留
			 * 		显示修订痕迹
			 * @return 返回是否打开了MSWord
			 */
			function WordRevisionNone() {
				if (this.CheckViewer() && this.IsWordOpened()) {
					this.ActiveDocument().TrackRevisions = false;
					this.ActiveDocument().ShowRevisions = true;
					return true;
				} else {
					return false;
				}
			}
			/**
			 * 获取MSWord痕迹保留的JSON格式修订记录
			 * @return 返回JSON格式修订记录，undefined表示获取失败
			 */
			function WordGetRevisionJSON() {
				if (this.CheckViewer() && this.IsWordOpened()) {
					var result = OV.tryThese(this, function(source){
						var r = [];
						for (var i = 1; i <= source.ActiveDocument().Revisions.Count; i++) {
							var revision = source.ActiveDocument().Revisions.Item(i);
							r[i-1] = {
								Author: revision.Author,
								Date: new Date(revision.Date),
								Index: revision.Index,
								Text: revision.Range.Text,
								Type: revision.Type
							};
						}
						return r;
					}, function(source){
						return [];
					});
					return OV.JSON.stringify(result);
				}
			}
			/**
			 * 获取MSWord痕迹保留的修订记录
			 * @json JSON格式修订记录，如果为undefined则获取当前打开MSWORD文档的修订记录
			 * @template 用于格式化修订内容的模板，为undefined则使用默认模板，模板参数：
			 * 		#{Index}	索引序号
			 * 		#{Author}	修订此内容的作者
			 * 		#{Type}		修订类型，参考WordRevisionTypeToStr方法
			 * 		#{Date}		修订时间
			 * 		#{Text}		简化修订内容，默认只有30字符并且不包含多余空行和换行符等
			 * 		#{FullText}	完整修订内容
			 * 		#{HTMLText}	HTML修订内容
			 * @textLength 简化修订内容的长度，默认30字符
			 * @truncation 简化修订内容的后缀，默认为...
			 * @return 返回修订记录，undefined表示获取失败
			 */
			function WordGetRevisionInfo(json, template, textLength, truncation) {
				var revisions = OV.tryThese(this, function(source){
					return OV.isClear(json) ?
							OV.JSON.parse(source.WordGetRevisionJSON()) :
						(OV.isString(json) && OV.isJSON(json)) ?
								OV.JSON.parse(json) :
							json;
				}, function(source){
					return json;
				});
				if (OV.isArray(revisions)) {
					template = OV.isClear(template) ?
						'<revisioninfo index="{Index}" author="{Author}" type="{Type}" date="{Date}">{Text}</revisioninfo>\r\n' :
						template;
					var result = "";
					for (var i = 0, length = revisions.length; i < length; i++) {
						var revision = revisions[i];
						result += OV.substitute(template, {
							Author: revision.Author,
							Date: OV.trim(revision.Date.replace(/\"|[T|Z]/g, ' ')),
							Index: revision.Index,
							Text: OV.truncate(revision.Text.replace(/\s+/g, ' '), textLength, truncation),
							FullText: revision.Text,
							HTMLText: OV.escape(revision.Text),
							Type: this.WordRevisionTypeToStr(revision.Type)});
					}
					return result;
				} else {
					return revisions;
				}
			}
			/**
			 * 转换痕迹保留的修订类型
			 * @type 修订类型，整数0~18，参考WdRevisionType
			 * @return 返回修订类型的文字描述，undefined表示转换失败
			 */
			function WordRevisionTypeToStr(type) {
				return ['None', 'Insert', 'Delete', 'Property', 'ParagraphNumber',
						'DisplayField', 'Reconcile', 'Conflict', 'Style', 'Replace',
						'ParagraphProperty', 'TableProperty', 'SectionProperty',
						'StyleDefinition', 'MovedFrom', 'MovedTo', 'CellInsertion',
						'CellDeletion', 'CellMerge'][type];
			}
			
			function DisableOfficeReviewingBar(isShow){
				if (this.CheckViewer() && this.IsWordOpened()) {
					//显示或隐藏批注框
					this.ActiveDocument().ActiveWindow.View.ShowComments=isShow;
					//显示或隐藏插入和删除标记批注框
					this.ActiveDocument().ActiveWindow.View.ShowInsertionsAndDeletions=isShow;
					//显示或隐藏墨迹注释
					this.ActiveDocument().ActiveWindow.View.ShowInkAnnotations=isShow;
					//正在格式化
					this.ActiveDocument().ActiveWindow.View.ShowFormatChanges=isShow;
				}else{
					return false;
				}
			}
			
			return {
				Assert:					Assert,
				OfficeViewerClassID:	OfficeViewerClassID,
				OfficeViewerClsID:	    OfficeViewerClsID,
				IsOfficeViewer:			IsOfficeViewer,
				CreateOfficeViewer:		CreateOfficeViewer,
				GetHttpResult:          GetHttpResult,
				GetProgIDByDocType:     GetProgIDByDocType,
				GetOpenedFileExt:       GetOpenedFileExt,
				DisableHotKey:          DisableHotKey,
				DisableSaveHotKey:      DisableSaveHotKey,
				DisableCopyHotKey:      DisableCopyHotKey,
				DisablePrintHotKey:     DisablePrintHotKey,
				DisablePrint:           DisablePrint,
				CheckViewer:			CheckViewer,
				CheckInstalled:			CheckInstalled,
				CreateDoc:				CreateDoc,
				CreateWord:				CreateWord,
				CreateExcel:			CreateExcel,
				CreatePowerPoint:		CreatePowerPoint,
				CreateVisio:			CreateVisio,
				CreateProject:			CreateProject,
				IsDocOpened:			IsDocOpened,
				IsWordOpened:			IsWordOpened,
				IsExcelOpened:			IsExcelOpened,
				IsPowerPointOpened:		IsPowerPointOpened,
				IsVisioOpened:			IsVisioOpened,
				IsProjectOpened:		IsProjectOpened,
				GetWordBookmarkCount:   GetWordBookmarkCount,     
				ReadWordBookmarkInfo:   ReadWordBookmarkInfo,
				WriteWordBookmarkInfo: WriteWordBookmarkInfo,
				WordRevisionInit:		WordRevisionInit,
				WordRevisionNone:		WordRevisionNone,
				WordGetRevisionJSON:	WordGetRevisionJSON,
				WordGetRevisionInfo:	WordGetRevisionInfo,
				WordRevisionTypeToStr:	WordRevisionTypeToStr,
				DisableOfficeReviewingBar:  DisableOfficeReviewingBar
			}
		})();
		/**
		 * 历史修订模板
		 * OV.RevisionTemplate.defaultHTMLContent 默认的HTML格式修订存储模板
		 */
		var RevisionTemplate = (function() {
			var defaultHTMLContent = (function() {
				var fn = function() {
					/*
					<div class='revision_item'>
						<div class='revision_title'>
							<div class='revision_left'>{Index}.{Type}</div>
							<div class='revision_center'>{Author}</div>
							<div class='revision_right'>{Date}</div>
						</div>
						<div class='revision_content'>{Text}</div>
						<div class='revision_content_full'>{HTMLText}</div>
					</div>
					*/
				}
				return getMultiLine(fn);
			})();
			return {
				defaultHTMLContent:	defaultHTMLContent
			}
		})();
		return {
			JSON:	this.JSON || {},
			Base64:	this.Base64 || {},
			ProgramID:			ProgramID,
			extend:					extend,
			IsIE:                   IsIE,
			IsWin:                  IsWin,
			getMultiLine:			getMultiLine,
			trim:					trim,
			substitute:				substitute,
			truncate:				truncate,
			tryThese:				tryThese,
			escape:					escape,
			getClass:				getClass,
			isArray:				isArray,
			isString:				isString,
			isNumber:				isNumber,
			isFunction:				isFunction,
			isObject:				isObject,
			isUndefined:			isUndefined,
			isNull:					isNull,
			isClear:				isClear,
			isJSON:					isJSON,
			OfficeViewer:		OfficeViewer,
			RevisionTemplate:	RevisionTemplate
		}
	})();
	return {
		$OV:$OV,
		OV:OV
	};
});