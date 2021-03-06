<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="playlist">
        <html>
            <head>
                <title>Record Shelf</title>
                <link href="current-playlist.css" rel="stylesheet"/>
                <link href='https://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' type='text/css'/>
            </head>
            <header>
                <h1>Record Shelf</h1>
            </header>
            
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="approach.html">Portfolio Approach</a></li>
                    <li><a href="reading.html">Further Reading</a></li>
                    <li><a href="records-display.html">Record Shelf</a></li>
                </ul>
            </nav>
            <br></br>
            <nav>
                <ul>
                    <li><a href="records-display-featured.html">Featured</a></li>
                    <li><a href="records-display-rec.html">Highly Recommended</a></li>
                    <li><a href="records-display-can.html">Canadian Content</a></li>
                </ul>
            </nav>
            <body>
                <article>
                   
                    <xsl:for-each select="album">
                        <xsl:sort select="artist/@ref" order="ascending"/>                        
                        
                        <section>
                                <p></p>
                            
                            <figure>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:text>images/</xsl:text>
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>cover image for </xsl:text>
                                        <xsl:value-of select="title"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="width">
                                        <xsl:text>200</xsl:text>
                                    </xsl:attribute>
                                </img>
                                <figcaption>
                                    <small>
                                        <xsl:value-of select="title"/>
                                    </small>
                                </figcaption>
                            </figure>
                            <h2>
                                <xsl:value-of select="title"/>
                            </h2>
                            <p>
                                <b>Artist: </b>
                                <xsl:value-of select="artist"/>
                            </p>
                            <p><b>Year</b>: <xsl:value-of select="year"/>
                            </p>
                            <p><b>Genre</b>: <xsl:value-of select="genre"/>
                            </p>
                            <p>
                                <b>Time for only one song:</b>
                            </p>
                            <blockquote>
                                <p>
                                    <xsl:value-of select="description"/>
                                    <xsl:text> </xsl:text>
                                    <br/>
                                    <span class="normal">
                                    (<a>
                                        <xsl:attribute name="href"><xsl:value-of select="source"
                                            /></xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>
                                        <xsl:text>Listen</xsl:text>
                                    </a>) </span></p>
                                
                            </blockquote>
                            <xsl:choose>
                                <xsl:when test="./@status = 'essential'">
                                    <h3 style="bold">Highly recommended</h3>
                                </xsl:when>
                                <xsl:when test="./@status='can'">
                                    <h3>Canadian</h3>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br></br>
                            <br></br>
                            

                            
                                
                                
                        </section>
                    </xsl:for-each>
                </article>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
