var XSLminivideos;
var urlXSLminivideos = "xsl/minivideos.xsl";
var XMLminivideos;
var urlXMLminivideos = "minivideos.xml";

function change_photo(image)
{
    var photo = document.getElementById("photo");

    photo.src=image;
}


function loadXMLDoc(dname) {
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    }
    else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", dname, false);
    xhttp.send("");
    return xhttp.responseXML;
}

function readXML() {
    $.when($.ajax(urlXSLminivideos), $.ajax(urlXMLminivideos)).then(function (a1, a2) {
        
                XSLminivideos = a1[0];
                XMLminivideos = a2[0];
        
                node = document.getElementById("container");
                // code for IE
                if (window.ActiveXObject) {
                    ex = XMLminivideos.transformNode(XSLminivideos);
                    node.innerHTML = ex;
                }
                // code for Mozilla, Firefox, Opera, etc.
                else if (document.implementation && document.implementation.createDocument) {
                    xsltProcessor = new XSLTProcessor();
                    xsltProcessor.importStylesheet(XSLminivideos);
                    resultDocument = xsltProcessor.transformToFragment(XMLminivideos, document);
                    node.appendChild(resultDocument);
                }

            });
}