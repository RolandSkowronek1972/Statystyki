using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss5r : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "mss1r.aspx";
        public datyDoMSS datyMSS = new datyDoMSS();

        protected void Page_Load(object sender, EventArgs e)
        {
            tablePlaceHolder01.Dispose();
            tablePlaceHolder02.Dispose();
            tablePlaceHolder03.Dispose();
            tablePlaceHolder04.Dispose();
            tablePlaceHolder06.Dispose();
            tablePlaceHolder07.Dispose();
            tablePlaceHolder08.Dispose();
            //     tablePlaceHolder01.Controls.Remove();
            tablePlaceHolder01.Controls.Clear();
            tablePlaceHolder02.Controls.Clear();
            tablePlaceHolder03.Controls.Clear();
            tablePlaceHolder04.Controls.Clear();
            //  tablePlaceHolder05.Controls.Clear();
            tablePlaceHolder06.Controls.Clear();
            tablePlaceHolder07.Controls.Clear();
            tablePlaceHolder08.Controls.Clear();
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
            if (Session["ustawDate5r"] == null)
            {
                Session["ustawDate15o"] = null;
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate5r"] = "X";
            }
            if (!IsPostBack)
            {
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
            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
            }

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            rysuj();
            makeLabels();
        }// end of Page_Load

        protected void rysuj()
        {
            string yyx = (string)Session["id_dzialu"];
            string idWydzialu = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabelaDanych = ms.PustaTabelaDanychMSS();

                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS5r.xml";
                string[] numeryTabel00 = new string[] { "1.1.1",  "1.1.2", "1.1.b", "1.1.d.1", "1.1.d.2" };
                string[] numeryTabel01 = new string[] { "1.1.d.1", "1.1.d.2" };
                string[] numeryTabel02 = new string[] { "1.1.i", "1.1.j" };
                string[] numeryTabel03 = new string[] { "1.1.p" };
                string[] numeryTabel04 = new string[] { "1.1.8", "1.2.1", "1.2.2", "1.3.b", "1.3.1", "2.1.1", "2.1.1.a", "2.1.2", "2.2", "2.2.a", "3", "3.1", "4.1" };
                // string[] numeryTabel04 = new string[] {  };
                string[] numeryTabel05 = new string[] { "8" };
                string[] numeryTabel06 = new string[] { "9.1", "9.1.a", "9.2" };
                string[] numeryTabel07 = new string[] { "11.3" };
                //    string[] numeryTabel05 = new string[] { "7.3" };
                try
                {
                    cm.log.Info(tenPlik + ": Generowanie tabel z xml sekcja tablePlaceHolder01");
                    ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder02, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder03, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel05, tablePlaceHolder06, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel06, tablePlaceHolder07, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel07, tablePlaceHolder08, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + ": Generowanie tabel z xml tablePlaceHolder01" + ex.Message);
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            //Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void odswiez()
        {
            string yyx = (string)Session["id_dzialu"];
            string idWydzialu = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);

                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS5r.xml";
                string[] numeryTabel00 = new string[] { "1.1.1", "1.1.1.a", "1.1.2", "1.1.b", "1.1.d.1", "1.1.d.2" };
                string[] numeryTabel01 = new string[] { "1.1.d.1", "1.1.d.2" };
                string[] numeryTabel02 = new string[] { "1.1.i", "1.1.j" };
                string[] numeryTabel03 = new string[] { "1.1.p" };
                string[] numeryTabel04 = new string[] { "1.1.8", "1.2.1", "1.2.2", "1.3.b", "1.3.1", "2.1.1", "2.1.1.a", "2.1.2", "2.2", "2.2.a", "3", "3.1", "4.1" };
                // string[] numeryTabel04 = new string[] {  };
                string[] numeryTabel05 = new string[] { "8" };
                string[] numeryTabel06 = new string[] { "9.1", "9.1.a", "9.2" };
                string[] numeryTabel07 = new string[] { "11.3" };
                //    string[] numeryTabel05 = new string[] { "7.3" };
                try
                {
                    cm.log.Info(tenPlik + ": Generowanie tabel z xml sekcja tablePlaceHolder01");
                    ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder02, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder03, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel05, tablePlaceHolder06, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel06, tablePlaceHolder07, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel07, tablePlaceHolder08, path, tabela2, idWydzialuNumerycznie, tenPlik);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + ": Generowanie tabel z xml tablePlaceHolder01" + ex.Message);
                }

                try
                {
                    #region "1.1";

                    idTabeli = "'1.1'";
                    pisz("tab_11_", 95, 5, tabela2, "'1.1'", idWydzialu);

                    #endregion "1.1";

                    #region "tabela 1.1.c"

                    idTabeli = "'1.1.c'";

                    //wiersz 1
                    tab_11c_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'", tenPlik);

                    //wiersz 2
                    tab_11c_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'", tenPlik);

                    //wiersz 3
                    tab_11c_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'", tenPlik);

                    //wiersz 4
                    tab_11c_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='1'", tenPlik);

                    //wiersz 5
                    tab_11c_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.c"

                    #region "tabel 1.1.e"

                    //wiersz 1
                    idTabeli = "'1.1.e'";
                    idWiersza = "'1'";
                    tab_11e_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_11e_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "tabel 1.1.e"

                    #region "1.1.f"

                    idTabeli = "'1.1.f'";
                    idWiersza = "'1'";
                    tab_11f_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11f_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    idWiersza = "'2'";
                    tab_11f_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11f_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    idWiersza = "'3'";
                    tab_11f_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11f_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    idWiersza = "'4'";
                    tab_11f_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11f_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    #endregion "1.1.f"

                    #region "1.1.g"

                    idTabeli = "'1.1.g'";
                    idWiersza = "'1'";
                    tab_11g_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.g"

                    #region "1.1.k"

                    idTabeli = "'1.1.k'";
                    idWiersza = "'1'";
                    tab_11k_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11k_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    idWiersza = "'2'";
                    tab_11k_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11k_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    #endregion "1.1.k"

                    #region "1.1.l"

                    idTabeli = "'1.1.l'";
                    idWiersza = "'1'";
                    tab_11l_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.l"

                    #region "1.1.m"

                    idTabeli = "'1.1.m'";
                    idWiersza = "'1'";
                    tab_11m_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_11m_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.m"

                    #region "1.1.n"

                    idTabeli = "'1.1.n'";
                    idWiersza = "'1'";
                    tab_11n_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_11n_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.n"

                    #region "1.1.o"

                    idTabeli = "'1.1.o'";
                    idWiersza = "'1'";
                    tab_11o_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.o"

                    #region "1.1.5"

                    idTabeli = "'1.1.5'";
                    idWiersza = "'1'";
                    tab_115_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_115_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_115_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_115_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_115_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_115_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_115_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_115_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                    #endregion "1.1.5"

                    #region "1.1.6"

                    idTabeli = "'1.1.6'";
                    idWiersza = "'1'";
                    tab_116_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_116_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.6"

                    #region "1.1.7.a"

                    idTabeli = "'1.1.7.a'";
                    idWiersza = "'1'";
                    tab_117a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_117a_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_117a_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                    tab_117a_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);

                    idWiersza = "'2'";
                    tab_117a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                    idWiersza = "'3'";
                    tab_117a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                    idWiersza = "'4'";
                    tab_117a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                    idWiersza = "'5'";
                    tab_117a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_117a_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_117a_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                    tab_117a_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);

                    idWiersza = "'6'";
                    tab_117a_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_117a_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_117a_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_117a_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_117a_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_117a_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_117a_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_117a_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_117a_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_117a_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                    tab_117a_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);

                    #endregion "1.1.7.a"

                    #region "1.1.7.b"

                    idTabeli = "'1.1.7.b'";
                    idWiersza = "'1'";
                    tab_117b_w01_c2.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.7.b"

                    //tab_121_w01_c01

                    idTabeli = "'1.1.a'";
                    idWiersza = "'1'";
                    tab_11a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_11a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #region "4.2"

                    idTabeli = "'4.2'";
                    idWiersza = "'1'";
                    tab_42_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'2'";
                    tab_42_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'3'";
                    tab_42_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'4'";
                    tab_42_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'5'";
                    tab_42_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'6'";
                    tab_42_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'7'";
                    tab_42_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "4.2"

                    #region "4.3"

                    idTabeli = "'4.3'";
                    idWiersza = "'1'";
                    tab_43_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'2'";
                    tab_43_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "4.3"

                    #region "5"

                    idTabeli = "'5'";
                    idWiersza = "'1'";
                    tab_5_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'2'";
                    tab_5_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'3'";
                    tab_5_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'4'";
                    tab_5_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "5"

                    #region "6"

                    idTabeli = "'6'";
                    idWiersza = "'1'";
                    tab_6_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'2'";
                    tab_6_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'3'";
                    tab_6_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'4'";
                    tab_6_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'5'";
                    tab_6_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'6'";
                    tab_6_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'7'";
                    tab_6_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'8'";
                    tab_6_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'9'";
                    tab_6_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'10'";
                    tab_6_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'11'";
                    tab_6_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'12'";
                    tab_6_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'13'";
                    tab_6_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'14'";
                    tab_6_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'15'";
                    tab_6_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'16'";
                    tab_6_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'17'";
                    tab_6_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'18'";
                    tab_6_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'19'";
                    tab_6_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'20'";
                    tab_6_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'21'";
                    tab_6_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'22'";
                    tab_6_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'23'";
                    tab_6_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'24'";
                    tab_6_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'25'";
                    tab_6_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'26'";
                    tab_6_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'27'";
                    tab_6_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'28'";
                    tab_6_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "6"

                    #region "7.1"

                    idTabeli = "'7.1'";
                    idWiersza = "'1'";
                    tab_7_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_7_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_7_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_7_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_7_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_7_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_7_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                    #endregion "7.1"

                    #region "8.a"

                    idTabeli = "'8.a'";
                    idWiersza = "'1'";
                    tab_8a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "8.a"

                    #region "8.b"

                    idTabeli = "'8.b'";
                    idWiersza = "'1'";
                    tab_8b_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "8.b"

                    #region "8.c"

                    idTabeli = "'8.c'";
                    idWiersza = "'1'";
                    tab_8c_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "8.c"

                    #region "10"

                    idTabeli = "'10'";
                    idWiersza = "'1'";
                    tab_10_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'2'";
                    tab_10_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'3'";
                    tab_10_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'4'";
                    tab_10_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'5'";
                    tab_10_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'6'";
                    tab_10_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'7'";
                    tab_10_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'8'";
                    tab_10_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'9'";
                    tab_10_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'10'";
                    tab_10_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'11'";
                    tab_10_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'12'";
                    tab_10_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'13'";
                    tab_10_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'14'";
                    tab_10_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    idWiersza = "'15'";
                    tab_10_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "10"

                    #region "11.1"

                    idTabeli = "'11.1'";
                    idWiersza = "'1'";
                    tab_11_1_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11_1_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_11_1_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_11_1_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                    idWiersza = "'2'";
                    tab_11_1_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11_1_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_11_1_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_11_1_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                    idWiersza = "'3'";
                    tab_11_1_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11_1_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_11_1_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_11_1_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                    idWiersza = "'4'";
                    tab_11_1_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11_1_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_11_1_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_11_1_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                    #endregion "11.1"

                    #region "1.1.2"

                    pisz("tab_112_", 33, 5, tabela2, "'1.1.2'", idWydzialu);

                    #endregion "1.1.2"

                    #region "11.2"

                    pisz("tab_11_2_", 15, 23, tabela2, "'11.2'", idWydzialu);

                    #endregion "11.2"

                    #region "11.1"

                    idTabeli = "'12.1'";
                    idWiersza = "'1'";
                    tab_12_1_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "11.1"

                    #region "12.2"

                    pisz("tab_12_2_", 2, 13, tabela2, "'12.2'", idWydzialu);

                    #endregion "12.2"

                    #region "12.3"

                    pisz("tab_12_3_", 2, 13, tabela2, "'12.3'", idWydzialu);

                    #endregion "12.3"

                    #region "13"

                    idTabeli = "'13'";
                    idWiersza = "'1'";
                    tab_13_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_13_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "13"
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + ": Generowanie tabel z kontrolek " + ex.Message);
                }

                //enf for while
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            //Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

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
                //    Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                id_dzialu.Text = (string)Session["txt_dzialu"];
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
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv

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
                //  DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
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
    }
}