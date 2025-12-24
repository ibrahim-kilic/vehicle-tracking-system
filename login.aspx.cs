using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using ATS.Classes;

namespace ATS
{
    public partial class Login : Page
    {
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            var commandlogin = new SqlCommand(
                "SELECT * FROM UserData WHERE Username=@pusername AND UserPassword=@puserpassword",
                SqlConnectionClass.connection);

            SqlConnectionClass.CheckConnection();

            string shaPass = Sha256Converter.ComputeSha256Hash(tboxpassword.Text);
            commandlogin.Parameters.AddWithValue("@pusername", tboxusername.Text);
            commandlogin.Parameters.AddWithValue("@puserpassword", shaPass);

            var dt = new DataTable();
            new SqlDataAdapter(commandlogin).Fill(dt);

            if (dt.Rows.Count > 0)
            {

                string statu = Convert.ToString(dt.Rows[0]["Statu"]);


                Session["Statu"] = (statu ?? "").ToLowerInvariant();

                Response.Redirect("empty.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;

            }
            else
            {

                Response.Write("Kullanıcı Adı veya Şifre Hatalı");
            }
        }
    }
}
