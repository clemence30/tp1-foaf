<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">

    <xsl:template match="foaf:Person">
        <div class="person">
            <h2>
                <xsl:value-of select="foaf:firstName"/> <xsl:value-of select="foaf:familyName"/>
            </h2>
            <p>Page d'accueil : 
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="foaf:homepage/@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="foaf:homepage/@rdf:resource"/>
                </a>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>