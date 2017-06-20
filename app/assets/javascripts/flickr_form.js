$(document).ready(function() {
    $(document).on('click', '#flickr_link', function() {
        $('#flickr_form').fadeToggle();
        $('#flickr').focus();
    });
});