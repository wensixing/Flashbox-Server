<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="Database/FlashGames/FlashGame">
            <xsl:variable name="filename" select="concat('output/xml/FlashGame/', @id, '.xml')"/>
            <xsl:result-document href="{$filename}">
                <FlashGame>
                    <xsl:attribute name="icon"><xsl:value-of select="concat('image/flashgame/', @id, '.png')"/></xsl:attribute>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="*"/>
                </FlashGame>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>
