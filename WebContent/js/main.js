function checkUrl(str) { 
		var RegUrl = /^((ht|f)tps?):\/\/[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:\/~\+#]*[\w\-\@?^=%&\/~\+#])?$/; 
		if (!RegUrl.test(str)) { 
			return false; 
		}
		return true; 
}
//初始化fileinput控件（第一次初始化）
function initFileInput(ctrlName, uploadUrl) {    
    var control = $('#' + ctrlName); 
    control.fileinput({
    	 language: 'zh', //设置语言
         showUpload: true,
         maxFileCount: 1,
         dropZoneEnabled: false,//是否显示拖拽区域
         uploadUrl: uploadUrl, // you must set a valid URL here else you will get an error
         overwriteInitial: false,
         maxFileSize: 10000,
         allowedFileTypes: ['image'],
         slugCallback: function(filename) {
             return filename.replace('(', '_').replace(']', '_');
         }
    });
}

//活动置顶--设置活动为热点活动
function setActiveTop() {
	var activds = "";
	// 获取选中的选项
	$.each($(".checkchild:checked"), function(i, n) {
		activds = activds + "," + n.value;
	});
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要置顶吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				$.ajax({
					url : 'active/setActTop',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'activeids=' + activds.substring(1),
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						// console.log(data)
						// console.log(textStatus)
						// console.log(jqXHR)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
						// 刷新当前页面
						table.api().ajax.reload();
						// window.location.reload(true);
					},
					error : function(xhr, textStatus) {
						// console.log('错误')
						// console.log(xhr)
						// console.log(textStatus)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			}
		},
		title : "置顶框",
	});
}
// 取消活动置顶--取消设置为热点活动
function cancelActiveTop() {
	var activds = "";
	// 获取选中的选项
	$.each($(".checkchild:checked"), function(i, n) {
		activds = activds + "," + n.value;
	});
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要取消置顶吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				$.ajax({
					url : 'active/cancelActTop',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'activeids=' + activds.substring(1),
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						// console.log(data)
						// console.log(textStatus)
						// console.log(jqXHR)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
						// 刷新当前页面
						table.api().ajax.reload();
						// window.location.reload(true);
					},
					error : function(xhr, textStatus) {
						// console.log('错误')
						// console.log(xhr)
						// console.log(textStatus)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			}
		},
		title : "置顶框",
	});
}
//删除用户
function delUser(id,flag){
	// 获取选中的选项
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要进行此操作吗？',
		callback : function(result) {
			if(result){
				// 发送请求删除数据
				$.ajax({
						url : 'user/del',
						type : 'POST', // GET
						async : true, // 或false,是否异步
						data : 'userid=' + id+"&status="+flag,
						timeout : 5000, // 超时时间
						dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
						success : function(data, textStatus, jqXHR) {
							bootbox.alert({
								buttons : {
									ok : {
										label : '确定',
										className : 'btn-myStyle'
									}
								},
								message : data.message,
								title : "操作消息",
							});
							// 刷新当前页面
							table.api().ajax.reload();
						},
						error : function(xhr, textStatus) {
							bootbox.alert({
								buttons : {
									ok : {
										label : '确定',
										className : 'btn-myStyle'
									}
								},
								message : data.message,
								title : "操作消息",
							});
						}
				});
			}
		},
		title : "确认框",
	});
}
//删除活动
function delActive(id,isDel) {
	// 获取选中的选项
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除活动吗？',
		callback : function(result) {
			if(result&&isDel==1){
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : '不可以重复删除活动',
					title : "操作消息",
				});
				return;
			}
			if(result){
				// 发送请求删除数据
				$.ajax({
						url : 'active/del',
						type : 'POST', // GET
						async : true, // 或false,是否异步
						data : 'activeid=' + id,
						timeout : 5000, // 超时时间
						dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
						success : function(data, textStatus, jqXHR) {
							bootbox.alert({
								buttons : {
									ok : {
										label : '确定',
										className : 'btn-myStyle'
									}
								},
								message : data.message,
								title : "操作消息",
							});
							// 刷新当前页面
							table.api().ajax.reload();
						},
						error : function(xhr, textStatus) {
							bootbox.alert({
								buttons : {
									ok : {
										label : '确定',
										className : 'btn-myStyle'
									}
								},
								message : data.message,
								title : "操作消息",
							});
						}
				});
			}
		},
		title : "确认框",
	});
}

