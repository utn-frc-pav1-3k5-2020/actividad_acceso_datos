using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class DataManager
{
    private SqlConnection dbConnection;

    private static DataManager instance;

    public DataManager()
    {
        dbConnection = new SqlConnection();
        var string_connection = "Data Source=.\\SQLEXPRESS;Initial Catalog=BugTracker;Integrated Security=True;";
        dbConnection.ConnectionString = string_connection;
    }

    public static DataManager getInstance()
    {
        if (instance == null) instance = new DataManager();
        instance.Open();
        return instance;
    }

    public void Open()
    {
        if(dbConnection.State != ConnectionState.Open)
            dbConnection.Open();
    }

    public void Close()
    {
        if (dbConnection.State != ConnectionState.Closed)
            dbConnection.Close();
    }

    public DataTable ConsultaSQL(string strSql, Dictionary<string, object> prs = null)
    {
        SqlCommand cmd = new SqlCommand();
        DataTable table = new DataTable();

        try
        {
            cmd.Connection = dbConnection;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;

            if(prs != null)
            {
                foreach (var item in prs)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
            }

            table.Load(cmd.ExecuteReader());
            return table;
        }
        catch(Exception ex)
        {
            throw (ex);
        }
    }

    public int EjecutarSQL(string strSql, Dictionary<string, object> prs = null)
    {
        SqlCommand cmd = new SqlCommand();
        int rtdo = 0;

        try
        {
            cmd.Connection = dbConnection;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;

            if(prs != null)
            {
                foreach(var item in prs)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
            }

            rtdo = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        return rtdo;
    }

    public object ConsultaSQLScalar(string strSql)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = dbConnection;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;
            return cmd.ExecuteScalar();
        }
        catch(Exception ex)
        {
            throw (ex);
        }
    }
}
