/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pelanmar1
 */
public class DBConnection {

    private Connection con;
    private static final String CONNECTION_STR = "jdbc:derby://localhost:1527/ProyectoOmega";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "root";

    public DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        con = DriverManager.getConnection(CONNECTION_STR, DB_USERNAME, DB_PASSWORD);
    }

    public ResultSet getMaxID(String tableName, String id) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "SELECT MAX(" + id + ") AS ID FROM " + tableName;
        ResultSet rs = query.executeQuery(q);
        return rs;
    }

    public void createUser(int id, String username, String password) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "INSERT INTO USERS VALUES (" + id + ",'" + username + "','" + password + "')";
        query.executeUpdate(q);
        con.commit();
    }

    public ResultSet findUser(String username) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "SELECT * FROM USERS WHERE NAME='" + username + "'";
        ResultSet rs = query.executeQuery(q);
        return rs;
    }

    public ResultSet validateUser(String username, String password) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "SELECT * FROM USERS WHERE NAME='" + username + "' AND PASSWORD='" + password + "'";
        ResultSet rs = query.executeQuery(q);
        return rs;
    }

    public ResultSet getUserTables(String username) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "SELECT * from USERS_TABLES where username='" + username + "'";
        ResultSet rs = query.executeQuery(q);
        return rs;
    }

    public void createTable(String username, String q, String tableName) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        query.executeUpdate(q);
        con.commit();
    }

    public void createUsersTable(String username, String tableName, int tableId) throws ClassNotFoundException, SQLException {
        Statement query = con.createStatement();
        String q = "INSERT INTO USERS_TABLES VALUES (" + tableId + ",'" + tableName + "','" + username + "')";
        query.executeUpdate(q);
        con.commit();
    }

    public void closeConnection() throws SQLException {
        con.close();
        con = null;
    }

    public ResultSet getTable(String tableName) throws SQLException {
        Statement query = con.createStatement();
        String q = "SELECT * from " + tableName;
        ResultSet rs = query.executeQuery(q);
        return rs;
    }

    public void deleteTable(String tableName) throws SQLException {
        Statement query = con.createStatement();
        String q = "DROP TABLE " + tableName;
        query.executeUpdate(q);
        con.commit();
    }

    public void deleteRow(String tableName, String pkName, String rowID) throws SQLException {
        Statement query = con.createStatement();
        try {
            String q = "DELETE FROM " + tableName + " WHERE " + pkName + "= " + rowID;
            query.executeUpdate(q);
            con.commit();
        } catch (Exception e) {
            String q = "DELETE FROM " + tableName + " WHERE " + pkName + "= '" + rowID + "'";
            query.executeUpdate(q);
            con.commit();
        }

    }

    public void insertRow(String tableName, String rowStr) throws SQLException {
        Statement query = con.createStatement();

        ResultSet rs = getTable(tableName);

        String[] cols = rowStr.split(",");
        String q = "INSERT INTO " + tableName + " VALUES (";
        for (int i = 0; i < cols.length; i++) {
            if (rs.getMetaData().getColumnType(i + 1) == Types.VARCHAR) {
                q += "'" + cols[i] + "',";
            } else {
                q += cols[i] + ",";
            }
        }
        q = q.substring(0, q.length() - 1);

        q += ")";
        System.out.println(q);
        query.executeUpdate(q);
        con.commit();

    }

    public void updateRow(String tableName, String idUpdate, String campoUpdate, String nuevoValor) throws SQLException {
        Statement query = con.createStatement();
        boolean pkVc = false;
        ResultSet rs = getTable(tableName);
        String pk = rs.getMetaData().getColumnName(1);
        String q;
        if (rs.getMetaData().getColumnType(1) == Types.VARCHAR) {
            pkVc = true;
        }
        if (pkVc) {
            idUpdate = "'"+idUpdate+"'";
        }
        for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
            if (rs.getMetaData().getColumnName(i + 1).equals(campoUpdate)) {
                if (rs.getMetaData().getColumnType(i + 1) == Types.VARCHAR) {
                    nuevoValor="'"+nuevoValor+"'";
                }
            }
        }
        
        q = "UPDATE " + tableName + " SET " + campoUpdate + "=" + nuevoValor + " WHERE " + pk + "=" + idUpdate;

        System.out.println(q);
        query.executeUpdate(q);
        con.commit();

    }

}
