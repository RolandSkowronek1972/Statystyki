using System;
using System.Data;
using System.IO;
using System.Web.UI;

namespace Statystyki_2018.UserControlls
{
    public partial class UserControlls_PopupLinkButtom : System.Web.UI.UserControl
    {
        public Class1 cl = new Class1();
        public pdfTables pdfT = new pdfTables();
        public SsrSso ccr = new SsrSso();

        public string info
        {
            set
            {
                HidField.Value = value;

                string[] stringSeparators = new string[] { "#" };
                string[] stTab = null;

                stTab = HidField.Value.Split(stringSeparators, StringSplitOptions.None);
                try
                {
                    string tt = stTab[1].ToString().Trim();
                    string kolumna = stTab[3].ToString().Trim();
                    if ((tt == "1") && (kolumna == "1"))
                    {
                        LinkButton1.Text = stTab[0].ToString();//value to display
                    }
                    LinkButton1.Text = stTab[0].ToString();//value to display
                    HiddenField1.Value = stTab[1].ToString();// id wiersza id sedziego
                    HiddenField2.Value = stTab[2].ToString();
                    HiddenField3.Value = stTab[3].ToString();//id kolumny
                    try
                    {
                        HiddenField4.Value = stTab[4].ToString();
                    }
                    catch
                    {
                    }
                }
                catch
                {
                    LinkButton1.Text = "0";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string id_tabeli = HiddenField2.Value.ToString();
            string id_wiersza = HiddenField1.Value.ToString(); // id sedziego
            string id_Kolumny = HiddenField3.Value.ToString();
            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];
            if (!string.IsNullOrEmpty(id_tabeli))
            {
                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));

                if (HiddenField4.Value.ToString().Trim() == "1")
                {
                    kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), int.Parse(id_wiersza), int.Parse(id_Kolumny), int.Parse(id_tabeli));
                }
                else
                {
                    kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, int.Parse(id_Kolumny), int.Parse(id_tabeli));
                }
                //podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny,int id_tabeli)
            }

            Panel1.Visible = true;
            string id_ = HiddenField1.Value.ToString();

            GridView55.DataSource = null;
            GridView55.DataSourceID = null;

            try
            {
                Session["id_sedziego"] = id_;
            }
            catch
            { }
            string yyx = (string)Session["id_dzialu"];

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, (string)Session["id_sedziego"]);
                GridView55.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView55.AutoGenerateColumns = true;
                GridView55.DataBind();
                px.Visible = true;
                GridView55.Visible = true;
            }
            catch
            {
                GridView55.DataSource = null;
                GridView55.DataSourceID = null;
                GridView55.Visible = false;
            }
            Label21.Text = "";
            if (id_tabeli != "1")
            {
                string txt = cl.wyciagnij_tytul(id_tabeli, id_Kolumny, id_dzialu);
                if (txt == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
                {
                    txt = "";
                }
                Label21.Text = cl.wyciagnij_sedziego((string)Session["id_sedziego"]);
                Label22.Text = txt;
            }
            else
            {
                Label21.Text = cl.wyciagnij_tytul(id_tabeli, id_Kolumny, id_dzialu, id_wiersza);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void LinkButton58_Click(object sender, EventArgs e)
        {
            DataTable dT = new DataTable();
            try
            {
                dT = (DataTable)Session["data_table"];
                MemoryStream msString = pdfT.memoryStr2(dT);
                Response.ContentType = "pdf/application";

                Response.AddHeader("content-disposition", "attachment;filename=Raport.pdf");
                Response.BinaryWrite(msString.ToArray());//
                Response.OutputStream.Write(msString.GetBuffer(), 0, msString.GetBuffer().Length);
                Response.Flush();

                Response.Clear();

                Response.End();
            }
            catch (Exception)
            {
            }
        }

        protected void LinkButton59_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}