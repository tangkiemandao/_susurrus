jQuery(document).ready(function($){
  var jcrop_api;

  $('#preview-img').Jcrop({
    onChange: showCoords,
    onSelect: showCoords,
    onRelease: clearCoords
  }, function(){
    jcrop_api = this;
  });

  function showCoords(c) {
    $('#slider_crop_x').val(c.x);
    $('#slider_crop_y').val(c.y);
    $('#slider_crop_w').val(c.w);
    $('#slider_crop_h').val(c.h);
  };

  function clearCoords() {
    $('#slider_crop_x').val('');
    $('#slider_crop_y').val('');
    $('#slider_crop_w').val('');
    $('#slider_crop_h').val('');
  };

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#preview-img').attr('src', e.target.result);
        jcrop_api.setImage(e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#slider_photo").change(function() {
    readURL(this);
  });
});
