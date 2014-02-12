<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:result-document href="output/xml/categories.xml">
            <Categories>
                <xsl:for-each select="Database/Categories/Category">
                    <Category>
                        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
                    </Category>
                </xsl:for-each>
            </Categories>
        </xsl:result-document>
    </xsl:template>
</xsl:transform>
