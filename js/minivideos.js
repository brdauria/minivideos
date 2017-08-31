var XSLminivideos;
var urlXSLminivideos = "xsl/minivideos.xsl";
var XMLminivideos;
var urlXMLminivideos = "minivideos.xml";

function change_photo(image) {
    var photo = document.getElementById("photo");

    photo.src = image;
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

function readXML(debug) {
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
            xsltProcessor.setParameter(null, 'debug', debug);
            xsltProcessor.importStylesheet(XSLminivideos);
            resultDocument = xsltProcessor.transformToFragment(XMLminivideos, document);
            node.appendChild(resultDocument);
        }

    });
}

/**
 * Retrieves the get parameter with the providen key in the current location of the document.
 *
 * @param identifier {String} Key of the get parameter
 */
function _getParameter(identifier) {
    var result = undefined, tmp = [];

    var items = window.location.search.substr(1).split("&");

    for (var index = 0; index < items.length; index++) {
        tmp = items[index].split("=");

        if (tmp[0] === identifier) {
            result = decodeURIComponent(tmp[1]);
        }
    }

    return result;
}

function checkDebug(){
    var debug = _getParameter('debug');
    return (debug == 'true');
}