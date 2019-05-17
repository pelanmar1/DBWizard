
package soapws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for updateRow complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="updateRow"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="tableName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="idUpdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="campoUpdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="nuevoValor" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "updateRow", propOrder = {
    "tableName",
    "idUpdate",
    "campoUpdate",
    "nuevoValor"
})
public class UpdateRow {

    protected String tableName;
    protected String idUpdate;
    protected String campoUpdate;
    protected String nuevoValor;

    /**
     * Gets the value of the tableName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * Sets the value of the tableName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTableName(String value) {
        this.tableName = value;
    }

    /**
     * Gets the value of the idUpdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIdUpdate() {
        return idUpdate;
    }

    /**
     * Sets the value of the idUpdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdUpdate(String value) {
        this.idUpdate = value;
    }

    /**
     * Gets the value of the campoUpdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCampoUpdate() {
        return campoUpdate;
    }

    /**
     * Sets the value of the campoUpdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCampoUpdate(String value) {
        this.campoUpdate = value;
    }

    /**
     * Gets the value of the nuevoValor property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNuevoValor() {
        return nuevoValor;
    }

    /**
     * Sets the value of the nuevoValor property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNuevoValor(String value) {
        this.nuevoValor = value;
    }

}
