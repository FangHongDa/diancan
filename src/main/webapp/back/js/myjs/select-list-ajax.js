var SELECT_LIST = {
	getActionTypeList: function(targetId,selectValue ,optionText){
		var url = '/admin/productKind/list';
		var item = {};
		item.method = "GET";
		item.url = url;
		item.targetId = targetId;
		//item.keyValue = "id";
		item.keyName = "kindName";   //注意要修改这里
		item.selectedValue = selectValue;
		if(optionText){
			item.firstOption = '<option value="">' + optionText + '</option>';
		}
		ajaxGenerateSelect(item);
	},
	getValidProductList: function(targetId,selectValue ,optionText){
		var url = '/admin/validProduct/list';
		var item = {};
		item.method = "GET";
		item.url = url;
		item.targetId = targetId;
		//item.keyValue = "id";
		item.keyName = "productName";//注意要修改这里
		item.selectedValue = selectValue;
		if(optionText){
			item.firstOption = '<option value="">' + optionText + '</option>';
		}
		ajaxGenerateSelect(item);
	}

}
/***
 *
 * {
 * 		url: 获取值的路径
 * 		mehtod: get还是post
 * 		keyValue: 对象中作为option value的字段
 * 		keyName: 对象中作为option显示的字段
 * 		targetId: select控件的id
 * 		selectedValue: select控件选中的值
 * 		firstOption: 首个提示框 = "<option value=''>请选择</option>";
 *
 * }
 * @returns
 */
function ajaxGenerateSelect(selectObject){
	var url = selectObject.url;
	var method = selectObject.method ? selectObject.method : "POST";
	var keyValue = selectObject.keyValue ? selectObject.keyValue : "id";
	var keyName = selectObject.keyName ? selectObject.keyName : "name";
	var selectedValue = selectObject.selectedValue ? selectObject.selectedValue : null;
	var targetId = selectObject.targetId;
	var condition = selectObject.condition ? selectObject.condition : {};
	var afterHandle = selectObject.afterHandle;
	var formatter = selectObject.formatter;
	var firstOption = selectObject.firstOption;
	var ajaxObject = {};
	ajaxObject.url = url;
	ajaxObject.method = method;
	ajaxObject.data = (selectObject.condition?JSON.stringify(condition):"");
	ajaxObject.success = function(result){
		var data = result.data;
		var html = "";
		if(firstOption){
			html = firstOption;
		}
		for(var i=0;i<data.length;i++){
			var selected = "";
			var dataItem = data[i];
			if(selectedValue == dataItem[keyValue]){
				selected = "selected";
			}
			var option = "<option value='#(value)' #(selected)>#(name)</option>";
			var nameValue = dataItem[keyName];
			if(formatter){
				nameValue = formatter(dataItem);
			}
			option = option.replace("#(value)", dataItem[keyValue]).
			replace("#(name)",nameValue).replace("#(selected)", selected);
			html += option;
		}
		$("#" + targetId).html('').append(html);
		if(afterHandle){
			afterHandle();
		}
	};
	ajaxMethod(ajaxObject);
}

function ajaxMethod(ajaxObject){
	var url = ajaxObject.url;
	var success = ajaxObject.success;
	var fail = ajaxObject.fail;
	var error = ajaxObject.error;
	var data = ajaxObject.data;
	$.ajax({
		type: ajaxObject.method,
		url: url,
		data: data,
		dataType:'json',
		contentType: "application/json;charset=UTF-8",
		cache: false,
		success: function(result){
			if(200 == result.code){
				success(result);
			}else if(fail){
				fail(result);
			}else{
				bootbox.alert(result.msg);
			}
		},
		error: function(result){
			if(error){
				error(result);
			}else{
				bootbox.alert("出现异常");
			}
		}
	});

}