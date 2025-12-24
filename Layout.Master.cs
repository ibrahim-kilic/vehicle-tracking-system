using System;
using System.Web;
using System.Web.UI;

namespace ATS
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Statu"] != null)
            {
                string statu = Session["Statu"].ToString().ToLower();

                if (statu == "cirak")
                {
                    liAracEkle.Visible = false;
                }

                if (statu == "kalfa" || statu == "cirak")
                {
                    liKayitEkle.Visible = false;
                }
            }
        }
    }
}
