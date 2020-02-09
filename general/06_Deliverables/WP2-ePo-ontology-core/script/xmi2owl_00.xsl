<?xml version="1.0" encoding="UTF-8"?>

<!-- WARNING!! Pay attention what xmi/uml namespaces your source is using -->
<!--TODO: implement xmi/uml namespace handling mechanism-->

<!--xmlns:uml="http://www.omg.org/spec/UML/20131001"
	xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
	xmlns:umldi="http://www.omg.org/spec/UML/20131001/UMLDI"
	xmlns:dc="http://www.omg.org/spec/UML/20131001/UMLDC"
-->

<!--
    xmlns:xmi="http://schema.omg.org/spec/XMI/2.1"
    xmlns:uml="http://schema.omg.org/spec/UML/2.1"
-->

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
   
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 4, 2020</xd:p>
            <xd:p><xd:b>Author:Eugeniu Costetchi</xd:b> lps</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <xsl:import href="naming-utils.xsl"/>
    <xsl:import href="formatting-uitils.xsl"/>
    
    <!-- Global variables   -->
    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"
        cdata-section-elements="lines"/>

    <xsl:variable name="sourcedoc" select="/"/>
    <xsl:variable name="document-uri" select="document-uri(.)"/>
    <xsl:variable name="base-uri" select="'http://publications.europa.eu/ontology/ePO'"/>
 
    <xsl:variable name="date" select="replace(string(current-time()), '([\D])', 'x')"/>


    <xd:doc>
        <xd:desc>
            <xd:p> The document entry template </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <rdf:RDF>
            <xsl:call-template name="namespace-setter"/>
            <xsl:call-template name="ontology-header"/>
            <!--<xsl:call-template name="classLoop"/>-->
            <!--<xsl:call-template name="enumerationLoop"/>-->
            <xsl:call-template name="generalisationLoop"/>
            <xsl:call-template name="associationLoop"/>
            <xsl:call-template name="dependecyLoop"/>
            
        </rdf:RDF>
    </xsl:template>

    <xd:doc>
        <xd:desc>Provides some namespaces</xd:desc>
    </xd:doc>
    <xsl:template name="namespace-setter">
        <xsl:namespace name="epo" select="concat($base-uri, '#')"/>
        <xsl:attribute name="xml:base" expand-text="true">{$base-uri}</xsl:attribute>
    </xsl:template>


    <xd:doc>
        <xd:desc> Ontology header </xd:desc>
    </xd:doc>
    <xsl:template name="ontology-header">
        <owl:Ontology rdf:about="">
            <owl:imports rdf:resource="http://purl.org/dc/terms/"/>
            <rdfs:comment xml:lang="en">This is the eProcurement ontology definition.</rdfs:comment>
            <dct:license rdf:resource="http://creativecommons.org/licenses/by-sa/3.0/"/>
            <rdfs:label xml:lang="en">eProcurement ontology</rdfs:label>
            <owl:versionInfo>eProcurement Ontology version 0.0.2 (auto generated)</owl:versionInfo>
            <dct:contributor rdf:resource="http://costezki.ro/eugeniu"/>
            <owl:imports rdf:resource="http://www.w3.org/2004/02/skos/core"/>
            <rdfs:seeAlso rdf:resource="https://op.europa.eu/en/web/eu-vocabularies/e-procurement"/>
            <dct:creator
                rdf:resource="http://publications.europa.eu/resource/authority/corporate-body/PUBL"/>
            <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#date"
                ><xsl:value-of select="$date"/></dct:modified>
        </owl:Ontology>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p> This template selects the class elements </xd:p>
        </xd:desc>
        <!--<xd:param name="rootElt"/>-->
    </xd:doc>
    <xsl:template name="classLoop">
        <!--<xsl:param name="rootElt"/>-->
        <xsl:for-each select="//xmi:Extension/elements/element[@xmi:type = 'uml:Class']">
            <xsl:call-template name="classDefinition">
                <xsl:with-param name="classElement" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    

    <xd:doc>
        <xd:desc>
            <xd:p> This template creates the owl:Class definition </xd:p>
        </xd:desc>
        <!--<xd:param name="className"/>
        <xd:param name="idref"/>-->
        <xd:param name="classElement"/>
    </xd:doc>

    <xsl:template name="classDefinition">
        <xsl:param name="classElement"/>

        <xsl:variable name="className" select="$classElement/@name"/>
        <xsl:variable name="idref" select="$classElement/@xmi:idref"/>

        <xsl:variable name="classURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement" select="$classElement"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="documentation" select="$classElement/properties/@documentation"/>

        
        
        <!-- rdf:ID="{$idref}" -->
        <owl:Class rdf:about="{$classURI}">
            <rdfs:label xml:lang="en">
                <xsl:choose>
                    <xsl:when test="$className">
                        <xsl:value-of select="$className"/>
                    </xsl:when>
                    <xsl:otherwise>Unnamed class</xsl:otherwise>
                </xsl:choose>                
            </rdfs:label>

            <skos:prefLabel xml:lang="en">
                <xsl:choose>
                    <xsl:when test="$className">
                        <xsl:value-of select="$className"/>
                    </xsl:when>
                    <xsl:otherwise>Unnamed class</xsl:otherwise>
                </xsl:choose>                
            </skos:prefLabel>            
            
            <xsl:choose>
                <xsl:when test="$documentation">
                    <rdfs:comment rdf:datatype="http://www.w3.org/1999/02/22-rdf-syntax-ns#HTML">
                        <xsl:call-template name="formatDocString">
                            <xsl:with-param name="input" select="$documentation"/>
                        </xsl:call-template>
                    </rdfs:comment>
                </xsl:when>
            </xsl:choose>                       
        </owl:Class>
    </xsl:template>

   
    <xd:doc>
        <xd:desc>
            <xd:p> This template selects the enumeration elements </xd:p>
        </xd:desc>
        <!--<xd:param name="rootElt"/>-->
    </xd:doc>
    <xsl:template name="enumerationLoop">
        <!--<xsl:param name="rootElt"/>-->
        <xsl:for-each select="//xmi:Extension/elements/element[@xmi:type = 'uml:Enumeration']">
            <xsl:call-template name="enumerationDefinition">
                <xsl:with-param name="enumerationElement" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>This template creates the Concept scheme and scheme definition</xd:desc>
        <xd:param name="enumerationElement"/>
    </xd:doc>
    <xsl:template name="enumerationDefinition">
        <xsl:param name="enumerationElement"/>
        
        <!-- variables for the CS content -->
        <xsl:variable name="conceptSchemeName" select="$enumerationElement/@name"/>        
        
        <xsl:variable name="conceptSchemeURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement" select="$enumerationElement"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="documentation" select="$enumerationElement/properties/@documentation"/>
        
        <!-- generating the actual CS content -->
        <skos:ConceptScheme rdf:about="{$conceptSchemeURI}">
            <skos:prefLabel><xsl:value-of select="$conceptSchemeName"/></skos:prefLabel>
            <xsl:choose>
                <xsl:when test="$documentation">
                    <skos:definition><xsl:value-of select="$documentation"/></skos:definition>
                </xsl:when>
            </xsl:choose>            
        </skos:ConceptScheme>
        
        <!-- iterating Enumeration attributes -->
        <xsl:for-each select="$enumerationElement/attributes/attribute">
            <xsl:variable name="conceptName" select="./@name"/>
            <xsl:variable name="conceptURI">
                <xsl:call-template name="buildAttributeURI">
                    <xsl:with-param name="xmiElement" select="$enumerationElement"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                    <xsl:with-param name="xmiAttribute" select="."/>
                </xsl:call-template>
            </xsl:variable>
            
            <!-- generating the actual Concept content -->
            <skos:Concept rdf:about="{$conceptURI}">
                <skos:inScheme rdf:resource="{$conceptSchemeURI}"/>
                <skos:notation><xsl:value-of select="$conceptName"/></skos:notation>
                <xsl:choose>
                    <xsl:when test="./initial/@body">
                        <skos:prefLabel xml:lang="en"><xsl:value-of select="./initial/@body"/></skos:prefLabel>
                    </xsl:when>
                    <xsl:otherwise>
                        <skos:prefLabel xml:lang="en"><xsl:value-of select="$conceptName"/></skos:prefLabel>
                    </xsl:otherwise>
                </xsl:choose>
            </skos:Concept>
        </xsl:for-each>
    </xsl:template>
    

    <xd:doc>
        <xd:desc> generate subclass statements </xd:desc>
    </xd:doc>
    <xsl:template name="dependecyLoop">
        <xsl:for-each select="//xmi:Extension/elements/connectors[@xmi:type = 'uml:Generalization']">
            <xsl:call-template name="classDefinition">
                <xsl:with-param name="classElement" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="associationLoop"/>
    <xsl:template name="generalisationLoop"/>
    

</xsl:stylesheet>
