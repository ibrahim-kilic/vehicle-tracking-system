using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using ATS.Classes;

namespace ATS
{
    public partial class StockTracking : System.Web.UI.Page
    {
        private bool IsCirak =>
            (Session["Statu"] + "").Equals("cirak", StringComparison.OrdinalIgnoreCase);

        protected void Page_Load(object sender, EventArgs e)
        {
            ApplyRolePermissions();

            if (!IsPostBack)
            {
                ListParts();
                FillPartsDropdown();
            }
        }

        private void ApplyRolePermissions()
        {
            if (IsCirak)
            {
                btnYeniParca.Visible = false;
                panelParcaEkle.Visible = false;
                panelHareket.Visible = false;
            }
        }

        protected void btnYeniParca_Click(object sender, EventArgs e)
        {
            if (IsCirak) return;
            panelParcaEkle.Visible = !panelParcaEkle.Visible;
        }

        private void FillPartsDropdown()
        {
            SqlConnectionClass.CheckConnection();
            using (SqlCommand command = new SqlCommand("SELECT ParcaID, ParcaAdi FROM Parcalar", SqlConnectionClass.connection))
            using (SqlDataReader dr = command.ExecuteReader())
            {
                ddlParcalar.DataSource = dr;
                ddlParcalar.DataTextField = "ParcaAdi";
                ddlParcalar.DataValueField = "ParcaID";
                ddlParcalar.DataBind();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (IsCirak) return;

            SqlConnectionClass.CheckConnection();

            using (SqlCommand command = new SqlCommand(
                "INSERT INTO Parcalar (ParcaAdi, Marka, Miktar, Fiyat) VALUES (@adi, @marka, @miktar, @fiyat)",
                SqlConnectionClass.connection))
            {
                command.Parameters.AddWithValue("@adi", txtParcaAdi.Text);
                command.Parameters.AddWithValue("@marka", txtMarka.Text);
                command.Parameters.AddWithValue("@miktar", txtMiktar.Text);
                command.Parameters.AddWithValue("@fiyat", txtFiyat.Text);
                command.ExecuteNonQuery();
            }

            ListParts();
            FillPartsDropdown();
            panelParcaEkle.Visible = false;
        }

        private void ListParts()
        {
            SqlConnectionClass.CheckConnection();

            string query = @"
                SELECT p.ParcaID, p.ParcaAdi, p.Marka, p.Fiyat,
                (
                    ISNULL((SELECT SUM(miktar) FROM ParcaHareketleri WHERE parcaId = p.ParcaID AND type = 'Giris'), 0)
                    -
                    ISNULL((SELECT SUM(miktar) FROM ParcaHareketleri WHERE parcaId = p.ParcaID AND type = 'Cikis'), 0)
                ) AS StokDurumu
                FROM Parcalar p";

            using (SqlCommand command = new SqlCommand(query, SqlConnectionClass.connection))
            using (SqlDataAdapter da = new SqlDataAdapter(command))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvParcalar.DataSource = dt;
                gvParcalar.DataBind();
            }
        }


        protected void gvParcalar_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (!IsCirak) return;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var btnSil = e.Row.FindControl("btnSil") as Button;
                if (btnSil != null) btnSil.Visible = false;
            }
        }

        protected void gvParcalar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                if (IsCirak) return;

                int parcaID = Convert.ToInt32(e.CommandArgument);
                SqlConnectionClass.CheckConnection();

                using (SqlCommand command = new SqlCommand("DELETE FROM Parcalar WHERE ParcaID = @id", SqlConnectionClass.connection))
                {
                    command.Parameters.AddWithValue("@id", parcaID);
                    command.ExecuteNonQuery();
                }

                ListParts();
                FillPartsDropdown();
            }
        }

        protected void btnHareketEkle_Click(object sender, EventArgs e)
        {
            if (IsCirak) return;

            SqlConnectionClass.CheckConnection();

            using (SqlCommand command = new SqlCommand(
                "INSERT INTO ParcaHareketleri (parcaId, miktar, type, tarih) VALUES (@parcaId, @miktar, @type, @tarih)",
                SqlConnectionClass.connection))
            {
                command.Parameters.AddWithValue("@parcaId", ddlParcalar.SelectedValue);
                command.Parameters.AddWithValue("@miktar", txtHareketMiktar.Text);
                command.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                command.Parameters.AddWithValue("@tarih", DateTime.Now);
                command.ExecuteNonQuery();
            }

            lblHareketMesaj.Text = "Parça hareketi başarıyla eklendi.";
            lblHareketMesaj.Visible = true;

            txtHareketMiktar.Text = string.Empty;
            ddlParcalar.ClearSelection();
            ddlType.ClearSelection();

            ListParts();
        }
    }
}
