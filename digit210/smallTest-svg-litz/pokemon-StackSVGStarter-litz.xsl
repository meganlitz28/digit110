<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml"/>
    
    <xsl:variable name="xml-tree" select="doc('pokemonmoves-litz.xml')"/>
    
    <xsl:variable name="pokemonCategories" select="$xml-tree//category => distinct-values()"/>
    <!-- text strings of the distinct categories -->
    
    <xsl:variable name="countCats" select="$pokemonCategories => count()"/>
    
    
    
    
    <xsl:template match="/">
        <svg>
            <g>
                
                <xsl:comment>
            Call some variables in here to see what they are.
            Wait...what are the categories? <xsl:value-of select="$pokemonCategories"/>
            Count of categories in Pokemon Moves file: <xsl:value-of select="$countCats"/>
        </xsl:comment>
                
            </g>
            
            <g>
                <xsl:variable name="total" select="count(//move)"/>
                <xsl:variable name="special" select="count(//move[type='special'])"/>
                <xsl:variable name="physical" select="count(//move[type='physical'])"/>
                <xsl:variable name="status" select="count(//move[type='status'])"/>
                
                <svg width="700" height="900" xmlns="http://www.w3.org/2000/svg">
                    
                    <!--    
Fairy	20
Normal	14
Poison	5
Rock	5
Electric 12
Bug	9
Fighting 8
Grass	10
Ice	7
Flying	6
Water	10
Dark	10
Psychic	13
Ghost	10
Steel	8
Fire	9
Ground	9
Dragon	8
               -->
                    <g><text x="400" y="80" font-size="30" text-anchor="middle" fill="black">Pokemon Move</text>
                        <line x1="250" y1="85" x2="550" y2="85" style="stroke:black;stroke-width:5" /> 
                    </g>
                    
                    <g>
                        <text x="400" y="110" font-size="20" text-anchor="middle" fill="purple">Poison[5]</text>  
                        <text x="400" y="130" font-size="20" text-anchor="middle" fill="#338A3A">Rock[5]</text>
                        <text x="400" y="150" font-size="20" text-anchor="middle" fill="#D5DDDE">Flying[6]</text>
                        <text x="400" y="170" font-size="20" text-anchor="middle" fill="#5D9EA6">Ice[7]</text>
                        <text x="400" y="190" font-size="20" text-anchor="middle" fill="blue">Fighting[8]</text>
                        <text x="400" y="210" font-size="20" text-anchor="middle" fill="#A8B8BA">Steel[8]</text>
                        <text x="400" y="230" font-size="20" text-anchor="middle" fill="#47165C">Dragon[8]</text>
                        <text x="400" y="250" font-size="20" text-anchor="middle" fill="#084707">Ground[9]</text>
                        <text x="400" y="270" font-size="20" text-anchor="middle" fill="#D13611">Fire[9]</text>
                        <text x="400" y="290" font-size="20" text-anchor="middle" fill="#338A3A">Bug[9]</text>
                        <text x="400" y="310" font-size="20" text-anchor="middle" fill="#0CCCE8">Water[10]</text>
                        <text x="400" y="330" font-size="20" text-anchor="middle" fill="black">Dark[10]</text>
                        <text x="400" y="350" font-size="20" text-anchor="middle" fill="green">Grass[10]</text>
                        <text x="400" y="370" font-size="20" text-anchor="middle" fill="#6D7475">Ghost[10]</text>
                        <text x="400" y="390" font-size="20" text-anchor="middle" fill="red">Electric[12]</text>
                        <text x="400" y="410" font-size="20" text-anchor="middle" fill="yellow" stroke="black">Psychic[13]</text>
                        <text x="400" y="430" font-size="20" text-anchor="middle" fill="#20208C">Normal[14]</text>
                        <text x="400" y="450" font-size="20" text-anchor="middle" fill="#D40B91">Fairy[20]</text>
                    </g>
                    
                    <!-- poison 5/-->
                    <rect x="50"
                        y="85"
                        width="150"
                        height="17"
                        fill="purple"/>
                    
                    <!-- rock 5/-->
                    <rect x="50"
                        y="100"
                        width="150"
                        height="17"
                        fill="#338A3A"/>
                    
                    <!-- flying 6/-->
                    <rect x="50"
                        y="120"
                        width="150"
                        height="18"
                        fill="#D5DDDE"/>
                    
                    <!-- ice 7/-->
                    <rect x="50"
                        y="140"
                        width="150"
                        height="19"
                        fill="#5D9EA6"/>
                    
                    <!-- fighting 8/-->
                    <rect x="50"
                        y="160"
                        width="150"
                        height="20"
                        fill="blue"/>
                    
                    <!-- steel 8/-->
                    <rect x="50"
                        y="180"
                        width="150"
                        height="20"
                        fill="#A8B8BA"/>
                    
                    <!-- dragon 8/-->
                    <rect x="50"
                        y="200"
                        width="150"
                        height="20"
                        fill="#47165C"/>
                    
                    <!-- ground 9/-->
                    <rect x="50"
                        y="220"
                        width="150"
                        height="22"
                        fill="#084707"/>
                    
                    <!-- fire 9/-->
                    <rect x="50"
                        y="240"
                        width="150"
                        height="22"
                        fill="#D13611"/>
                    
                    <!-- bug 9/-->
                    <rect x="50"
                        y="260"
                        width="150"
                        height="19"
                        fill="#338A3A"/>
                    
                    <!-- water 10/-->
                    <rect x="50"
                        y="280"
                        width="150"
                        height="25"
                        fill="#0CCCE8"/>
                    
                    <!-- dark 10/-->
                    <rect x="50"
                        y="300"
                        width="150"
                        height="25"
                        fill="black"/>
                    
                    <!-- grass 10/-->
                    <rect x="50"
                        y="320"
                        width="150"
                        height="25"
                        fill="green"/>
                    
                    <!-- ghost 10/-->
                    <rect x="50"
                        y="340"
                        width="150"
                        height="25"
                        fill="#6D7475"/>
                    
                    <!-- electric 12/-->
                    <rect x="50"
                        y="360"
                        width="150"
                        height="22"
                        fill="red"/>
                    
                    <!-- psychic 13/-->
                    <rect x="50"
                        y="380"
                        width="150"
                        height="30"
                        fill="yellow"/>
                    
                    <!-- normal 14/-->
                    <rect x="50"
                        y="400"
                        width="150"
                        height="24"
                        fill="#20208C"/>
                    
                    <!-- Fairy 20/-->
                    <rect x="50"
                        y="420"
                        width="150"
                        height="30"
                        fill="#D40B91"/>
               
                </svg>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>