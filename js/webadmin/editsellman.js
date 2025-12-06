$(document).ready(function(){
	//Sample 2
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
            	user_id: {
                    required: true,
                    remote: {
						url: "/index.php?c=sellman&m=checkedit",     //后台处理程序
						type: "post",               //数据发送方式
						dataType: "json",           //接受数据格式   
						data: {                     //要传递的数据
							olduserid: function(){
							return $("#olduserid").val();
							},
							newuserid: function(){
							return $("#newuserid").val();
							}
						}
					}
                },
                user_name: {
                    required: true
                },
                user_sn: {
                    required: true,
                    number: true
                },
                role_id: {
                    required: true
                },
                orgstr_id: {
                    required: true,
                    number: true
                },
                orgstr_tree: {
                    required: true
                }
            },

            messages: { // custom messages for radio buttons and checkboxes
            	user_id: {
					required: "组员id必填",
					remote: $.format("组员id已经被占用")
				},
				user_name: {
                    required: "组员名称必填"
                },
                user_sn: {
                    required: "组员工号必填",
                    number: "必须填写数字"
                },
                role_id: {
                    required: "角色必填"
                },
                orgstr_id: {
                    required: "组织架构id必填",
                    number: "必须填写数字"
                },
                orgstr_tree: {
                    required: "组织架构树必填"
                }
            },
			
			//把错误信息放在验证的元素后面，指明错误放置的位置
            errorPlacement: function (error, element) { // render error placement for each input type
                //if (element.attr("name") == "education") { // for chosen elements, need to insert the error after the chosen container
                   // error.insertAfter("#form_2_education_chzn");
                //} else 
				if (element.attr("name") == "status") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                    error.addClass("no-left-padding111").insertAfter("#form_2_status_error");
                } else {
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
});