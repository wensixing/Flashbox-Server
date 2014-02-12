<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="Database/Categories/Category">
            <xsl:variable name="filename" select="concat('output/xml/category/', @id, '.xml')"/>
            <xsl:result-document href="{$filename}">
                <Category>
                    <xsl:for-each select="FlashGame">
                    <FlashGame>
                        <xsl:variable name="fg" select='/Database/FlashGames/FlashGame[@id=current()/@id]'/>
                        <xsl:attribute name="id"><xsl:value-of select="$fg/@id"/></xsl:attribute>
                        <xsl:attribute name="name"><xsl:value-of select="$fg/@name"/></xsl:attribute>
                    </FlashGame>
                    </xsl:for-each>
                </Category>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>
