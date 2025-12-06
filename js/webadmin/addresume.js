$(document).ready(function(){
    $("#form_sample_2").validate({
		debug: true,
		ignoreTitle: true,	
		rules:{
			name:{
				required: true,
				rangelength: [2,8],
				language: true
				},
			sex:{
				required: true,
				maxlength: 1,
				remote: "/index.php?c=resume&m=checksex"
				},
			mobile:{
				required: true,
				isMobile: true
				},
			email:{
				required: true,
				mail: true
				},
			edu:{
				required: true,
				language: true
				},
			workhistory:{
				required: true,
				wenzhang: true
				},
			content:{
				required: true,
				wenzhang: true
				}  
            },
		messages:{
			name:{
				required: "请输入姓名",
				rangelength: "输入长度必须介于 2 和 8 之间的字符串"
				},
			sex:{
				required: "请输入性别",
				maxlength: "最多输入一个字",
				remote: $.format("必须填写男或女")
				},
			mobile:{
				required: "请输入手机号" 
				},
			email:{
				required: "请输入email"
				},
			edu:{
				required: "请输入学历"
				},
			workhistory:{
				required: "请输入工作经验"
				},
			content:{
				required: "请输入工作内容"
				} 
			},
		errorClass: "valierror",
		errorElement: "div",
		errorPlacement: function(error, element) {  //验证消息放置的地方   
//            error.insertAfter( element.parent("div"));   
//	        },
			if (element.attr("name") == "name") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                error.addClass("valierror").appendTo("#form_2_name_error");
            } else if (element.attr("name") == "sex") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_sex_error");
            } else if (element.attr("name") == "mobile") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_mobile_error");
            }else if (element.attr("name") == "email") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_email_error");
            }else if (element.attr("name") == "edu") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_edu_error");
            }else if (element.attr("name") == "workhistory") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_workhistory_error");
            } else if (element.attr("name") == "content") { // for uniform checkboxes, insert the after the given container
                error.addClass("valierror").appendTo("#form_2_content_error");
            } else {
                error.insertAfter(element); // for other inputs, just perform default behavoir
            }
		},
		submitHandler: function(form){
			form.submit();
		}
	});
    
    //自定义中英文验证
    jQuery.validator.addMethod("language", function(value, element) {
    	return this.optional(element) || /^[a-zA-Z\u4e00-\u9fa5]*$/.test(value);
    	}, "只能填写中文字、英文字母");
	
    //自定义手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /1[3458]{1}\d{9}$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");
    
    //自定义中英文标点符号验证
    jQuery.validator.addMethod("wenzhang", function(value, element) {
    	//var zhengze = /^[a-zA-Z\u4e00-\u9fa5]+[\,\.\?\[\]\!\<\>\“\”\(\)\;]*$/;
    	var zhengze = /^[0-9a-zA-Z\u4e00-\u9fa5]+.*$/;
    	return this.optional(element) || zhengze.test(value);
    	}, "只能填写中英文、数字和标点符号,且不能以标点符号开头");
    
  //自定义邮箱验证
    jQuery.validator.addMethod("mail", function(value, element) {
    	var zhengze = /^[0-9a-zA-Z]+@(([0-9a-zA-Z]+)[.])+(com|cn)+$/i;
    	return this.optional(element) || zhengze.test(value);
    	}, "请正确输入email格式");
});