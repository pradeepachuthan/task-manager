// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
$(document).ready(function () {
    $('#new-ticket').submit(function() {
        $.post("/ticket", $(this).serialize(), function(response) {
            if(response.success == false) {
                var errors = [];
                for(var field in response.errors) {
                    errors.push(field + ' ' + response.errors[field]);
                }
                alert(errors.join('\n'));
            } else {
                alert(response.message);
            }
        }, 'json');
        return false;
    });
    $('#sign-in').submit(function() {
        $.post("/sign_in", $(this).serialize(), function(response) {
            if(response.success == false) {
                alert(response.error);
            } else {
                document.location.href = 'admin'
            }
        }, 'json');
        return false;
    });
    $('#response').submit(function() {
        var id = $('#response_id').val();
        $.post("/admin/ticket/" + id, $(this).serialize(), function(response) {
            if(response.success == false) {
                var errors = [];
                for(var field in response.errors) {
                    errors.push(field + ' ' + response.errors[field]);
                }
                alert(errors.join('\n'));
            } else {
                document.location.href = '/admin/ticket/' + id
            }
        }, 'json');
        return false;
    });
    $('#ticket-find').submit(function() {
        var query = $('#query'), val = query.val();
        if (val === '') {
            query.focus();
            return false;
        }
        document.location.href = '/admin/ticket/find/' + val;
        return false;
    });
});


