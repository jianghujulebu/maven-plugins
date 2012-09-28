<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" media-type="text/xml" encoding="utf-8"/>

<xsl:param name="xsl-dir"/>
<xsl:param name="src-main-java"/>
<xsl:param name="src-main-resources"/>
<xsl:param name="src-test-java"/>
<xsl:param name="src-test-resources"/>
<xsl:variable name="space" select="' '"/>
<xsl:variable name="empty" select="''"/>
<xsl:variable name="empty-line" select="'&#x0A;'"/>
<xsl:variable name="do-package" select="//entity/@do-package"/>

<xsl:template match="/">
   <xsl:call-template name="manifest"/>
</xsl:template>

<xsl:template name="manifest">
   <xsl:element name="manifest">
      <xsl:apply-templates select="/entities/entity[@gen='true' or not(@gen) and ../@gen='true']"/>
   </xsl:element>
</xsl:template>

<xsl:template match="entity">
   <xsl:if test="@do-package != ''">
      <!-- Do class -->
      <xsl:value-of select="$empty-line"/>
      <xsl:element name="file">
         <xsl:attribute name="path">
            <xsl:value-of select="$src-main-java"/>/<xsl:value-of select="translate(@do-package,'.','/')"/>/<xsl:value-of select="$empty"/>
            <xsl:value-of select="@do-class"/>.java<xsl:value-of select="$empty"/>
         </xsl:attribute>
         
         <xsl:attribute name="template">do.xsl</xsl:attribute>
         
         <xsl:attribute name="mode">create_or_overwrite</xsl:attribute>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">do-package</xsl:attribute>
            
            <xsl:value-of select="@do-package"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">name</xsl:attribute>
            
            <xsl:value-of select="@name"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
      </xsl:element>
      
      <!-- Mapper class -->
      <xsl:value-of select="$empty-line"/>
      <xsl:element name="file">
         <xsl:attribute name="path">
            <xsl:value-of select="$src-main-java"/>/<xsl:value-of select="translate(@do-package,'.','/')"/>/<xsl:value-of select="$empty"/>
            <xsl:value-of select="@dao-class"/>.java<xsl:value-of select="$empty"/>
         </xsl:attribute>
         
         <xsl:attribute name="template">dao.xsl</xsl:attribute>
         
         <xsl:attribute name="mode">create_or_overwrite</xsl:attribute>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">do-package</xsl:attribute>
            
            <xsl:value-of select="@do-package"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">name</xsl:attribute>
            
            <xsl:value-of select="@name"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
      </xsl:element>
      
      <!-- Mapper XML file -->
      <xsl:value-of select="$empty-line"/>
      <xsl:element name="file">
         <xsl:attribute name="path">
            <xsl:value-of select="$src-main-resources"/>/<xsl:value-of select="translate(@do-package,'.','/')"/>/<xsl:value-of select="$empty"/>
            <xsl:value-of select="@do-class"/>Mapper.xml<xsl:value-of select="$empty"/>
         </xsl:attribute>
         
         <xsl:attribute name="template">mapper.xsl</xsl:attribute>
         
         <xsl:attribute name="mode">create_or_overwrite</xsl:attribute>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">do-package</xsl:attribute>
            
            <xsl:value-of select="@do-package"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
         <xsl:element name="property">
            <xsl:attribute name="name">name</xsl:attribute>
            
            <xsl:value-of select="@name"/>
         </xsl:element>
         
         <xsl:value-of select="$empty-line"/>
      </xsl:element>
   </xsl:if>
</xsl:template>

</xsl:stylesheet>