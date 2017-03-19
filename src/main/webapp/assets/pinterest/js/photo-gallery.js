
(function(){
	"use strict";

	var clicked = {};

	function showModal(){
		var index = $(this).parent('article').attr('data-index');
		var src = $('#img_b'+index).text();
		var img = '<img src="' + src + '" class="img-responsive"/>';

		clicked.prevImg = parseInt(index) - parseInt(1);
		clicked.nextImg = parseInt(index) + parseInt(1);

		var html = '';
		html += img;
		html += '<div style="height:25px;clear:both;display:block;">';			
		html += '<a class="controls next" href="'+ (clicked.nextImg) + '">next &raquo;</a>';
		html += '<a class="controls previous" href="' + (clicked.prevImg) + '">&laquo; prev</a>';
		html += '</div>';

		$('#myModal').modal();
		$('#myModal').on('shown.bs.modal', function(){
			$('#myModal .modal-body').html(html);
			showHideControls();
		})
		$('#myModal').on('hidden.bs.modal', function(){
			$('#myModal .modal-body').html('');
		});
	}

	function nextPrevHandler(){

		var index = $(this).attr('href');
		var src = $('#img_b'+index).text();

		$('.modal-body img').attr('src', src);

		clicked.prevImg = parseInt(index) - 1;
		clicked.nextImg = parseInt(clicked.prevImg) + 2;

		if($(this).hasClass('previous')){
			$(this).attr('href', clicked.prevImg);
			$('a.next').attr('href', clicked.nextImg);
		}else{
			$(this).attr('href', clicked.nextImg);
			$('a.previous').attr('href', clicked.prevImg);
		}

		showHideControls();

		return false;

	}

	function showHideControls(){

		var total = ($('article').length);

		if(total === clicked.nextImg){
			$('a.next').hide();
		}else{
			$('a.next').show()
		}

		if(clicked.prevImg === -1){
			$('a.previous').hide();
		}else{
			$('a.previous').show()
		}
	}



	$(document).ready(function(){
		$.post("/getImageList.action",
			{},
			function(data,status){
				var result = data.Result;
				if(result=='OK'){
					var jsonArray = data.Records;
					for(var i=0;i<jsonArray.length;++i){
						var oneline = jsonArray[i];
						$("#gallery-wrapper").append("<article class='white-panel' id='"+oneline.image_id+"' data-index='"+i+"'><img src='"+
							oneline.img_s+"' class='thumb'><div id='img_b"+i+"' style='display: none' >"+oneline.img_b+
							"</div><div id='img_o"+i+"' style='display: none'>"+oneline.image_path+"</div><div><div class='checkbox checkbox-danger'><input type='checkbox' id='_"+oneline.image_id+"' class='styled'><label for='_"+oneline.image_id+"'>"+oneline.image_name+"</label></div></div></article>");
					}

		$('article').each(function(i){
			$(this).attr('data-index',i);
			var img = $(this).find('img');
			img.on('click',showModal);
		});
				}
				//alert(data.Records);
			});
		$(this).on('click', 'a.controls', nextPrevHandler);

	}) //end doc ready


})();
