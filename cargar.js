function getHttpObject(){
  var XMLHttp;
  if (window.XMLHttpRequest) {
    XMLHttp = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  return XMLHttp;
}

var http = getHttpObject();

function LoadTrait(){    
  var modelo = document.getElementById('selectModelo').value;
  var listCar = document.getElementById('listaTrait');
  if(http){
    http.onreadystatechange = function(){
      if(http.readyState==4 && http.status==200){
        listCar.innerHTML=http.responseText;
      }
    }
    http.open("GET","cgi-bin/loadTrait.pl?modelo="+modelo,true);
    http.send();
  }
}

function LoadIni(){
  var listModel = document.getElementById('selectModelo');
  if(http){
    http.onreadystatechange = function(){
      if(http.readyState==4 && http.status==200){
        listModel.innerHTML=http.responseText;
      }
    }
    http.open("GET","cgi-bin/loadIni.pl",true);
    http.send();
  }
}

function LoadAtr(codigoCar){
  var pAtri = document.getElementById('panelAtributos');
  if(http){
    http.onreadystatechange = function(){
      if(http.readyState==4 && http.status==200){
        pAtri.innerHTML=http.responseText;
      }
    }
    http.open("GET","cgi-bin/loadAtr.pl?codigoCar="+codigoCar,true);
    http.send();
  }
}

function LoadDel(){
  var ver = document.getElementById('datos');
  var codigo = document.getElementById('codigo').value;
  if(http){
    http.onreadystatechange = function(){
      if(http.readyState==4 && http.status==200){
        ver.innerHTML=http.responseText;
      }
    }
    http.open("GET","cgi-bin/eliminar.pl?codigo="+codigo,true);
    http.send();
  }
}

