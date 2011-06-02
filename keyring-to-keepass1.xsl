<!DOCTYPE KEEPASSX_DATABASE>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml"/>
  
  <xsl:template match="pwlist">
    <database>
      <xsl:for-each-group select="pwentry" group-by="category">
	<group>
	  <title><xsl:value-of select="current-grouping-key()"/></title>
	  <xsl:for-each select="current-group()">
	    <xsl:apply-templates select="."/>
	  </xsl:for-each>
	</group>
      </xsl:for-each-group>
    </database>
  </xsl:template>

  <xsl:template match="pwentry">
    <entry>
      <title><xsl:value-of select="./title"/></title>
      <username><xsl:value-of select="./username"/></username>
      <password><xsl:value-of select="./password"/></password>
      <comment><xsl:value-of select="./notes"/></comment>
      <xsl:apply-templates select="./lastmodtime"/>
    </entry>
  </xsl:template>

  <xsl:template match="lastmodtime">
    <creation><xsl:apply-templates select="@*|node()"/>T12:00:00Z</creation>
    <lastaccess><xsl:apply-templates select="@*|node()"/>T12:00:00Z</lastaccess>
    <lastmod><xsl:apply-templates select="@*|node()"/>T12:00:00Z</lastmod>
    <expire>Never</expire>
  </xsl:template>
  
</xsl:stylesheet>
