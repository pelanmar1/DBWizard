/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import conf.DBConnection;
import conf.Helpers;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ejb.Stateless;

/**
 *
 * @author pelanmar1
 */
@WebService(serviceName = "SOAPWebService")
@Stateless()
public class SOAPWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "createTable")
    public void createTable(@WebParam(name = "query") String query, @WebParam(name = "username") String username, @WebParam(name = "tableName") String tableName) {
        try {
            DBConnection dbc = new DBConnection();
            System.out.println("AYUDAA");
            dbc.createTable(username, query, tableName);

            ResultSet rs = dbc.getMaxID("USERS_TABLES", "ID_TABLE");
            int maxID = rs.next() ? rs.getInt("ID") : 0;
            int newID = maxID + 1;

            dbc.createUsersTable(username, tableName, newID);

            dbc.closeConnection();

            //WSDL
            //http://localhost:8080/SOAPWebService/SOAPWebService?WSDL
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "showTables")
    public String showTables(@WebParam(name = "username") String username) {
        try {
            DBConnection dbc = new DBConnection();
            ResultSet rs = dbc.getUserTables(username);
            String strRS = Helpers.resultSet2Str(rs);
            dbc.closeConnection();
            return strRS;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        //TODO write your implementation code here:
        return "";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "deleteTable")
    public String deleteTable(@WebParam(name = "username") String username, @WebParam(name = "tableName") String tableName) {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getFromTable")
    public String getFromTable(@WebParam(name = "tableName") String tableName) {
        //TODO write your implementation code here:
        try {
            DBConnection dbc = new DBConnection();
            ResultSet rs = dbc.getTable(tableName);
            String strRS = Helpers.resultSet2Str(rs);
            dbc.closeConnection();
            return strRS;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "deleteRow")
    public String deleteRow(@WebParam(name = "tableName") String tableName, @WebParam(name = "pkName") String pkName, @WebParam(name = "rowID") String rowID) {
        try {
            DBConnection dbc = new DBConnection();
            dbc.deleteRow(tableName, pkName, rowID);
            dbc.closeConnection();
            return "";

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "insertRow")
    public String insertRow(@WebParam(name = "tableName") String tableName, @WebParam(name = "rowStr") String rowStr) {
        try {

            DBConnection dbc = new DBConnection();
            dbc.insertRow(tableName, rowStr);
            dbc.closeConnection();
            return "";

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "updateRow")
    public String updateRow(@WebParam(name = "tableName") String tableName, @WebParam(name = "idUpdate") String idUpdate, @WebParam(name = "campoUpdate") String campoUpdate, @WebParam(name = "nuevoValor") String nuevoValor) {
        try {

            DBConnection dbc = new DBConnection();
            dbc.updateRow(tableName, idUpdate,campoUpdate,nuevoValor);
            dbc.closeConnection();
            return "";

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SOAPWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }

}
