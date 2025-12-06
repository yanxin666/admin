$(document).ready(function(){
	// $(".form_meridian_datetime").datetimepicker({
		// language: 'zh-CN',
        // format: "yyyy-mm-dd HH:ii:ss",
        // showMeridian: true,
        // autoclose: true,
        // pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        // todayBtn: true
    // });
	
        var form2 = $('#form_sample_2');
        var error2 = $('.alert-error', form2);
        var success2 = $('.alert-success', form2);
        
        form2.validate({
        	errorElement: 'span', //default input error message container
            errorClass: 'help-inline', // default input error message class
            focusInvalid: true, // do not focus the last invalid input
            ignore: "",
            rules:{
//            	target_address: {
//                    required: true,
//                    email: true
//                },
//                sender_address:{
//                	required: true,
//                	email: true
//                },
                sender_id:{
                	required: true
                },
                title:{
                	maxlength: 20,
                	required: true
 	            },
 	           content:{
 	            	required: true
 	            }
 	           // time:{
 	            	// required: true
 	            // },
// 	           img:{
// 	            	required: true
// 	            },
// 	           device:{
// 	            	required: true
// 	            },
// 	           state: {
// 	            	required: true
//                }
            },
            messages: { 
//            	target_address: {
//					required: "收邮件地址不能为空!" ,
//					email: "必须输入正确的邮箱格式"
//				},
//				sender_address: {
//					required: "发邮件地址不能为空!" ,
//					email: "必须输入正确的邮箱格式"   
//				},
				sender_id: {
					required: "发通知人必选一个！"   
				},
				title:{
				   maxlength: "输入字符不能大于20",
	               required:"通知标题必填!"
	            },
	            content:{
	               required:"通知内容必填!"
	            }
	            // time:{
	                // required:"通知时间必填!"
	            // },
//	            img:{
//	                required:"图片必填!"
//	            },
//	            device:{
//	                required:"设备必填!"
//	            },
//	            state: {
//                	required: "发送状态必填!"
//                }
            },
			
          //把错误信息放在验证的元素后面，指明错误放置的位置
            errorPlacement: function (error, element) { // render error placement for each input type
            	
				if (element.attr("name") == "guess_betendtime") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                    error.addClass("no-left-padding111").insertAfter("#form_2_guess_betendtime_error");
                } else if (element.attr("name") == "guess_lotterytime") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                    error.addClass("no-left-padding111").insertAfter("#form_2_guess_lotterytime_error");
                } else
            	
                if (element.attr("name") == "time") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_time_error");
                }else if (element.attr("name") == "state") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_state_error"); 
                }
                else {
                    error.insertAfter(element); // for other inputs, just perform default behavoir
                }
            },

			//当未通过验证的表单提交时，可以在该回调函数中处理一些事情。
            invalidHandler: function (event, validator) { //display error alert on form submit   
                success2.hide();
                error2.show();
                App.scrollTo(error2, -200);
            },

			//将未通过验证的表单元素设置高亮。
            highlight: function (element) { // hightlight error inputs
                $(element).closest('.help-inline').removeClass('ok'); // display OK icon
                $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
            },

			//与highlight操作相反
            unhighlight: function (element) { // revert the change dony by hightlight
				$(element).closest('.control-group').removeClass('error'); // set error class to the control group
            },

			//如果指定它，当验证通过时显示一个消息。如果是String类型的，则添加该样式到标签中，如果是一个回调函数，则将标签作为其唯一的参数。
            success: function (label) {
                if (label.attr("for") == "service" || label.attr("for") == "membership") { // for checkboxes and radip buttons, no need to show OK icon
                    label.closest('.control-group').removeClass('error').addClass('success');
                    label.remove(); // remove error label here
                } else { // display success icon for other inputs
                    label.addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                }
            },
			
			//表单通过验证，提交表单。回调函数有个默认参数form
            submitHandler: function (form) {
                success2.show();
                error2.hide();
				form.submit();
            }

        });
		
		//apply validation on chosen dropdown value change, this only needed for chosen dropdown integration.
        $('.chosen, .chosen-with-diselect', form2).change(function () {
            form2.validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
        });    
});

//var type = $("input[name='notify_type']:checked").val();
//if(type == 1){
//	$("#some1").show();
//	$("#some2").show();
//}else{
//	$("#some1").show();
//	$("#some2").show();
//}

function choosetype(argtype){
	if(argtype == 'all'){
		$("#some1").hide();
		$("#some2").hide();
	}else if(argtype == 'some'){
		$("#some1").show();
		$("#some2").show();
	}
}