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
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 8, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> Eugeniu Costetchi </xd:p>
            <xd:p>A set of templates and functions for processing names</xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:import href="formatting-uitils.xsl"/>
    
    <!-- Setting useful prefix definitions -->
    <xsl:variable name="prefixes" select="document('namespaces.xml')"/>

    <xd:doc>
        <xd:desc>Lookup a prefix in the sourceContent (usually an external file with namespace
            definitions) and return the namespace corresponding to the prefix</xd:desc>
        <xd:param name="prefix"/>
        <xd:param name="sourceContent"/>
    </xd:doc>
    <xsl:template name="getNamespaceValue" as="item()*">
        <xsl:param name="prefix"/>
        <xsl:param name="sourceContent"/>
        
        <xsl:variable name="prefixNamespace" select="$sourceContent/*:prefixes/*:prefix/@value[../@name = $prefix]"/>
        
        <xsl:choose>
            <xsl:when test="$prefixNamespace"><xsl:value-of select="$prefixNamespace"/></xsl:when>
            <xsl:otherwise>http://unknown/namespace/<xsl:value-of select="fn:encode-for-uri($prefix)"/>#</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc> generate the element URI pased on the parent package name</xd:desc>
        <xd:param name="xmiElement"> XMI element to build </xd:param>
        <xd:param name="root"/>
    </xd:doc>
    <xsl:template name="buildElementURI" as="item()*">
        <xsl:param name="xmiElement"/>
        <xsl:param name="root"/>
        
        <xsl:variable name="idref" select="$xmiElement/@xmi:idref"/>
        
        <xsl:variable name="parentPackage"
            select="$root//packagedElement[@xmi:id = $idref]/../@name"/>
        
        <xsl:variable name="namespace">
            <xsl:call-template name="getNamespaceValue">
                <xsl:with-param name="sourceContent" select="$prefixes"/>
                <xsl:with-param name="prefix" select="$parentPackage"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name">
            <xsl:call-template name="formatNameString">
                <xsl:with-param name="input" select="$xmiElement/@name"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="fn:concat($namespace, $name)"/>
    </xsl:template>


    <xd:doc>
        <xd:desc> build the URI for a element attribute based on the element package parent</xd:desc>
        <xd:param name="xmiElement"> Host XMI element </xd:param>
        <xd:param name="root"/>
        <xd:param name="xmiAttribute">XMI attribute to build</xd:param>
    </xd:doc>
    <xsl:template name="buildAttributeURI" as="item()*">
        <xsl:param name="xmiAttribute"/>
        <xsl:param name="xmiElement"/>
        <xsl:param name="root"/>
        
        <xsl:variable name="idref" select="$xmiElement/@xmi:idref"/>
        
        <xsl:variable name="parentPackage"
            select="$root//packagedElement[@xmi:id = $idref]/../@name"/>
        
        <xsl:variable name="namespace">
            <xsl:call-template name="getNamespaceValue">
                <xsl:with-param name="sourceContent" select="$prefixes"/>
                <xsl:with-param name="prefix" select="$parentPackage"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name">
            <xsl:call-template name="formatNameString">
                <xsl:with-param name="input" select="$xmiAttribute/@name"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="fn:concat($namespace, $name)"/>
    </xsl:template>


    <xd:doc>
        <xd:desc> build the URI for a connector based on the name and parent package of the connector source</xd:desc>
        <!--<xd:param name="xmiElement"> Source XMI element </xd:param>-->
        <xd:param name="root"/>
        <xd:param name="xmiConnector">XMI attribute to build</xd:param>
    </xd:doc>
    <xsl:template name="buildConnectorURI" as="item()*">
        <xsl:param name="xmiConnector"/>
        <xsl:param name="root"/>
        
        <!--<xsl:variable name="name" select="$xmiConnector/@name"/>-->
        <xsl:variable name="sourceId" select="$xmiConnector/source/@xmi:idref"/>
        
        <xsl:variable name="parentPackage"
            select="$root//packagedElement[@xmi:id = $sourceId]/../@name"/>
        
        <xsl:variable name="namespace">
            <xsl:call-template name="getNamespaceValue">
                <xsl:with-param name="sourceContent" select="$prefixes"/>
                <xsl:with-param name="prefix" select="$parentPackage"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name">
            <xsl:call-template name="formatNameString">
                <xsl:with-param name="input" select="$xmiConnector/@name"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$xmiConnector/@name">
                <xsl:value-of select="fn:concat($namespace, $name)"/>        
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:value-of select="fn:concat('unnamed-connector-',$xmiConnector/@xmi:idref)"/>-->
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xd:doc>
        <xd:desc> build the URI for a connector end (either source or target) based on the name and parent package of the connector source</xd:desc>
        <xd:param name="root"/>
        <xd:param name="xmiConnectorEnd">connector end to build URI for</xd:param>
        <xd:param name="xmiConnector">parent connector</xd:param>
    </xd:doc>
    <xsl:template name="buildConnectorEndURI" as="item()*">
        <xsl:param name="xmiConnectorEnd"/>
        <xsl:param name="xmiConnector"></xsl:param>
        <xsl:param name="root"/>
        
        <xsl:variable name="sourceId" select="$xmiConnector/source/@xmi:idref"/>
        
        <xsl:variable name="parentPackage"
            select="$root//packagedElement[@xmi:id = $sourceId]/../@name"/>
        
        <xsl:variable name="namespace">
            <xsl:call-template name="getNamespaceValue">
                <xsl:with-param name="sourceContent" select="$prefixes"/>
                <xsl:with-param name="prefix" select="$parentPackage"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name">
            <xsl:call-template name="formatNameString">
                <xsl:with-param name="input" select="$xmiConnectorEnd/role/@name"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$name != ''">
                <xsl:value-of select="fn:concat($namespace, $name)"/>        
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:value-of select="fn:concat('unnamed-connector-',$xmiConnector/@xmi:idref)"/>-->
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    
</xsl:stylesheet>