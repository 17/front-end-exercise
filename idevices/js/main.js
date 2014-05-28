$(function() {
  return $('#toggle-device').on('change', function() {
    var val;
    val = $(this).val();
    if (val) {
      return $('#idevice').removeClass().addClass(val);
    }
  });
});
