<?xml version="1.0" encoding="utf-8"?>
<!-- Edited by XMLSpy� -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Edited by Bernardo D'Auria

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

    <xsl:output
    method='xml'
    version='1.0'
    omit-xml-declaration='yes'
    media-type='text/html'
    doctype-public='-//W3C//DTD XHTML 1.1//EN'
    doctype-system='http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd'
    indent='no'
    encoding='UTF-8'/>
    -->
    <xsl:param name="debug"/>
    <xsl:template name="debug">
        <xsl:if test="$debug = 'true'">http://minivideos.uc3m.es/</xsl:if>
    </xsl:template>

    <xsl:template match="html">
        <html xml:lang="es">
            <xsl:call-template name="head"/>
            <xsl:call-template name="body"/>
        </html>
    </xsl:template>

    <xsl:template name="head">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <script src="minivideos_files/minivideos.js" type="text/javascript">
            </script>
            <link rel="stylesheet" href="minivideos_files/minivideos.css" type="text/css"/>
            <title>Proyecto de Innovación Docente, Mini-Vídeos de autoformación por Internet y teléfonos móviles</title>
            <meta name="description"
                  content="Proyecto de Innovación Docente, Mini-Vídeos de autoformación por Internet y teléfonos móviles"/>
            <meta name="keywords"
                  content="mini-videos, estadistica, minivideos, videos, 3gp, wmv, emilio leton, bernardo d'auria, maria durban, dae-jin lee"/>
            <link type="image/x-icon" href="minivideos_files/wmv.png" rel="icon"/>
            <link type="image/ico" href="minivideos_files/wmv.png" rel="SHORTCUT ICON"/>
        </head>
    </xsl:template>

    <xsl:template name="body">
        <body>
            <xsl:apply-templates select="minivideos"/>
        </body>
    </xsl:template>

    <xsl:template match="minivideos">
        <div id="wrap">
            <xsl:call-template name="navbar"/>
            <!-- <xsl:call-template name="side" />-->
            <xsl:call-template name="tabs"/>
            <xsl:call-template name="footer"/>
        </div>
    </xsl:template>

    <xsl:template name="navbar">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"/>
                        <span class="icon-bar"/>
                        <span class="icon-bar"/>
                    </button>
                    <a class="navbar-brand" href="#">Mini-Vídeos</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li role="presentation" class="active">
                            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a>
                        </li>
                        <li role="presentation" class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">Temas
                                <span class="caret"/>
                            </a>
                            <ul class="dropdown-menu">
                                <xsl:apply-templates select="tema" mode="dropdown"/>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </xsl:template>


    <xsl:template name="tabs">
        <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                <xsl:call-template name="header"/>
            </div>
            <xsl:apply-templates select="tema" mode="tabs"/>
        </div>
    </xsl:template>


    <xsl:template match="minivideos/tema" mode="dropdown">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <xsl:element name="li">
                <xsl:attribute name="role">tab_href_<xsl:value-of select="position()"/>
                </xsl:attribute>
                <xsl:element name="a">
                    <xsl:attribute name="href">#tab_href_<xsl:value-of select="position()"/>
                    </xsl:attribute>
                    <xsl:attribute name="aria-controls">tab_href_<xsl:value-of select="position()"/>
                    </xsl:attribute>
                    <xsl:attribute name="role">tab</xsl:attribute>
                    <xsl:attribute name="data-toggle">tab</xsl:attribute>
                    <xsl:value-of select="title"/>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <xsl:template match="minivideos/tema" mode="tabs">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <xsl:element name="div">
                <xsl:attribute name="role">tabpanel</xsl:attribute>
                <xsl:attribute name="class">tab-pane fade</xsl:attribute>
                <xsl:attribute name="id">tab_href_<xsl:value-of select="position()"/>
                </xsl:attribute>
                <div class="container-fluid panel panel-primary">
                    <xsl:call-template name="tema"/>
                </div>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <xsl:template name="tema">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <div class="row panel-heading">
                <div class="col-md-7 tema">
                    <h1 class="panel-title">
                        <xsl:value-of select="title"/>
                    </h1>
                </div>
                <xsl:call-template name="links"/>
            </div>
            <xsl:apply-templates select="subtema"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="subtema">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <div class="row">
                <div class="col-md-7 subtema">
                    <xsl:value-of select="title"/>
                </div>
                <xsl:call-template name="links"/>
            </div>
            <xsl:apply-templates select="section"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="section">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <div class="row">
                <div class="col-md-7 section">
                    <xsl:value-of select="title"/>
                </div>
                <xsl:call-template name="links"/>
            </div>
            <xsl:apply-templates select="subsection"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="subsection">
        <xsl:if test="count(./descendant::link-wmv | ./descendant::link-3gp | ./descendant::link-ipod | ./descendant::link-pdf) &gt; 0">
            <div class="row">
                <div class="col-md-7 subsection">
                    <xsl:value-of select="title"/>
                </div>
                <xsl:call-template name="links"/>
            </div>
        </xsl:if>
    </xsl:template>

    <xsl:template name="links">
        <div class="col-md-4">
            <xsl:apply-templates select="link-wmv"/>
            <xsl:apply-templates select="link-3gp"/>
            <xsl:apply-templates select="link-ipod"/>
            <xsl:apply-templates select="link-pdf"/>
        </div>
    </xsl:template>

    <xsl:template match="link-wmv">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:call-template name="debug"/>wmv/<xsl:value-of select="."/>
            </xsl:attribute>
            <img class="icon" alt="para pc" src="minivideos_files/wmv.png"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="link-pdf">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:call-template name="debug"/>pdf/<xsl:value-of select="."/>
            </xsl:attribute>
            <img class="icon" alt="transparencias" src="minivideos_files/pdf.png"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="link-3gp">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:call-template name="debug"/>3gp/<xsl:value-of select="."/>
            </xsl:attribute>
            <img class="icon" alt="para movil" src="minivideos_files/pda.gif"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="link-ipod">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:call-template name="debug"/>mpeg4/<xsl:value-of select="."/>
            </xsl:attribute>
            <img class="icon" alt="para ipod" src="minivideos_files/ipod.png"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="footer">
        <footer class="bs-docs-footer" role="contentinfo">
            <div class="row">
                <div class="col-md-10 text-left">
                    <address>
                        <strong>Mini-Vídeos de autoformación por Internet y teléfonos móviles</strong>
                        <br/>
                        Proyecto de Innovación docente - UC3M (2008/09)
                        <br/>
                        <a class="text-left" href="mailto:eleton@est-econ.uc3m.es">Ayudas, sugerencias y comentarios</a>
                    </address>
                </div>
                <div class="col-md-2">
                    <xsl:call-template name="W3C-validation-certificates"/>
                    <xsl:call-template name="Histats"/>
                </div>
            </div>
        </footer>
    </xsl:template>

    <!-- MORE -->

    <xsl:template name="header">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Proyecto de Innovación Docente</h3>
            </div>
            <h2>Mini-Vídeos de autoformación por Internet y teléfonos móviles</h2>
            <p>Una ayuda para la docencia en Bolonia</p>
        </div>
        <xsl:call-template name="Participants"/>
    </xsl:template>

    <xsl:template name="Participants">

        <div class="row">
            <h3 class="team-members">Participantes</h3>
            <div class="col-md-7">
                <ul class="list-group">
                    <li class="list-group-item">
                        <xsl:element name="a">
                            <xsl:attribute name="href">javascript:;</xsl:attribute>
                            <xsl:attribute name="onmouseover">change_photo('minivideos_files/photos/eleton.jpg');
                            </xsl:attribute>
                            <xsl:attribute name="onmouseout">change_photo('minivideos_files/photos/movil.jpg');
                            </xsl:attribute>
                            <span id="coord">Emilio Letón Molina</span>
                        </xsl:element>
                    </li>
                    <li class="list-group-item">
                        <xsl:element name="a">
                            <xsl:attribute name="href">javascript:;</xsl:attribute>
                            <xsl:attribute name="onmouseover">change_photo('minivideos_files/photos/bdauria.jpg');
                            </xsl:attribute>
                            <xsl:attribute name="onmouseout">change_photo('minivideos_files/photos/movil.jpg');
                            </xsl:attribute>
                            Bernardo D'Auria
                        </xsl:element>
                    </li>
                    <li class="list-group-item">
                        <xsl:element name="a">
                            <xsl:attribute name="href">javascript:;</xsl:attribute>
                            <xsl:attribute name="onmouseover">change_photo('minivideos_files/photos/mdurban.jpg');
                            </xsl:attribute>
                            <xsl:attribute name="onmouseout">change_photo('minivideos_files/photos/movil.jpg');
                            </xsl:attribute>
                            María L. Durbán Reguera
                        </xsl:element>
                    </li>
                    <li class="list-group-item">
                        <xsl:element name="a">
                            <xsl:attribute name="href">javascript:;</xsl:attribute>
                            <xsl:attribute name="onmouseover">change_photo('minivideos_files/photos/dlee.jpg');
                            </xsl:attribute>
                            <xsl:attribute name="onmouseout">change_photo('minivideos_files/photos/movil.jpg');
                            </xsl:attribute>
                            Dae-Jin Lee
                        </xsl:element>
                    </li>
                </ul>
            </div>
            <div id="photoframe" class="col-md-5">
                <h3/>
                <img id="photo" src="minivideos_files/photos/movil.jpg" alt="foto"></img>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="W3C-validation-certificates">
        <a href="http://validator.w3.org/check?uri=referer">
            <img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10-blue"
                 alt="Valid XHTML 1.0 Transitional"/>
        </a>
        <br/>
        <a href="http://jigsaw.w3.org/css-validator/">
            <img style="border:0;width:88px;height:31px"
                 src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!"/>
        </a>
    </xsl:template>

    <xsl:template name="Histats">
        <script type="text/javascript">
            var s_sid = 484154; var st_dominio = 4;
            var cimg = 509; var cwi =72; var che =18;
        </script>
        <script type="text/javascript" src="http://s11.histats.com/js9.js">
            &lt;!-- --&gt;
        </script>
        <noscript>
            <p>
                <img src="http://s4.histats.com/stats/0.gif?484154&amp;1" alt="cool hit counter"/>
            </p>
        </noscript>
    </xsl:template>

    <xsl:template name="side">
        <div id="side">


        </div>
    </xsl:template>

</xsl:stylesheet>
