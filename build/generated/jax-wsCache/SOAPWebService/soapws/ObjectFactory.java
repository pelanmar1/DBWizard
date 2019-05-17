
package soapws;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the soapws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _CreateTable_QNAME = new QName("http://webservices/", "createTable");
    private final static QName _CreateTableResponse_QNAME = new QName("http://webservices/", "createTableResponse");
    private final static QName _DeleteTable_QNAME = new QName("http://webservices/", "deleteTable");
    private final static QName _DeleteTableResponse_QNAME = new QName("http://webservices/", "deleteTableResponse");
    private final static QName _GetFromTable_QNAME = new QName("http://webservices/", "getFromTable");
    private final static QName _GetFromTableResponse_QNAME = new QName("http://webservices/", "getFromTableResponse");
    private final static QName _ShowTables_QNAME = new QName("http://webservices/", "showTables");
    private final static QName _ShowTablesResponse_QNAME = new QName("http://webservices/", "showTablesResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: soapws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CreateTable }
     * 
     */
    public CreateTable createCreateTable() {
        return new CreateTable();
    }

    /**
     * Create an instance of {@link CreateTableResponse }
     * 
     */
    public CreateTableResponse createCreateTableResponse() {
        return new CreateTableResponse();
    }

    /**
     * Create an instance of {@link DeleteTable }
     * 
     */
    public DeleteTable createDeleteTable() {
        return new DeleteTable();
    }

    /**
     * Create an instance of {@link DeleteTableResponse }
     * 
     */
    public DeleteTableResponse createDeleteTableResponse() {
        return new DeleteTableResponse();
    }

    /**
     * Create an instance of {@link GetFromTable }
     * 
     */
    public GetFromTable createGetFromTable() {
        return new GetFromTable();
    }

    /**
     * Create an instance of {@link GetFromTableResponse }
     * 
     */
    public GetFromTableResponse createGetFromTableResponse() {
        return new GetFromTableResponse();
    }

    /**
     * Create an instance of {@link ShowTables }
     * 
     */
    public ShowTables createShowTables() {
        return new ShowTables();
    }

    /**
     * Create an instance of {@link ShowTablesResponse }
     * 
     */
    public ShowTablesResponse createShowTablesResponse() {
        return new ShowTablesResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CreateTable }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "createTable")
    public JAXBElement<CreateTable> createCreateTable(CreateTable value) {
        return new JAXBElement<CreateTable>(_CreateTable_QNAME, CreateTable.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CreateTableResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "createTableResponse")
    public JAXBElement<CreateTableResponse> createCreateTableResponse(CreateTableResponse value) {
        return new JAXBElement<CreateTableResponse>(_CreateTableResponse_QNAME, CreateTableResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteTable }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "deleteTable")
    public JAXBElement<DeleteTable> createDeleteTable(DeleteTable value) {
        return new JAXBElement<DeleteTable>(_DeleteTable_QNAME, DeleteTable.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteTableResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "deleteTableResponse")
    public JAXBElement<DeleteTableResponse> createDeleteTableResponse(DeleteTableResponse value) {
        return new JAXBElement<DeleteTableResponse>(_DeleteTableResponse_QNAME, DeleteTableResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFromTable }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "getFromTable")
    public JAXBElement<GetFromTable> createGetFromTable(GetFromTable value) {
        return new JAXBElement<GetFromTable>(_GetFromTable_QNAME, GetFromTable.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFromTableResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "getFromTableResponse")
    public JAXBElement<GetFromTableResponse> createGetFromTableResponse(GetFromTableResponse value) {
        return new JAXBElement<GetFromTableResponse>(_GetFromTableResponse_QNAME, GetFromTableResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ShowTables }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "showTables")
    public JAXBElement<ShowTables> createShowTables(ShowTables value) {
        return new JAXBElement<ShowTables>(_ShowTables_QNAME, ShowTables.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ShowTablesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "showTablesResponse")
    public JAXBElement<ShowTablesResponse> createShowTablesResponse(ShowTablesResponse value) {
        return new JAXBElement<ShowTablesResponse>(_ShowTablesResponse_QNAME, ShowTablesResponse.class, null, value);
    }

}
