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
            	linename: {
                    required: true,
                    remote: {
						url: "/index.php?c=bus&m=checkedit",     //后台处理程序
						type: "post",               //数据发送方式
						dataType: "json",           //接受数据格式   
						data: {                     //要传递的数据
								oldlinename: function(){
								return $("#oldlinename").val();
								},
								newlinename: function(){
								return $("#newlinename").val();
								}
						}
					}
                },
				sno: {
                    required: true,
					number: true
                },
                line: {
                    required: true
                },
                linetime: {
                    required: true
                },
                driver: {
                    required: true
                },
                dmobile: {
                    required: true,
                    rangelength: [11,11],
                    number: true
                },
                busnumber: {
                    required: true
                },
                teamer: {
                    required: true
                },
                tmobile: {
                    required: true,
                    rangelength: [11,11],
                    number: true
                },
                temail: {
                    required: true,
                    email: true
                },
//                "get_station[]": {
//                	required: true
//                },
//                "send_time[]": {
//                	required: true
//                },
//                "stop_address[]": {
//                	required: true
//                }
				nightstart: {
                    required: true
                },
                nighttime: {
                    required: true
                },
                nightadd: {
                    required: true
                }
            },

            messages: { // custom messages for radio buttons and checkboxes
            	linename: {
					required: "线路名称必填",
					remote: $.format("线路名称已存在")
				},
				sno: {
					required: "班车编号必填",
					number: "必须填写数字"
				},
				line: {
					required: "班车线路必填"
				},
				linetime: {
					required: "早晚发车时间必填"
				},
				driver: {
                    required: "司机名称必填"
                },
                dmobile: {
                    required: "司机手机号必填",
                    rangelength: "必须填写十一位数字",
                    number: "必须填写数字"
                },
                busnumber: {
                    required: "车牌号必填"
                },
                teamer: {
                    required: "班车长必填"
                },
                tmobile: {
                    required: "班车长手机号必填",
                    rangelength: "必须填写十一位数字",
                    number: "必须填写数字"
                },
                temail: {
                    required: "班车长邮箱必填",
                    email: "必须填写正确的邮箱格式"
                },
//                "get_station[]": {
//                	required: "上车站点必填"
//                },
//                "send_time[]": {
//                	required: "发车时间必填"
//                },
//                "stop_address[]": {
//                	required: "停车位置必填"
//                }
				nightstart: {
                    required: "晚班始发站点必填"
                },
                nighttime: {
                    required: "晚班发车时间必填"
                },
                nightadd: {
                    required: "晚班停车位置必填"
                }
            },
			
			//把错误信息放在验证的元素后面，指明错误放置的位置
            errorPlacement: function (error, element) { // render error placement for each input type
                //if (element.attr("name") == "education") { // for chosen elements, need to insert the error after the chosen container
                   // error.insertAfter("#form_2_education_chzn");
                //} else 
				if (element.attr("name") == "station") { // 统一的单选按钮,插入后给定的容器。比如：form_2_membership_error
                    error.addClass("no-left-padding111").insertAfter("#form_2_station_error");
                } else if (element.attr("name") == "time") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_is_time_error");
                } else if (element.attr("name") == "address") { // for uniform checkboxes, insert the after the given container
                    error.addClass("no-left-padding").insertAfter("#form_2_address_error");
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