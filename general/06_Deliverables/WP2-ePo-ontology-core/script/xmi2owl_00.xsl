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
    
    <xsl:variable name="errorURI">http://error/URI/indicating/which/things/went/wrong/</xsl:variable>
    
    
    <xd:doc>
        <xd:desc>
            <xd:p> The document entry template </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <rdf:RDF>
            <xsl:call-template name="namespace-setter"/>
            <xsl:call-template name="ontology-header"/>
            <xsl:call-template name="classLoop"/>
            <xsl:call-template name="enumerationLoop"/>
            <xsl:call-template name="generalisationLoop"/>
            <xsl:call-template name="dependecyLoop"/>
            <xsl:call-template name="associationLoop"/>
            <xsl:call-template name="attributeLoop"/>
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
            <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
                <xsl:value-of select="$date"/>
            </dct:modified>
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
        
        <xsl:choose>
            <xsl:when test="$className != ''">
                <owl:Class rdf:about="{$classURI}">
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="$className"/>
                    </rdfs:label>
                    <skos:prefLabel xml:lang="en">
                        <xsl:value-of select="$className"/>
                    </skos:prefLabel>
                    
                    <xsl:choose>
                        <xsl:when test="$documentation != ''">
                            <rdfs:comment rdf:datatype="http://www.w3.org/1999/02/22-rdf-syntax-ns#HTML">
                                <xsl:call-template name="formatDocString">
                                    <xsl:with-param name="input" select="$documentation"/>
                                </xsl:call-template>
                            </rdfs:comment>
                        </xsl:when>
                    </xsl:choose>            
                
                </owl:Class>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="helper-text">
                    Due to a missing name a class cannote be created from element xmi:idref='<xsl:value-of select="$classElement/@xmi:idref"/>' 
                </xsl:variable>
                
                <rdf:Description rdf:about="{$errorURI}">
                    <rdfs:comment>
                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                    </rdfs:comment>    
                </rdf:Description>
                
            </xsl:otherwise>
        </xsl:choose>
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
        
        <xsl:variable name="documentation" select="$enumerationElement/documentation/@value"/>
        
        <!-- generating the actual CS content -->
        <skos:ConceptScheme rdf:about="{$conceptSchemeURI}">
            <skos:prefLabel>
                <xsl:value-of select="$conceptSchemeName"/>
            </skos:prefLabel>
            <xsl:choose>
                <xsl:when test="$documentation">
                    <skos:definition>
                        <xsl:value-of select="$documentation"/>
                    </skos:definition>
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
                <skos:notation>
                    <xsl:value-of select="$conceptName"/>
                </skos:notation>
                <xsl:choose>
                    <xsl:when test="./initial/@body">
                        <skos:prefLabel xml:lang="en">
                            <xsl:value-of select="./initial/@body"/>
                        </skos:prefLabel>
                    </xsl:when>
                    <xsl:otherwise>
                        <skos:prefLabel xml:lang="en">
                            <xsl:value-of select="$conceptName"/>
                        </skos:prefLabel>                        
                    </xsl:otherwise>
                </xsl:choose>
            </skos:Concept>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> generate subclass of statements </xd:desc>
    </xd:doc>
    <xsl:template name="generalisationLoop">
        <xsl:for-each
            select="//xmi:Extension/connectors/connector[./properties/@ea_type = 'Generalization']">
            
            <xsl:variable name="sourceId" select="./source/@xmi:idref"/>
            <xsl:variable name="targetId" select="./target/@xmi:idref"/>
            
            <xsl:variable name="sourceURI">
                <xsl:call-template name="buildElementURI">
                    <xsl:with-param name="xmiElement"
                        select="//xmi:Extension/elements/element[@xmi:idref = $sourceId]"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:variable name="targetURI">
                <xsl:call-template name="buildElementURI">
                    <xsl:with-param name="xmiElement"
                        select="//xmi:Extension/elements/element[@xmi:idref = $targetId]"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <!--  generating the  subclass of statement-->
            <owl:Class rdf:about="{$sourceURI}">
                <rdfs:subClassOf rdf:resource="{$targetURI}"/>
            </owl:Class>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> generate the property definition with an enumeration as range </xd:desc>
    </xd:doc>
    <xsl:template name="dependecyLoop">
        <xsl:for-each
            select="//xmi:Extension/connectors/connector[./properties/@ea_type = 'Dependency']">
            
            <xsl:variable name="sourceId" select="./source/@xmi:idref"/>
            <xsl:variable name="targetId" select="./target/@xmi:idref"/>
            
            <xsl:variable name="sourceURI">
                <xsl:call-template name="buildElementURI">
                    <xsl:with-param name="xmiElement"
                        select="//xmi:Extension/elements/element[@xmi:idref = $sourceId]"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:variable name="targetURI">
                <xsl:call-template name="buildElementURI">
                    <xsl:with-param name="xmiElement"
                        select="//xmi:Extension/elements/element[@xmi:idref = $targetId]"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:variable name="propertyURI">
                <xsl:call-template name="buildConnectorURI">
                    <xsl:with-param name="xmiConnector" select="."/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <!--<xsl:variable name="documentation" select="./documentation"/>-->
            
            <!-- TODO: generating the object propoerty-->
            <xsl:choose>
                <xsl:when test="./@name">
                    <owl:ObjectProperty rdf:about="{$propertyURI}">
                        <rdfs:label xml:lang="en">
                            <xsl:value-of select="./@name"/>
                        </rdfs:label>
                        <skos:prefLabel xml:lang="en">
                            <xsl:value-of select="./@name"/>
                        </skos:prefLabel>
                        
                        <!-- if there is documentation insert the formated form of it-->
                        <xsl:choose>
                            <xsl:when test="./documentation != ''">
                                <skos:definition xml:lang="en">
                                    <xsl:call-template name="formatDocString">
                                        <xsl:with-param name="input" select="./documentation"/>
                                    </xsl:call-template>
                                </skos:definition>
                            </xsl:when>
                        </xsl:choose>
                        <!-- insert the domain definition -->
                        <rdfs:domain rdf:resource="{$sourceURI}"/>
                        <!-- insert the  range definition -->
                        <rdfs:range rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
                        <!-- the range shall me a concept from the Concept schme target URI -->
                        <rdfs:comment>The expected value of this property should be from the
                            controleld list "<xsl:value-of select="$targetURI"/>" </rdfs:comment>
                    </owl:ObjectProperty>
                </xsl:when>
            </xsl:choose>
            
        </xsl:for-each>
        
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Generate object propoerties from association connectors </xd:desc>
    </xd:doc>
    <xsl:template name="associationLoop">
        <xsl:for-each
            select="//xmi:Extension/connectors/connector[./properties/@ea_type = 'Association']">
            
            <xsl:choose>
                <xsl:when test="./properties/@direction = 'Source -&gt; Destination'">
                    <!--<xsl:call-template name="associationSourceDestination">
                        <xsl:with-param name="xmiConnector" select="."></xsl:with-param>
                        </xsl:call-template>-->
                </xsl:when>
                <xsl:when test="./properties/@direction = 'Bi-Directional'">
                    <xsl:call-template name="associationBiDirectional">
                        <xsl:with-param name="xmiConnector" select="."></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <!-- Strange stuff to be tested -->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> generate an onbject propoerty from a connector which has a name and 
            is unidirectional from source to destination nodes</xd:desc>
        <xd:param name="xmiConnector"/>
    </xd:doc>
    <xsl:template name="associationSourceDestination">
        <xsl:param name="xmiConnector"/>
        
        <xsl:variable name="sourceId" select="$xmiConnector/source/@xmi:idref"/>
        <xsl:variable name="targetId" select="$xmiConnector/target/@xmi:idref"/>
        
        <xsl:variable name="sourceURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement"
                    select="//xmi:Extension/elements/element[@xmi:idref = $sourceId]"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="targetURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement"
                    select="//xmi:Extension/elements/element[@xmi:idref = $targetId]"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="propertyURI">
            <xsl:call-template name="buildConnectorURI">
                <xsl:with-param name="xmiConnector" select="$xmiConnector"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- generating the object propoerty-->
        <xsl:choose>
            <xsl:when test="$xmiConnector/@name">
                <owl:ObjectProperty rdf:about="{$propertyURI}">
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="$xmiConnector/@name"/>
                    </rdfs:label>
                    <skos:prefLabel xml:lang="en">
                        <xsl:value-of select="$xmiConnector/@name"/>
                    </skos:prefLabel>
                    
                    <!-- if there is documentation insert the formated form of it-->
                    <xsl:choose>
                        <xsl:when test="$xmiConnector/documentation != ''">
                            <skos:definition xml:lang="en">
                                <xsl:call-template name="formatDocString">
                                    <xsl:with-param name="input" select="$xmiConnector/documentation"/>
                                </xsl:call-template>
                            </skos:definition>
                        </xsl:when>
                    </xsl:choose>
                    <!-- insert the domain definition -->
                    <rdfs:domain rdf:resource="{$sourceURI}"/>
                    <!-- insert the  range definition -->
                    <rdfs:range rdf:resource="{$targetURI}"/>                    
                </owl:ObjectProperty>
            </xsl:when>
            <xsl:otherwise>
                <!-- there is no name indicated for this association. Probably it is in the source or tahrget, and thus it shall be lifted to the association level-->
                <xsl:variable name="helper-text">
                    Could not generate object property from association connector xmi:idref='<xsl:value-of select="$xmiConnector/@xmi:idref"/>' due to missing name.
                    This connection is from '<xsl:value-of select="$xmiConnector/source/model/@name"/>' to 
                    '<xsl:value-of select="$xmiConnector/target/model/@name"/>' 
                    and is labelled at source '<xsl:value-of select="$xmiConnector/source/role/@name"/>' and at target
                    '<xsl:value-of select="$xmiConnector/target/role/@name"/>'.
                </xsl:variable>
                <rdf:Description rdf:about="{$errorURI}">
                    <rdfs:comment>
                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                    </rdfs:comment>
                </rdf:Description>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="xmiConnector"/>
    </xd:doc>
    <xsl:template name="associationBiDirectional">
        <xsl:param name="xmiConnector"/>
        
        <xsl:variable name="sourceId" select="$xmiConnector/source/@xmi:idref"/>
        <xsl:variable name="targetId" select="$xmiConnector/target/@xmi:idref"/>
        
        <xsl:variable name="sourceURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement"
                    select="//xmi:Extension/elements/element[@xmi:idref = $sourceId]"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="targetURI">
            <xsl:call-template name="buildElementURI">
                <xsl:with-param name="xmiElement"
                    select="//xmi:Extension/elements/element[@xmi:idref = $targetId]"/>
                <xsl:with-param name="root" select="fn:root()"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="sourceRelationURI">
            <xsl:call-template name="buildConnectorEndURI">
                <xsl:with-param name="root" select="fn:root()"/>
                <xsl:with-param name="xmiConnector" select="$xmiConnector"/>
                <xsl:with-param name="xmiConnectorEnd" select="$xmiConnector/source"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="targetRelationURI">
            <xsl:call-template name="buildConnectorEndURI">
                <xsl:with-param name="root" select="fn:root()"/>
                <xsl:with-param name="xmiConnector" select="$xmiConnector"/>
                <xsl:with-param name="xmiConnectorEnd" select="$xmiConnector/target"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- generating the object property-->
        <xsl:choose>
            <xsl:when test="$xmiConnector/@name">
                <!-- the connector has a name. It hsould not be Bi-Directional then -->
                <xsl:variable name="helper-text">
                    Could not generate object property for association connector '<xsl:value-of select="$xmiConnector/@name"/>' 
                    because it has a general name but is marked as bi-directional.
                    This connection is from '<xsl:value-of select="$xmiConnector/source/model/@name"/>' to 
                    '<xsl:value-of select="$xmiConnector/target/model/@name"/>' 
                    and is labelled at source '<xsl:value-of select="$xmiConnector/source/role/@name"/>' and at target
                    '<xsl:value-of select="$xmiConnector/target/role/@name"/>'.
                </xsl:variable>
                <rdf:Description rdf:about="{$errorURI}">
                    <rdfs:comment>
                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                    </rdfs:comment>
                </rdf:Description>
            </xsl:when>
            <xsl:when test="not($xmiConnector/source/role/@name) or  not($xmiConnector/target/role/@name)">
                <!-- one of the connectors does not have a name. It hsould not be Bi-Directional then -->
                <xsl:variable name="helper-text">
                    Could not generate object property for association connector xmi:idref='<xsl:value-of select="$xmiConnector/@xmi:idref"/>' 
                    because it is missing an inverse property.
                    This connection is from '<xsl:value-of select="$xmiConnector/source/model/@name"/>' to 
                    '<xsl:value-of select="$xmiConnector/target/model/@name"/>' 
                    and is labelled at source '<xsl:value-of select="$xmiConnector/source/role/@name"/>' and at target
                    '<xsl:value-of select="$xmiConnector/target/role/@name"/>'.
                </xsl:variable>
                <rdf:Description rdf:about="{$errorURI}">
                    <rdfs:comment>
                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                    </rdfs:comment>
                </rdf:Description>
            </xsl:when>
            <xsl:otherwise>
                <!-- Generating the source property -->
                <owl:ObjectProperty rdf:about="{$sourceRelationURI}">
                    <rdfs:label><xsl:value-of select="$xmiConnector/source/role/@name"/></rdfs:label>
                    <skos:prefLabel><xsl:value-of select="$xmiConnector/source/role/@name"/></skos:prefLabel>
                    
                    <!-- if there is documentation insert the formated form of it-->
                    <xsl:choose>
                        <xsl:when test="$xmiConnector/source/documentation != ''">
                            <skos:definition xml:lang="en">
                                <xsl:call-template name="formatDocString">
                                    <xsl:with-param name="input" select="$xmiConnector/source/documentation"/>
                                </xsl:call-template>
                            </skos:definition>
                        </xsl:when>
                    </xsl:choose>
                    <!-- insert the domain definition -->
                    <rdfs:domain rdf:resource="{$targetURI}"/>
                    <!-- insert the  range definition -->
                    <rdfs:range rdf:resource="{$sourceURI}"/>
                    <!-- insert the inverse relation binding-->
                    <owl:inverseOf rdf:resource="{$targetRelationURI}"></owl:inverseOf>
                </owl:ObjectProperty>
                <!-- Generating the target property -->
                <owl:ObjectProperty rdf:about="{$targetRelationURI}">
                    <rdfs:label><xsl:value-of select="$xmiConnector/target/role/@name"/></rdfs:label>
                    <skos:prefLabel><xsl:value-of select="$xmiConnector/target/role/@name"/></skos:prefLabel>
                    
                    <!-- if there is documentation insert the formated form of it-->
                    <xsl:choose>
                        <xsl:when test="$xmiConnector/target/documentation != ''">
                            <skos:definition xml:lang="en">
                                <xsl:call-template name="formatDocString">
                                    <xsl:with-param name="input" select="$xmiConnector/target/documentation"/>
                                </xsl:call-template>
                            </skos:definition>
                        </xsl:when>
                    </xsl:choose>
                    <!-- insert the domain definition -->
                    <rdfs:domain rdf:resource="{$sourceURI}"/>
                    <!-- insert the  range definition -->
                    <rdfs:range rdf:resource="{$targetURI}"/>
                    <!-- insert the inverse relation binding-->
                    <owl:inverseOf rdf:resource="{$sourceRelationURI}"></owl:inverseOf>
                </owl:ObjectProperty>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> generate datatype properties for each attribute of every class </xd:desc>
    </xd:doc>
    <xsl:template name="attributeLoop">
        <xsl:for-each select="//xmi:Extension/elements/element[@xmi:type = 'uml:Class']">
            <xsl:variable name="classElement" select="."/>
            
            <xsl:variable name="className" select="$classElement/@name"/>
            <xsl:variable name="idref" select="$classElement/@xmi:idref"/>
            
            <xsl:variable name="classURI">
                <xsl:call-template name="buildElementURI">
                    <xsl:with-param name="xmiElement" select="$classElement"/>
                    <xsl:with-param name="root" select="fn:root()"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:choose>
                <!-- work with classes that have a name -->
                <xsl:when test="$className != ''">
                    <!-- okay we have a class with a name , lets loop the attributes now-->
                    <xsl:for-each select="$classElement/attributes/attribute">
                        <xsl:variable name="attributeElement" select="."/>
                        <xsl:variable name="propertyName" select="$attributeElement/@name"/>
                        <xsl:variable name="propertyURI">
                            <xsl:call-template name="buildAttributeURI">
                                <xsl:with-param name="xmiElement" select="$classElement"/>
                                <xsl:with-param name="root" select="fn:root()"/>
                                <xsl:with-param name="xmiAttribute" select="$attributeElement"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="dataType" select="$attributeElement/properties/@type"/>
                        
                        <xsl:variable name="documentation" select="$attributeElement/documentation/@value"/>
                        
                        <xsl:choose>
                            <!-- if we have an attribute name then build the propeorty -->
                            <xsl:when test="$propertyName !=''">
                                <owl:DatatypeProperty rdf:about="{$propertyURI}">
                                    <rdfs:label><xsl:value-of select="$propertyName"/></rdfs:label>
                                    <skos:prefLabel><xsl:value-of select="$propertyName"/></skos:prefLabel>
                                    <xsl:choose>
                                        <xsl:when test="$documentation !=''">
                                            <rdfs:comment>
                                                <xsl:value-of select="$documentation"/>
                                            </rdfs:comment>
                                        </xsl:when>
                                    </xsl:choose>
                                    <rdfs:domain rdf:resource="{$classURI}"/>
                                    <rdf:range rdf:resource="{$dataType}"/>
                                </owl:DatatypeProperty> 
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- if we do NOT have an attribute name then generate an error-->
                                <xsl:variable name="helper-text">
                                    Cannot generate a data property due to a missing name from a class attribute xmi:idref='<xsl:value-of select="$attributeElement/@xmi:idref"/>' 
                                </xsl:variable>
                                <rdf:Description rdf:about="{$errorURI}">
                                    <rdfs:comment>
                                        <xsl:value-of select="fn:normalize-space($helper-text)"/>
                                    </rdfs:comment>    
                                </rdf:Description>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="helper-text">
                        Due to a missing name of the class cannot created Data Properties 
                        from attributes of the element xmi:idref='<xsl:value-of select="$classElement/@xmi:idref"/>' 
                    </xsl:variable>
                    <rdf:Description rdf:about="{$errorURI}">
                        <rdfs:comment>
                            <xsl:value-of select="fn:normalize-space($helper-text)"/>
                        </rdfs:comment>
                    </rdf:Description>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
