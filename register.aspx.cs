using System;
using System.Data;
using System.Data.SqlClient;
using ATS.Classes;

namespace ATS
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            string username = tboxusername.Text;
            string password = tboxpassword.Text;

            string shaPass = Sha256Converter.ComputeSha256Hash(password);
            string statuValue = statu.SelectedValue;

            SqlCommand commandregister = new SqlCommand(
                "INSERT INTO UserData (Username, UserPassword, Statu) VALUES (@pusername, @puserpassword, @pstatu)",
                SqlConnectionClass.connection);

            commandregister.Parameters.AddWithValue("@pusername", username);
            commandregister.Parameters.AddWithValue("@puserpassword", shaPass);
            commandregister.Parameters.AddWithValue("@pstatu", statuValue);

            try
            {
                SqlConnectionClass.CheckConnection();
                int rowsAffected = commandregister.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Kayıt başarıyla eklendi!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Kayıt eklenmedi.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Kayıt eklenirken bir hata oluştu: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
