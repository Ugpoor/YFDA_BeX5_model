/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var Data = require("../data");
	var BizData = require("../bizData");
	var Input = require("../../input/input");
	var Output = require("../../output/output");
	var Textarea = require("../../textarea/textarea");

	// 增加自定义规则
	Data.Rules.add('isExistStr', {
		// val：校验的值，params：规则给出的参数，ctx：当前的上下文，包含source（对应的data），rowid（行id），col(列名)
		validator : function(val, params, ctx) {
			var ret = false;
			if ('string' === typeof (val)) {
				ret = val.indexOf(params) > -1;
			}
			return ret;
		},
		message : '必须包含字符 {0}'
	});

	var Model = function() {
		this.callParent();

		this.mainData = new Data(this, {
			xid : 'mainData',
			defCols : {
				SA_Task : {
					type : 'String',
					label : 'ID'
				},
				sName : {
					type : 'String',
					label : '名字',
					rules : {
						required : {
							params : true,
							message : '名字必须有值'
						}
					}
				},
				sAge : {
					type : 'Integer',
					label : '年龄'
				/*
				 * , rules :{ min: {params:18, message:'年龄必须大于等于18' }, max:
				 * {params:50, message:'年龄必须小于等于50' }}
				 */
				},
				sAmt : {
					type : 'Double',
					label : '合计',
					relation : 'EXPRESS',
					calculate : "js:$model.slaveData?$model.slaveData.Sum('sAmt',$row):0"
				}
			},
			idColumn : 'SA_Task'
		});

		this.mainData.ageAvg = bind.computed(function() {
			var ret = this.mainData.Avg('sAge');
			return ret;
		}, this).extend({
			mustEqual : 30
		});

		this.mainData.amtSum = bind.computed(function() {
			var ret = this.mainData.Sum('sAmt');
			return ret;
		}, this).extend({
			mustEqual : 50
		});

		this.slaveData = new Data(this, {
			xid : 'slaveData',
			defCols : {
				SA_Task_Info : {
					type : 'String',
					label : '任务明细'
				},
				SA_Task : {
					type : 'String',
					label : '主ID'
				},
				sName : {
					type : 'String',
					label : '名字'
				},
				sInfo : {
					type : 'String',
					label : '说明'
				},
				sCount : {
					type : 'Integer',
					label : '数量',
					rules : {
						required : {
							params : true,
							message : '数量必须有值'
						},
						integer : {
							params : true,
							message : '数量无效'
						}
					}
				},
				sUnitprice : {
					type : 'Double',
					label : '单价',
					rules : {
						required : {
							params : true,
							message : '单价必须有值'
						},
						number : {
							params : true,
							message : '单价无效'
						}
					}
				},
				sAmt : {
					type : 'Double',
					label : '合计',
					relation : 'EXPRESS',
					rules : {
						calculate : "js:val('sCount') * val('sUnitprice')"
					}
				}
			},
			idColumn : 'SA_Task_Info',
			master : {
				xid : 'mainData',
				relation : 'SA_Task'
			}
		});

		this.bizDataReadonly = bind.observable(false);// 控制整个data的只读
		this.bizData = new BizData(this, {
			xid : 'bizData',
			readonly : "js:$model.bizDataReadonly.get()",
			defCols : {
				DEMO_TABLE1 : {
					type : 'String',
					relation : 'DEMO_TABLE1',
					label : 'DEMO_TABLE1'
				},
				fString : {
					type : 'String',
					relation : 'DEMO_TABLE1.fString',
					label : 'fString',
					// 上下文包括{$model:this.getModel(),$data:this,$row:r,$val,$rowID:rowid,$col:col}
					rules : {
						readonly : "js:500<val('fInteger')",
						required : {
							params : true,
							message : 'fString必须有值'
						},
						isExistStr : 'abc',
						constraint : {
							params : {
								expr : "js:$val.indexOf(val('fInteger'))>-1"
							},
							message : '通用规则，必须包含fInteger'
						}
					}
				},
				fInteger : {
					type : 'Integer',
					relation : 'DEMO_TABLE1.fInteger',
					label : 'fInteger',
					rules : {
						required : {
							params : true,
							message : 'fInteger必须有值'
						},
						number : {
							params : true,
							message : 'fInteger无效'
						}
					}
				},
				fFloat : {
					type : 'Float',
					relation : 'DEMO_TABLE1.fFloat',
					label : 'fFloat',
					rules : {
						number : {
							params : true,
							message : 'fFloat无效'
						}
					}
				},
				fDecimal : {
					type : 'Decimal',
					relation : 'DEMO_TABLE1.fDecimal',
					label : 'fDecimal'
				},
				fDate : {
					type : 'Date',
					label : 'fDate',
					relation : 'DEMO_TABLE1.fDate'
				},
				fDateTime : {
					type : 'DateTime',
					label : 'fDateTime',
					relation : 'DEMO_TABLE1.fDateTime'
				},
				fTime : {
					type : 'Time',
					label : 'fTime',
					relation : 'DEMO_TABLE1.fTime'
				},
				fText : {
					type : 'Text',
					label : 'fText',
					relation : 'DEMO_TABLE1.fText'
				},
				version : {
					type : 'Integer',
					label : 'version',
					relation : 'DEMO_TABLE1.version'
				}
			},
			idColumn : 'DEMO_TABLE1',
			dataModel : '/demo/components/data',
			queryAction : 'queryDEMO_TABLE1Action',
			newAction : 'createDEMO_TABLE1Action',
			saveAction : 'saveDEMO_TABLE1Action',
			limit : 5,
			autoLoad : true
		});

		var self = this;
		this.bizChanged = bind.observable(false);
		this.bizData.on("onDataChange", function(event) {
			self.bizChanged.set(event.source.isChanged());
		});
		this.bizData.on("onSaveCommit", function(event) {
			self.bizChanged.set(event.source.isChanged());
		});

		this.bizDataDirectDelete = bind.observable(this.bizData.directDeleteMode);
		this.bizDataDirectDelete.subscribe(function(v) {
			self.bizData.directDeleteMode = v;
		});
		this.bizDataDeleteConfirm = bind.observable(this.bizData.deleteConfirm);
		this.bizDataDeleteConfirm.subscribe(function(v) {
			self.bizData.deleteConfirm = v;
		});

		this.input6Render = function(event) {
			event.text = event.value == '1' ? '男' : '女';
		};
		this.output6Render = function(event) {
			event.html = event.value == '1' ? '男' : '<span>output组件输出html：</span><input type="button" value="' + event.value + '"/>';
		};
		this.createInput = function() {
			var parent = this.getElementByXid("create-input");
			if (parent) {
				var cfg = {
					'bind-ref' : "bizData1.ref('fDateTime')",
					format : "yyyy-MM-dd hh:mm",
					parentNode : parent
				};
				new Input(cfg);
			} else
				alert('error');
		};
		this.createOutput = function() {
			var parent = this.getElementByXid("create-output");
			if (parent) {
				var cfg = {
					'bind-ref' : "bizData1.ref('fText')",
					parentNode : parent
				};
				new Output(cfg);
			} else
				alert('error');
		};
		this.createTextarea = function() {
			var parent = this.getElementByXid("create-output");
			if (parent) {
				var cfg = {
					'bind-ref' : "bizData1.ref('fText')",
					parentNode : parent
				};
				new Textarea(cfg);
			} else
				alert('error');
		};

	};

	Model.prototype.mainDataNew = function(defaultValue) {
		defaultValue = defaultValue || {};
		this.mainData.newData({
			defaultValues : [ {
				SA_Task : defaultValue['SA_Task'] || Data.UUID(),
				sName : defaultValue['sName'] || '',
				sAge : defaultValue['sAge'] || (Math.round(Math.random() * 40) + 20)
			} ]
		});
	};

	Model.prototype.slaveDataNew = function(defaultValue) {
		defaultValue = defaultValue || {};
		this.slaveData.newData({
			defaultValues : [ {
				SA_Task_Info : defaultValue['SA_Task_Info'] || Data.UUID(),
				sName : defaultValue['sName'] || (this.mainData.getValue('sName') + '---' + this.slaveData.getCount()),
				sCount : defaultValue['sCount'] || (Math.round(Math.random() * 150) + 30),
				sUnitprice : defaultValue['sUnitprice'] || (Math.round(Math.random() * 200) * 0.5),
				sInfo : defaultValue['sInfo'] || "无"
			} ]
		});
	};

	Model.prototype.test = function() {
		// 测试applyBindings速度
		var t = "<div><label data-bind=\"text:bizData.label('fString')\"></label><input data-bind=\"value:bizData.ref('fString')\" /></div><div><label data-bind=\"text:bizData.label('fInteger')\"></label><input data-bind=\"value:bizData.ref('fInteger')\" /></div><div><label data-bind=\"text:bizData.label('fFloat')\"></label><input data-bind=\"value:bizData.ref('fFloat')\" /></div><div><label data-bind=\"text:bizData.label('fDecimal')\"></label><input data-bind=\"value:bizData.ref('fDecimal')\" /></div><div><label data-bind=\"text:bizData.label('fDateTime')\"></label><input data-bind=\"value:bizData.ref('fDateTime')\" /></div><div><label data-bind=\"text:bizData.label('fText')\"></label><input data-bind=\"value:bizData.ref('fText')\" /></div><div><label data-bind=\"text:bizData.label('fTime')\"></label><input data-bind=\"value:bizData.ref('fTime')\" /></div>";
		var tt = "";
		for ( var i = 0; i < 200; i++)
			// 创建200行数据
			tt = tt + t;
		$('.tr').append("<td class='td1'>" + tt + "</td>");
		var b1 = new Date();
		bind.applyBindings(this, $('.td1')[0]);
		alert("applyBindings:" + ((new Date()).getTime() - b1.getTime()));
	};

	Model.prototype.bizData1DataChange = function(event) {
		alert('bizData1DataChange');
	};

	return Model;
});
