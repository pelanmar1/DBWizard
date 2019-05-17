/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author pelanmar1
 */
@Path("OneTable")
public class OneTableResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of OneTableResource
     */
    public OneTableResource() {
    }

    /**
     * Retrieves representation of an instance of webservices.OneTableResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.TEXT_HTML)
    public String getHtml(@QueryParam("tableName") String tableName) {
        //TODO return proper representation object
        String tables = getTableSOAP(tableName);
        return tables;
        
    }

    /**
     * PUT method for updating or creating an instance of OneTableResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.TEXT_HTML)
    public void putHtml(String content) {
    }
    
    private static String getTableSOAP(java.lang.String tableName) {
        System.out.println("tableName: "+tableName);
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        String tables = port.getFromTable(tableName);
        return tables;

    }
    
    private static void updateInTableSOAP(java.lang.String username, java.lang.String tableName,java.lang.String rowID, java.lang.String colName, java.lang.String newValue ) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.deleteTable(username, tableName);

    }
    
    private static void insertInTableSOAP(java.lang.String username, java.lang.String tableName) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.deleteTable(username, tableName);

    }
    
    private static void deleteInTableSOAP(java.lang.String username, java.lang.String tableName, java.lang.String rowID) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.deleteTable(username, tableName);

    }
}
