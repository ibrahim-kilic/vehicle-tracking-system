using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ATS.Classes;

namespace ATS
{
    public partial class Vehicles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            SqlCommand commandList = new SqlCommand(
                "SELECT ID, ArabaModeli, MarkaID, ArabaPlakasi, ArabaYakitTipi, ArabaAciklama, SahipTel, SahipIsim, MID, MarkaAdi " +
                "FROM ArabaTable INNER JOIN MarkaTable ON ArabaTable.MarkaID = MarkaTable.MID",
                SqlConnectionClass.connection);

            SqlConnectionClass.CheckConnection();

            SqlDataReader dr = commandList.ExecuteReader();

            DataList1.DataSource = dr;
            DataList1.DataBind();

            dr.Close();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button deleteButton = (Button)e.Item.FindControl("DeleteButton");

                if (Session["Statu"] != null && Session["Statu"].ToString().ToLower() == "cirak")
                {
                    if (deleteButton != null)
                    {
                        deleteButton.Visible = false;
                    }
                }
            }
        }

        protected void DeleteButton_Command(object sender, CommandEventArgs e)
        {
            int carId = Convert.ToInt32(e.CommandArgument);

            SqlConnectionClass.CheckConnection();

            SqlCommand deleteCommand = new SqlCommand("DELETE FROM ArabaTable WHERE ID = @ID", SqlConnectionClass.connection);
            deleteCommand.Parameters.AddWithValue("@ID", carId);

            try
            {
                deleteCommand.ExecuteNonQuery();
                LoadData();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Bir hata oluştu: {ex.Message}');</script>");
            }
        }
    }
}
