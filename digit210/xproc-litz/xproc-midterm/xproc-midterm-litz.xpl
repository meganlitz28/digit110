<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0" name="my-pipeline">
    
    <p:import href="http://www.w3.org/ns/xproc-step-library.xpl"/>
    
    <p:option name="input-text" select="'zoom-transcript.txt'"/>
    <p:option name="grammar-file" select="'ZoomTranscript-litz.ixml'"/>
    
    <p:invisible-xml name="ixml-step">
        <p:with-input port="source" href="{$input-text}"/>
        <p:with-input port="grammar" href="{$grammar-file}"/>
    </p:invisible-xml>
    
    <p:xslt name="transform-step">
        <p:with-input port="source" pipe="@ixml-step"/>
        <p:with-input port="stylesheet" href="calculate_metrics.xsl"/>
    </p:xslt>
    
    <p:store href="output/final_viz.svg"/>
    
</p:declare-step>