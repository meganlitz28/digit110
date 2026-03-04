<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">
    
    <p:input port="source">
        <p:inline>
            <doc>Hello XProc!</doc>
        </p:inline>
    </p:input>
    
    <p:output port="result"/>
    
    <p:insert match="doc" position="last-child">
        <p:with-input port="insertion">
            <p:inline>
                <note>This was added by a step!</note>
            </p:inline>
        </p:with-input>
    </p:insert>
    
    <p:identity/>
    
</p:declare-step>