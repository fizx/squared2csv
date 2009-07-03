if(location.href.match("google")) {
  var f = document.createElement('FORM');
  f.setAttribute('action', 'http://squared2csv.heroku.com/convert');
  f.setAttribute('method', 'post');
  var h=document.createElement("INPUT");
  h.setAttribute('type', 'hidden');
  h.setAttribute('name', 'html');
  h.value = document.body.innerHTML;
  f.appendChild(h);
  document.body.appendChild(f);
  f.submit();
}else{
  location.href="http://google.com/squared";
}