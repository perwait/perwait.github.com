function zsz_ajax(adds,url,valID){
    var xmlhttp;
    var val= document.getElementById(valID).value;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            
            document.getElementById(adds).innerHTML=xmlhttp.responseText;
        }
    };
    xmlhttp.open("POST",url+val,true);
    xmlhttp.send();
}
function zsz_Login_ajax(adds,url,valID,valPw){
    var xmlhttp;
    var uname= document.getElementById(valID).value;
    var upw=document.getElementById(valPw).value;
    var URL=url+"?uname="+uname+"&upw="+upw;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            
            document.getElementById(adds).innerHTML=xmlhttp.responseText;
        }
    };
    xmlhttp.open("POST",URL,true);
    xmlhttp.send();
}
