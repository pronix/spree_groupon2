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


function TimeLeft(ddate,iid){
	dateNow = new Date();	//grab current date
	amount = ddate.getTime() - dateNow.getTime();	//calc milliseconds between dates
	delete dateNow;

	// if time is already past
	if(amount < 0){
		$(iid).html("Акция закончена");
	}
	// else date is still good
	else{
		days=0;hours=0;mins=0;out="";

		amount = Math.floor(amount/1000);//kill the "milliseconds" so just secs

		days=Math.floor(amount/86400);//days
		amount=amount%86400;

		hours=Math.floor(amount/3600);//hours
		amount=amount%3600;

		mins=Math.floor(amount/60);//minutes
		amount=amount%60;

		if(days != 0){out += days +" "+((days==1)?"день":"дней")+"  ";}
		if(hours != 0){out += hours +" "+((hours==1)?"час":"часов")+"  ";}
		if(mins != 0){out += mins +" "+((mins==1)?"минут":"минут")+"  ";}
		out = out.substr(0,out.length-2);
		$(iid).html(out);

		setTimeout(function(){TimeLeft(ddate,iid)}, 1000);
	}
}
