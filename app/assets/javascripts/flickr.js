$(document).ready(function() {
  $('#add_pic_from_flickr').click(function() {
    $('.flickr-container').toggle();
  });

  $('.flickr-img').click(function() {
    $('.flickr-field').val(this.src);
  });
});