//查询push详细信息
function pushdetail(id) {
	window.location.href = "push/id2push?pushid=" + id;
}
// 查询用户详情
function userdetail(id) {
	window.location.href = "user/id2user?userid=" + id;
}
// 查询活动详情
function activedetail(id) {
	window.location.href = "active/id2act?actid=" + id;
}
// 返回用户列表
function userback() {
	window.location.href = "pages/user/user_list.jsp";
}
function pushback() {
	window.location.href = "pages/push/push_list.jsp";
}

function groupdetail(id) {
	window.location.href = "group/id2group?groupid=" + id;
}
function groupback(){
	window.location.href = "pages/push/group_list.jsp";
}
//修改群组状态
function editGroupStatus(id,status){
	window.location.href = "group/status?groupid="+id+"&status="+status;
}
//修改活动类别状态
function editTypeStatus(id,status){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要修改吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				window.location.href = "acttype/status?id="+id+"&status="+status;
			}
		},
		title : "活动状态改变",
	});
}
//修改轮播图状态
function editTurnStatus(id,status){
	window.location.href = "turn/status?id="+id+"&status="+status;
}
//删除单页
function delComp(id){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				window.location.href = "comp/del?id="+id;
			}
		},
		title : "群组框",
	});
}

function delTurn(id,flag){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				if (flag == 't') {
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定',
								className : 'btn-myStyle'
							}
						},
						message : '正在使用轮播图不能删除',
						title : "操作消息",
					});
					return;
				}
				window.location.href = "turn/del?id=" + id;
			}
		},
		title : "群组框",
	});
}

//删除群组
function delGroup(id){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除群组吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				window.location.href = "group/del?groupid="+id;
			}
		},
		title : "群组框",
	});
}

//删除系统账号
function delSysUser(id){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除账号吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				window.location.href = "author/del?id="+id;
			}
		},
		title : "系统账号框",
	});
}

// 修改引导图
function editCarouse(title, weight, ischoose, imageFrontOld, id) {
	$("#user_form").attr("action", "carousel/ChangeGuid.action");
	$("#title").val(title);// 写入角色编号
	$("#weight").val(weight);
	$("#ischoose").val(ischoose);
	$("#imageFrontOld").attr("src", imageFrontOld);
	$("#path").val(imageFrontOld);
	$("#id").val(id);
	$('#myModal').modal('show');// 显示修改
}
// 修改editType
function editType(title, id,status,weight) {
	$("#acttype_form").attr("action", "acttype/edit");
	$("#title").val(title);//
	$("#id").val(id);
	//设置状态
	if(status=="0"){
		document.getElementById("is1").checked=true;
		document.getElementById("is2").checked=false;
	}else{
		document.getElementById("is1").checked=false;
		document.getElementById("is2").checked=true;
	}
	$("#weight").val(weight);
	$('#myModal').modal('show');// 显示修改
}
// 修改开屏广告
function editPeacock(title, weight, ischoose, imageFrontOld, id) {
	$("#user_form").attr("action", "carousel/ChangePeacock.action");
	$("#title").val(title);// 写入角色编号
	$("#imageFrontOld").attr("src", imageFrontOld);
	$("#path").val(imageFrontOld);
	$("#id").val(id);
	$('#myModal').modal('show');// 显示修改
}

