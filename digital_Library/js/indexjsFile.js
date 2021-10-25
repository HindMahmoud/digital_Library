//validation functions in index page 




$(function () {

    $("input[name='example']").click(function () {

        if ($("#radio2").is(":checked")) {

            $("#univ_new").show();
        } else {
            $("#univ_new").hide();
        }
    });
    $('.email_error').hide();
    $('#emtxt').first().keyup(function () {

        var $email = this.value;
        if ($email != "") {
            validateEmail($email);
        }
        else { $('.email_error').html('هذا الحقل مطلوب'); }
    });
    
    function validateEmail(email) {
        var emailReg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
        if (!emailReg.test(email)) {
            $('.email_error').show();
            $('.email_error').html('(example@examp.com) بريد إلكترونى خاطئ');
        } else {
            $('.email_error').hide();
           

        }
    }

    //validation mobile
    $('.mob_error').hide();
    $('#mobtxt').first().keyup(function () {

        var $mobile = this.value;
        if ($mobile != "") {
            validatemob($mobile);
        }
        else { $('.mob_error').html('هذا الحقل مطلوب'); }
    });
 
    function validatemob(email) {
        var emailReg = /^\d{11}$/;
        if (!emailReg.test(email)) {
            $('.mob_error').show();
            $('.mob_error').html('رقم موبيل خاطئ');
        } else {
            $('.mob_error').hide();
        }
    }
    //end validation
    //validation english alphabets
    $('#eng_add').first().keyup(function () {
        var thistext = $(this);
        if (thistext != '')
        { thistext.val(thistext.val().replace(/^[\u0621-\u064A\u0660-\u0669 ]+$/, '')); }
        else { $('.eng-add').html('هذا الحقل مطلوب'); }
    });

    //validation required
    $('#name').focusout(function () {
       
        if ($(this).val() == '')
        { $('.name-msg').html('هذا الحقل مطلوب'); }
        else {  }
    });

    $('#arabic_add').focusout(function () {

        if ($(this).val() == '')
        { $('.ar-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
  

    $('#university_name').focusout(function () {

        if ($(this) == '')
        { $('.another-univ').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#deptxt').focusout(function () {

        if ($(this) == '')
        { $('.dep-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#Divisiontxt').focusout(function () {

        if ($(this) == '')
        { $('.div-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#spectxt').focusout(function () {

        if ($(this) == '')
        { $('.spec-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#academictxt').focusout(function () {

        if ($(this) == '')
        { $('.year').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#titletxt').focusout(function () {

        if ($(this) == '')
        { $('.title-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#supertxt').focusout(function () {

        if ($(this) == '')
        { $('.super-msg').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#partenarstxt').focusout(function () {

        if ($(this) == '')
        { $('.supers-msg').html('هذا الحقل مطلوب'); }
        else { }
    });

    $('#university_name').focusout(function () {

        if ($(this) == '')
        { $('.another-univ').html('هذا الحقل مطلوب'); }
        else { }
    });
    $('#university_name').keyup(function () {

        if ($(this) == '')
        { $('.another-univ').html('هذا الحقل مطلوب'); }
        else { $('.another-univ').hide(); }
    });


    //radios 
    $('input[name="example"]').click(function () {
        $('.choose-msg').hide();

    });

 });


    $('#submit').click(function () {
       
        //if ($('.supers-msg').is(":visible") || $('.super-msg').is(":visible") || $('.super-msg').is(":visible"))
        
        return isvalid();
    });
    function isvalid()
    {
        var re=true;
        if ($('.options:not(:has(:radio:checked))').length)
        { $('.choose-msg').show(); $('.choose-msg').html('اختيار الجامعه مطلوب'); $('.choose-msg').focus(); re = false; }

        if ($('#radio2').is(":checked") && $('#university_name').val() == '')
        { $('.another-univ').show(); $('.another-univ').html('هذا الحقل مطلوب'); $('#university_name').focus(); re = false; }
       
       
        return re;
    }
    

//end validation js in index page

//js for file form

    //uploaded file
    var allowedExtensions = /(\.docx,\.rtf)$/i;
    $('#button1').click(function () {
        alert('btu');
        if (x == false)
            return false;
        else return true;
      
    });
  