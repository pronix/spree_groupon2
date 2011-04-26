function get_cities() {
  $("#country").change(function () {
    $.ajax({
      url: "/locations/get_city",
      data: "country=ru",
      success: function(msg){
        $("#city_select").html(msg)
      }
    });
  })
}
