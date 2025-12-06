$(document).ready(function(){
//	$(".form_meridian_datetime").datetimepicker({
//		language: 'zh-CN',
//        format: "yyyy-mm-dd",
//        showMeridian: true,
//        autoclose: true,
//        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
//        todayBtn: true,
//        minView: "month", //选择日期后，不会再跳转去选择时分秒
//    });
	//Sample 2 entrytime
        $('#form_2_select2').select2({
            placeholder: "请选择",
            allowClear: true
        });

        var form2 = $('#form_sample_2');
        var error2 = $('.alert-error', form2);
        var success2 = $('.alert-success', form2);

        form2.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-inline', // default input error message class
            focusInvalid: true, // do not focus the last invalid input
            ignore: "",
            rules: {
//            	username: {
//                    required: true,
//                    remote: {
//						url: "/index.php?c=user&m=checkeditname",     //后台处理程序
//						type: "post",               //数据发送方式
//						dataType: "json",           //接受数据格式   
//						data: {                     //要传递的数据
//								oldname: function(){
//								return $("#oldname").val();
//								},
//								newname: function(){
//								return $("#newname").val();
//								}
//						}
//					}
//                },
//                lejumail: {
//                    required: true 
//                },
//                sno: {
//                    required: true,
//                    number: true
//                },
//                fullname: {
//                    required: true
//                },
//                city: {
//                    required: true 
//                },
//                dept: {
//                    required: true,
//                    number: true
//                },
//                depart_name: {
//                    required: true 
//                },
//                lft: {
//                    required: true,
//                    number: true
//                },
//                rgt: {
//                    required: true,
//                    number: true
//                },
//                wtype: {
//                    required: true
//                },
                tel: {
                    required: true,
                    number: true,
                    rangelength: [4,15]
                },
                mobile: {
                    required: true,
                    number: true,
                    rangelength: [11,11]
                },
//                ctype: {
//                    required: true
//                },
//                position: {
//                    required: true
//                },
//                status: {
//                    required: true
//                },
//                birthday: {
//                    required: true
//                },
//                entrytime: {
//                    required: true
//                },
//                work_position: {
//                    required: true
//                },
//                city_true: {
//                    required: true
//                },
//                mailname: {
//                    required: true
//                },
//                role_id: {
//                    required: true
//                },
//                weibo: {
//                    required: true
//                },
//                is_notify: {
//                	required: true
//                },
//                is_exists: {
//                    required: true
//                },
				is_ok: {
                    required: true
                }
//                wmh: {
//                    required: true
//                }
            },

            messages: { // custom messages for radio buttons and checkboxes
//				username: {
//                    required: "用户名必填",
//                    remote: $.format("用户名已经被占用")
//                },
//                lejumail: {
//                    required: "邮箱前缀必填" 
//                },
//                sno: {
//                    required: "员工编号必填",
//                    number: "必须填写数字"
//                },
//                fullname: {
//                    required: "员工全称必填"
//                },
//                city: {
//                    required: "城市必填" 
//                },
//                dept: {
//                    required: "组织机构编号必填",
//                    number: "必须填写数字"
//                },
//                depart_name: {
//                    required: "组织机构名称必填" 
//                },
//                lft: {
//                    required: "左范围必填",
//                    number: "必须填写数字"
//                },
//                rgt: {
//                    required: "右范围必填",
//                    number: "必须填写数字"
//                },
//                wtype: {
//                    required: "周报类型必填"
//                },
                tel: {
                    required: "座机电话必填",
                    number: "必须填写数字",
                    rangelength: "输入长度在四至十五位之间"
                },
                mobile: {
                    required: "手机号码必填",
                    number: "必须填写数字",
                    rangelength: "输入长度必须为十一位"
                },
//                ctype: {
//                    required: "职务必填"
//                },
//                position: {
//                    required: "位置必填"
//                },
//                status: {
//                    required: "状态必填"
//                },
//                birthday: {
//                    required: "生日必填"
//                },
//                entrytime: {
//                    required: "入职时间必填"
//                },
//                work_position: {
//                    required: "工作信息必填"
//                },
//                city_true: {
//                    required: "工作地点必填"
//                },
//                mailname: {
//                    required: "邮箱地址必填"
//                },
//                role_id: {
//                    required: "角色必填"
//                },
//                weibo: {
//                    required: "微博地址必填"
//                },
//                is_notify: {
//                	required: "发通知权限必填"
//                },
//                is_exists: {
//                    required: "是否存在必填"
//                },
				is_ok: {
                    required: "后台权限必填"
                }
//                wmh: {
//                    required: "微米号必填"
//                }
            },
			
			//把错误信息放在验证的元素后面，指明错误放置的位置
            errorPlacement: function (error, element) { // render error placement for each input type
                //if (element.attr("name") == "education") { // for chosen elements, need to insert the error after the chosen container
                   // error.insertAfter("#form_2_education_chzn");
                //} else 
				if (element.attr("name") == "is_ok") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                    error.addClass("no-left-padding111").insertAfter("#form_2_is_ok_error");
                } else if (element.attr("name") == "wtype") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_wtype_error");
                } else if (element.attr("name") == "ctype") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_ctype_error");
                }else if (element.attr("name") == "status") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_status_error");
                }else if (element.attr("name") == "birthday") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_birthday_error");
                }else if (element.attr("name") == "is_exists") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_is_exists_error");
                }else if (element.attr("name") == "is_notify") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_is_notify_error");
                }else if (element.attr("name") == "entrytime") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_entrytime_error");
                }else {
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

        /**
        * 返回重填
        */
        $("#reset").click(function(){
           location.reload(); 
        });
     
			
		//apply validation on chosen dropdown value change, this only needed for chosen dropdown integration.
        $('.chosen, .chosen-with-diselect', form2).change(function () {
            form2.validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
        });

        //apply validation on select2 dropdown value change, this only needed for chosen dropdown integration.
        $('.select2', form2).change(function () {
            form2.validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
        });
        
//        var name = $("input[name=depart_name]").val();
//        if(name=='总裁办'){
//        	$(".quanxian").show();
//        	$("input[name=is_notify]").rules("add",{
//				required:true
//			});
//        }else if(name=='人力资源部'){
//        	$(".quanxian").show();
//        	$("input[name=is_notify]").rules("add",{
//				required:true
//			});
//        }else if(name=='行政部'){
//        	$(".quanxian").show();
//        	$("input[name=is_notify]").rules("add",{
//				required:true
//			});
//        }else{
//        	$(".quanxian").hide();
//        	$("input[name=is_notify]").removeClass("error");
//        	$("input[name=is_notify]").remove(".help-inline");
//        	$("input[name=is_notify]").rules("remove");
//        }
//        
//        $("input[name=depart_name]").blur(function(){
//	        var dept = $("input[name=depart_name]").val();
//	        $.ajax({
//	        	url: "/index.php?c=user&m=checkdept",
//	        	type: 'post',
//	        	async: true,
//	        	data: {'dept':dept},
//	        	success: function(data){
//	        		if(data == 1){     
//	        			$(".quanxian").show();
//	        			$("input[name=is_notify]").rules("add",{
//	        				required:true
//	        			});
//	        		}else{
//	        			$(".quanxian").hide();
//	        			$("input[name=is_notify]").removeClass("error");
//	                	$("input[name=is_notify]").remove(".help-inline");
//	                	$("input[name=is_notify]").rules("remove");
//	        		}
//	        	},
//	        	
//	        });
//      });
});