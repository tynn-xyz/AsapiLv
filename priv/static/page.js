π=(d,f,g)=>{function h(a,b){var c=new XMLHttpRequest;c.onreadystatechange=()=>{4==c.readyState&&(a.alt="API level "+(200==c.status?c.responseText:"unknown"),a.src=b+"@svg")};c.open("GET",b+"@txt",!0);c.send()}function e(a){document.title="Android API level - "+a;a=a.replace(/:/g,"/");a.endsWith("/")&&(a=a.substring(0,a.length-1));a.endsWith("/+")&&(a=a.substring(0,a.length-2));a.startsWith("/")||(a="/"+a);document.getElementById("url").innerText=f+a+"@svg";var b=document.getElementById("badge");b.href=a;b=b.firstElementChild;b.src=g;b.alt="API level loading";h(b,a);return a}history.replaceState(d,"Android SDK API level - "+d,"");window.onpopstate=a=>{e(a.state)};document.forms[0].onsubmit=a=>{a=document.forms[0][0].value;history.pushState(a,document.title,e(a));return!1}}
