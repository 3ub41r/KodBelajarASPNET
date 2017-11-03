using System.Configuration;
using System.Data.SqlClient;

namespace ePMO
{
    public static class ConnectionFactory
    {
        public static SqlConnection GetConnection()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ePMO"].ToString();
            return new SqlConnection(connectionString);
        }
    }
}