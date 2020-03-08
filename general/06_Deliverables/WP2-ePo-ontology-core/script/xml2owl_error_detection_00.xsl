<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math xd xsl uml xmi umldi dc fn"
    xmlns:uml="http://www.omg.org/spec/UML/20131001"
    xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
    xmlns:umldi="http://www.omg.org/spec/UML/20131001/UMLDI"
    xmlns:dc="http://www.omg.org/spec/UML/20131001/UMLDC" xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dct="http://purl.org/dc/terms/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="3.0">
<!--    Imports-->
    <xsl:import href="formatting-utils.xsl"/>
   <!-- Global variables-->
    <xsl:variable name="errorURI">http://error/URI/illegal/name/attribute/</xsl:variable>
    
    
    <xd:doc>
        <xd:desc>
            <xd:p> This template selects the class elements </xd:p>
        </xd:desc>
        <!--<xd:param name="rootElt"/>-->
    </xd:doc>
    <xsl:template name="classLoop">
        <!--<xsl:param name="rootElt"/>-->
        <xsl:for-each select="//xmi:Extension/elements/element[@xmi:type = 'uml:Class']">
            <xsl:call-template name="detectFaultyClassName">
                <xsl:with-param name="classElement" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> this template detects errors in the class names </xd:desc>
        <xd:param name="classElement"/>
    </xd:doc>
    <xsl:template name="detectFaultyClassName">
        <xsl:param name="classElement"/>
        <xsl:variable name="className" select="$classElement/@name"/>
        
        <xsl:variable name="classNameError">
            <xsl:call-template name="hasSpecialCharacters">
                <xsl:with-param name="input" select="$className"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$classNameError = fn:true()">
                <xsl:variable name="helper-text">
                    Class name: '<xsl:value-of select="$className"/>'. This has special characters in the name atribute.
                </xsl:variable>
                <rdf:Description rdf:about="{$errorURI}">
                    <rdfs:comment>
                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                    </rdfs:comment>    
                </rdf:Description>
            </xsl:when>
        </xsl:choose>    
    </xsl:template>
    
</xsl:stylesheet>

