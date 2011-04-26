function get_cities() {
  $("#country").change(function () {
    $.ajax({
      url: "/locations/get_state",
      data: "country=ru",
      success: function(msg){
        $("#city_select").html(msg)
      }
    });
  })
}
