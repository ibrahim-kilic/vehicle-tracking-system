using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ATS.Classes;

namespace ATS
{
    public partial class VehicleRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlCommand commandListBrands = new SqlCommand("SELECT * FROM MarkaTable", SqlConnectionClass.connection);

                SqlConnectionClass.CheckConnection();

                SqlDataReader dr = commandListBrands.ExecuteReader();

                combobox.DataTextField = "MarkaAdi";
                combobox.DataValueField = "MID";
                combobox.DataSource = dr;
                combobox.DataBind();

                dr.Close();
            }
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            SqlCommand commandAdd = new SqlCommand(
                "INSERT INTO ArabaTable (ArabaModeli, MarkaID, ArabaPlakasi, ArabaYakitTipi, ArabaAciklama, SahipTel, SahipIsim) " +
                "VALUES (@pmodel, @pmarka, @pplaka, @pyakit, @paciklama, @ptel, @pisim)",
                SqlConnectionClass.connection);

            SqlConnectionClass.CheckConnection();

            commandAdd.Parameters.AddWithValue("@pmarka", Convert.ToInt32(combobox.SelectedValue));
            commandAdd.Parameters.AddWithValue("@pmodel", tboxmodel.Text);
            commandAdd.Parameters.AddWithValue("@pplaka", tboxplaka.Text);
            commandAdd.Parameters.AddWithValue("@pyakit", tboxyakit.Text);
            commandAdd.Parameters.AddWithValue("@paciklama", tboxaciklama.Text);
            commandAdd.Parameters.AddWithValue("@pisim", tboxisim.Text);
            commandAdd.Parameters.AddWithValue("@ptel", tboxtel.Text);

            commandAdd.ExecuteNonQuery();
        }
    }
}
