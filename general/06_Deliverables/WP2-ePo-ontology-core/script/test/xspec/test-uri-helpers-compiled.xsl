<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/naming-utils.xsl"/>
   <xsl:import href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/test/test-uri-helpers.xspec</xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/reporter/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/naming-utils.xsl"
                   date="{current-dateTime()}"
                   xspec="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/test/test-uri-helpers.xspec">
            <xsl:call-template name="x:d6e2"/>
            <xsl:call-template name="x:d6e8"/>
            <xsl:call-template name="x:d6e15"/>
            <xsl:call-template name="x:d6e22"/>
            <xsl:call-template name="x:d6e28"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d6e2">
      <xsl:message>Scenario for testing function buildElementURI</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing function buildElementURI</x:label>
         <x:call>
            <xsl:attribute name="template">buildElementURI</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">xmiElement</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/elements/element[@xmi:type = 'uml:Class' and @name='Organization']</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">root</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="xmiElement"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/elements/element[@xmi:type = 'uml:Class' and @name='Organization']"/>
            <xsl:variable name="root"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')"/>
            <xsl:call-template name="buildElementURI">
               <xsl:with-param name="xmiElement" select="$xmiElement"/>
               <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e6">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e6">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Organization URI</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://www.w3.org/ns/org#Organization</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>Organization URI</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e8">
      <xsl:message>test getting the org namespace definition</xsl:message>
      <x:scenario>
         <x:label>test getting the org namespace definition</x:label>
         <x:call>
            <xsl:attribute name="template">getNamespaceValue</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">prefix</xsl:attribute>
               <xsl:text>org</xsl:text>
            </x:param>
            <x:param>
               <xsl:attribute name="name">sourceContent</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/namespaces.xml')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="prefix-doc" as="document-node()">
               <xsl:document>
                  <xsl:text>org</xsl:text>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="prefix" as="item()*">
               <xsl:for-each select="$prefix-doc">
                  <xsl:sequence select="node()"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="sourceContent"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/namespaces.xml')"/>
            <xsl:call-template name="getNamespaceValue">
               <xsl:with-param name="prefix" select="$prefix"/>
               <xsl:with-param name="sourceContent" select="$sourceContent"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e13">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e13">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>http namespace</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://www.w3.org/ns/org#</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>http namespace</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e15">
      <xsl:message>Scenario for testing function buildAttributeURI</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing function buildAttributeURI</x:label>
         <x:call>
            <xsl:attribute name="template">buildAttributeURI</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">xmiElement</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:XMI/xmi:Extension/elements/element[@xmi:type = 'uml:Enumeration' and @name='Evaluation Method Type']</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">xmiAttribute</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:XMI/xmi:Extension/elements/element[@xmi:type = 'uml:Enumeration' and @name='Evaluation Method Type']/attributes/attribute[@name = 'PASSFAIL']</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">root</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="xmiElement"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:XMI/xmi:Extension/elements/element[@xmi:type = 'uml:Enumeration' and @name='Evaluation Method Type']"/>
            <xsl:variable name="xmiAttribute"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:XMI/xmi:Extension/elements/element[@xmi:type = 'uml:Enumeration' and @name='Evaluation Method Type']/attributes/attribute[@name = 'PASSFAIL']"/>
            <xsl:variable name="root"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')"/>
            <xsl:call-template name="buildAttributeURI">
               <xsl:with-param name="xmiElement" select="$xmiElement"/>
               <xsl:with-param name="xmiAttribute" select="$xmiAttribute"/>
               <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e20">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e20">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>URI</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://data.europa.eu/ePO/ontology#PASSFAIL</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>URI</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e22">
      <xsl:message>Scenario for testing function build connector URI</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing function build connector URI</x:label>
         <x:call>
            <xsl:attribute name="template">buildConnectorURI</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">xmiConnector</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[ @xmi:idref = 'EAID_1F057680_2DD1_465d_A815_73DADF8FF850']</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">root</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="xmiConnector"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[ @xmi:idref = 'EAID_1F057680_2DD1_465d_A815_73DADF8FF850']"/>
            <xsl:variable name="root"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')"/>
            <xsl:call-template name="buildConnectorURI">
               <xsl:with-param name="xmiConnector" select="$xmiConnector"/>
               <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e26">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e26">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>URI</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://data.europa.eu/ePO/ontology#has-EO-Group-Type</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>URI</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e28">
      <xsl:message>Scenario for testing function build connector end URI</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing function build connector end URI</x:label>
         <x:call>
            <xsl:attribute name="template">buildConnectorEndURI</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">xmiConnector</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[./@xmi:idref = 'EAID_9BFA9CBA_AA02_4344_997E_2891C61F633A']</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">xmiConnectorEnd</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[./@xmi:idref = 'EAID_9BFA9CBA_AA02_4344_997E_2891C61F633A']/target</xsl:attribute>
            </x:param>
            <x:param>
               <xsl:attribute name="name">root</xsl:attribute>
               <xsl:attribute name="select">doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="xmiConnector"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[./@xmi:idref = 'EAID_9BFA9CBA_AA02_4344_997E_2891C61F633A']"/>
            <xsl:variable name="xmiConnectorEnd"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')//xmi:Extension/connectors/connector[./@xmi:idref = 'EAID_9BFA9CBA_AA02_4344_997E_2891C61F633A']/target"/>
            <xsl:variable name="root"
                          select="doc('file:/home/lps/work/workspace-charm/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/test/ePO-CM_v2.0.1.eap.xmi')"/>
            <xsl:call-template name="buildConnectorEndURI">
               <xsl:with-param name="xmiConnector" select="$xmiConnector"/>
               <xsl:with-param name="xmiConnectorEnd" select="$xmiConnectorEnd"/>
               <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e33">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e33">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>URI</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>http://data.europa.eu/ePO/ontology#makes-decsion</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>URI</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
