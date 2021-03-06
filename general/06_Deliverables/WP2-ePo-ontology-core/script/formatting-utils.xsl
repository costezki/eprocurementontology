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

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 8, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> Eugeniu Costetchi</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!-- Global variables   -->
    <xsl:variable name="allowedCharacters" select="'[a-zA-Z0-9]'"/>
    <xsl:variable name="allowedStrings" select="'^[a-zA-Z0-9\s+]*$'"/>

    <xd:doc>
        <xd:desc/>
        <xd:param name="input"> Format the Documentation string </xd:param>
    </xd:doc>
    <xsl:template name="formatDocString" as="item()*">
        <xsl:param name="input"/>
        <xsl:variable name="doc0"
            select="fn:replace($input, '&lt;a href', '&lt;xref scope=&#x0022;external&#x0022; href')"/>
        <xsl:variable name="doc1" select="fn:replace($doc0, '&lt;/a&gt;', '&lt;/xref&gt;')"/>
        <xsl:variable name="doc2" select="fn:replace($doc1, 'font color', 'foreign otherprops')"/>
        <xsl:variable name="doc3" select="fn:replace($doc2, '&lt;/font&gt;', '&lt;/foreign&gt;')"/>
        <xsl:variable name="doc4" select="fn:replace($doc3, 'nbsp', '#x00A0')"/>
        <xsl:variable name="doc5" select="fn:replace($doc4, '\$inet://', '')"/>
        <xsl:value-of select="$doc5"/>
    </xsl:template>


    <xd:doc>
        <xd:desc>Produce a string that can be used as local segemtn in a URI</xd:desc>
        <xd:param name="input"/>
    </xd:doc>
    <xsl:template name="formatNameString" as="item()*">
        <xsl:param name="input"/>
        <xsl:variable name="doc0" select="fn:normalize-space($input)"/>
        <xsl:variable name="doc1" select="fn:replace($doc0, '\s', '-')"/>
        <xsl:value-of select="fn:encode-for-uri($doc1)"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Check any string from special characters (only letters and numbers allowed) and
            return true or false</xd:desc>
        <xd:param name="input"/>
    </xd:doc>
    <xsl:template name="hasSpecialCharacters" as="item()*">
        <xsl:param name="input"/>
        <xsl:value-of select="not(fn:matches($input, $allowedStrings))"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Filter any string from special characters (only letters and numbers
            allowed)</xd:desc>
        <xd:param name="input"/>
    </xd:doc>
    <xsl:template name="filterSpecialCharacters" as="item()*">
        <xsl:param name="input"/>
        <xsl:variable name="unwanted"
            select="translate(fn:replace($input, $allowedCharacters, ''), ' ', '')"/>
        <xsl:value-of select="fn:normalize-space(fn:translate($input, $unwanted, ''))"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transform class name to CamelCase</xd:desc>
        <xd:param name="input"/>
    </xd:doc>
    <xsl:template name="classNameToCamelCase">
        <xsl:param name="input"/>
        <xsl:variable name="filterClass">
            <xsl:call-template name="filterSpecialCharacters">
                <xsl:with-param name="input" select="$input"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="words" select="tokenize($filterClass, '\s+')"/>
        <xsl:for-each select="distinct-values($words)">
            <xsl:variable name="word" as="xs:string" select="."/>
            <xsl:variable name="capitalizeFirstLetter"
                select="fn:upper-case(fn:substring($word, 1, 1))"/>
            <xsl:variable name="lowerCaseRestOfTheLetters"
                select="fn:lower-case(fn:substring($word, 2))"/>
            <xsl:value-of select="fn:concat($capitalizeFirstLetter, $lowerCaseRestOfTheLetters)"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Transform property name to camelCase</xd:desc>
        <xd:param name="input"/>
    </xd:doc>
    <xsl:template name="propertyNameToCamelCase">
        <xsl:param name="input"/>
        <xsl:variable name="filterProperty">
            <xsl:call-template name="filterSpecialCharacters">
                <xsl:with-param name="input" select="$input"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="firstWord" select="fn:tokenize($filterProperty, '\s+')[position() = 1]"/>
        <xsl:variable name="lowerCasedFirstWord" select="fn:lower-case($firstWord)"/>
        <xsl:variable name="words" select="tokenize($filterProperty, '\s+')[position() > 1]"/>
        <xsl:variable name="formatRestOfWords"
            select="
                for $word in $words
                return
                    fn:concat(fn:upper-case(fn:substring($word, 1, 1)), fn:lower-case(substring($word, 2)))"/>
        <xsl:variable name="restOfWordsWithoutSpace" select="fn:string-join($formatRestOfWords)"/>
        <xsl:value-of select="fn:concat($lowerCasedFirstWord, $restOfWordsWithoutSpace)"/>
    </xsl:template>
</xsl:stylesheet>
