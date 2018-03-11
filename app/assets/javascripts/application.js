// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $('#voter_id').on( 'input' ,function() { 
    $('#voter_id_msg').val('');
    $.ajax({
        type: 'post',
        url: '/meetings/validate_voter_id',
        data: {voter_id: $('#voter_id').val()},
        success: function(data){ 
            $('#voter_id_msg').removeClass('red-voter');
            $('#voter_id_msg').addClass('green-voter');
            $('#voter_id_msg').text('Hello '+data.profile.name);
            $('#voter_id_msg').append('We validated your id. ');
            $('#voter_id_msg').append('Please give your feedback below.');
            
        },
        error: function(data){
            $('#voter_id_msg').removeClass('green-voter');
            $('#voter_id_msg').addClass('red-voter');
            $('#voter_id_msg').text('Invalid id. Please enter valid voter id');
        }
    });
    });
});