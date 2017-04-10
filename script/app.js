function getSearchResults(){
  console.log('gets here');
  var searchValue = document.getElementById('searchBar').value;
  $.post("oracle.php", {Team: searchValue}, function(data){
        $("#results").html(data);
  //fixedHeader();
      }); 
}
function filterOptions(){
  if(document.getElementById('filterDropdowns').style.visibility =='visible'){
  	closeOptions();
  }
  else{
  	document.getElementById('filterDropdowns').style = 'visibility:visible;display:initial;'      
  }
}
function closeOptions(){
  document.getElementById('filterDropdowns').style = 'visibility:hidden;display:none;'
}
function fixedHeader(){
    console.log('fixed header');
	var tableOffset = $("#table-1").offset().top;
	var $header = $("#table-1 > thead").clone();
	var $fixedHeader = $("#header-fixed").append($header);
console.log($fixedHeader);

	$(window).bind("scroll", function() {
     	var offset = $(this).scrollTop();

     	if (offset >= tableOffset && $fixedHeader.is(":hidden")) {
         		$fixedHeader.show();
     	}
     	else if (offset < tableOffset) {
         		$fixedHeader.hide();
     	}
	});
}