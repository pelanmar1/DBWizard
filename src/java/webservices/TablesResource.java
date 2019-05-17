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
@Path("Tables")
public class TablesResource {


    @Context
    private UriInfo context;

    /**
     * Creates a new instance of MyPathResource
     */
    public TablesResource() {
    }

    @GET
    // @Produces(MediaType.TEXT_HTML)
    public String getHtml(@QueryParam("username") String username) {
        System.out.println("USR:" + username);
        String tables =  showTablesSOAP(username);;
        return tables;
    }
    @DELETE
    @Consumes(MediaType.TEXT_HTML)
    public void deleteHtml(@QueryParam("username") String username,@QueryParam("tableName") String tableName) {
        deleteTableSOAP(username,tableName);
    }
    @POST
    @Consumes(MediaType.TEXT_HTML)
    public void postHtml(@QueryParam("query") String query, @QueryParam("username") String username, @QueryParam("tableName") String tableName) {
        createTableSOAP(query, username, tableName);

    }
    private static void createTableSOAP(java.lang.String query, java.lang.String username, java.lang.String tableName) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.createTable(query, username, tableName);

    }

    private static String showTablesSOAP(java.lang.String username) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        String tables = port.showTables(username);
        return tables;

    }


    private static void deleteTableSOAP(java.lang.String username, java.lang.String tableName) {
        soapws.SOAPWebService_Service service = new soapws.SOAPWebService_Service();
        soapws.SOAPWebService port = service.getSOAPWebServicePort();
        port.deleteTable(username, tableName);

    }

}
