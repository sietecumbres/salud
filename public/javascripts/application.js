// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var estado_id = "";
var datepicker_options = 	{
														changeMonth: true,
														changeYear: true
													}

$(document).ready(function(){
	$('.to-validate').validate();
  $('a[rel*=facebox]').facebox();
	
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

    //Funcion para validar solo números
    $(".numeric").keydown(function(event) {
        if ( event.keyCode == 46 || event.keyCode == 8 ) {
        } else {
            if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57 ) {
                        event.preventDefault();
                    }
                } else {
                    if (event.keyCode < 96 || event.keyCode > 105 ) {
                        event.preventDefault();
                }
            }
        }
    });
    
    //Funcion para validar solo números Facebox
    $(".numeric").live('keydown', function(event) {
        if ( event.keyCode == 46 || event.keyCode == 8 ) {
        } else {
            if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57 ) {
                        event.preventDefault();
                    }
                } else {
                    if (event.keyCode < 96 || event.keyCode > 105 ) {
                        event.preventDefault();
                }
            }
        }
    });

    $('.datepicker').datepicker(datepicker_options);
    
    $("#busqueda_tipo_adquisicion_id").change(function(){
        if(!$(this).val()){
            $("#otro-adquisicion").show();
        }
        else{
            $("#otro-adquisicion").hide();
        }
    });
    
    $("#reporte_tipo_mantenimiento_id").change(function(){
        if(!$(this).val()){
            $("#otro-mantenimiento").show();
        }
        else{
            $("#otro-mantenimiento").hide();
        }
    });
    
    $(".radio").click(function(){
        estado_id = $(this).attr("data-remote");
        $.facebox($("#div-evaluacion").val());
    });

    //Funcion para adicionar la evaluacion si el estados es Reprobado
    $("#to-eval").live('click', function(){
        $("#estado-"+estado_id).val($("#add-eval").val());
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

    //Funcion para mostrar los comparativos del mantenimiento
    $("#mostrar-comparativo").live('click', function(){
        $.ajax({
            url: "/equipo/"+ $("#equipo").val()+"/mostrar_mantenimiento",
            data: ({tipo_mantenimiento: $("#tipos_mantenimiento").val(), anio: $("#year").val()}),
            type: "GET",
            success: function(data){
                $("#mantenimientos").html(data);
            },
            error: function(xhr, e, ex){
                alert("error: "+ex);
            }
        });
    });

    //Función para almacenar el estado equipo cada que se haga clic en un radio
    
  $('.datepicker').datepicker(datepicker_options);
   
   $("#busqueda_tipo_adquisicion_id").change(function(){
       if(!$(this).val()){
           $("#otro-adquisicion").show();
       }
       else{
           $("#otro-adquisicion").hide();
       }
   });
   
   $("#reporte_tipo_mantenimiento_id").change(function(){
       if(!$(this).val()){
           $("#otro-mantenimiento").show();
       }
       else{
           $("#otro-mantenimiento").hide();
       }
   });
      //Función para almacenar el estado equipo cada que se haga clic en un radio
   $(".r_normal").click(function(){
       $("#estado-"+$(this).attr("data-remote")).val("");
   });
   
   $("#agregar-repuesto").live('click', function(){
		$('#add-repuesto-form').submit();
		if($('#add-repuesto-form').valid()){
       $("#tabla-repuestos").append("<tr>\
                                       <td></td>\
                                       <td>" + $("#ref").val() + "</td>\
                                       <td>" + $("#cantidad").val() + "</td>\
                                       <td>" + $("#desc").val() + "</td>\
                                      </tr>");
       $("#lista-repuestos").append("<input type='hidden' name='repuestos[repuesto" + $("#ref").val() + "][cant]' value='" + $("#cantidad").val() + "' />");
       $("#lista-repuestos").append("<input type='hidden' name='repuestos[repuesto" + $("#ref").val() + "][desc]' value='" + $("#desc").val() + "' />");
       $("#lista-repuestos").append("<input type='hidden' name='repuestos[repuesto" + $("#ref").val() + "][ref]' value='" + $("#ref").val() + "' />");
			}
   });

   $(document).bind('reveal.facebox', function(){
			$('.to-validate').validate();
			$('#add-repuesto-form').validate();
       $('.datepicker').datepicker(datepicker_options);
       $(".autocomplete_repuestos").autocomplete({
       source: function(req, add){
         $.getJSON("/reportes/autocomplete_repuestos", req, function(data){
           var suggestions = [];
           $.each(data, function(i, val){
             suggestions.push(val);
           });
         add(suggestions);
       });},
       minLength: 1
     });
   });
   
   $("#tipo_mantenimiento.autogenerar").live('change', function(){
     $("#periodicidad.autogenerar").val($("#tipo_mantenimiento.autogenerar [value='" + $(this).val() + "']").attr("data-remote"));
     $("#periodicidad.autogenerar").removeAttr('disabled');
     $("#enviar.autogenerar").removeAttr('disabled');
     validate_date();
   });

   $("#year_for_agenda").change(function(){
		var year = $(this).val();
     $.get('/agenda/calendar', {year: year}, function(data){
			$('#calendar').html(data);
		});
   });

	$('#equipo-agenda').live('change', function(){
		var year = $(this).val();
		var equipo = $('#equipo-id').val();
		$.get('/agenda/equipo_calendar', {year: year, equipo_id: equipo}, function(data){
			$('#calendar').html(data);
		});
	});


  $(".filter-head").click(function(){
    $(".filter").slideToggle("medium");
  });

  //Approval button click
  $("#aprobar-reporte").click(function(){
    $.post($(this).attr("data-remote-url"), {reporte: $(this).attr("date-remote")}, function(data){
      $("#aprobar-reporte").css("display", "none");
      $("#aprobar-mensaje").show();
      $("#aprobar-mensaje").html("El reporte n&uacute;mero " + data.reporte_mantenimiento.id + " fue aprobado con exito.");
    });
  });

  $(".dar-salida").click(function(){
    var action = $(this).attr("data-remote");
    $.facebox({div: "#dar-salida"});
    $("form").get(1).setAttribute("action", action);
  });

	var color = "";
	if($('#tipo_mantenimiento_color').length > 0)
		color = $('#tipo_mantenimiento_color').val().substring(1,7)
	
	$('#color-selector').ColorPicker({
		color: color,
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#color-selector div').css('backgroundColor', '#' + hex);
			$('#tipo_mantenimiento_color').val('#' + hex);
		}
	});

});

function validate_date(){
  var val = $("#tipo_mantenimiento.autogenerar").val();
  $(this).attr('disabled', 'disabled');
  $.get('/autogenerate/validate_date', {tipo_mantenimiento: val}, function(data){
    $("#desde.autogenerar").html("<option value=''>Seleccionar</option>");
    $.each(data, function(index, value){
      $("#desde.autogenerar").append("<option value='" + value + "'>" + value + "</option>");
    });
    $("#desde.autogenerar").removeAttr('disabled');
    $("#tipo_mantenimiento.autogenerar").removeAttr('disabled');
  });

}

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

function get_parameter( name ){
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}