// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var estado_id = "";


$(document).ready(function(){

    $(document).bind('loading.facebox', function() {
        $(document).unbind('keydown.facebox');
    });

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
		$("#reporte_mantenimiento_tipo_mantenimiento_id").change(function(){
			if(!$(this).val()){
				$("#otro-mantenimiento").show();
			}
			else{
				$("#otro-mantenimiento").hide();
			}
		});
		
		$('a[rel*=facebox]').facebox();
       
    $(".radio").click(function(){
				estado_id = $(this).attr("data-remote");
				$.facebox($("#div-evaluacion").val());
    });

    //Funcion para adicionar la evaluacion si el estados es Reprobado
    $("#to-eval").live('click', function(){
        var eval = $("#add-eval").val();
        $(".rp_evaluacion").show();
        $('#extra_eval').append(estado_id + " " + eval + "\n");
        $(document).trigger('close.facebox');
    });

    //Funcion para desplegar el formulario de ingreso de repuestos
    $(".add_repuesto").click(function(){
        $.facebox($("#div-repuestos").val());
    });

    //Funcion para buscar por documento de identidad
    $("#buscar-cc").click(function(){
        $.ajax({
            url: "/find_by_cc",
            data: ({documento: $("#buscar-documento").val()}),
            type: "POST",
            dataType: "json",
            success: function(data){
                if(data != "error"){
                    $("#info-recibe").show();
                    $("#recibe_nombre").val(data.persona.nombre);
                    $("#recibe_cargo").val(data.persona.cargo);
                }
            }
        });
    });

    //Función para almacenar el estado equipo cada que se haga clic en un radio
	$(".r_normal").click(function(){
		$("#estado-"+$(this).attr("data-remote")).val("");
	});
		
	$("#to-eval").live('click', function(){
		$("#estado-"+estado_id).val($("#add-eval").val());
    $(document).trigger('close.facebox');
	});

	$("#agregar-repuesto").live('click', function(){
		$("#tabla-repuestos").append("<tr>\
																		<td>" + $("#repuesto_id [value='" + $("#repuesto_id").val() + "']").text() + "</td>\
																		<td>" + $("#cantidad").val() + "</td>\
																		<td>" + $("#repuesto_id [value='" + $("#repuesto_id").val() + "']").attr("data-remote") + "</td>\
																	</tr>");
		$("#lista-repuestos").append("<input type='hidden' name='repuestos[" + $("#repuesto_id").val() + "]' value='" + $("#cantidad").val() + "' />");
	});
  
  $(document).bind('reveal.facebox', function(){
    $('.datepicker').datepicker();
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