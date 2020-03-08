<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:uml="http://www.omg.org/spec/UML/20131001"
                xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
                xmlns:umldi="http://www.omg.org/spec/UML/20131001/UMLDI"
                xmlns:dc="http://www.omg.org/spec/UML/20131001/UMLDC"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/xml2owl_error_detection_00.xspec"/>
   <xsl:import href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/xml2owl_error_detection_00.xspec</xsl:variable>
   <xsl:variable name="class1-doc" as="document-node()">
      <xsl:document>
         <element>
            <xsl:attribute name="xmi:idref"
                           select="'', ''"
                           separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
            <xsl:attribute name="xmi:type" select="'', ''" separator="uml:Class"/>
            <xsl:attribute name="name" select="'', ''" separator="Criterion Property Datum"/>
            <xsl:attribute name="scope" select="'', ''" separator="public"/>
            <model>
               <xsl:attribute name="package"
                              select="'', ''"
                              separator="EAPK_D6A9134D_B30D_4358_85FC_989B7FD48BB4"/>
               <xsl:attribute name="tpos" select="'', ''" separator="0"/>
               <xsl:attribute name="ea_localid" select="'', ''" separator="182"/>
               <xsl:attribute name="ea_eleType" select="'', ''" separator="element"/>
            </model>
            <properties>
               <xsl:attribute name="documentation"
                              select="'', ''"
                              separator="The value  provided for a criterion property.&#xA;&#xA;(WG approval 22/06/2018)&#xA;"/>
               <xsl:attribute name="isSpecification" select="'', ''" separator="false"/>
               <xsl:attribute name="sType" select="'', ''" separator="Class"/>
               <xsl:attribute name="nType" select="'', ''" separator="0"/>
               <xsl:attribute name="scope" select="'', ''" separator="public"/>
               <xsl:attribute name="isRoot" select="'', ''" separator="false"/>
               <xsl:attribute name="isLeaf" select="'', ''" separator="false"/>
               <xsl:attribute name="isAbstract" select="'', ''" separator="false"/>
               <xsl:attribute name="isActive" select="'', ''" separator="false"/>
            </properties>
            <project>
               <xsl:attribute name="author" select="'', ''" separator="mfontsan"/>
               <xsl:attribute name="version" select="'', ''" separator="1.0"/>
               <xsl:attribute name="phase" select="'', ''" separator="1.0"/>
               <xsl:attribute name="created" select="'', ''" separator="2018-02-07 11:31:24"/>
               <xsl:attribute name="modified" select="'', ''" separator="2018-09-12 12:27:17"/>
               <xsl:attribute name="complexity" select="'', ''" separator="1"/>
               <xsl:attribute name="status" select="'', ''" separator="Proposed"/>
            </project>
            <code>
               <xsl:attribute name="product_name" select="'', ''" separator="Java"/>
               <xsl:attribute name="gentype" select="'', ''" separator="Java"/>
            </code>
            <style>
               <xsl:attribute name="appearance"
                              select="'', ''"
                              separator="BackColor=-1;BorderColor=-1;BorderWidth=-1;FontColor=-1;VSwimLanes=1;HSwimLanes=1;BorderStyle=0;"/>
            </style>
            <tags/>
            <xrefs/>
            <extendedProperties>
               <xsl:attribute name="tagged" select="'', ''" separator="0"/>
               <xsl:attribute name="package_name" select="'', ''" separator="ccev"/>
            </extendedProperties>
            <attributes>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_7F63A40C_7924_41e6_97F7_0C771AA3AF4C"/>
                  <xsl:attribute name="name" select="'', ''" separator="Value Identifier"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="83"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{7F63A40C-7924-41e6-97F7-0C771AA3AF4C}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Identifier"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="0"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_1E4082B4_C208_47b8_945D_D57DAFAE047D"/>
                  <xsl:attribute name="name" select="'', ''" separator="Amount"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="84"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{1E4082B4-C208-47b8-945D-D57DAFAE047D}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Amount"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="1"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_9607E693_6B26_4c96_9BC5_5D8A3856F2C3"/>
                  <xsl:attribute name="name" select="'', ''" separator="Quantity"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="87"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{9607E693-6B26-4c96-9BC5-5D8A3856F2C3}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Quantity"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="4"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_45FCC1FA_25AA_4613_ACC4_8E595A29C6C7"/>
                  <xsl:attribute name="name" select="'', ''" separator="Code"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="88"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{45FCC1FA-25AA-4613-ACC4-8E595A29C6C7}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Code"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="5"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_65F6A6C0_166D_47c3_B433_895CACF67951"/>
                  <xsl:attribute name="name" select="'', ''" separator="Date"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="89"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{65F6A6C0-166D-47c3-B433-895CACF67951}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Date"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="6"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_88CAF11A_32F2_41d7_A226_E00E398F54A2"/>
                  <xsl:attribute name="name" select="'', ''" separator="Time"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="90"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{88CAF11A-32F2-41d7-A226-E00E398F54A2}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Time"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="7"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_09226FBD_51D0_41dd_B644_C7ACF55F111E"/>
                  <xsl:attribute name="name" select="'', ''" separator="Indicator"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="91"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{09226FBD-51D0-41dd-B644-C7ACF55F111E}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Indicator"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="8"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_1CD8AAAF_490F_4560_855E_1219EBE68AFE"/>
                  <xsl:attribute name="name" select="'', ''" separator="URI"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="92"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{1CD8AAAF-490F-4560-855E-1219EBE68AFE}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="URI"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="9"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_D9C889B1_0C1B_4984_9378_73194AEAA171"/>
                  <xsl:attribute name="name" select="'', ''" separator="Period"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="93"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{D9C889B1-0C1B-4984-9378-73194AEAA171}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Period"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="10"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
               <attribute>
                  <xsl:attribute name="xmi:idref"
                                 select="'', ''"
                                 separator="EAID_A313A0BC_951F_405d_9E8F_1FE47DAB6623"/>
                  <xsl:attribute name="name" select="'', ''" separator="Text"/>
                  <xsl:attribute name="scope" select="'', ''" separator="Public"/>
                  <initial/>
                  <documentation/>
                  <model>
                     <xsl:attribute name="ea_localid" select="'', ''" separator="497"/>
                     <xsl:attribute name="ea_guid"
                                    select="'', ''"
                                    separator="{A313A0BC-951F-405d-9E8F-1FE47DAB6623}"/>
                  </model>
                  <properties>
                     <xsl:attribute name="type" select="'', ''" separator="Text"/>
                     <xsl:attribute name="collection" select="'', ''" separator="false"/>
                     <xsl:attribute name="static" select="'', ''" separator="0"/>
                     <xsl:attribute name="duplicates" select="'', ''" separator="0"/>
                     <xsl:attribute name="changeability" select="'', ''" separator="changeable"/>
                  </properties>
                  <coords>
                     <xsl:attribute name="ordered" select="'', ''" separator="0"/>
                  </coords>
                  <containment>
                     <xsl:attribute name="containment" select="'', ''" separator="Not Specified"/>
                     <xsl:attribute name="position" select="'', ''" separator="11"/>
                  </containment>
                  <stereotype/>
                  <bounds>
                     <xsl:attribute name="lower" select="'', ''" separator="1"/>
                     <xsl:attribute name="upper" select="'', ''" separator="1"/>
                  </bounds>
                  <options/>
                  <style/>
                  <styleex>
                     <xsl:attribute name="value" select="'', ''" separator="volatile=0;"/>
                  </styleex>
                  <tags/>
                  <xrefs/>
               </attribute>
            </attributes>
            <links>
               <Association>
                  <xsl:attribute name="xmi:id"
                                 select="'', ''"
                                 separator="EAID_30D51F2C_9147_4c35_AEFA_ED8C40A203A1"/>
                  <xsl:attribute name="start"
                                 select="'', ''"
                                 separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
                  <xsl:attribute name="end"
                                 select="'', ''"
                                 separator="EAID_116B30E9_5947_4510_847A_7E8C5EEC0432"/>
               </Association>
               <NoteLink>
                  <xsl:attribute name="xmi:id"
                                 select="'', ''"
                                 separator="EAID_F7B91D1C_7D31_4c31_82D9_FC8BA63E6147"/>
                  <xsl:attribute name="start"
                                 select="'', ''"
                                 separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
                  <xsl:attribute name="end"
                                 select="'', ''"
                                 separator="EAID_1978A32C_FA81_4144_A2D8_3872ED05C8B5"/>
               </NoteLink>
               <Association>
                  <xsl:attribute name="xmi:id"
                                 select="'', ''"
                                 separator="EAID_3D877C31_33D1_49b2_A3B3_2ED2D7E8177E"/>
                  <xsl:attribute name="start"
                                 select="'', ''"
                                 separator="EAID_042360F0_BF1E_443d_9375_B99D86DC047A"/>
                  <xsl:attribute name="end"
                                 select="'', ''"
                                 separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
               </Association>
               <Association>
                  <xsl:attribute name="xmi:id"
                                 select="'', ''"
                                 separator="EAID_CAEEB8A1_58C5_4b58_9ACA_610467D4D59A"/>
                  <xsl:attribute name="start"
                                 select="'', ''"
                                 separator="EAID_042360F0_BF1E_443d_9375_B99D86DC047A"/>
                  <xsl:attribute name="end"
                                 select="'', ''"
                                 separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
               </Association>
               <Association>
                  <xsl:attribute name="xmi:id"
                                 select="'', ''"
                                 separator="EAID_FC6BC360_A9B3_4ae2_A439_1CCFCEE2711A"/>
                  <xsl:attribute name="start"
                                 select="'', ''"
                                 separator="EAID_9D96D0CB_35A7_4908_87DB_EE8B4980064B"/>
                  <xsl:attribute name="end"
                                 select="'', ''"
                                 separator="EAID_F1C29234_9A79_49fd_860E_E79AB4F9240D"/>
               </Association>
            </links>
         </element>
      </xsl:document>
   </xsl:variable>
   <xsl:variable name="class1" as="item()*">
      <xsl:for-each select="$class1-doc">
         <xsl:sequence select="node()"/>
      </xsl:for-each>
   </xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/reporter/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/xml2owl_error_detection_00.xspec"
                   date="{current-dateTime()}"
                   xspec="file:/home/dragos/src/eprocurementontology/eprocurementontology/general/06_Deliverables/WP2-ePo-ontology-core/script/xml2owl_error_detection_00.xspec">
            <xsl:call-template name="x:d6e169"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d6e169">
      <xsl:message>class name to CamelCase - first letter is uppercase</xsl:message>
      <x:scenario>
         <x:label>class name to CamelCase - first letter is uppercase</x:label>
         <x:call>
            <xsl:attribute name="template">classNameToCamelCase</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">input</xsl:attribute>
               <xsl:attribute name="select">$class1</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="input" select="$class1"/>
            <xsl:call-template name="classNameToCamelCase">
               <xsl:with-param name="input" select="$input"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e172">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e172">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>camelCasedClassName</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="//*:Description" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="//*:Description" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>camelCasedClassName</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">//*:Description</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
