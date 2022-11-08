using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Statystyki_2018
{
    public partial class mss11r : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();

        private const string tenPlik = "mss11r";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (!IsPostBack)
            {
                try
                {
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch

                {
                    //  Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate11r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate11r"] = "X";
            }
            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
            }

            Session["data_1"] = datyMSS.DataPoczatkowa();
            Session["data_2"] = datyMSS.DataKoncowa();
            rysuj();
            makeLabels();
        }// end of Page_Load

        protected void rysuj()
        {
            string id_dzialu = (string)Session["id_dzialu"];
            Id_dzialu.Text = (string)Session["txt_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.PustaTabelaDanychMSS();
                //wypełnianie lebeli
                tablePlaceHolder01.Controls.Clear();

                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS11r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1.1", "1.1.1.1", "1.1.1.a", "1.1.1.b", "1.1.1.c", "1.1.2", "1.1.1.2" };
                string[] numeryTabel01 = new string[] { "1.1.2.h" };
                string[] numeryTabel02 = new string[] { "1.2.a.1", "1.2.a.2", "1.2.a", "1.2.1", "1.2.2", "1.3", "1.4", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3", "4.1", "4.2", "5.1", "5.2" };

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabela2, idWydzialuNumerycznie, tenPlik);

                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void odswiez()
        {
            string id_dzialu = (string)Session["id_dzialu"];
            Id_dzialu.Text = (string)Session["txt_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 60);
                //wypełnianie lebeli
                tablePlaceHolder01.Controls.Clear();

                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS11r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1.1", "1.1.1.1", "1.1.1.a", "1.1.1.b", "1.1.1.c", "1.1.2", "1.1.1.2" };
                string[] numeryTabel01 = new string[] { "1.1.2.h" };

                string[] numeryTabel02 = new string[] { "1.2.a.1", "1.2.a.2", "1.2.a", "1.2.1", "1.2.2", "1.3", "1.4", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3", "4.1", "4.2", "5.1", "5.2" };

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabela2, idWydzialuNumerycznie, tenPlik);

                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();

                #region "tabela 1 - 1.1.2.a"

                idTabeli = "'1.1.2.a'";
                tab_112a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.2.a"

                #region "tabela 1 - 1.1.2.b"

                idTabeli = "'1.1.2.b'";
                tab_112b_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.2.b"

                #region "tabela 1 - 1.1.2.c"

                idTabeli = "'1.1.2.c'";
                tab_112c_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");
                tab_112c_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'");
                tab_112c_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'");
                tab_112c_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='2'");
                tab_112c_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='2'");
                tab_112c_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='2'");

                #endregion "tabela 1 - 1.1.2.c"

                #region "tabela 1 - 1.1.2.d"

                idTabeli = "'1.1.2.d'";
                tab_112d_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");
                tab_112d_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'");
                tab_112d_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'");
                tab_112d_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='1'");
                tab_112d_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='1'");
                tab_112d_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='6' and idkolumny='1'");
                tab_112d_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='7' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.2.d"

                #region "tabela 1 - 1.1.2.e"

                idTabeli = "'1.1.2.e'";
                tab_112e_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");
                tab_112e_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'");
                tab_112e_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'");
                tab_112e_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='1'");
                tab_112e_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='1'");
                tab_112e_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='6' and idkolumny='1'");
                tab_112e_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='7' and idkolumny='1'");
                tab_112e_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='8' and idkolumny='1'");
                tab_112e_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='9' and idkolumny='1'");
                tab_112e_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='10' and idkolumny='1'");
                tab_112e_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='11' and idkolumny='1'");
                tab_112e_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='12' and idkolumny='1'");
                tab_112e_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='13' and idkolumny='1'");
                tab_112e_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='2'");
                tab_112e_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='2'");
                tab_112e_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='2'");
                tab_112e_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='2'");
                tab_112e_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='2'");

                #endregion "tabela 1 - 1.1.2.e"

                #region "tabela 1 - 1.1.2.f"

                idTabeli = "'1.1.2.f'";
                tab_112f_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.2.f"

                #region "tabela 1 - 1.1.2.g"

                idTabeli = "'1.1.2.g'";
                tab_112g_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");
                tab_112g_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'");
                tab_112g_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'");
                tab_112g_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='1'");
                tab_112g_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.2.g"

                #region "tabela 6"

                idTabeli = "'6'";
                idWiersza = "'1'";
                //wiersz 1
                tab_6_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'2'";
                //wiersz 2
                tab_6_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'3'";
                //wiersz 2
                tab_6_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 4
                idWiersza = "'4'";

                tab_6_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 5
                idWiersza = "'5'";

                tab_6_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_6_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 6
                idWiersza = "'6'";

                tab_6_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 7
                idWiersza = "'7'";

                tab_6_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_6_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 8

                idWiersza = "'8'";

                tab_6_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                //wiersz 9
                idWiersza = "'9'";

                tab_6_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 10
                idWiersza = "'10'";

                tab_6_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_6_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                //wiersz 11
                idWiersza = "'11'";

                tab_6_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'12'";
                //wiersz 12

                tab_6_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_6_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'13'";
                //wiersz 13

                tab_6_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 14
                idWiersza = "'14'";

                tab_6_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w14_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w14_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 15
                idWiersza = "'15'";

                tab_6_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w15_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w15_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 16
                idWiersza = "'16'";

                tab_6_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w16_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w16_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 17
                idWiersza = "'17'";

                tab_6_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w17_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w17_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 18

                idWiersza = "'18'";

                tab_6_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_6_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w18_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w18_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                //wiersz 19
                idWiersza = "'19'";

                tab_6_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w19_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w19_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w19_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w19_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'20'";

                tab_6_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w20_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w20_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w20_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w20_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'21'";

                tab_6_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w21_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w21_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w21_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w21_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'22'";
                //wiersz 22
                tab_6_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w22_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w22_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w22_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w22_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w22_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                idWiersza = "'23'";
                //wiersz 23
                tab_6_w23_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_6_w23_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_6_w23_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_6_w23_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_6_w23_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");

                #endregion "tabela 6"

                #region "tabela 7"

                idTabeli = "'7'";
                idWiersza = "'1'";
                //wiersz 1
                tab_7_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                idWiersza = "'2'";
                //wiersz 2
                tab_7_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                idWiersza = "'3'";
                //wiersz 3
                tab_7_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 4
                idWiersza = "'4'";

                tab_7_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 5
                idWiersza = "'5'";

                tab_7_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 6
                idWiersza = "'6'";

                tab_7_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 7
                idWiersza = "'7'";

                tab_7_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 8

                idWiersza = "'8'";

                tab_7_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 9
                idWiersza = "'9'";
                tab_7_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 10
                idWiersza = "'10'";
                tab_7_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 11
                idWiersza = "'11'";

                tab_7_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                idWiersza = "'12'";
                //wiersz 12
                tab_7_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_7_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                idWiersza = "'13'";
                //wiersz 13
                tab_7_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_7_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w13_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w13_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                //wiersz 14
                idWiersza = "'14'";

                tab_7_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                tab_7_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                tab_7_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_7_w14_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_7_w14_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_7_w14_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_7_w14_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "tabela 7"

                #region "tabela 9.1"

                idTabeli = "'9.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_91_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_91_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_91_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_91_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'2'";
                //wiersz 2
                tab_91_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_91_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_91_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_91_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'3'";
                //wiersz 3
                tab_91_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_91_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_91_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_91_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion "tabela 9.1"

                #region "tabela 9.2"

                idTabeli = "'9.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_92_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_92_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_92_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_92_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_92_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_92_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_92_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_92_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'2'";
                //wiersz 2
                tab_92_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_92_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_92_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_92_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_92_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_92_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_92_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_92_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                idWiersza = "'3'";
                //wiersz 3
                tab_92_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_92_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_92_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_92_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_92_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_92_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_92_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_92_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabela 9.2"

                #region "tabela 9.3"

                idTabeli = "'9.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_93_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_93_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_93_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_93_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_93_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_93_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_93_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_93_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_93_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_93_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_93_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_93_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'2'";
                //wiersz 2
                tab_93_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_93_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_93_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_93_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_93_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_93_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_93_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_93_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                tab_93_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_93_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_93_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_93_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                idWiersza = "'3'";
                //wiersz 3
                tab_93_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_93_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_93_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_93_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_93_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_93_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_93_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_93_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                tab_93_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_93_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_93_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_93_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                #endregion "tabela 9.3"

                #region "tabela 10.1"

                idTabeli = "'10.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_101_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "tabela 10.1"

                #region "tabela 10.2"

                idTabeli = "'10.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_102_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_102_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_102_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_102_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_102_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_102_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_102_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_102_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabela 10.2"

                #region "tabela 10.3"

                idTabeli = "'10.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_103_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_103_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_103_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_103_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_103_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_103_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_103_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_103_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_103_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_103_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_103_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_103_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + id_dzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                #endregion "tabela 10.3"
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void makeLabels()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                Id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    //        tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    //    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    //  tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    //       tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za okres od " + Date1.Text + " do  " + Date2.Text;
                    //     tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    //tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;

                    //tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() > 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[4].ToString();
                }
            }
            catch
            { }
            return result;
        }//end of wyciagnijWartosc

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
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                    //    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
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
            catch
            {
            }
        }
    }
}