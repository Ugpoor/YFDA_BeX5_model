/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	// 引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");

	// https://github.com/jonmiles/bootstrap-treeview
	require("css!../css/bootstrap-treeview").load();

	require("../js/bootstrap-treeview");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.init();
	};

	Model.prototype.init = function() {
        var defaultData = [
          {
            text: 'Parent 1',
            href: '#parent1',
            tags: ['4'],
            nodes: [
              {
                text: 'Child 1',
                href: '#child1',
                tags: ['2'],
                nodes: [
                  {
                    text: 'Grandchild 1',
                    href: '#grandchild1',
                    tags: ['0']
                  },
                  {
                    text: 'Grandchild 2',
                    href: '#grandchild2',
                    tags: ['0']
                  }
                ]
              },
              {
                text: 'Child 2',
                href: '#child2',
                tags: ['0']
              }
            ]
          },
          {
            text: 'Parent 2',
            href: '#parent2',
            tags: ['0']
          },
          {
            text: 'Parent 3',
            href: '#parent3',
             tags: ['0']
          },
          {
            text: 'Parent 4',
            href: '#parent4',
            tags: ['0']
          },
          {
            text: 'Parent 5',
            href: '#parent5'  ,
            tags: ['0']
          }
        ];

        var alternateData = [
          {
            text: 'Parent 1',
            tags: ['2'],
            nodes: [
              {
                text: 'Child 1',
                tags: ['3'],
                nodes: [
                  {
                    text: 'Grandchild 1',
                    tags: ['6']
                  },
                  {
                    text: 'Grandchild 2',
                    tags: ['3']
                  }
                ]
              },
              {
                text: 'Child 2',
                tags: ['3']
              }
            ]
          },
          {
            text: 'Parent 2',
            tags: ['7']
          },
          {
            text: 'Parent 3',
            icon: 'glyphicon glyphicon-earphone',
            href: '#demo',
            tags: ['11']
          },
          {
            text: 'Parent 4',
            icon: 'glyphicon glyphicon-cloud-download',
            href: '/demo.html',
            tags: ['19'],
            selected: true
          },
          {
            text: 'Parent 5',
            icon: 'glyphicon glyphicon-certificate',
            color: 'pink',
            backColor: 'red',
            href: 'http://www.tesco.com',
            tags: ['available','0']
          }
        ];

        var json = '[' +
          '{' +
            '"text": "Parent 1",' +
            '"nodes": [' +
              '{' +
                '"text": "Child 1",' +
                '"nodes": [' +
                  '{' +
                    '"text": "Grandchild 1"' +
                  '},' +
                  '{' +
                    '"text": "Grandchild 2"' +
                  '}' +
                ']' +
              '},' +
              '{' +
                '"text": "Child 2"' +
              '}' +
            ']' +
          '},' +
          '{' +
            '"text": "Parent 2"' +
          '},' +
          '{' +
            '"text": "Parent 3"' +
          '},' +
          '{' +
            '"text": "Parent 4"' +
          '},' +
          '{' +
            '"text": "Parent 5"' +
          '}' +
        ']';

        var root = this.getRootNode();

        $('#treeview1',root).treeview({
          data: defaultData
        });

        $('#treeview2',root).treeview({
          levels: 1,
          data: defaultData
        });

        $('#treeview3',root).treeview({
          levels: 99,
          data: defaultData
        });

        $('#treeview4',root).treeview({

          color: "#428bca",
          data: defaultData
        });

        $('#treeview5',root).treeview({
          color: "#428bca",
          expandIcon: 'icon-ios7-arrow-right',
          collapseIcon: 'icon-ios7-arrow-down',
          nodeIcon: 'icon-android-camera',
          data: defaultData
        });

        $('#treeview6',root).treeview({
          color: "#428bca",
          expandIcon: "icon-android-send",
          collapseIcon: "icon-arrow-down-b",
          nodeIcon: "icon-android-contact",
          showTags: true,
          data: defaultData
        });

        $('#treeview7',root).treeview({
          color: "#428bca",
          showBorder: false,
          data: defaultData
        });

        $('#treeview8',root).treeview({
          expandIcon: "icon-android-send",
          collapseIcon: "icon-arrow-down-b",
          nodeIcon: "icon-android-storage",
          color: "yellow",
          backColor: "purple",
          onhoverColor: "orange",
          borderColor: "red",
          showBorder: false,
          showTags: true,
          highlightSelected: true,
          selectedColor: "yellow",
          selectedBackColor: "darkorange",
          data: defaultData
        });

        $('#treeview9',root).treeview({
          expandIcon: "icon-android-send",
          collapseIcon: "icon-arrow-down-b",
          nodeIcon: "icon-card",
          color: "yellow",
          backColor: "purple",
          onhoverColor: "orange",
          borderColor: "red",
          showBorder: false,
          showTags: true,
          highlightSelected: true,
          selectedColor: "yellow",
          selectedBackColor: "darkorange",
          data: alternateData
        });

        $('#treeview10',root).treeview({
          color: "#428bca",
          enableLinks: true,
          data: defaultData
        });



        var $searchableTree = $('#treeview-searchable',root).treeview({
          data: defaultData,
        });

        var search = function(e) {
          var pattern = $('#input-search',root).val();
          var options = {
            ignoreCase: $('#chk-ignore-case',root).is(':checked'),
            exactMatch: $('#chk-exact-match',root).is(':checked'),
            revealResults: $('#chk-reveal-results',root).is(':checked')
          };
          var results = $searchableTree.treeview('search', [ pattern, options ]);

          var output = '<p>' + results.length + ' matches found</p>';
          $.each(results, function (index, result) {
            output += '<p>- ' + result.text + '</p>';
          });
          $('#search-output',root).html(output);
        }

        $('#btn-search',root).on('click', search);
        $('#input-search',root).on('keyup', search);

        $('#btn-clear-search',root).on('click', function (e) {
          $searchableTree.treeview('clearSearch');
          $('#input-search',root).val('');
          $('#search-output',root).html('');
        });


        var initSelectableTree = function() {
          return $('#treeview-selectable',root).treeview({
            data: defaultData,
            multiSelect: $('#chk-select-multi',root).is(':checked'),
            onNodeSelected: function(event, node) {
              $('#selectable-output',root).prepend('<p>' + node.text + ' was selected</p>');
            },
            onNodeUnselected: function (event, node) {
              $('#selectable-output',root).prepend('<p>' + node.text + ' was unselected</p>');
            }
          });
        };
        var $selectableTree = initSelectableTree();

        var findSelectableNodes = function() {
          return $selectableTree.treeview('search', [ $('#input-select-node',root).val(), { ignoreCase: false, exactMatch: false } ]);
        };
        var selectableNodes = findSelectableNodes();

        $('#chk-select-multi:checkbox',root).on('change', function () {
          console.log('multi-select change');
          $selectableTree = initSelectableTree();
          selectableNodes = findSelectableNodes();          
        });

        // Select/unselect/toggle nodes
        $('#input-select-node',root).on('keyup', function (e) {
          selectableNodes = findSelectableNodes();
          $('.select-node',root).prop('disabled', !(selectableNodes.length >= 1));
        });

        $('#btn-select-node.select-node',root).on('click', function (e) {
          $selectableTree.treeview('selectNode', [ selectableNodes, { silent: $('#chk-select-silent',root).is(':checked') }]);
        });

        $('#btn-unselect-node.select-node',root).on('click', function (e) {
          $selectableTree.treeview('unselectNode', [ selectableNodes, { silent: $('#chk-select-silent',root).is(':checked') }]);
        });

        $('#btn-toggle-selected.select-node',root).on('click', function (e) {
          $selectableTree.treeview('toggleNodeSelected', [ selectableNodes, { silent: $('#chk-select-silent',root).is(':checked') }]);
        });



        var $expandibleTree = $('#treeview-expandible',root).treeview({
          data: defaultData,
          onNodeCollapsed: function(event, node) {
            $('#expandible-output',root).prepend('<p>' + node.text + ' was collapsed</p>');
          },
          onNodeExpanded: function (event, node) {
            $('#expandible-output',root).prepend('<p>' + node.text + ' was expanded</p>');
          }
        });

        var findExpandibleNodess = function() {
          return $expandibleTree.treeview('search', [ $('#input-expand-node',root).val(), { ignoreCase: false, exactMatch: false } ]);
        };
        var expandibleNodes = findExpandibleNodess();

        // Expand/collapse/toggle nodes
        $('#input-expand-node',root).on('keyup', function (e) {
          expandibleNodes = findExpandibleNodess();
          $('.expand-node').prop('disabled', !(expandibleNodes.length >= 1));
        });

        $('#btn-expand-node.expand-node',root).on('click', function (e) {
          var levels = $('#select-expand-node-levels',root).val();
          $expandibleTree.treeview('expandNode', [ expandibleNodes, { levels: levels, silent: $('#chk-expand-silent',root).is(':checked') }]);
        });

        $('#btn-collapse-node.expand-node',root).on('click', function (e) {
          $expandibleTree.treeview('collapseNode', [ expandibleNodes, { silent: $('#chk-expand-silent',root).is(':checked') }]);
        });

        $('#btn-toggle-expanded.expand-node',root).on('click', function (e) {
          $expandibleTree.treeview('toggleNodeExpanded', [ expandibleNodes, { silent: $('#chk-expand-silent',root).is(':checked') }]);
        });

        // Expand/collapse all
        $('#btn-expand-all',root).on('click', function (e) {
          var levels = $('#select-expand-all-levels',root).val();
          $expandibleTree.treeview('expandAll', { levels: levels, silent: $('#chk-expand-silent',root).is(':checked') });
        });

        $('#btn-collapse-all',root).on('click', function (e) {
          $expandibleTree.treeview('collapseAll', { silent: $('#chk-expand-silent',root).is(':checked') });
        });



        var $checkableTree = $('#treeview-checkable',root).treeview({
          data: defaultData,
          showIcon: false,
          showCheckbox: true,
          onNodeChecked: function(event, node) {
            $('#checkable-output',root).prepend('<p>' + node.text + ' was checked</p>');
          },
          onNodeUnchecked: function (event, node) {
            $('#checkable-output',root).prepend('<p>' + node.text + ' was unchecked</p>');
          }
        });

        var findCheckableNodess = function() {
          return $checkableTree.treeview('search', [ $('#input-check-node',root).val(), { ignoreCase: false, exactMatch: false } ]);
        };
        var checkableNodes = findCheckableNodess();

        // Check/uncheck/toggle nodes
        $('#input-check-node',root).on('keyup', function (e) {
          checkableNodes = findCheckableNodess();
          $('.check-node',root).prop('disabled', !(checkableNodes.length >= 1));
        });

        $('#btn-check-node.check-node',root).on('click', function (e) {
          $checkableTree.treeview('checkNode', [ checkableNodes, { silent: $('#chk-check-silent',root).is(':checked') }]);
        });

        $('#btn-uncheck-node.check-node',root).on('click', function (e) {
          $checkableTree.treeview('uncheckNode', [ checkableNodes, { silent: $('#chk-check-silent',root).is(':checked') }]);
        });

        $('#btn-toggle-checked.check-node',root).on('click', function (e) {
          $checkableTree.treeview('toggleNodeChecked', [ checkableNodes, { silent: $('#chk-check-silent',root).is(':checked') }]);
        });

        // Check/uncheck all
        $('#btn-check-all',root).on('click', function (e) {
          $checkableTree.treeview('checkAll', { silent: $('#chk-check-silent',root).is(':checked') });
        });

        $('#btn-uncheck-all',root).on('click', function (e) {
          $checkableTree.treeview('uncheckAll', { silent: $('#chk-check-silent',root).is(':checked') });
        });



        var $disabledTree = $('#treeview-disabled',root).treeview({
          data: defaultData,
          onNodeDisabled: function(event, node) {
            $('#disabled-output',root).prepend('<p>' + node.text + ' was disabled</p>');
          },
          onNodeEnabled: function (event, node) {
            $('#disabled-output',root).prepend('<p>' + node.text + ' was enabled</p>');
          },
          onNodeCollapsed: function(event, node) {
            $('#disabled-output',root).prepend('<p>' + node.text + ' was collapsed</p>');
          },
          onNodeUnchecked: function (event, node) {
            $('#disabled-output',root).prepend('<p>' + node.text + ' was unchecked</p>');
          },
          onNodeUnselected: function (event, node) {
            $('#disabled-output',root).prepend('<p>' + node.text + ' was unselected</p>');
          }
        });

        var findDisabledNodes = function() {
          return $disabledTree.treeview('search', [ $('#input-disable-node',root).val(), { ignoreCase: false, exactMatch: false } ]);
        };
        var disabledNodes = findDisabledNodes();

        // Expand/collapse/toggle nodes
        $('#input-disable-node',root).on('keyup', function (e) {
          disabledNodes = findDisabledNodes();
          $('.disable-node',root).prop('disabled', !(disabledNodes.length >= 1));
        });

        $('#btn-disable-node.disable-node',root).on('click', function (e) {
          $disabledTree.treeview('disableNode', [ disabledNodes, { silent: $('#chk-disable-silent',root).is(':checked') }]);
        });

        $('#btn-enable-node.disable-node',root).on('click', function (e) {
          $disabledTree.treeview('enableNode', [ disabledNodes, { silent: $('#chk-disable-silent',root).is(':checked') }]);
        });

        $('#btn-toggle-disabled.disable-node',root).on('click', function (e) {
          $disabledTree.treeview('toggleNodeDisabled', [ disabledNodes, { silent: $('#chk-disable-silent',root).is(':checked') }]);
        });

        // Expand/collapse all
        $('#btn-disable-all',root).on('click', function (e) {
          $disabledTree.treeview('disableAll', { silent: $('#chk-disable-silent',root).is(':checked') });
        });

        $('#btn-enable-all',root).on('click', function (e) {
          $disabledTree.treeview('enableAll', { silent: $('#chk-disable-silent',root).is(':checked') });
        });



        var $tree = $('#treeview12',root).treeview({
          data: json
        });
        
    };

	return Model;
});