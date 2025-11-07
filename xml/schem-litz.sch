<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern id="geocoding-rules">
        <title>Geocoding validation for Banksy project locations</title>
        
        
        <!-- USA locations -->
        <rule context="location[contains(., 'USA')]">
            <assert test="@long &lt; 0">
                USA locations must have negative longitude (western hemisphere).
            </assert>
            <assert test="@lat &gt; 0">
                USA locations must have positive latitude (northern hemisphere).
            </assert>
        </rule>
    </pattern>
</schema>
