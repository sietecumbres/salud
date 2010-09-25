// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
		var param =  "";
    var data = "Core Selectors Attributes Traversing Manipulation CSS Events Effects Ajax Utilities".split(" ");
		$(".autocomplete").click(function(){
			param = $(this).attr("data-remote");
		});
		$(".autocomplete").focus(function(){
			param = $(this).attr("data-remote");
		});
		
		$(".autocomplete").autocomplete('/equipos/autocomplete', {extraParams: {term: function(){
					return param;}
				}
			});
		
                $('#popupDatepicker').datepick();
                $('#inlineDatepicker').datepick({onSelect: showDate});

		$("#busqueda_tipo_adquisicion_id").change(function(){
			if(!$(this).val()){
				$("#otro-adquisicion").show();
			}
			else{
				$("#otro-adquisicion").hide();
			}
		});
  });

function showDate(date) {
	alert('The date chosen is ' + date);
}
