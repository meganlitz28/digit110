<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    

   <xsl:template match="/">
       <html>
           <head>
               <title>
                   <xsl:apply-templates select="descendant::title"/>
               </title>
               <link rel="stylesheet" href="litz-3.css"/>
           </head>
           <body>
               <xsl:apply-templates select="descendant::cover"/>
               <xsl:apply-templates select="descendant::body"/>
               
           </body> 
       </html>
   </xsl:template>
    
    <xsl:template match="cover">
    <h1><xsl:apply-templates select="title"/></h1>
        <h2><xsl:apply-templates select="attributes"/></h2>
        <h3><xsl:apply-templates select="subtitle"/></h3>
    </xsl:template>
    
    <xsl:template match="body">
        <section class="main">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="QuestEvent | charcters | location">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="faction">
        <span class="faction">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
 
    <!--<xsl:template match="cast">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="character">
        <li><span class="{@alignment}">
            <xsl:apply-templates select="@id"/>
        </span>
        </li>
    </xsl:template>-->
    
</xsl:stylesheet>