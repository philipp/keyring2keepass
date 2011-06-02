<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml"/>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="pwlist">
    <KeePassFile>
      <Root>
        <Group>
          <Name>TOPLEVEL</Name>
          <xsl:for-each-group select="pwentry" group-by="category">
            <Group>
              <Name>
                <xsl:value-of select="current-grouping-key()"/>
              </Name>
              <xsl:for-each select="current-group()">
                <Entry>
                  <xsl:apply-templates select="@*|node()"/>
                </Entry>
              </xsl:for-each>
            </Group>
          </xsl:for-each-group>
        </Group>
      </Root>
    </KeePassFile>
  </xsl:template>

  <xsl:template match="notes">
    <String>
      <Key>Notes</Key>
      <Value>
        <xsl:apply-templates select="@*|node()"/>
      </Value>
    </String>
  </xsl:template>

  <xsl:template match="password">
    <String>
      <Key>Password</Key>
      <Value>
        <xsl:apply-templates select="@*|node()"/>
      </Value>
    </String>
  </xsl:template>

  <xsl:template match="title">
    <String>
      <Key>Title</Key>
      <Value>
        <xsl:apply-templates select="@*|node()"/>
      </Value>
    </String>
  </xsl:template>

  <xsl:template match="username">
    <String>
      <Key>UserName</Key>
      <Value>
        <xsl:apply-templates select="@*|node()"/>
      </Value>
    </String>
  </xsl:template>

  <xsl:template match="lastmodtime">
    <Times>
      <LastModificationTime><xsl:apply-templates select="@*|node()"/>T12:00:00Z</LastModificationTime>
      <CreationTime><xsl:apply-templates select="@*|node()"/>T12:00:00Z</CreationTime>
      <LastAccessTime><xsl:apply-templates select="@*|node()"/>T12:00:00Z</LastAccessTime>
    </Times>
  </xsl:template>

  <xsl:template match="category">
  </xsl:template>

</xsl:stylesheet>
