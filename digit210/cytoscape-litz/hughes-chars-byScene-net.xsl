<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!--ebb:  XSLT example for outputting a TSV from screenplays marked with scene containers
    and descendant character elements. 
    Purpose: prepare TSV input for network analysis with Cytoscape.
    This is designed for one movie script at a time to prepare a network analysis
    visualizing the  movie's distribution of characters in scenes.
    
    It could be revised to pull data from a collection of related files.
    
    What we're analyzing with XSLT:
    * Take distinct values of mentions of characters in each scene.
    * Output a count of how many times each character actually appears.
   *  Output the scene number with a marker for use in distinguishing the node types in Cytoscape.
    -->
    
    <xsl:output method="text" indent="no"/>
    <xsl:variable name="tab" as="xs:string">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="newline" as="xs:string">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <!-- ebb: Column headings -->
        <xsl:text>speaker</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>countInScene</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>sceneNum</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>sceneMarker</xsl:text>
        <xsl:value-of select="$newline"/>

        <xsl:apply-templates select="//line"/>

    </xsl:template>
    <xsl:template match="line">
        <xsl:value-of select="speaker ! normalize-space()"/>
        <xsl:value-of select="$tab"/>
        
        <xsl:text>1</xsl:text>
        <xsl:value-of select="$tab"/>
        
        <xsl:value-of select="count(preceding::stage) + 1"/>
        <xsl:value-of select="$tab"/>
        
        <xsl:text>scene</xsl:text>
        <xsl:value-of select="$newline"/>
    </xsl:template>
        
    
  
</xsl:stylesheet>