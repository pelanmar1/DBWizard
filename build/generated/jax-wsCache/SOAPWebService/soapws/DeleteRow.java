
package soapws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for deleteRow complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="deleteRow"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="tableName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="pkName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="rowID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "deleteRow", propOrder = {
    "tableName",
    "pkName",
    "rowID"
})
public class DeleteRow {

    protected String tableName;
    protected String pkName;
    protected String rowID;

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
     * Gets the value of the pkName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPkName() {
        return pkName;
    }

    /**
     * Sets the value of the pkName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPkName(String value) {
        this.pkName = value;
    }

    /**
     * Gets the value of the rowID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRowID() {
        return rowID;
    }

    /**
     * Sets the value of the rowID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRowID(String value) {
        this.rowID = value;
    }

}
