using System;

namespace Statystyki_2018
{
    public partial class kof : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            string kofKonfig = "0";
            kofKonfig = cm.odczytajWartosc("Kof01");
            if (Session["konfig"] == null)
            {
                Session["konfig"] = 1;
                switch (kofKonfig)
                {
                    case "1":
                        {
                            DropDownList1.SelectedIndex = 0;
                        }

                        break;

                    default:
                        {
                            DropDownList1.SelectedIndex = 1;
                        }
                        break;
                }
            }
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string numer = e.NewValues["numer_of"].ToString();
            string id_sprawy = e.Keys[0].ToString();
            ms.kofUpdate(id_sprawy, numer);
        }

        protected void hideAll()
        {
            edytowalny.Visible = false;
            wszystko.Visible = false;
            wypełniony.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hideAll();
            switch (DropDownList1.SelectedValue.ToString().Trim())
            {
                case "1":
                    {
                        wszystko.Visible = true;
                    }
                    break;

                case "2":
                    {
                        wypełniony.Visible = true;
                    }
                    break;

                case "3":
                    {
                        edytowalny.Visible = true;
                    }
                    break;

                default:
                    break;
            }
        }

        protected void importujDaneKOF(object sender, EventArgs e)
        {
            //wczytanie danych KOF
            string log = ms.uzupelnijDaneDoKOF();
            //cm.log.Info("KOF " + log);
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();
            LogLabel.Text = log;
        }
    }
}