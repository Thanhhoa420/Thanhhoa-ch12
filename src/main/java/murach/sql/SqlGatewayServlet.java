package murach.sql;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SqlGatewayServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String sqlStatement = request.getParameter("sqlStatement");
        String sqlResult = "";

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // ===== Render PostgreSQL info =====
            String dbURL = "jdbc:postgresql://dpg-d3h4rnogjchc73a7d3h0-a.oregon-postgres.render.com:5432/sqlgateway_hoa_db?sslmode=require";
            String username = "sqlgateway_hoa_db_user";
            String password = "z3Yb3QsIhv3Q68Ld5IkXof1tTa5R5vfs";
            // ===================================

            // Connect to Render PostgreSQL
            Connection connection = DriverManager.getConnection(dbURL, username, password);
            Statement statement = connection.createStatement();

            sqlStatement = sqlStatement.trim();
            if (sqlStatement.length() >= 6) {
                String sqlType = sqlStatement.substring(0, 6).toLowerCase();

                if (sqlType.startsWith("select")) {
                    ResultSet resultSet = statement.executeQuery(sqlStatement);
                    sqlResult = SQLUtil.getHtmlTable(resultSet);
                    resultSet.close();
                } else {
                    int count = statement.executeUpdate(sqlStatement);
                    sqlResult = (count == 0)
                            ? "<p>The statement executed successfully.</p>"
                            : "<p>The statement executed successfully.<br>" + count + " row(s) affected.</p>";
                }
            }

            statement.close();
            connection.close();

        } catch (ClassNotFoundException e) {
            sqlResult = "<p style='color:red;'>Error loading database driver:<br>" + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p style='color:red;'>Error executing the SQL statement:<br>" + e.getMessage() + "</p>";
        }

        HttpSession session = request.getSession();
        session.setAttribute("sqlResult", sqlResult);
        session.setAttribute("sqlStatement", sqlStatement);

        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
