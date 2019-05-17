/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 *
 * @author pelanmar1
 */
public class Helpers {

    public static String resultSet2Str(ResultSet rs) throws SQLException {
        if(!rs.next())
            return "";
        ResultSetMetaData rsmd = rs.getMetaData();
        int numCols = rsmd.getColumnCount();
        final StringBuilder builder = new StringBuilder();
        for (int cn = 1; cn <= numCols; cn++) {
            builder.append(rsmd.getColumnName(cn)).append(",");
        }
        builder.append(";");
        while (rs.next()) {
            for (int i = 1; i <= numCols; i++) {
                builder.append(rs.getString(i)).append(",");
            }
            builder.append(";");

        }
        String allResults = builder.toString();
        return allResults;
    }

}
