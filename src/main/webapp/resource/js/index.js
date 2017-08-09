/**
 * 
 */
 $(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);
	
	$("#subbtu").click(function(){
		if($("#loginName").val() == ""){
			layer.msg('请输入登入名', {icon: 5});
		}else if($("#password").val() == ""){
			layer.msg('请输入密码', {icon: 5});
		}else{
			$.post("login.do", { loginName:$("#loginName").val(),password:$("#password").val(),ident:$("#ident").val()},
			function (data, textStatus){
				if(!data.status){
					layer.msg('登录信息错误', {icon: 5});
				}else{
					var ident = $("#ident").val();
					if(ident == "1"){
						window.location="views/Seller.jsp";
					}else if(ident == "0"){
						window.location="views/User.jsp";
					}else if(ident == "2"){
						window.location="views/Admin.jsp";
					}
				}
			}, "json");	
		}
	});
});
 