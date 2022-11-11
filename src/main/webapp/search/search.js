$(function(){
	$.ajax({
		url: "/swan_stream/search/getSearchTitle.do",
		type: "post",
		data: "title="+$("#pageTitle").val(),
		dataType: "json",
		success: function(data) {
			$.each(data.list, function(index, items){
				//console.log(index, items)
				$('<li/>')
					.append($("<a/>",{class: "search-link"})
						.append($("<div/>",{class: "search-link-box"})
							.append($("<img/>",{src: "/swan_stream/images/search/genre/"+(index+1)+".png"}))
							.append($("<div/>",{class: "search-link-box_title"})
								.append($("<p/>",{text: items}))
							)
						)
					).appendTo($(".search-grid"))
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});