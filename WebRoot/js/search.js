$(document).ready(function(){
							
	$("#select1 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length == 0) {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
			}
			$("#selectA a").html("服务商："+$(this).text());
		}
	});
	
	$("#select2 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length ==0) {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
			$("#selectB a").html("范围："+$(this).text());
		}
	});
	
	$("#select3 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length == 0) {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
			$("#selectC a").html("停车费："+$(this).text());
		}
	});

	$("#select4 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectD").remove();
		} else {
			var copyThisD = $(this).clone();
			if ($("#selectD").length == 0) {
				$(".select-result dl").append(copyThisD.attr("id", "selectD"));
			}
			$("#selectD a").html("充电服务费："+$(this).text());
		}
	});	

	$("#selectA").on("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectB").on("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectC").on("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectD").on("click", function () {
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$(".select dd").on("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});

	$(".search-toggle a").on("click", function () {
		var node = $(".select-section");
		if(node.is(':hidden')){//如果node是隐藏的则显示node元素，否则隐藏
			node.slideDown();
			$(this).html("收起");
		}else{
			node.slideUp();
			$(this).html("展开");
		}
	});
	$(".search-toggle a").on("mouseenter", function () {
		var node = $(".select-section");
		if(node.is(':hidden')){//如果node是隐藏的则显示node元素，否则隐藏
		    node.slideDown();
			$(this).html("收起");
		}
	});
	$("#search").click(function(){
		$(".select-section").hide();
	})
});