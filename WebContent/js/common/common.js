$(document).ready(function(){
	
	$("ul.leftmenu a.dropmenu").click(function(){
		var ulNode = $(this).next("ul");
		ulNode.slideToggle("slow");
		changeIcon($(this));
	});
	
	
	
	$(".list_table tr").hover(function(){
		$(this).addClass("rowhover");
	},function(){
		$(this).removeClass("rowhover");
	});
	
});

// function changeIcon(chgNode){
//	 if(chgNode){
//		 if(chgNode.css("background-image").indexOf("collapsed.gif")>=0){
//			 chgNode.css("background-image","url('image/common/expanded.gif')");
//		 }else{
//			 chgNode.css("background-image","url('image/common/collapsed.gif')");
//		 }
//	 }
// }
 

 function doCheckedAll(elem){
	 $(elem).offsetParent("tabel").find("input:checkbox").attr("checked",elem.checked);
 }
 

  function addRowCondition(){
	 $("#advsearchtab tr:last").after("<tr>"+$("#condtemplet tr:last").html()+"</tr>");
  }
	
	function alertText(){
		var str=$("select option:selected").text();
		alert("choice:"+str);
	}
	
  function removeRowCondition(){
	 $("#advsearchtab tr:not(:first):last").remove();
  }


  function doAdvancedSearch(){
	  $("#advancedsearchcon").slideToggle()
  }


  function resetAdvancedSearch(){
	  $("#advsearchtab tr:not(:first)").remove();
	  $("#groupbrowse .kind").removeClass("kindhover").find("li.kindlihover").removeClass("kindlihover");
	  $("#groupbrowse div.subkind:visible").fadeOut("20");
	  $("#groupbrowse .subkind ul li.sel").removeClass("sel");
  }


  $(function(){
	 
	  $("#groupbrowse .kind li").bind("click",function(){
		  $(this).addClass("kindlihover").parent(".kind").addClass("kindhover").end().siblings("li").removeClass("kindlihover");
		  var index = $(this).prevAll().length;
		  $("#groupbrowse div.subkind").eq(index).fadeIn("100").siblings("div.subkind").hide();
	  });
	
	  $("#groupbrowse .subkind span.close").bind("click",function(){
		  $("#groupbrowse .kind").removeClass("kindhover").find("li.kindlihover").removeClass("kindlihover");
		  $("#groupbrowse div.subkind:visible").fadeOut("20");
	  });
	  
	  $("#groupbrowse .subkind ul li").bind("click",function(){
		  $(this).toggleClass("sel");
	  });
	 
	  $("#advancedsearchcon .advsearchtitle span").bind("click",function(){
		  $("#advancedsearchcon").slideToggle();
	  });
  });