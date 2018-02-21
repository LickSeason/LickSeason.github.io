var fivesongs = [
  {Artist: '50 Cent', Song: 'Window Shopper', Album: "Get Rich Or Die Tryin", Song_Duration: "3:10"},
  {Artist: 'Doctor P', Song: 'Shishkabob', Album: 'Circus Reloaded', Song_Duration: "3:54"},
  {Artist: 'Migos', Song: 'Stir Fry', Album: 'Culture II', Song_Duration: "3:10"},
  {Artist: 'Muse', Song: 'Knights Of Cydonia', Album: 'Black Holes And Revelations', Song_Duration: "6:06"},
  {Artist: 'Sabaton', Song: 'Gott Mit Uns (English Version)', Album: 'Carolus Rex', Song_Duration: "3:15"}
]

var html = "<table border='10|10'>";
html+="<td>"+'Artist'.bold();
html+="<td>"+'Song'.bold();
html+="<td>"+"Album".bold();
html+="<td>"+"Song Duration".bold();
for (var i = 0; i < fivesongs.length; i++) {
    html+="<tr>";
    html+="<td>"+fivesongs[i].Artist+"</td>";
    html+="<td>"+fivesongs[i].Song+"</td>";
    html+="<td>"+fivesongs[i].Album+"</td>";
    html+="<td>"+fivesongs[i].Song_Duration+"</td>";
    html+="</tr>";
}
html+="</table>";
document.getElementById("table").innerHTML = html;

document.body.style.backgroundColor = 'rgb(209, 251, 255)'
function button(){
  window.location = 'https://lickseason.github.io/'
}

var songTotal = 3.10+3.54+3.10+6.06+3.15
var stats = "<table border='10|10'>";
stats+="<td>"+"Number of Artists".bold();
stats+="<td>"+"Number of songs".bold();
stats+="<td>"+"Total Playlist Duration".bold();
stats+="<tr>";
stats+="<td>"+"5";
stats+="<td>"+"5";
stats+="<td>"+"18:95";
stats+="</table>";
document.getElementById("Stats").innerHTML = stats
