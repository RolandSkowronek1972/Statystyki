using System;
using System.Configuration;
using System.Data;

namespace Statystyki_2018
{
    public partial class ocenaPracownika : System.Web.UI.Page
    {

        public wyszukiwarka w1 = new wyszukiwarka();

        public Class1 cl = new Class1();

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //string date = Request.Form[Date1.Text];
            if (!IsPostBack)
            {
                try
                {
                    // file read
                    try
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                    }
                    catch
                    {
                    }
                    string txt = (string)Session["user_id"];
                    if (string.IsNullOrEmpty((txt)))
                    {
                        //Server.Transfer("default.aspx");
                    }
                    else
                    {
                        if (Session["id_dzialu"] == null)
                        {
                            cl.nazwaSadu((string)Session["id_dzialu"]);
                            Session["id_dzialu"] = "1";
                            //Server.Transfer("default.aspx");
                        }
                        //zaladowanie danych pracowników w zależności od wydzialu
                    }
                    //==============
                }
                catch
                {
                    //Server.Transfer("default.aspx");
                }
            }

            ASPxComboBox1.Items.Clear();
            DataTable dT = new DataTable();
            dT = w1.PobierzOpisy("pracownik", "Pracownik");
            //     dT = cl.listaWydzialow();
            foreach (DataRow dR in dT.Rows)
            {
                ASPxComboBox1.Items.Add(dR[0].ToString());
            }

            if (ASPxComboBox1.SelectedIndex == -1)
            {
                ASPxComboBox1.SelectedIndex = 0;
                zapelnijTabeleLudzi();
            }

            if (string.IsNullOrEmpty(data1.Text.Trim()))
            {
                data1.Text = DateTime.Parse(DateTime.Now.Year.ToString() + "-01-01").ToShortDateString();
            }

