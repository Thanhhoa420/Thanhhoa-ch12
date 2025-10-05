package murach.sql;

import java.sql.*;

public class SQLUtil {

    // Convert ResultSet → HTML Table
    public static String getHtmlTable(ResultSet results)
            throws SQLException {
        StringBuilder htmlTable = new StringBuilder();
        ResultSetMetaData metaData = results.getMetaData();
        int columnCount = metaData.getColumnCount();

        htmlTable.append("<table border='1' style='border-collapse:collapse;width:100%;text-align:center;'>");

        // Header row
        htmlTable.append("<tr style='background-color:#d1c4e9;'>");
        for (int i = 1; i <= columnCount; i++) {
            htmlTable.append("<th>").append(metaData.getColumnName(i)).append("</th>");
        }
        htmlTable.append("</tr>");

        // Data rows
        while (results.next()) {
            htmlTable.append("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                htmlTable.append("<td>").append(results.getString(i)).append("</td>");
            }
            htmlTable.append("</tr>");
        }

        htmlTable.append("</table>");
        return htmlTable.toString();
    }
}