function initPortrait(ctrlName, imageurl) {
    var control = $('#' + ctrlName);
    //重要，需要更新控件的附加参数内容，以及图片初始化显示
    control.fileinput('refresh', {
        initialPreview: [ //预览图片的设置
            "<img src='http://127.0.0.1:8087/cishi/upload/79176029d63c447d8baa3fe38e52e157.jpg' class='file-preview-image' alt='肖像图片' title='肖像图片'>"
        ]
    });
}
//修改轮播回显
function editTurn(id) {
	$.ajax({
		url : 'turn/id2turn',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		data : 'id=' + id,
		timeout : 5000, // 超时时间
		dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data, textStatus, jqXHR) {
			$("#turn_form").attr("action", "turn/edit");
			$("#id").val(id);//
			$("#title").val(data.title);
			$("#weight").val(data.weight);
			$("#ischoose").val(data.ischoose);
			//设置状态按钮
			$('#myflag').bootstrapSwitch('state',data.ischoose=='t'?true:false, data.ischoose=='t'?true:false);
			//图片回显
			//initPortrait('coverphoto',data.path);
			//设置选中项
			$("#coverphoto2").val(data.path);
			$("#type").val(data.type);
			if(data.type=="1"||data.type=="2"){
				$("#url").val(data.url);
			}else{
				$("#url").val(data.mobile);
			}
			//设置
			$('#myModal').modal('show');// 显示修改
		},
		error : function(xhr, textStatus) {
			bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message : '查询异常',
				title : "操作消息",
			});
		}
	});
}
//修改单页
function editComp(id) {
	$.ajax({
		url : 'comp/id2comp',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		data : 'id=' + id,
		timeout : 5000, // 超时时间
		dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data, textStatus, jqXHR) {
			$("#comp_form").attr("action", "comp/edit");
			$("#id").val(id);//
			$("#title").val(data.title);
			$("#weight").val(data.weight);
			//设置状态
			if(data.category=="u"){
				document.getElementById("cat1").checked=true;
				document.getElementById("cat2").checked=false;
				$("#url").val(data.url);
				UE.getEditor('editor').execCommand( "clearlocaldata" );
				UE.getEditor('editor').setContent("");
				$("#divcontent").hide();
				$("#divurl").show();
			}else{
				document.getElementById("cat1").checked=false;
				document.getElementById("cat2").checked=true;
				$("#url").val("");
				UE.getEditor('editor').execCommand( "clearlocaldata" );
				UE.getEditor('editor').setContent(data.content);
				$("#divcontent").show();
				$("#divurl").hide();
			}
			//设置
			$('#myModal').modal('show');// 显示修改
		},
		error : function(xhr, textStatus) {
			bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message : '查询异常',
				title : "操作消息",
			});
		}
	});
}
//单页详情
function detailComp(id) {
	$.ajax({
		url : 'comp/id2comp',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		data : 'id=' + id,
		timeout : 5000, // 超时时间
		dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data, textStatus, jqXHR) {
			$("#titleDetail").html(data.title);// 
			$("#weightDetail").html(data.weight);
			//设置状态
			if(data.category=="u"){
				$("#cateDetail").html("URL地址");
				$("#contentDetail").html(data.url);
			}else{
				$("#cateDetail").html("自填内容");
				$("#contentDetail").html(data.content);
			}
			//设置
			$('#detailModal').modal('show');// 显示修改
		},
		error : function(xhr, textStatus) {
			bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message : '查询异常',
				title : "操作消息",
			});
		}
	});
}
//意见反馈详情
function detailOpin(id) {
	$.ajax({
		url : 'opinion/id2opin',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		data : 'id=' + id,
		timeout : 5000, // 超时时间
		dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data, textStatus, jqXHR) {
			$("#titleDetail").html(data.title);// 
			$("#mobileDetail").html(data.tel);// 
			$("#createTimeDetail").html(data.createdate);// 
			$("#contentDetail").html(data.content);// 
			//设置
			$('#detailModal').modal('show');// 显示修改
		},
		error : function(xhr, textStatus) {
			bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message : '查询异常',
				title : "操作消息",
			});
		}
	});
}

//修改群组-PUSH
function editGroup(groupid,groupname, status, memo) {
	$("#group_form").attr("action", "group/edit");
	$("#groupname").val(groupname);// 写入角色编号
	$("#id").val(groupid);
	$("#memo").html(memo);
	//设置状态
	if(status=="0"){
		document.getElementById("is1").checked=true;
		document.getElementById("is2").checked=false;
	}else{
		document.getElementById("is1").checked=false;
		document.getElementById("is2").checked=true;
	}
	//设置
	guTable.api().ajax.url('user/group2user2?groupid='+groupid).load();
//	guTable.api().ajax.reload();
	$('#myModal').modal('show');// 显示修改
}

//修改系统账号
function editSysUser(id,username, truename) {
	$("#sysuser_form").attr("action", "author/edit");
	$("#username").val(username);// 写入角色编号
	$("#id").val(id);
	$("#truename").val(truename);
	$('#myModal').modal('show');// 显示修改
}

