var XSLminivideos;
var urlXSLminivideos = "XmlXsl/minivideos.xsl";
var XMLminivideos;
var urlXMLminivideos = "XmlXsl/minivideos.xml";
var _Hasync= _Hasync|| [];

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

        handleHistats();
        handleHistory();

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

function checkDebug() {
    var debug = _getParameter('debug');
    return (debug == 'true');
}


function handleHistory() {
    // add a hash to the URL when the user clicks on a tab
    $('a[data-toggle="tab"]').on('click', function (e) {
        var href = $(this).attr('href');
        history.pushState(null, null, href);
    });

    $('a.external-link').on('click', function (e) {
        var href = '#' + $(this).closest('div.tab-pane').attr('id');
        history.pushState(null, null, href);
    });

    function handleLocationHash(e) {
        var activeTab = $('[href="' + location.hash + '"]');
        if (activeTab.length) {
            activeTab.tab('show');
        } else {
            $('.nav-tabs a:first').tab('show');
        }
    }

    // navigate to a tab when the history changes
    window.addEventListener("popstate", handleLocationHash);

    // excetute handleLocationHash once
    handleLocationHash(null);
}

function handleHistats() {
    if (checkDebug()) {
        _Hasync.push(['Histats.start', '1,484154,4,105,100,45,00010000']);
        _Hasync.push(['Histats.fasi', '1']);
        _Hasync.push(['Histats.track_hits', '']); <!-- Visible Counter -->
    } else {
        _Hasync.push(['Histats.start', '1,484154,4,0,0,0,00010000']);
        _Hasync.push(['Histats.fasi', '1']);
        _Hasync.push(['Histats.track_hits', '']); <!-- Hidden Counter -->
    }
    $.ajax({
        url: 'http://s10.histats.com/js15_as.js',
        dataType: 'script',
        success: function() {console.log('Hitstats counter loaded!')}
    });
}

