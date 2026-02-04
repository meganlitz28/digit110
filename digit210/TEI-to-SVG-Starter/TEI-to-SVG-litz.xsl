<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- ebb: Here's an XSLT file designed to read TEI and output SVG.
        Notice it has an xpath-default-namespace pointing to the TEI namespace. 
        We still need the SVG namespace to control the output in the XSLT root element:
        see the xmlns="http://www.w3.org/2000/svg" 
        
        I'm setting this up to process a TEI XML file from the Dandandan project last fall.
        This file is showing Season 1 Episode 1 of the Dandandan anime series. 
        
        Every <div> element is a scene location. You could plot something based on counts 
        of who or what is happening in the div elements: do some document analysis and see what
        makes sense! 
    -->
    
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    <!-- Here (above) are the spacer variables we set up for a previous example. Change the numbers so they make sense for your plot. -->
    
    <xsl:variable name="xml-tree" as="document-node()" select="doc(ep-1tei.xml)"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 500)">
            
            <xsl:for-each select="descendant::div">
            
                
              <!--  <xsl:variable name="count" select=".... "/>-->
                
                <!-- What will you tally up to plot?  -->   <g class="division">
                <xsl:variable name="stageLocations" as="attribute()+" select="descendant::stage/@where" />    
                <xsl:variable name="distinctStageLocs" as="xs:string+" select="$stageLocations => distinct-vaule() => sort()"/>    
                    <xsl:comment>
                        
                    </xsl:comment>
                    
                </g>
                
                <!-- Set up SVG element(s) to work with...  -->
                
                
            </xsl:for-each>
               <xsl:for-each select="descendant::div">
                   
                   <!-- ===== DATA EXTRACTION ===== -->
                   
                   <!-- Number of spoken lines in the scene -->
                   <xsl:variable name="lineCount" select="count(.//l)"/>
                   
                   <!-- Total word count in the scene -->
                   <xsl:variable name="wordCount"
                       select="sum(for $l in .//l return count(tokenize(normalize-space($l), '\s+')))"/>
                   
                   <!-- ===== POSITIONING ===== -->
                   
                   <!-- X: scene order -->
                   <xsl:variable name="x" select="position() * $x-spacer"/>
                   
                   <!-- Y: line count (inverted for SVG space) -->
                   <xsl:variable name="y" select="-$lineCount * $y-spacer"/>
                   
                   <!-- ===== HEAT MAP COLOR ===== -->
                   
                   <xsl:variable name="heatColor">
                       <xsl:choose>
                           <xsl:when test="$wordCount gt 300">#ff0000</xsl:when>
                           <xsl:when test="$wordCount gt 200">#ff7f00</xsl:when>
                           <xsl:when test="$wordCount gt 100">#ffff00</xsl:when>
                           <xsl:otherwise>#00bfff</xsl:otherwise>
                       </xsl:choose>
                   </xsl:variable>
                   
                   <!-- ===== SVG SHAPE ===== -->
                   
                   <circle
                       cx="{$x}"
                       cy="{$y}"
                      r="{count(descendant::div[@whatsIt='magicEgg']) * $y-spacer}"
                       fill="{$heatColor}"
                       opacity="0.8"/>
                 <!--  <circle
                       cx="{position() * $x-spacer}"
                       cy="{$count * $y-spacer}"
                       r="{$count * 2}"
                       fill="steelblue"
                       opacity="0.8"/>-->
                   
                   <!--r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                   fill="rgb({count(descendant::special[@whatsIt='magicEgg'])* 50}, {count(descendant::special[@whatsIt='magicEgg'])* 50}, 0)"
                   stroke="black"
                   stroke-width="2"-->
                   
               </xsl:for-each>
               
               
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>