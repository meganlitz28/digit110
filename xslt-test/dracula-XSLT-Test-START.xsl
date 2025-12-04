<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
<!-- **************************************************************************-->
<!-- 2025-11-21 ebb: This XSLT starter file is for the XSLT test in DIGIT 110. 
    Do not alter the stylesheet root element or the output line. 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents featuring:
        * each chapter heading
        * each chapter's distinct sorted people/characters mentioned: <person> 
        * each chapter's distinct sorted technologies mentioned: <tech>
     
   * contain internal links from the chapter headings in the table of contents to the chapter headings;
   * contain span elements in the reading view to stylize the persons and technologies mentioned. 
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately.   
    -->  
    <!-- **************************************************************************-->
  
 <xsl:template match="/">
     <html>
         <head>
             <title>Dracula</title>
             <link rel="stylesheet" type="text/css" href="dracula.css"/>
         </head>
         <body>
             <h1 id="top">
                 <xsl:value-of select="//title"/>
             </h1>
             
             <!-- Table of contents. -->
             <section id="contents"> 
                 
                 <h2>Table of Contents</h2>
                 <table> 
                 <tr>
                     <th>Chapter Number</th>
                     <th>Tech mentioned</th>
                     <th>Locations mentioned</th>
                 </tr>
                     
            <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->   
                     
                     <xsl:apply-templates select="//chapter" mode="toc">
                         <xsl:sort select="heading" order="ascending"/>
                     </xsl:apply-templates>
                     
             </table>
             </section>
             
             <!--Reading view of the chapters here. -->
             <section id="readingView">
                 <h2>Reading View</h2>
                 
                 <xsl:apply-templates select="//chapter" mode="body">
                     <xsl:sort select="heading" order="ascending"/>
                 </xsl:apply-templates>
             </section>
             
        </body>
        
     </html>
 </xsl:template>
   
    
    <xsl:template match="chapter" mode="toc">
        <tr>
            
            <td>
                <xsl:value-of select="position()"/>
            </td>
          
            <td>
                <a href="#{heading/@xml:id}">
                    <xsl:value-of select="heading"/>
                </a>
            </td>
            
           
            <td>
                <xsl:value-of 
                    select="string-join(distinct-values(.//tech), ', ')"/>
            </td>
            
           
            <td>
                <xsl:value-of 
                    select="string-join(distinct-values(.//loc), ', ')"/>
            </td>
            
        </tr>
    </xsl:template>
    <xsl:template match="chapter" mode="body">
        <section class="chapter">
            
          
            <h2 id="{heading/@xml:id}">
                <xsl:value-of select="heading"/>
            </h2>
            
            
            <xsl:apply-templates select="p"/>
        </section>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tech">
        <span class="tech"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="loc">
        <span class="loc"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="person">
        <span class="person"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="date">
        <span class="date"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="time">
        <span class="time"><xsl:value-of select="."/></span>
    </xsl:template>
    
    
</xsl:stylesheet>