            if (string.IsNullOrEmpty(data2.Text.Trim()))
            {
                data2.Text = DateTime.Now.ToShortDateString();
            }
        }// end of Page_Load

        protected void zapelnijTabeleLudzi()
        {
            //zmiana wydzialu
            try
            {
                string nazwa = ASPxComboBox1.Text.Trim();
                DataTable ludziki = new DataTable();
                string kwerenda = w1.PobierzDana2(nazwa);
                string connectionString = w1.PobierzConnectionString(nazwa,"ocena pracownika");
                ludziki = w1.PobierzListePracowników(kwerenda, connectionString);
                if (ludziki != null)
                {
                    Session["ludziki"] = ludziki;
                    ASPxComboBox2.Items.Clear();
                    foreach (DataRow dRR in ludziki.Rows)
                    {
                        ASPxComboBox2.Items.Add(dRR[0].ToString());
                    }
                    if ((ASPxComboBox2.Items.Count > 0))
                    {
                        ASPxComboBox2.SelectedIndex = 0;
                    }
                }
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            {
            }
        }

        protected void zapelnijTabeleLudzi2()
        {
            //zmiana wydzialu
            try
            {
                string nazwa = ASPxComboBox1.Text.Trim();
                DataTable ludziki = new DataTable();
                string kwerenda = w1.PobierzDana2(nazwa);
                string connectionString = w1.PobierzConnectionString(nazwa,"ocena pracownika");
                Session["connectionString"] = connectionString;
                ludziki = w1.PobierzListePracowników(kwerenda, connectionString);
                if (ludziki != null)
                {
                    Session["ludziki"] = ludziki;
                    ASPxComboBox2.Items.Clear();
                    foreach (DataRow dRR in ludziki.Rows)
                    {
                        ASPxComboBox2.Items.Add(dRR[0].ToString());
                    }
                }
            }
            catch
            { }
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            zapelnijTabeleLudzi();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            int i = ASPxComboBox1.Items.Count;
            string txt = ASPxComboBox1.Text;
            string ludzik = ASPxComboBox2.Text.Trim();
            DataTable ludziki = new DataTable();
            Label5.Text = "start odczyty danych dla pracownika: " + ludzik + "</br>" + Environment.NewLine;
            try
            {
                ludziki = (DataTable)Session["ludziki"];
                // Presuming the DataTable has a column named Date.
                string expression = "column1 like '%" + ludzik + "%'";
                // string expression = "OrderQuantity = 2 and OrderID = 2";

                // Sort descending by column named CompanyName.

                DataRow[] foundRows;

                // Use the Select method to find all rows matching the filter.
                foundRows = ludziki.Select(expression);
                string idPracownika = string.Empty;
                if (foundRows != null)
                {
                    idPracownika = foundRows[0][1].ToString();
                }
                Label5.Text = Label5.Text + " id pracownika " + ludzik + " : " + idPracownika + "</br>" + Environment.NewLine;
                //wyciądnijdaty pracowników
                DataTable datyPracy = new DataTable();
                string nazwa = ASPxComboBox1.Text.Trim();

                string connectionString = w1.PobierzConnectionString(nazwa, "ocena pracownika");

                Label5.Text = Label5.Text + " Connection string do bazy : " + connectionString + "</br>" + Environment.NewLine;

                DataTable kwerendy = w1.PobierzKwerendy(con_str, "ocena pracownika");

                expression = "idKolumny =1";

                // Use the Select method to find all rows matching the filter.
                foundRows = kwerendy.Select(expression);
                string kwerenda = string.Empty;
                if (foundRows != null)
                {
                    kwerenda = foundRows[0][1].ToString();
                }

                Label5.Text = Label5.Text + " Kwerenda  : " + kwerenda + "</br>" + Environment.NewLine;

                datyPracy = w1.listaDniPracownika(idPracownika, DateTime.Parse(data1.Text.Trim()), DateTime.Parse(data2.Text.Trim()), kwerenda, connectionString);
                DataTable lista = new DataTable();

                Label5.Text = Label5.Text + " Ilośc znalezionych dat  : " + datyPracy.Rows.Count.ToString() + "</br>" + Environment.NewLine;

                lista.Columns.Add("data", typeof(DateTime));
                lista.Columns.Add("Columna 1", typeof(String));
                lista.Columns.Add("Columna 2", typeof(String));
                lista.Columns.Add("Columna 3", typeof(String));
                lista.Columns.Add("Columna 4", typeof(String));
                lista.Columns.Add("Columna 5", typeof(String));
                // cl.listaDniPracownika()
                Label5.Text = Label5.Text + " ==========================================================</br>" + Environment.NewLine;
                Label5.Text = Label5.Text + " ==========================================================</br>" + Environment.NewLine;
                Label5.Text = Label5.Text + " ==========================================================</br>" + Environment.NewLine;
                foreach (DataRow dzien in datyPracy.Rows)
                {
                    //lecimy po dniach
                    string dzionek = dzien[0].ToString().Trim();
                    Label5.Text = Label5.Text + " data: " + dzionek + "</br>" + Environment.NewLine;
                    //  string kwerenda=w1.PobierzPierwszaKwerende
                    string kwerendaR1 = GetValue(kwerendy, "idKolumny =1");
                    Label5.Text = Label5.Text + " Kwerenda koluny 1 : " + kwerendaR1 + "</br>" + Environment.NewLine;
                    string kwerendaR2 = GetValue(kwerendy, "idKolumny =2");
                    Label5.Text = Label5.Text + " Kwerenda koluny 2 : " + kwerendaR2 + "</br>" + Environment.NewLine;
                    string kwerendaR3 = GetValue(kwerendy, "idKolumny =3");
                    Label5.Text = Label5.Text + " Kwerenda koluny 3 : " + kwerendaR3 + "</br>" + Environment.NewLine;
                    string kwerendaR4 = GetValue(kwerendy, "idKolumny =4");
                    Label5.Text = Label5.Text + " Kwerenda koluny 4 : " + kwerendaR4 + "</br>" + Environment.NewLine;
                    string kwerendaR5 = GetValue(kwerendy, "idKolumny =5");
                    Label5.Text = Label5.Text + " Kwerenda koluny 5 : " + kwerendaR5 + "</br>" + Environment.NewLine;
                    DataTable parameters = new DataTable();
                    parameters.Columns.Add("name", typeof(String));
                    parameters.Columns.Add("value", typeof(String));

                    parameters.Rows.Add("@idPracownika", idPracownika);
                    parameters.Rows.Add("@data", dzionek);

                    string val1 = w1.DaneNaDzien(kwerendaR1, connectionString, dzionek, idPracownika);
                    Label5.Text = Label5.Text + " Wartość koluny 1 : " + val1 + "</br>" + Environment.NewLine;
                    string val2 = w1.DaneNaDzien(kwerendaR2, connectionString, dzionek, idPracownika);
                    Label5.Text = Label5.Text + " Wartość koluny 2 : " + val2 + "</br>" + Environment.NewLine;
                    string val3 = w1.DaneNaDzien(kwerendaR3, connectionString, dzionek, idPracownika);
                    Label5.Text = Label5.Text + " Wartość koluny 3 : " + val3 + "</br>" + Environment.NewLine;
                    string val4 = w1.DaneNaDzien(kwerendaR4, connectionString, dzionek, idPracownika);
                    Label5.Text = Label5.Text + " Wartość koluny 4 : " + val4 + "</br>" + Environment.NewLine;
                    string val5 = w1.DaneNaDzien(kwerendaR5, connectionString, dzionek, idPracownika);
                    Label5.Text = Label5.Text + " Wartość koluny 5 : " + val5 + "</br>" + Environment.NewLine;
                    DataRow Raportdzienny = lista.NewRow();
                    Raportdzienny[0] = dzionek;
                    Raportdzienny[1] = val1;
                    Raportdzienny[2] = val2;
                    Raportdzienny[3] = val3;
                    Raportdzienny[4] = val4;
                    Raportdzienny[5] = val5;
                    lista.Rows.Add(Raportdzienny);
                }
                ASPxGridView1.Columns.Clear();
                ASPxGridView1.DataSource = lista;
                Session["danedotabeli"] = lista;
                ASPxGridView1.AutoGenerateColumns = true;

                ASPxGridView1.DataBind();
            }
            catch (Exception ex)
            {
                Label5.Text = Label5.Text + "Komunikat błedu : " + ex + "</br>" + Environment.NewLine;
            }
        }

        protected string GetValue(DataTable dT, string expression)
        {
            string result = string.Empty;
            DataRow[] foundRows;

            // Use the Select method to find all rows matching the filter.
            foundRows = dT.Select(expression);

            if (foundRows.Length > 0)
            {
                result = foundRows[0][1].ToString();
            }

            return result;
        }

        protected void drucz(object sender, EventArgs e)
        {
            ASPxGridView1.DataSource = (DataTable)Session["danedotabeli"];
            ASPxGridView1.AutoGenerateColumns = true;

            ASPxGridView1.DataBind();

            ASPxGridViewExporter1.Landscape = true;

            ASPxGridViewExporter1.WritePdfToResponse("ocena.pdf", false, new DevExpress.XtraPrinting.PdfExportOptions() { ShowPrintDialogOnOpen = true });
        }
    }
}