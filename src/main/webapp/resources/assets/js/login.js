$(document).ready(function(){
	var formInputs = $('input[type="text"],input[type="password"]');
	formInputs.focus(function() {
       $(this).parent().children('p.formLabel').addClass('formTop');
       $('div#formWrapper').addClass('darken-bg');
       $('div.logo').addClass('logo-active');
	});
	formInputs.focusout(function() {
		if ($.trim($(this).val()).length == 0){
		$(this).parent().children('p.formLabel').removeClass('formTop');
		}
		$('div#formWrapper').removeClass('darken-bg');
		$('div.logo').removeClass('logo-active');
	});
	$('p.formLabel').click(function(){
		 $(this).parent().children('.form-style').focus();
	});
});

$(document).ready(function() {
    $("#button").click(function() {
        var name = $("#name").val();
        var password = $("#password").val();
        if (name === '' && password === '') {
            alert("Please Enter Right Credentials.");
            return false;
        } else if (name === '') {
            alert("Please Enter Right UserID");
            return false;
        } else if (password === '') {
            alert("Please Enter Right Password");
            return false;
        }

    });
});