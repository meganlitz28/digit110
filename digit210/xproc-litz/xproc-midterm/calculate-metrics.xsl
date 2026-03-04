<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0" expand-text="yes">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="transcript">
        <xsl:copy>
            <xsl:variable name="wordTokens" select="tokenize(., '\s+')[normalize-space()]"/>
            <xsl:variable name="countTokens" select="count($wordTokens)"/>
            
            <xsl:attribute name="wordCount" select="$countTokens"/>
            
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>