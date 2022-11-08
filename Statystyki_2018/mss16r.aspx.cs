using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss16r : System.Web.UI.Page
    {
        public static string tenPlik = "mss16r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
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
            if (Session["ustawDate16r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate16r"] = "X";
            }
            Session["data_1"] = datyMSS.DataPoczatkowa();
            Session["data_2"] = datyMSS.DataKoncowa();
            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
            }

            narysuj();
            makeLabels();
        }// end of Page_Load

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
                    else
                    {
                        cm.log.Info("Nie znaleziono kontrolki " + controlName);
                    }
                }
            }
        }// end of pisz

        protected void odswiez()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cm.log.Info("mss16r start");
            string idTabeli = string.Empty;
            string idWiersza = string.Empty;
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            try
            {
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 50);
                cm.log.Info(tenPlik + " Generowanie tabel z XML");
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS16r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1.1", "1.1.1.1" };

                string[] numeryTabel01 = new string[] { "1.1.1.i", "1.1.2" };
                string[] numeryTabel02 = new string[] { "1.2.a", "1.2.b", "1.2.1", "1.2.2", "1.3.a", "1.3.b", "1.3", "1.4.1", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3" };
                string[] numeryTabel04 = new string[] { "13.1", "13.1.a" ,"13.2", "14.1", "14.2", "14.3" };

                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                tablePlaceHolder03.Controls.Clear();
                tablePlaceHolder04.Controls.Clear();

                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();
                tablePlaceHolder04.Dispose();

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);

                //wypełnianie lebeli
                if (tabelaDanych == null)
                {
                    cm.log.Error(tenPlik + " brak danych w tabeli");
                    return;
                }

                try
                {
                    #region "tabela 1.1.1.a"

                    //tab_111a_
                    idTabeli = "'1.1.1.a'";
                    idWiersza = "'1'";
                    tab_111a_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza='1' and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_111a_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza='2' and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.1.a"

                    #region "tabela 1.1.a.1"

                    pisz("tab_111a1_", 1, 6, tabelaDanych, "'1.1.1.a.1'", idWydzialu);

                    #endregion "tabela 1.1.a.1"

                    #region "tabela 1.1.1.a.2"

                    idTabeli = "'1.1.1.a.2'";
                    idWiersza = "'1'";
                    tab_111a2_w01_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.1.a.2"

                    #region "1.1.1.a.1";

                    pisz("tab_111a1_", 1, 6, tabelaDanych, "'1.1.1.a.1'", idWydzialu);

                    #endregion "1.1.1.a.1";

                    #region "tabela 1.1.1.b"

                    idTabeli = "'1.1.1.b'";
                    idWiersza = "'1'";
                    tab_111b_w01_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.1.b"

                    #region "tabela 1.1.1.c"

                    idTabeli = "'1.1.1.c'";
                    idWiersza = "'1'";
                    tab_111c_w01_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.1.c"

                    #region "1.1.1.d";

                    pisz("tab_111d_", 17, 3, tabelaDanych, "'1.1.1.d'", idWydzialu);

                    #endregion "1.1.1.d";

                    #region "1.1.1.e";

                    pisz("tab_111e_", 9, 2, tabelaDanych, "'1.1.1.e'", idWydzialu);

                    #endregion "1.1.1.e";

                    #region "1.1.1.f";

                    idTabeli = "'1.1.1.f'";
                    idWiersza = "'1'";
                    tab_111f_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_111f_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'3'";
                    tab_111f_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'4'";
                    tab_111f_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'5'";
                    tab_111f_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'6'";
                    tab_111f_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.1.f";

                    #region "1.1.1.g";

                    idTabeli = "'1.1.1.g'";
                    idWiersza = "'1'";
                    tab_111g_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'2'";
                    tab_111g_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'3'";
                    tab_111g_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'4'";
                    tab_111g_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'5'";
                    tab_111g_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'6'";
                    tab_111g_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'7'";
                    tab_111g_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'8'";
                    tab_111g_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'9'";
                    tab_111g_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'10'";
                    tab_111g_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w10_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'11'";
                    tab_111g_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w11_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'12'";
                    tab_111g_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w12_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'13'";
                    tab_111g_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111g_w13_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    #endregion "1.1.1.g";

                    #region "1.1.1.g";

                    idTabeli = "'1.1.1.g.1'";
                    idWiersza = "'1'";

                    tab_111g1_w01_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_111g1_w02_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.1.g";

                    #region "tabela 1.1.1.h"

                    idTabeli = "'1.1.1.h'";

                    //wiersz 1
                    tab_111h1_w01_col01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'", tenPlik);

                    #endregion "tabela 1.1.1.h"

                    #region "1.1.2.a";

                    idTabeli = "'1.1.2.a'";
                    idWiersza = "'1'";
                    tab_112a_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112a_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112a_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_112a_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_112a_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_112a_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_112a_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_112a_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                    #endregion "1.1.2.a";

                    #region "'1.1.2.b'";

                    idTabeli = "'1.1.2.b'";
                    idWiersza = "'1'";

                    tab_112b_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_112b_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'3'";
                    tab_112b_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'4'";
                    tab_112b_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'5'";
                    tab_112b_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'6'";
                    tab_112b_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'7'";
                    tab_112b_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'8'";
                    tab_112b_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'9'";
                    tab_112b_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'10'";
                    tab_112b_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'11'";
                    tab_112b_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'12'";
                    tab_112b_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'13'";
                    tab_112b_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'14'";
                    tab_112b_w14_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'15'";
                    tab_112b_w15_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'16'";
                    tab_112b_w16_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'17'";
                    tab_112b_w17_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'18'";
                    tab_112b_w18_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'19'";
                    tab_112b_w19_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'20'";
                    tab_112b_w20_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'21'";
                    tab_112b_w21_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'22'";
                    tab_112b_w22_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'23'";
                    tab_112b_w23_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'24'";
                    tab_112b_w24_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "'1.1.2.b'";

                    #region "1.1.2.c";

                    idTabeli = "'1.1.2.c'";
                    idWiersza = "'1'";
                    tab_112c_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'2'";
                    tab_112c_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'3'";
                    tab_112c_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'4'";
                    tab_112c_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'5'";
                    tab_112c_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'6'";
                    tab_112c_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'7'";
                    tab_112c_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w07_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'8'";
                    tab_112c_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w08_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'9'";
                    tab_112c_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w09_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'10'";
                    tab_112c_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w10_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w10_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'11'";
                    tab_112c_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w11_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w11_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'12'";
                    tab_112c_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w12_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w12_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'13'";
                    tab_112c_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w13_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w13_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'14'";
                    tab_112c_w14_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w14_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w14_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'15'";
                    tab_112c_w15_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w15_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w15_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'16'";
                    tab_112c_w16_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w16_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w16_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'17'";
                    tab_112c_w17_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w17_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w17_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'18'";
                    tab_112c_w18_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w18_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w18_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'19'";
                    tab_112c_w19_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w19_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w19_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'20'";
                    tab_112c_w20_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w20_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w20_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'21'";
                    tab_112c_w21_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w21_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w21_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'22'";
                    tab_112c_w22_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w22_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w22_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'23'";
                    tab_112c_w23_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w23_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w23_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'24'";
                    tab_112c_w24_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w24_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w24_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'25'";
                    tab_112c_w25_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w25_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w25_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'26'";
                    tab_112c_w26_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w26_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w26_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'27'";
                    tab_112c_w27_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w27_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w27_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'28'";
                    tab_112c_w28_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w28_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w28_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'29'";
                    tab_112c_w29_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w29_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w29_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'30'";
                    tab_112c_w30_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w30_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w30_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'31'";
                    tab_112c_w31_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w31_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w31_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'32'";
                    tab_112c_w32_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w32_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w32_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'33'";
                    tab_112c_w33_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w33_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w33_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'34'";
                    tab_112c_w34_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w34_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w34_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'35'";
                    tab_112c_w35_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w35_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w35_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'36'";
                    tab_112c_w36_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w36_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w36_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    idWiersza = "'37'";
                    tab_112c_w37_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_112c_w37_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_112c_w37_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);

                    #endregion "1.1.2.c";

                    #region "1.1.3";

                    pisz("tab_113_", 6, 1, tabelaDanych, "'1.1.3'", idWydzialu);

                    #endregion "1.1.3";

                    #region "1.1.4";

                    pisz("tab_1_1_4_", 3, 1, tabelaDanych, "'1.1.4'", idWydzialu);

                    #endregion "1.1.4";

                    #region "1.1.5";

                    pisz("tab_115_", 3, 1, tabelaDanych, "'1.1.5'", idWydzialu);

                    #endregion "1.1.5";

                    #region "1.1.6";

                    idWiersza = "'1'";
                    pisz("tab_1_1_6_", 9, 1, tabelaDanych, "'1.1.6'", idWydzialu);

                    #endregion "1.1.6";

                    #region "1.1.7.a";

                    pisz("tab_117a_", 5, 15, tabelaDanych, "'1.1.7.a'", idWydzialu);

                    #endregion "1.1.7.a";

                    #region "1.1.7.b";

                    pisz("tab_1_1_7_b_", 7, 12, tabelaDanych, "'1.1.7.b'", idWydzialu);

                    #endregion "1.1.7.b";

                    #region "1.1.7.c";

                    pisz("tab_117c_", 1, 5, tabelaDanych, "'1.1.7.c'", idWydzialu);

                    #endregion "1.1.7.c";

                    #region "1.1.8";

                    idTabeli = "'1.1.8'";
                    idWiersza = "'1'";
                    tab_1_1_1_8_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_1_1_1_8_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'3'";
                    tab_1_1_1_8_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'4'";
                    tab_1_1_1_8_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'5'";
                    tab_1_1_1_8_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'6'";
                    tab_1_1_1_8_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "1.1.8";

                    #region "1.1.9";

                    pisz("tab_1_1_9_", 5, 5, tabelaDanych, "'1.1.9'", idWydzialu);

                    #endregion "1.1.9";

                    #region "1.1.10";

                    pisz("tab_1110_", 4, 3, tabelaDanych, "'1.1.10'", idWydzialu);

                    #endregion "1.1.10";

                    idTabeli = "'4'";
                    idWiersza = "'1'";
                    tab_4_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_4_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #region "5";

                    idTabeli = "'5'";
                    idWiersza = "'1'";
                    tab_5_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'2'";
                    tab_5_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'3'";
                    tab_5_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w03_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w03_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'4'";
                    tab_5_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w04_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w04_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w04_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'5'";
                    tab_5_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w05_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w05_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w05_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'6'";
                    tab_5_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w06_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w06_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w06_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    idWiersza = "'7'";
                    tab_5_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_5_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_5_w07_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_5_w07_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_5_w07_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_5_w07_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                    #endregion "5";

                    #region "6.1.a";

                    idTabeli = "'6.1.a'";
                    idWiersza = "'1'";
                    tab_6_1_a_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'2'";
                    tab_6_1_a_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'3'";
                    tab_6_1_a_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'4'";
                    tab_6_1_a_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'5'";
                    tab_6_1_a_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'6'";
                    tab_6_1_a_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'7'";
                    tab_6_1_a_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'8'";
                    tab_6_1_a_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'9'";
                    tab_6_1_a_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'10'";
                    tab_6_1_a_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'11'";
                    tab_6_1_a_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'12'";
                    tab_6_1_a_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'13'";
                    tab_6_1_a_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'14'";
                    tab_6_1_a_w14_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'15'";
                    tab_6_1_a_w15_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'16'";
                    tab_6_1_a_w16_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'17'";
                    tab_6_1_a_w17_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'18'";
                    tab_6_1_a_w18_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "6.1.a";

                    #region "6.1.b";

                    idTabeli = "'6.1.b'";
                    idWiersza = "'1'";
                    tab_6_1_b_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'2'";
                    tab_6_1_b_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'3'";
                    tab_6_1_b_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'4'";
                    tab_6_1_b_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'5'";
                    tab_6_1_b_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'6'";
                    tab_6_1_b_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'7'";
                    tab_6_1_b_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'8'";
                    tab_6_1_b_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    idWiersza = "'9'";
                    tab_6_1_b_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_1_b_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    #endregion "6.1.b";

                    #region "6.2";

                    idTabeli = "'6.2'";
                    idWiersza = "'1'";
                    tab_6_2_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_2_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_6_2_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_6_2_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_6_2_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    idWiersza = "'2'";
                    tab_6_2_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_2_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_6_2_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_6_2_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_6_2_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    idWiersza = "'3'";
                    tab_6_2_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_2_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_6_2_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_6_2_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_6_2_w03_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    idWiersza = "'4'";
                    tab_6_2_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_2_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_6_2_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_6_2_w04_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_6_2_w04_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    idWiersza = "'5'";
                    tab_6_2_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_6_2_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_6_2_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_6_2_w05_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_6_2_w05_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    idWiersza = "'6'";
                    tab_6_2_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'7'";
                    tab_6_2_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'8'";
                    tab_6_2_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'9'";
                    tab_6_2_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'10'";
                    tab_6_2_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    idWiersza = "'11'";
                    tab_6_2_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion "6.2";

                    #region "7";

                    idTabeli = "'7'";
                    idWiersza = "'1'";
                    tab_7_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_7_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_7_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_7_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_7_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_7_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_7_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_7_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_7_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_7_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);

                    #endregion "7";

                    #region "8";

                    idTabeli = "'8'";
                    idWiersza = "'1'";
                    tab_8_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_8_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_8_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_8_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_8_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_8_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_8_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_8_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_8_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_8_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                    tab_8_w01_c11.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                    tab_8_w01_c12.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);

                    #endregion "8";

                    #region "9";

                    idTabeli = "'9'";
                    idWiersza = "'1'";
                    tab_9_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_9_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_9_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_9_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_9_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_9_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                    #endregion "9";

                    #region "10"

                    //wiersz 1
                    idTabeli = "'10'";
                    idWiersza = "'1'";
                    tab_10_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_10_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                    #endregion "10"

                    #region "tabela 11.1"

                    //wiersz 1
                    idTabeli = "'11.1'";
                    idWiersza = "'1'";
                    tab_111_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_111_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_111_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_111_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_111_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_111_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                    //wiersz 2
                    idWiersza = "'2'";
                    tab_111_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_111_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_111_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_111_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_111_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_111_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_111_w02_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                    #endregion "tabela 11.1"

                    #region "tabel 11.2"

                    //wiersz 1
                    idTabeli = "'11.2'";
                    idWiersza = "'1'";
                    tab_11_2_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_11_2_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_11_2_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_11_2_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_11_2_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_11_2_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_11_2_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                    #endregion "tabel 11.2"

                    #region "12";

                    pisz("tab_12_", 29, 4, tabelaDanych, "'12'", idWydzialu);

                    #endregion "12";

                    #region "tabela 13.2"

                    pisz("tab_13_2_", 4, 6, tabelaDanych, "'13.2'", idWydzialu);

                    #endregion "tabela 13.2"

                    #region 15.1

                    idTabeli = "'15.1'";
                    idWiersza = "'1'";
                    tab_151_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                    #endregion 15.1

                    #region 15.2

                    pisz("tab_152_", 1, 8, tabelaDanych, "'15.2'", idWydzialu);

                    #endregion 15.2

                    #region 15.3

                    idTabeli = "'15.3'";
                    idWiersza = "'1'";
                    tab_153_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                    tab_153_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                    tab_153_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                    tab_153_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                    tab_153_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                    tab_153_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                    tab_153_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                    tab_153_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                    tab_153_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                    tab_153_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                    tab_153_w01_c11.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                    tab_153_w01_c12.Text = dr.wyciagnijWartosc(tabelaDanych, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);

                    #endregion 15.3
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " bład " + ex.Message);
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel z xml " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idWydzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
        }
        protected void narysuj()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cm.log.Info("mss16r start");
            string idTabeli = string.Empty;
            string idWiersza = string.Empty;
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            try
            {

                DataTable tabelaDanych = ms.PustaTabelaDanychMSS();
             
                cm.log.Info(tenPlik + " Generowanie tabel z XML");
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS16r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1.1", "1.1.1.1" };

                string[] numeryTabel01 = new string[] { "1.1.1.i", "1.1.2" };
                string[] numeryTabel02 = new string[] { "1.2.a", "1.2.b", "1.2.1", "1.2.2", "1.3.a", "1.3.b", "1.3", "1.4.1", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3" };
                string[] numeryTabel04 = new string[] { "13.1", "13.1.a", "13.2", "14.1", "14.2", "14.3" };

                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                tablePlaceHolder03.Controls.Clear();
                tablePlaceHolder04.Controls.Clear();

                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();
                tablePlaceHolder04.Dispose();

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);

               

          
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel z xml " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idWydzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
        }
        private DataTable tabelaBocznaDzialu_1_1_3()
        {
            DataTable dT = schematTabeli();
            try
            {
                dT.Clear();
                //nrWiersza,nrKolumny",colspan""rowspan",style",text"
                dT.Rows.Add(new Object[] { 1, 1, 1, 2, "wciecie borderAll", "Umieszczenie w schronisku dla nieletnich" });
                dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania" });
                dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "Nadzór kuratora" });
                dT.Rows.Add(new Object[] { 4, 1, 3, 1, "wciecie borderAll", "umieszczenie  w " });
                dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "zakładzie leczniczym " });
                dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "młodzieżowym ośrodku wychowawczym" });
                dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "domu pomocy społecznej" });
            }
            catch (Exception ex)
            {
                cm.log.Error("tabelaBocznaDzialu_1_1_3 " + ex.Message);
            }

            return dT;
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
                    DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
             //       DataTable tabelaDanych = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
                    var distinctRows = (from DataRow dRow in tabelaDanych.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
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

                    output = ms.raportTXT(listaTabelek, tabelaDanych, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    Response.Flush();
                    Response.End();
                }
            }
            catch
            {
            }
        }

        private DataTable schematTabeli()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("nrWiersza", typeof(int));
            dT.Columns.Add("nrKolumny", typeof(int));
            dT.Columns.Add("colspan", typeof(int));
            dT.Columns.Add("rowspan", typeof(int));
            dT.Columns.Add("style", typeof(string));
            dT.Columns.Add("text", typeof(string));

            return dT;
        }
    }
}