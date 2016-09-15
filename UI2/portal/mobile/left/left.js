define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/biz");//为了使用全局上下文
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype = {
		getFunctionTreeData: function(){
			return window.__justep.__portalContext.data.functionTree.menu;
		},
		initFunctionTree: function(){
			var funcsData = this.getFunctionTreeData(),
				$content = this.comp('panel').$content,
				html = ['<div id="menu" class="portal-menu">'];
			
			
			function printTree(children){
				if(!children || !children.length) return;
				html.push('<dl>');
				for(var i=0; i<children.length; i++){
					var child = children[i];
					html.push('<dt class="portal-menu-group"><h4>');
					html.push(child.label);
					html.push('</h4></dt>');
					html.push('<dd><div class="list-group">');
					printTree2(child.$children);
					html.push('</div></dd>');
				}
				html.push('</dl>');
			}
			
			function printTree2(children){
				if(!children || !children.length) return;
				for(var i=0; i<children.length; i++){
					var child = children[i];
					if(child.pageKey){
						html.push(justep.String.format('<a class="list-group-item"  pageKey="{0}" title="{1}">{1}</a>', 
								child.pageKey, child.label));
					}
					printTree2(child.$children);
				}
			}
			printTree(funcsData.$children);
			
			html.push('</div>');
			html = html.join('');
			var $e = $(html);
			$e.on('click', 'a', function(event){
				var pageKey = $(this).attr('pageKey');
				justep.Shell.showPage(pageKey);
			});
			
			justep.Component.addNode($content[0], $e[0]);
		}
	};

	Model.prototype.logoutClick = function(event){
		justep.Shell.fireEvent('onCallPortal',{fn:'logout'});
	};

	Model.prototype.modelLoad = function(event){
		//set user name
		var name = this.getContext().getCurrentPersonName();
		this.comp('titleBar').setTitle(name);
		//init functree
		this.initFunctionTree();
	};

	return Model;
});