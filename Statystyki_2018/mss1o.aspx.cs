using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss1o : System.Web.UI.Page
    {
        public static string tenPlik = "mss1o.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();
        public dataReaders dr = new dataReaders();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate1o"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate1o"] = "X";
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            odswiez();
        }// end of Page_Load

        protected void odswiez()
        {
           

            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            //id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                tablePlaceHolder.Dispose();
                TablePlaceHolder2.Dispose();
                TablePlaceHolder3.Dispose();
                TablePlaceHolder4.Dispose();
                TablePlaceHolder5.Dispose();

                PlaceHolder1f.Dispose();
                tablePlaceHolder.Controls.Clear();
                TablePlaceHolder2.Controls.Clear();
                TablePlaceHolder3.Controls.Clear();
                TablePlaceHolder4.Controls.Clear();

                TablePlaceHolder5.Controls.Clear();

                TablePlaceHolder8.Controls.Clear();

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 40);
                //wypełnianie lebeli
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS1o.xml";
                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                Label tblControl2 = new Label { ID = "kod02" };
                tblControl2.Width = 1150;
                Label tblControl3 = new Label { ID = "kod03" };
                tblControl3.Width = 1150;
                Label tblControl4 = new Label { ID = "kod04" };
                tblControl4.Width = 1150;
                Label tblControl5 = new Label { ID = "kod05" };
                tblControl5.Width = 1150;
                Label tblControl7 = new Label { ID = "kod07" };
                tblControl7.Width = 1150;
                Label tblControl8 = new Label { ID = "kod08" };
                tblControl8.Width = 1150;
                Label tblControl9 = new Label { ID = "kod09" };
                tblControl9.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.2", tabela2, tenPlik));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Clear();
                tablePlaceHolder.Controls.Add(tblControl);
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.f", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.g", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.h", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.j", tabela2, tenPlik));
                tblControl9.Text = tabelaGlowna.ToString();
                PlaceHolder1f.Controls.Add(tblControl9);

                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.z.z", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.z.z.z", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.2.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.b", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.c", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.4.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.4.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.a.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.1.a", tabela2, tenPlik));

                tblControl2.Text = tabelaGlowna.ToString();

                TablePlaceHolder2.Controls.Add(tblControl2);
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "3", tabela2, tenPlik));
                tblControl3.Text = tabelaGlowna.ToString();

                TablePlaceHolder3.Controls.Add(tblControl3);

                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "8.3", tabela2, tenPlik));
                tblControl4.Text = tabelaGlowna.ToString();
                TablePlaceHolder4.Controls.Add(tblControl4);
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.o.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.o.2", tabela2, tenPlik));
                tblControl5.Text = tabelaGlowna.ToString();
                TablePlaceHolder5.Controls.Add(tblControl5);

                TablePlaceHolder8.Controls.Clear();
                TablePlaceHolder8.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "7.1.a", tabela2, tenPlik) });

                TablePlaceHolder8.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "7.2", tabela2, tenPlik) });
                TablePlaceHolder10.Controls.Clear();
                TablePlaceHolder10.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "10", tabela2, tenPlik) });

                tab_1_1_1_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli='1.1.1.1' and idWiersza ='1' and idkolumny='1'");
                tab_1_1_1_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli='1.1.1.2' and idWiersza ='1' and idkolumny='1'");
                tab_1_1_1_3_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli='1.1.1.3' and idWiersza ='1' and idkolumny='1'");

                #region "1.1.a";

                idTabeli = "'1.1.a'";
                idWiersza = "'1'";
                tab_1_1_a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_a_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_a_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_1_1_a_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_1_1_a_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_1_1_a_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.a";

                #region "1.1.b";

                idTabeli = "'1.1.b'";
                idWiersza = "'1'";
                tab_1_1_b_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_b_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_b_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_1_1_b_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_1_1_b_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_1_1_b_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'7'";
                tab_1_1_b_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'8'";
                tab_1_1_b_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'9'";
                tab_1_1_b_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'10'";
                tab_1_1_b_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'11'";
                tab_1_1_b_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'12'";
                tab_1_1_b_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'13'";
                tab_1_1_b_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'14'";
                tab_1_1_b_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'15'";
                tab_1_1_b_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'16'";
                tab_1_1_b_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.b";

                #region "1.1.c";

                idTabeli = "'1.1.c'";
                idWiersza = "'1'";
                tab_1_1_c_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_c_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'2'";
                tab_1_1_c_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_c_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'3'";
                tab_1_1_c_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.c";

                #region "1.1.d";

                idTabeli = "'1.1.d'";
                idWiersza = "'1'";
                tab_1_1_d_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'2'";
                tab_1_1_d_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_d_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.d";

                #region "1.1.e";

                idTabeli = "'1.1.e'";
                idWiersza = "'1'";
                tab_1_1_e_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_e_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'2'";
                tab_1_1_e_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_e_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_e_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'3'";
                tab_1_1_e_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_e_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_e_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_e_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'4'";
                tab_1_1_e_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.e";

                #region "1.1.i";

                idTabeli = "'1.1.i'";
                idWiersza = "'1'";
                tab_1_1_i_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_i_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_i_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_i_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'2'";
                tab_1_1_i_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_i_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_i_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_i_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'3'";
                tab_1_1_i_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_i_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_i_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_i_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion "1.1.i";

                #region "1.1.j";

                idTabeli = "'1.1.j'";
                idWiersza = "'1'";
                tab_1_1_j_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_j_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_j_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_1_1_j_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_1_1_j_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_1_1_j_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'7'";
                tab_1_1_j_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'8'";
                tab_1_1_j_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'9'";
                tab_1_1_j_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.j";

                #region "1.1.k";

                idTabeli = "'1.1.k'";
                idWiersza = "'1'";
                tab_1_1_k_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_k_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_k_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'2'";
                tab_1_1_k_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_k_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_k_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'3'";
                tab_1_1_k_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_k_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_k_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "1.1.k";

                #region "1.1.l.1";

                idTabeli = "'1.1.l.1'";
                idWiersza = "'1'";
                tab_1_1_l_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'2'";
                tab_1_1_l_1_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'3'";
                tab_1_1_l_1_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'4'";
                tab_1_1_l_1_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'5'";
                tab_1_1_l_1_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'6'";
                tab_1_1_l_1_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'7'";
                tab_1_1_l_1_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'8'";
                tab_1_1_l_1_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'9'";
                tab_1_1_l_1_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'10'";
                tab_1_1_l_1_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'11'";
                tab_1_1_l_1_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'12'";
                tab_1_1_l_1_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'13'";
                tab_1_1_l_1_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'14'";
                tab_1_1_l_1_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'15'";
                tab_1_1_l_1_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'16'";
                tab_1_1_l_1_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'17'";
                tab_1_1_l_1_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'18'";
                tab_1_1_l_1_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_1_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_1_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "1.1.l.1";

                #region "1.1.l.2";

                idTabeli = "'1.1.l.2'";
                idWiersza = "'1'";
                tab_1_1_l_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_2_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_2_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_l_2_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_1_1_l_2_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_1_1_l_2_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_1_1_l_2_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_1_1_l_2_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_1_1_l_2_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_1_1_l_2_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_1_1_l_2_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_1_1_l_2_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                idWiersza = "'2'";
                tab_1_1_l_2_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_2_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_2_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_l_2_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_1_1_l_2_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_1_1_l_2_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_1_1_l_2_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_1_1_l_2_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_1_1_l_2_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_1_1_l_2_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_1_1_l_2_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_1_1_l_2_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                idWiersza = "'3'";
                tab_1_1_l_2_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_l_2_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_l_2_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_l_2_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_1_1_l_2_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_1_1_l_2_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_1_1_l_2_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_1_1_l_2_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_1_1_l_2_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_1_1_l_2_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_1_1_l_2_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_1_1_l_2_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                #endregion "1.1.l.2";

                #region "1.1.m";

                idTabeli = "'1.1.m'";
                idWiersza = "'1'";
                tab_1_1_m_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_m_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_m_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.m";

                idTabeli = "'1.1.n'";
                idWiersza = "'1'";
                tab_1_1_n_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idTabeli = "'1.1.p'";
                idWiersza = "'1'";
                tab_1_1_p_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idTabeli = "'1.1.r'";
                idWiersza = "'1'";
                tab_1_1_r_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #region "1.1.s";

                idTabeli = "'1.1.s'";
                idWiersza = "'1'";
                tab_1_1_s_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_s_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                #endregion "1.1.s";

                #region "1.1.t";

                idTabeli = "'1.1.t'";
                idWiersza = "'1'";
                tab_1_1_t_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_t_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_t_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_t_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'2'";
                tab_1_1_t_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_t_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_t_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_t_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'3'";
                tab_1_1_t_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_t_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_t_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_t_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'4'";
                tab_1_1_t_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_1_1_t_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_1_1_t_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_1_1_t_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion "1.1.t";

                #region "1.1.u";

                idTabeli = "'1.1.u'";
                idWiersza = "'1'";
                tab_1_1_u_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_u_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_u_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.u";

                #region "1.1.v";

                idTabeli = "'1.1.v'";
                idWiersza = "'1'";
                tab_1_1_v_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_v_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_v_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.v";

                #region "1.1.w";

                idTabeli = "'1.1.w'";
                idWiersza = "'1'";
                tab_1_1_w_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_w_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_w_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_1_1_w_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_1_1_w_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.w";

                #region "1.1.y";

                idTabeli = "'1.1.y'";
                idWiersza = "'1'";
                tab_1_1_y_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_1_1_y_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_1_1_y_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_1_1_y_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_1_1_y_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_1_1_y_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'7'";
                tab_1_1_y_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'8'";
                tab_1_1_y_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'9'";
                tab_1_1_y_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'10'";
                tab_1_1_y_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'11'";
                tab_1_1_y_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'12'";
                tab_1_1_y_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'13'";
                tab_1_1_y_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'14'";
                tab_1_1_y_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'15'";
                tab_1_1_y_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'16'";
                tab_1_1_y_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "1.1.y";

                idTabeli = "'1.1.z'";
                idWiersza = "'1'";
                tab_1_1_z_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #region "1.3";

                pisz("tab_1_3_", 10, 10, tabela2, "'1.3'", idWydzialu);

                #endregion "1.3";

                #region "1.2.2";

                pisz("tab_1_2_2_", 43, 41, tabela2, "'1.2.2'", idWydzialu);
                //tab_1_3_w01_c01

                idTabeli = "'1.2.2'";

                #endregion "1.2.2";

                #region "2.3";

                idTabeli = "'2.3'";
                idWiersza = "'1'";
                tab_2_3_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_2_3_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'3'";
                tab_2_3_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'4'";
                tab_2_3_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'5'";
                tab_2_3_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'6'";
                tab_2_3_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'7'";
                tab_2_3_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'8'";
                tab_2_3_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'9'";
                tab_2_3_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "2.3";

                #region "2.3.1";

                idTabeli = "'2.3.1'";
                idWiersza = "'1'";
                tab_2_3_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_2_3_1_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'3'";
                tab_2_3_1_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'4'";
                tab_2_3_1_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'5'";
                tab_2_3_1_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'6'";
                tab_2_3_1_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'7'";
                tab_2_3_1_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'8'";
                tab_2_3_1_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'9'";
                tab_2_3_1_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_2_3_1_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_2_3_1_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_2_3_1_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_2_3_1_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_2_3_1_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_2_3_1_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "2.3.1";

                #region "4.1.a";

                idTabeli = "'4.1.a'";
                idWiersza = "'1'";
                tab_4_1_a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_1_a_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_1_a_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_1_a_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_1_a_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_1_a_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_1_a_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_4_1_a_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_1_a_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_1_a_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_1_a_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_1_a_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_1_a_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_1_a_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "4.1.a";

                #region "4.1.b";

                idTabeli = "'4.1.b'";
                idWiersza = "'1'";
                tab_4_1_b_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_1_b_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_1_b_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_1_b_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_1_b_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_1_b_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_1_b_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_4_1_b_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_1_b_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_1_b_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_1_b_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_1_b_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_1_b_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_1_b_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "4.1.b";

                #region "4.2";

                idTabeli = "'4.2'";
                idWiersza = "'1'";
                tab_4_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_2_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_2_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_2_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_2_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_2_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_2_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_4_2_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_4_2_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_4_2_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_4_2_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_4_2_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_4_2_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_4_2_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "4.2";

                #region "5.1";

                idTabeli = "'5.1'";
                idWiersza = "'1'";
                tab_5_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w01_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'2'";
                tab_5_1_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w02_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'3'";
                tab_5_1_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w03_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'4'";
                tab_5_1_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w04_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w04_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w04_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w04_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'5'";
                tab_5_1_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w05_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w05_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w05_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w05_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w05_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'6'";
                tab_5_1_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w06_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w06_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w06_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w06_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w06_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'7'";
                tab_5_1_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w07_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w07_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w07_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w07_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w07_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'8'";
                tab_5_1_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w08_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w08_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w08_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w08_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w08_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w08_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'9'";
                tab_5_1_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w09_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w09_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w09_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w09_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w09_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w09_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'10'";
                tab_5_1_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w10_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w10_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w10_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w10_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w10_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w10_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'11'";
                tab_5_1_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w11_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w11_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w11_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w11_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w11_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w11_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                idWiersza = "'12'";
                tab_5_1_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_1_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_1_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_1_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_1_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_1_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_1_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_5_1_w12_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_5_1_w12_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_5_1_w12_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_5_1_w12_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_5_1_w12_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_5_1_w12_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                #endregion "5.1";

                #region "5.2";

                idTabeli = "'5.2'";
                idWiersza = "'1'";
                tab_5_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_5_2_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_5_2_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_5_2_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_5_2_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_5_2_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_5_2_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "5.2";

                #region "6";

                idTabeli = "'6'";
                idWiersza = "'1'";
                tab_6_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'2'";
                tab_6_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'3'";
                tab_6_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'4'";
                tab_6_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w04_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'5'";
                tab_6_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w05_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w05_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'6'";
                tab_6_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w06_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w06_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'7'";
                tab_6_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w07_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w07_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'8'";
                tab_6_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w08_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w08_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w08_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'9'";
                tab_6_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w09_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w09_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w09_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'10'";
                tab_6_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w10_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w10_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w10_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'11'";
                tab_6_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w11_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w11_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w11_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'12'";
                tab_6_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w12_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w12_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w12_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'13'";
                tab_6_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w13_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w13_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w13_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w13_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w13_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'14'";
                tab_6_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w14_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w14_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w14_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w14_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w14_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w14_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w14_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'15'";
                tab_6_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w15_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w15_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w15_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w15_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w15_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w15_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w15_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'16'";
                tab_6_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w16_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w16_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w16_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w16_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w16_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w16_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w16_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'17'";
                tab_6_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w17_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w17_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w17_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w17_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w17_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w17_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w17_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'18'";
                tab_6_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w18_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w18_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w18_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w18_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w18_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w18_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w18_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'19'";
                tab_6_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w19_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w19_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w19_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w19_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w19_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w19_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w19_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w19_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w19_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'20'";
                tab_6_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w20_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w20_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w20_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w20_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w20_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w20_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w20_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w20_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w20_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'21'";
                tab_6_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w21_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w21_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w21_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w21_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w21_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w21_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w21_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w21_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w21_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'22'";
                tab_6_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w22_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w22_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w22_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w22_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w22_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w22_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w22_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w22_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w22_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'23'";
                tab_6_w23_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w23_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w23_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w23_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w23_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w23_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w23_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w23_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w23_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w23_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'24'";
                tab_6_w24_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w24_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w24_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w24_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w24_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w24_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w24_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w24_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w24_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w24_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'25'";
                tab_6_w25_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w25_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w25_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w25_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w25_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w25_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w25_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w25_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w25_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w25_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'26'";
                tab_6_w26_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w26_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w26_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w26_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w26_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w26_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w26_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w26_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w26_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w26_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                idWiersza = "'27'";
                tab_6_w27_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w27_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w27_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w27_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w27_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_6_w27_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_6_w27_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_6_w27_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_6_w27_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_6_w27_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");

                #endregion "6";

                #region "7";

                idTabeli = "'7'";
                idWiersza = "'1'";
                tab_7_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'2'";
                tab_7_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'3'";
                tab_7_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'4'";
                tab_7_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'5'";
                tab_7_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'6'";
                tab_7_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'7'";
                tab_7_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'8'";
                tab_7_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'9'";
                tab_7_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'10'";
                tab_7_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'11'";
                tab_7_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'12'";
                tab_7_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'13'";
                tab_7_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w13_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w13_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'14'";
                tab_7_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w14_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w14_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w14_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w14_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                idWiersza = "'15'";
                tab_7_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w15_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w15_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w15_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w15_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "7";

                #region "7.1";

                idTabeli = "'7.1'";
                idWiersza = "'1'";
                tab_71_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_71_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_71_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_71_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_71_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_71_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_71_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_71_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_71_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_71_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_71_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_71_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_71_w01_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                tab_71_w01_c14.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'");
                tab_71_w01_c15.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'");
                tab_71_w01_c16.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'");
                tab_71_w01_c17.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'");
                tab_71_w01_c18.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'");
                tab_71_w01_c19.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'");
                tab_71_w01_c20.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'");
                tab_71_w01_c21.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'");
                tab_71_w01_c22.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'");
                tab_71_w01_c23.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'");
                tab_71_w01_c24.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'");
                tab_71_w01_c25.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'");
                tab_71_w01_c26.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'");
                tab_71_w01_c27.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'");
                tab_71_w01_c28.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'");
                tab_71_w01_c29.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'");
                tab_71_w01_c30.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'");
                tab_71_w01_c31.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'");
                tab_71_w01_c32.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'");
                tab_71_w01_c33.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'");
                tab_71_w01_c34.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'");
                tab_71_w01_c35.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'");
                tab_71_w01_c36.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'");
                tab_71_w01_c37.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'");
                idWiersza = "'2'";
                tab_71_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_71_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_71_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_71_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_71_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_71_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_71_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_71_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_71_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_71_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_71_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_71_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_71_w02_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                tab_71_w02_c14.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'");
                tab_71_w02_c15.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'");
                tab_71_w02_c16.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'");
                tab_71_w02_c17.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'");
                tab_71_w02_c18.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'");
                tab_71_w02_c19.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'");
                tab_71_w02_c20.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'");
                tab_71_w02_c21.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'");
                tab_71_w02_c22.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'");
                tab_71_w02_c23.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'");
                tab_71_w02_c24.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'");
                tab_71_w02_c25.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'");
                tab_71_w02_c26.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'");
                tab_71_w02_c27.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'");
                tab_71_w02_c28.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'");
                tab_71_w02_c29.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'");
                tab_71_w02_c30.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'");
                tab_71_w02_c31.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'");
                tab_71_w02_c32.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'");
                tab_71_w02_c33.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'");
                tab_71_w02_c34.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'");
                tab_71_w02_c35.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'");
                tab_71_w02_c36.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'");
                tab_71_w02_c37.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'");
                idWiersza = "'3'";
                tab_71_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_71_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_71_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_71_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_71_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_71_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_71_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_71_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_71_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_71_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_71_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_71_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_71_w03_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                tab_71_w03_c14.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'");
                tab_71_w03_c15.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'");
                tab_71_w03_c16.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'");
                tab_71_w03_c17.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'");
                tab_71_w03_c18.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'");
                tab_71_w03_c19.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'");
                tab_71_w03_c20.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'");
                tab_71_w03_c21.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'");
                tab_71_w03_c22.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'");
                tab_71_w03_c23.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'");
                tab_71_w03_c24.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'");
                tab_71_w03_c25.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'");
                tab_71_w03_c26.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'");
                tab_71_w03_c27.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'");
                tab_71_w03_c28.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'");
                tab_71_w03_c29.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'");
                tab_71_w03_c30.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'");
                tab_71_w03_c31.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'");
                tab_71_w03_c32.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'");
                tab_71_w03_c33.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'");
                tab_71_w03_c34.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'");
                tab_71_w03_c35.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'");
                tab_71_w03_c36.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'");
                tab_71_w03_c37.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'");

                #endregion "7.1";

                #region "8.1";

                idTabeli = "'8.1'";
                idWiersza = "'1'";
                tab_8_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'2'";
                tab_8_1_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'3'";
                tab_8_1_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'4'";
                tab_8_1_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'5'";
                tab_8_1_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'6'";
                tab_8_1_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                idWiersza = "'7'";
                tab_8_1_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_1_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_1_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_1_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion "8.1";

                #region "8.2";

                idTabeli = "'8.2'";
                idWiersza = "'1'";
                tab_8_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'2'";
                tab_8_2_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'3'";
                tab_8_2_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'4'";
                tab_8_2_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'5'";
                tab_8_2_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'6'";
                tab_8_2_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'7'";
                tab_8_2_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_8_2_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_8_2_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_8_2_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_8_2_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_8_2_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_8_2_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_8_2_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "8.2";

                idTabeli = "'9.1'";
                idWiersza = "'1'";
                tab_9_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #region "9.2";

                idTabeli = "'9.2'";
                idWiersza = "'1'";
                tab_9_2_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_9_2_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_9_2_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_9_2_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_9_2_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_9_2_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_9_2_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_9_2_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "9.2";

                #region "9.3";

                pisz("tab_9_3_", 2, 14, tabela2, "'9.3'", idWydzialu);
                idWiersza = "'1'";

                #endregion "9.3";

                tablePlaceHolder.Dispose();
                TablePlaceHolder2.Dispose();
                TablePlaceHolder3.Dispose();
                TablePlaceHolder4.Dispose();
                TablePlaceHolder5.Dispose();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";

            if (ddT == null)
            {
                return result;
            }
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[4].ToString();
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv
            try
            {
                string idSadu = idSad.Text.Trim();
                string idWydzialu = (string)Session["id_dzialu"];
                try
                {
                    int idWydzialN = int.Parse(idWydzialu);
                    idWydzialu = idWydzialN.ToString("D2");
                }
                catch (Exception)
                {
                    idWydzialu = string.Empty;
                }
                if (!string.IsNullOrEmpty(idWydzialu))
                {
                    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
                    var distinctRows = (from DataRow dRow in tabela2.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
                    DataTable listaTabelek = new DataTable();
                    listaTabelek.Columns.Add("tabela", typeof(string));
                    DataRow rowik = listaTabelek.NewRow();

                    foreach (var tabela in distinctRows)
                    {
                        rowik = listaTabelek.NewRow();
                        rowik[0] = tabela.ToString().Trim();
                        listaTabelek.Rows.Add(rowik);
                    }
                    var output = new StringBuilder();
                    //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    //  Response.WriteFile(idRaportu + ".csv");
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " generowanie pliku .csv " + ex.Message);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    var cos = this.Master.FindControl("ContentPlaceHolder1");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        //string wartosc= dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz
    }
}