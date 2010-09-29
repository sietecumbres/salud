// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
		var param =  "";
    var data = "Core Selectors Attributes Traversing Manipulation CSS Events Effects Ajax Utilities".split(" ");
		$(".autocomplete").click(function(){
			autocomplete_fields($(this).attr("data-remote"));
		});
		$(".autocomplete").focus(function(){
			autocomplete_fields($(this).attr("data-remote"));
		});
		
   $('.datepicker').datepicker();

		$("#busqueda_tipo_adquisicion_id").change(function(){
			if(!$(this).val()){
				$("#otro-adquisicion").show();
			}
			else{
				$("#otro-adquisicion").hide();
			}
		});
  });

function autocomplete_fields(table){
	$(".autocomplete").autocomplete({
		source: function(req, add){
			$.getJSON("/equipos/autocomplete?table="+table, req, function(data){
				var suggestions = [];
				$.each(data, function(i, val){
					suggestions.push(val);
				});
				add(suggestions);
			});},
			minLength: 1
	});
}