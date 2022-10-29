<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color:white;
}

.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img{
	width:600px;
}
</style>

<div class="row">
  <div class="col-lg-12">

    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>Bno</label> <input class="form-control" name='bno'
            value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${board.writer }"/>' readonly="readonly">
        </div>

<button data-oper='modify' class="btn btn-default">Modify</button>
<button data-oper='list' class="btn btn-info">List</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>

<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
</form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!--원본 첨부파일이 보여질 영역 시작 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	
	</div>
</div>
<!--원본 첨부파일이 보여질 영역 완료 -->

<!--thumnail 이 보여질 영역 시작 -->
<div class='row'>
  <div class="col-lg-12">
  	<div class="panel panel-default">
  		<div class="panel-heading">Files</div>
  		<!-- /.panel-heading -->
  		<div class="panel-body">
  			<div class="uploadResult">
  				<ul>
  				</ul>
  			</div>
  		</div>
  		<!-- end panel-body -->
  	</div>
  	<!-- end panel panel-default -->
  </div>
  <!-- end col-lg-12 -->
</div>
<!--thumnail이 보여질 영역 완료 -->

<!-- 댓글 목록 처리 시작-->
<div class='row'>
  <div class="col-lg-12">
    <!-- /.panel 댓글 제목/버튼 영역 시작-->
    <div class="panel panel-default">
       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      </div>    
    <!-- /.panel-heading -->
    <div class="panel-body">
    <!-- /.panel 댓글 제목/버튼 영역 완료-->    
      
<!--댓글 리스트 시작  -->
        <ul class="chat">
        </ul>
<!--댓글 리스트 완료  -->
      </div>
      <!-- /.panel .chat-panel -->
<!--댓글 네비게이션 시작  -->
	   <div class="panel-footer"></div>
<!--댓글 네비게이션 완료  -->
	</div>
  </div>
  <!-- ./ end row -->
</div>
<!-- 댁글 목록 처리 완료-->


<!-- Modal 창 시작 -->
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
              </div>          
          </div>
          <!--/.modal-content-->
        </div>
        <!--/.modal-dialog-->
      </div>
<!--/.modal 창 완료-->


<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">

  $(document).ready(function(){
    var bnoValue='<c:out value="${board.bno}"/>';
    var replyUL=$(".chat");
    showList(1);
	
    //게시물 첨부파일 function 시작
    (function(){
    	var bno = '<c:out value="${board.bno}"/>';
    	$.getJSON("/board/getAttachList",{bno:bno}, function(arr){
    		console.log(arr);
    		var str = "";
    		$(arr).each(function(i,attach){
    			//image type
    			if(attach.fileType){
    				var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
    				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.image+"'>";
    				str += " <div><img src='/display?fileName="+fileCallPath+"'></div></li>";
    			}else{
    				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.image+"' ><div>";
    				str += "<span> "+ attach.fileName+"</span>";
    				str += "<img src='/resources/img/attach.png'> </li>";
    			}
    		});
    		$(".uploadResult ul").html(str);
    		
    	}); //end getjson
    })(); //end function
    //게시물 첨부파일 function 완료
    
    //첨부파일 클릭 시 이벤트 처리 시작
    $(".uploadResult").on("click","li",function(e){
    	console.log("view image");
    	var liObj = $(this);
    	var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
    	if(liObj.data("type")){
    		showImage(path.replace(new RegExp(/\\/g),"/"));
    	}else {
    		//download
    		self.location = "/download?fileName="+path;
    	}
    });
    
    function showImage(fileCallPath){
    	//alert(fileCallPath);
    	
    	$(".bigPictureWrapper").css("display","flex").show();
    	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
    		.animate({width:'100%',height:'100%'},1000);
    }
    
    $(".bigPictureWrapper").on("click", function(e){
    	$(".bigPicture").animate({width:'0%', height:'0%'},1000);
    	setTimeout(function(){
    		$('.bigPictureWrapper').hide();
    	},1000);
    });
    //첨부파일 클릭 시 이벤트 처리 완료
    
    function showList(page){
    	console.log("show list "+page);
    	
		replyService.getList({bno:bnoValue, page:page||1}
			, function(replyCnt,list){
				console.log("replyCnt: "+replyCnt);
				console.log("list: "+list);
				console.log(list);
				if(page==-1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
			  var str="";
			  if(list==null||list.length==0){
			  //  replyUL.html("");
			    return;
		  	}
  
	        for(var i=0, len=list.length||0;i<len;i++){
	          str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	          str +="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
	          str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
	          str +="<P>"+list[i].reply+"</p></div></li>";
	        }
        replyUL.html(str);			//댓글 목록 호출
        showReplyPage(replyCnt);	//댓글 페이지네비게이션 화면 호출
        });//end function
        
      }//end showList
      
//댓글 페이지네ㅇ비게이션 시작
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){ endNum = Math.ceil(replyCnt/10.0); }
      
      if(endNum * 10 < replyCnt){ next = true; }
      
      var str = "<ul class='pagination pull-right'>";      
      if(prev){ str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>"; }
      
      for(var i = startNum ; i <= endNum; i++){        
        var active = pageNum == i? "active":"";
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){ str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>"; }
      str += "</ul></div>";
      console.log(str);
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){ 
    	e.preventDefault();
        console.log("page click");
        var targetPageNum = $(this).attr("href");
        console.log("targetPageNum: " + targetPageNum);
        pageNum = targetPageNum;
        showList(pageNum);
      });   
//댓글 페이지네비게이션 완료

      //모달창 시작
      var modal = $(".modal");
      //모달창 입력 변수
      var modalInputReply = modal.find("input[name='reply']");
      var modalInputReplyer = modal.find("input[name='replyer']");
      var modalInputReplyDate = modal.find("input[name='replyDate'] ");

      //모달창 등록 시작
      $("#addReplyBtn").on("click",function(e){
        modal.find("input").val("");
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id!='modalCloseBtn']").hide();
        modalRegisterBtn.show();
        $(".modal").modal("show");
      });

      //모달창 입력 버튼
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      
  //댓글 클릭시 모달창 오픈
      $(".chat").on("click ","li",function(e){
        var rno = $(this).data("rno");
        replyService.get(rno, function(reply){
          modalInputReply.val(reply.reply );
          modalInputReplyer.val(reply.replyer);
          modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly")
          modal.data("rno",reply.rno);

          modal.find("button[id!='modalCloseBtn']").hide();
          modalModBtn.show();
          modalRemoveBtn.show();

          $(".modal").modal('show');
        })
      });

      //댓글 등록
      modalRegisterBtn.on("click",function(e){
        var reply = {
          reply:modalInputReply.val(),
          replyer:modalInputReplyer.val(),
          bno:bnoValue
        };
        replyService.add(reply, function(result){
          alert(result);

          modal.find("input").val("");
          modal.modal("hide");

          //showList(1);
          showList(-1);
      });
    });

	//댓글 수정
     modalModBtn.on("click",function(e){
       var reply = {rno:modal.data("rno"), reply:modalInputReply.val(), replyer:modalInputReplyer.val()};
       replyService.update(reply, function(result){
         alert(result);
         modal.modal("hide");
         showList(pageNum);
       });
     });
	
	//댓글 삭제
	modalRemoveBtn.on("click",function(e){
		var rno = modal.data("rno");
		replyService.remove(rno, function(result){
			alert(result);
			modal.modal('hide');
			showList(pageNum);
		});
	});
      
  });
  </script>

<script type="text/javascript">
$(document).ready(function() {  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
  $("button[data-oper='list']").on("click", function(e){
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>
