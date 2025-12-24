using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ATS.Classes
{
    public static class SqlConnectionClass
    {
        private static readonly string Cs =
            ConfigurationManager.ConnectionStrings["ATSConnection"].ConnectionString;

        public static readonly SqlConnection connection = new SqlConnection(Cs);

        public static void CheckConnection()
        {
            if (connection.State == ConnectionState.Broken) connection.Close();
            if (connection.State == ConnectionState.Closed) connection.Open();
        }
    }
}
