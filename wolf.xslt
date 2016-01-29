<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output omit-xml-declaration="yes" indent="no"/>
	<xsl:output method="text"/>
	<xsl:variable name="indent" select="'&#xA;&#x20;&#x20;&#x20;&#x20;'" />

	<xsl:template match="/">
		<xsl:apply-templates select="//queryresult"/>
	</xsl:template>

	<xsl:template match="queryresult[@success='true']">

		<xsl:for-each select="pod">
			<xsl:text>&#xA;</xsl:text>
			<xsl:value-of select="@title" />
			<xsl:for-each select=".//plaintext">
				<xsl:value-of select="$indent" />
				<xsl:call-template name="insertBreaks">
					<xsl:with-param name="pText" select="text()" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>

		<xsl:text>&#xA;</xsl:text>

	</xsl:template>

	<xsl:template name="insertBreaks">
		<xsl:param name="pText" select="."/>
		<xsl:choose>
			<xsl:when test="not(contains($pText, '&#xA;'))">
				<xsl:copy-of select="$pText"/>
			</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="substring-before($pText, '&#xA;')"/>
			<xsl:value-of select="$indent" />
			<xsl:call-template name="insertBreaks">
				<xsl:with-param name="pText" select="substring-after($pText, '&#xA;')"/>
	       </xsl:call-template>
	     </xsl:otherwise>
	   </xsl:choose>
	 </xsl:template>

</xsl:stylesheet>