// 删除引导图
function delCarouse(id,flag) {
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除这条信息吗?',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				if (flag == 't') {
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定',
								className : 'btn-myStyle'
							}
						},
						message : '正在使用引导图不能删除',
						title : "操作消息",
					});
					return;
				}
				window.location.href = "carousel/deleteguid.action?id=" + id;
			}
		},
		title : "引导图提示框",
	});
}
// 删除开屏广告
function delPeacock(id, flag) {
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定要删除这条信息吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				if (flag == 't') {
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定',
								className : 'btn-myStyle'
							}
						},
						message : '正在使用开屏广告不能删除',
						title : "操作消息",
					});
					return;
				}
				window.location.href = "carousel/deletepeacock.action?id=" + id;
			}
		},
		title : "开屏广告框",
	});
}

//删除意见反馈
function delOpinion(id) {
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定删除吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				$.ajax({
					url : 'opinion/del',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'id=' + id,
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
						// 刷新当前页面
						opinionTable.api().ajax.reload();
					},
					error : function(xhr, textStatus) {
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			}
		},
		title : "确认框",
	});
}
// 删除活动类别
function delActType(id) {
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确定删除该条信息吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				$.ajax({
					url : 'acttype/del',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'id=' + id,
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						// console.log(data)
						// console.log(textStatus)
						// console.log(jqXHR)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
						// 刷新当前页面
						table.api().ajax.reload();
						// window.location.reload(true);
					},
					error : function(xhr, textStatus) {
						// console.log('错误')
						// console.log(xhr)
						// console.log(textStatus)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			}
		},
		title : "确认框",
	});
}

//修改系统账号状态
function editSysUserStatus(id,status){
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : status=='2'?'确定要锁定该账号吗？':'确定要解锁该账号吗？',
		callback : function(result) {
			if (result) {
				// 发送请求删除数据
				$.ajax({
					url : 'author/status',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'id=' + id+'&status='+status,
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
						// 刷新当前页面
						sysUserTable.api().ajax.reload();
					},
					error : function(xhr, textStatus) {
						// console.log('错误')
						// console.log(xhr)
						// console.log(textStatus)
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			}
		},
		title : "确认框",
	});
}

// 打开增加引导图
function addCarouse() {
	// 隐藏所有校验图标和内容
	$("#user_form").data('bootstrapValidator').resetForm();
	$("#user_form").attr("action", "carousel/guidAdd.action");
	$("#title").val("");// 写入角色编号
	$("#weight").val("");
	$("#ischoose").val('f');
	$("#imageFrontOld").attr("src", "");
	$("#path").val("");
	$("#result").html("");
	$('#myModal').modal('show');// 显示修改
}
//打开轮播图
function addTurn() {
	// 隐藏所有校验图标和内容
	$("#turn_form").data('bootstrapValidator').resetForm();
	$("#turn_form").attr("action", "turn/add");
	$("#title").val("");// 写入角色编号
	$("#weight").val("");
	$("#ischoose").val('t');
	$("#coverphoto2").val("");
	initFileInput("coverphoto","file/fileUpload?"+ new Date());
	$("#url").html("");
	$('#myModal').modal('show');// 显示修改
}
//打开群组
function addGroup(){
	$("#group_form").data('bootstrapValidator').resetForm();
	$("#group_form").attr("action", "group/add");
	$("#groupname").val("");// 写入角色编号
	$("#memo").html("");
	$('#myModal').modal('show');// 显示修改
	//清空子表中所有checkbox为未选中状态
	guTable.$("INPUT[name='userId']").each( function() {
       	$(this).prop("checked", false);
    });
}
//打开单页
function addComp(){
	$("#comp_form").data('bootstrapValidator').resetForm();
	$("#comp_form").attr("action", "comp/add");
	$("#title").val("");// 标题
	$("#weight").val("");
	document.getElementById("cat1").checked=true;
	//编辑器内容置空
	UE.getEditor('editor').execCommand( "clearlocaldata" );
	UE.getEditor('editor').setContent("");
	$("#divurl").css("display","block");
	$("#divcontent").css("display","none");
	$('#myModal').modal('show');// 显示修改
}

