<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Template principal -->
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>FOAF Profile</title>
      </head>
      <body>
        <h1>FOAF Profile</h1>
        <xsl:for-each select="//foaf:Person">
          <h2>Profile of <xsl:value-of select="concat(foaf:firstName, ' ', foaf:familyName)"/></h2>
          <p><strong>Homepage:</strong> 
            <a href="{foaf:homepage/@rdf:resource}">
              <xsl:value-of select="foaf:homepage/@rdf:resource"/>
            </a>
          </p>

          <xsl:if test="foaf:knows">
            <p><strong>Knows:</strong></p>
            <ul>
              <xsl:for-each select="foaf:knows">
                <xsl:variable name="knownPerson" select="foaf:Person[@rdf:about=current()/@rdf:resource]"/>
                <li>
                  <a href="{foaf:homepage/@rdf:resource}">
                    <xsl:value-of select="$knownPerson/foaf:firstName"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$knownPerson/foaf:familyName"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>