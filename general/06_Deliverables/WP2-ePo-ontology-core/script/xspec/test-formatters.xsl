<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:__x="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:pkg="http://expath.org/ns/pkg"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                version="2"
                exclude-result-prefixes="pkg impl">
   <xsl:import href="../xmi2owl_00.xsl"/>
   <xsl:import href="../test/test-formatters.xspec"/>
   <xsl:import href="file:/home/lps/work/software/OxygenXMLEditor21/frameworks/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:import href="file:/home/lps/work/software/OxygenXMLEditor21/frameworks/xspec/src/schematron/sch-location-compare.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'../xmi2owl_00.xsl'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/lps/work/software/OxygenXMLEditor21/frameworks/xspec/src/compiler/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}"
                   date="{current-dateTime()}"
                   xspec="../test/test-formatters.xspec">
            <xsl:call-template name="x:d5e2"/>
            <xsl:call-template name="x:d5e7"/>
            <xsl:call-template name="x:d5e13"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e2">
      <xsl:message>Scenario for testing function formatDocString</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing function formatDocString</x:label>
         <x:call template="formatDocString">
            <x:param name="input" select="'simple text'"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable select="'simple text'" name="input"/>
            <xsl:call-template name="formatDocString">
               <xsl:with-param name="input" select="$input"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>same simple text</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>simple text</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>same simple text</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e7">
      <xsl:message>formatNameString - normalised spaces and replaced with hyphens</xsl:message>
      <x:scenario>
         <x:label>formatNameString - normalised spaces and replaced with hyphens</x:label>
         <x:call template="formatNameString">
            <x:param name="input">
               <xsl:text> Class  Name </xsl:text>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="input-doc" as="document-node()">
               <xsl:document>
                  <xsl:text> Class  Name </xsl:text>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="input" select="$input-doc/node()"/>
            <xsl:call-template name="formatNameString">
               <xsl:with-param name="input" select="$input"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e11">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e11">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>hypenated name</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>Class-Name</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>hypenated name</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e13">
      <xsl:message>teste namespace prefix getter</xsl:message>
      <x:scenario>
         <x:label>teste namespace prefix getter</x:label>
         <x:call template="getNamespaceValue">
            <x:param name="prefix">
               <xsl:text>org</xsl:text>
            </x:param>
            <x:param name="sourceContent" select="doc('../../data/namespaces.xml')"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="prefix-doc" as="document-node()">
               <xsl:document>
                  <xsl:text>org</xsl:text>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="prefix" select="$prefix-doc/node()"/>
            <xsl:variable select="doc('../../data/namespaces.xml')" name="sourceContent"/>
            <xsl:call-template name="getNamespaceValue">
               <xsl:with-param name="prefix" select="$prefix"/>
               <xsl:with-param name="sourceContent" select="$sourceContent"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e18">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e18">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>http namespace</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://www.w3.org/ns/org#</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>http namespace</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