//打卡push页面
function addPush() {
	// 隐藏所有校验图标和内容
	$("#push_form").data('bootstrapValidator').resetForm();
	$("#push_form").attr("action", "push/add");
	$("#msgtype").val("1");// 写入角色编号
	$("#pushtitle").val("");
	$("#title").val("");
	$("#coverphoto2").val("");
	$("#coverphoto").val();
	$("#content").attr("");
	$("#forwardType").val("");
	$("#productId").val("");
	$("#inlineCheckbox3").attr("checked","true");
	$("#shareId").val("");
	$("#osType3").attr("checked","true");
	$("#is1").attr("checked","true");
	$("#sender").val("");
	$("#sendnow").attr("checked","true");
	$("#sendTime").val("");
	$("#pushId").val("");
	$("#encryptionKey").val("");
	initFileInput("coverphoto","file/fileUpload?"+ new Date());
	$('#myModal').modal('show');// 显示修改
}

// 打开增加开屏广告
function addpeacock() {
	// 隐藏所有校验图标和内容
	$("#user_form").data('bootstrapValidator').resetForm();
	$("#user_form").attr("action", "carousel/peacockAdd.action");
	$("#title").val("");// 写入标题
	$("#imageFrontOld").attr("src", "");
	$("#path").val("");
	$("#result").html("");
	$('#myModal').modal('show');// 显示修改
}

// 打开增加活动类别
function addactivetype() {
	// 隐藏所有校验图标和内容
	$("#acttype_form").data('bootstrapValidator').resetForm();
	$("#acttype_form").attr("action", "acttype/add");
	$("#title").val("");// 写入标题
	$('#myModal').modal('show');// 显示修改
}

function addSysUser(){
	$("#sysuser_form").data('bootstrapValidator').resetForm();
	$("#sysuser_form").attr("action", "author/add");
	$("#username").val("");
	$("#pass1").val("");
	$("#password").val("");
	$("#truename").val("");
	$('#myModal').modal('show');// 显示修改
}

function updateStae(id, state) {
	bootbox.confirm({
		buttons : {
			confirm : {
				label : '确定',
				className : 'btn-myStyle'
			},
			cancel : {
				label : '取消',
				className : 'btn-default'
			}
		},
		message : '确认要修改吗?',
		callback : function(result) {
			if (result) {
				window.location.href = "carousel/changestate.action?id=" + id + "&state=" + state;
			}
		},
		title : "引导图提示框",
	});
}

function updatePeacockStae(id, state) {
	if (confirm("确认要修改吗？") == true) {
		window.location.href = "carousel/changestate.action?id=" + id + "&state=" + state;
	}
}

$(document).ready(function() {
	$("#btn_user_submit").unbind("click");
	// 提交引导图、开屏广告
	$("#btn_user_submit").click(function(e) {
		e.preventDefault();
		$('#user_form').data('bootstrapValidator').validate();
		if (!$('#user_form').data('bootstrapValidator').isValid()) {
			return;
		}
//		if ($("#path").val() == "") {
//			alert("请选择要上传的图片");
//			return;
//		}
		document.user_form.submit();
	});

	// 提交活动类别
	$("#btn_type_submit").unbind("click");
	// 添加活动类别
	$("#btn_type_submit").click(function(e) {
		e.preventDefault();
		$('#acttype_form').data('bootstrapValidator').validate();
		if (!$('#acttype_form').data('bootstrapValidator').isValid()) {
			return;
		}
		// 提交
		$.ajax({
			url : $("#acttype_form").attr('action'),
			type : 'POST', // GET
			async : true, // 或false,是否异步
			data : 'title=' + $("#title").val() + '&id=' + $("#id").val()+'&status='+$("input[name='status']:checked").val()+"&weight="+$("#weight").val(),
			timeout : 5000, // 超时时间
			dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data, textStatus, jqXHR) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : data.message,
					title : "操作消息",
				});
				// 关闭当前的窗口
				$('#myModal').modal('hide');// 显示修改
				// 刷新当前页面
				table.api().ajax.reload();
				// window.location.reload(true);
			},
			error : function(data, textStatus) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : data.message,
					title : "操作消息",
				});
			}
		});
	});

	//提交push信息
