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
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
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
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.TEXT_HTML)
    public String getHtml(@QueryParam("tableName") String tableName) {
        //TODO return proper representation object
        String tables = getTableSOAP(tableName);
        return tables;

    }

    @POST
    public void postHtml(@QueryParam("tableName") String tableName, @QueryParam("rowStr") String rowStr) {
        System.out.println("Q " + tableName + "" + rowStr);
        insertRowSOAP(tableName, rowStr);
    }

    /**
     * PUT method for updating or creating an instance of OneTableResource
     *
     * @param content representation for the resource
     */
    @PUT
    public void putHtml(@QueryParam("tableName") String tableName, @QueryParam("idUpdate") String idUpdate, @QueryParam("campoUpdate") String campoUpdate, @QueryParam("nuevoValor") String nuevoValor) {
        updateRowSOAP(tableName,idUpdate,campoUpdate,nuevoValor);
    }

    @DELETE
//    @Consumes(MediaType.TEXT_HTML)
    public void deleteHtml(@QueryParam("tableName") String tableName, @QueryParam("pkName") String pkName, @QueryParam("rowID") String rowID) {
        deleteRowSOAP(tableName, pkName, rowID);

    }

    private static String getTableSOAP(java.lang.String tableName) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        String tables = port.getFromTable(tableName);
        return tables;

    }

    private static void updateRowSOAP(java.lang.String tableName, java.lang.String idUpdate, java.lang.String campoUpdate, java.lang.String nuevoValor) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.updateRow(tableName, idUpdate, campoUpdate, nuevoValor);

    }

    private static void insertRowSOAP(java.lang.String tableName, java.lang.String rowStr) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.insertRow(tableName, rowStr);

    }

    private static void deleteRowSOAP(java.lang.String tableName, java.lang.String pkName, java.lang.String rowID) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.deleteRow(tableName, pkName, rowID);

    }
}
