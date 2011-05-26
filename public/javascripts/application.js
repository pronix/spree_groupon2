function get_states(issuer) {
  $("#country").change(function () {
    var data = {'country': this.value};
    if (typeof issuer != 'undefined') {
      data['issuer'] = issuer;
    }
    $.ajax({
      url: "/locations/get_state",
      data: data,
      success: function(msg){
        $("#city_select").html(msg)
      }
    });
  })
}