//	$("#btn_push_submit").unbind("click");
//	// 添加活动类别
//	$("#btn_push_submit").click(function(e) {
//		e.preventDefault();
//		$('#push_form').data('bootstrapValidator').validate();
//		if (!$('#push_form').data('bootstrapValidator').isValid()) {
//			return;
//		}
//		var str_data=$("#push_form").map(function(){
//			 return ($(this).attr("name")+'='+$(this).val());
//			}).get().join("&") ;
//		alert(str_data);
//		// 提交
//		$.ajax({
//			url : $("#push_form").attr('action'),
//			type : 'POST', // GET
//			async : true, // 或false,是否异步
//			data : 'title=' + $("#title").val() + '&id=' + $("#id").val(),
//			timeout : 5000, // 超时时间
//			dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
//			success : function(data, textStatus, jqXHR) {
//				bootbox.alert({
//					buttons : {
//						ok : {
//							label : '确定',
//							className : 'btn-myStyle'
//						}
//					},
//					message : data.message,
//					title : "操作消息",
//				});
//				// 关闭当前的窗口
//				$('#myModal').modal('hide');// 显示修改
//				// 刷新当前页面
//				table.api().ajax.reload();
//				// window.location.reload(true);
//			},
//			error : function(xhr, textStatus) {
//				bootbox.alert({
//					buttons : {
//						ok : {
//							label : '确定',
//							className : 'btn-myStyle'
//						}
//					},
//					message : data.message,
//					title : "操作消息",
//				});
//			}
//		});
//	});

	// 增加按钮
	$('.btn-add').click(function(e) {
		e.preventDefault();
		$('#myModal').modal('show');
	});
	// 修改密码
	$('.btn-pwd').click(function(e) {
		e.preventDefault();
		//清空原
		$("#newpwd").val("");
		$("#password").val("");
		$('#myModal1').modal('show');
	});
	
	//增加push
	$("#btn_push_submit").unbind("click");
	$("#btn_push_submit").click(function(e){
		e.preventDefault();
		$('#push_form').data('bootstrapValidator').validate();
		if (!$('#push_form').data('bootstrapValidator').isValid()) {
			return;
		}
		document.push_form.submit();
	});
	//增加群组
	$("#btn_group_submit").unbind("click");
	$("#btn_group_submit").click(function(e){
		e.preventDefault();
		$('#group_form').data('bootstrapValidator').validate();
		if (!$('#group_form').data('bootstrapValidator').isValid()) {
			return;
		}
		var ids="";
		//获取选中的用户id
		$.each(guTable.$(".checkchild:checked"), function(i, n) {
			ids = ids + "," + n.value;
		});
		$("#gulinkid").val(ids.substring(1));
		document.group_form.submit();
	});
	//增加系统账号
	$("#btn_sysuser_submit").unbind("click");
	$("#btn_sysuser_submit").click(function(e){
		e.preventDefault();
		$('#sysuser_form').data('bootstrapValidator').validate();
		if (!$('#sysuser_form').data('bootstrapValidator').isValid()) {
			return;
		}
		document.sysuser_form.submit();
	});
	//新增单页
	$("#btn_comp_submit").unbind("click");
	$("#btn_comp_submit").click(function(e){
		e.preventDefault();
		$('#comp_form').data('bootstrapValidator').validate();
		if (!$('#comp_form').data('bootstrapValidator').isValid()) {
			return;
		}
		document.comp_form.submit();
		
	});
	//新增轮播图
	$("#btn_turn_submit").unbind("click");
	$("#btn_turn_submit").click(function(e){
		e.preventDefault();
		$('#turn_form').data('bootstrapValidator').validate();
		if (!$('#turn_form').data('bootstrapValidator').isValid()) {
			return;
		}
		document.turn_form.submit();
		
	});
	//修改密码
	$("#btn_upwd_submit").unbind("click");
	$("#btn_upwd_submit").click(function(e){
		e.preventDefault();
		$('#upwd_form').data('bootstrapValidator').validate();
		if (!$('#upwd_form').data('bootstrapValidator').isValid()) {
			return;
		}
		//document.upwd_form.submit();
		$.ajax({
			url : 'tusercontroller/updatePassword.action',
			type : 'POST', // GET
			async : true, // 或false,是否异步
			data : 'password=' + $("#password").val(),
			timeout : 5000, // 超时时间
			dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data, textStatus, jqXHR) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : "密码修改成功！",
					title : "操作消息",
				});
				// 关闭当前的窗口
				$('#myModal1').modal('hide');// 显示修改
			},
			error : function(xhr, textStatus) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : "密码修改失败！",
					title : "操作消息",
				});
			}
		});
	});
});
