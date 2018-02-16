var fivesongs = [
  {Artist: '50 Cent', Song: 'Window Shopper', Album: "Get Rich Or Die Tryin"},
  {Artist: 'Doctor P', Song: 'Shishkabob', Album: 'Circus Reloaded'},
  {Artist: 'Migos', Song: 'Stir Fry', Album: 'Culture II'},
  {Artist: 'Muse', Song: 'Knights Of Cydonia', Album: 'Black Holes And Revelations'},
  {Artist: 'Sabaton', Song: 'Gott Mit Uns (English Version)', Album: 'Carolus Rex'}
]

var html = "<table border='10|10'>";
html+="<td>"+'Artist'.bold();
html+="<td>"+'Song'.bold();
html+="<td>"+"Album".bold();
for (var i = 0; i < fivesongs.length; i++) {
    html+="<tr>";
    html+="<td>"+fivesongs[i].Artist+"</td>";
    html+="<td>"+fivesongs[i].Song+"</td>";
    html+="<td>"+fivesongs[i].Album+"</td>";
    html+="</tr>";
}
html+="</table>";
document.getElementById("table").innerHTML = html;
document.body.style.backgroundColor = 'rgb(209, 251, 255)'
function button(){
  window.location = 'https://lickseason.github.io/'
}
