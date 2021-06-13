using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Statystyki_2018
{
    public partial class mss19o : System.Web.UI.Page
    {
        private const string tenPlik = "mss19o.aspx";
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public mss ms = new mss();
        public datyDoMSS datyMSS = new datyDoMSS();

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
            //  this.Controls.Clear();
            //  this.Controls.Add (new Content )
            tablePlaceHolder01.Controls.Clear();
            tablePlaceHolder02.Controls.Clear();
            tablePlaceHolder03.Controls.Clear();
            tablePlaceHolder04.Controls.Clear();
            tablePlaceHolder05.Controls.Clear();
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
            if (Session["ustawDate19o"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate19o"] = "X";
            }
            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
            }

            // Session["data_1"] = datyMSS.DataPoczatkowa();
            // Session["data_2"] = datyMSS.DataKoncowa();

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();

            odswiez();
        }// end of Page_Load

        protected void odswiez()
        {
            string path = Server.MapPath("XMLHeaders") + "\\" + "MSS19o.xml";
            string idTabeli = string.Empty;
            string idWiersza = string.Empty;
            string idWydzialu = (string)Session["id_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            DataTable tabelaDanychMSS = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
            //wypełnianie lebeli
            this.ClearChildControlState();
            this.Context.Items.Clear();
            tablePlaceHolder01.Dispose();
            tablePlaceHolder02.Dispose();
            tablePlaceHolder03.Dispose();
            tablePlaceHolder04.Dispose();
            tablePlaceHolder05.Dispose();
            
            tablePlaceHolder01.Controls.Clear();

            tablePlaceHolder02.Controls.Clear();
            tablePlaceHolder03.Controls.Clear();
            tablePlaceHolder04.Controls.Clear();
            tablePlaceHolder05.Controls.Clear();

            string[] numeryTabel00 = new string[] { "1", "1.1.1", "1.1.1.a", "1.1.2", "1.1.a", "1.1.b", "1.1.c", "1.1.e", "1.1.f" };
            string[] numeryTabel01 = new string[] { "1.1.h.1", "1.1.h.2", "1.1.i", "1.1.j" };
            string[] numeryTabel02 = new string[] { "1.1.l", "1.1.3", "1.2.1", "1.2.2", "1.3.a", "1.3.b", "1.3.c", "1.3.1", "1.4.1", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3","4.1.a" };

            string[] numeryTabel04 = new string[] { "6.a.1","6.2" };
            string[] numeryTabel05 = new string[] { "7.2", "7.3" };
            ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanychMSS, idWydzialuNumerycznie, tenPlik);

            ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanychMSS, idWydzialuNumerycznie, tenPlik);

            ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanychMSS, idWydzialuNumerycznie, tenPlik);
            ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabelaDanychMSS, idWydzialuNumerycznie, tenPlik);
            ms.TworzTabelizListy(numeryTabel05, tablePlaceHolder05, path, tabelaDanychMSS, idWydzialuNumerycznie, tenPlik);

        

      

            #region "1.1.g";

            idTabeli = "'1.1.g'";
            idWiersza = "'1'";
            tab_1_1_g_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'2'";
            tab_1_1_g_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'3'";
            tab_1_1_g_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'4'";
            tab_1_1_g_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'5'";
            tab_1_1_g_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'6'";
            tab_1_1_g_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'7'";
            tab_1_1_g_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w07_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'8'";
            tab_1_1_g_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w08_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'9'";
            tab_1_1_g_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w09_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'10'";
            tab_1_1_g_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w10_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w10_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'11'";
            tab_1_1_g_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w11_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w11_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'12'";
            tab_1_1_g_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w12_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w12_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'13'";
            tab_1_1_g_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w13_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w13_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'14'";
            tab_1_1_g_w14_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w14_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w14_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'15'";
            tab_1_1_g_w15_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w15_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w15_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'16'";
            tab_1_1_g_w16_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w16_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w16_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'17'";
            tab_1_1_g_w17_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w17_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w17_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            idWiersza = "'18'";
            tab_1_1_g_w18_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_1_1_g_w18_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_1_1_g_w18_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);

            #endregion "1.1.g";

            #region "1.1.k";

            idTabeli = "'1.1.k'";
            idWiersza = "'1'";
            tab_1_1_k_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

            #endregion "1.1.k";
         

            #region "4.1.b";

            idTabeli = "'4.1.b'";
            idWiersza = "'1'";
            tab_4_1_b_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_4_1_b_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_4_1_b_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_4_1_b_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_4_1_b_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_4_1_b_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_4_1_b_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'2'";
            tab_4_1_b_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_4_1_b_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_4_1_b_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_4_1_b_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_4_1_b_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_4_1_b_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_4_1_b_w02_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

            #endregion "4.1.b";

            #region "4.2";

            idTabeli = "'4.2'";
            idWiersza = "'1'";
            tab_4_2_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_4_2_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_4_2_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_4_2_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_4_2_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_4_2_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            idWiersza = "'2'";
            tab_4_2_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_4_2_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_4_2_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_4_2_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_4_2_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_4_2_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

            #endregion "4.2";

            #region "5.1";

            idTabeli = "'5.1'";
            idWiersza = "'1'";
            tab_5_1_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w01_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w01_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w01_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'2'";
            tab_5_1_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w02_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w02_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w02_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w02_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w02_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w02_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w02_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'3'";
            tab_5_1_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w03_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w03_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w03_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w03_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w03_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w03_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w03_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w03_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w03_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'4'";
            tab_5_1_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w04_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w04_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w04_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w04_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w04_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w04_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w04_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w04_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w04_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w04_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'5'";
            tab_5_1_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w05_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w05_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w05_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w05_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w05_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w05_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w05_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w05_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w05_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w05_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'6'";
            tab_5_1_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w06_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w06_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w06_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w06_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w06_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w06_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w06_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w06_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w06_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w06_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'7'";
            tab_5_1_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w07_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w07_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w07_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w07_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w07_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w07_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w07_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w07_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w07_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w07_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w07_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'8'";
            tab_5_1_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w08_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w08_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w08_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w08_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w08_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w08_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w08_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w08_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w08_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w08_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w08_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'9'";
            tab_5_1_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w09_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w09_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w09_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w09_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w09_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w09_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w09_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w09_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w09_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w09_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w09_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'10'";
            tab_5_1_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w10_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w10_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w10_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w10_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w10_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w10_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w10_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w10_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w10_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w10_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w10_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w10_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'11'";
            tab_5_1_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w11_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w11_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w11_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w11_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w11_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w11_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w11_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w11_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w11_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w11_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w11_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w11_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            idWiersza = "'12'";
            tab_5_1_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_1_w12_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_1_w12_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_1_w12_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_1_w12_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_1_w12_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_1_w12_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_5_1_w12_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_5_1_w12_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_5_1_w12_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_5_1_w12_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_5_1_w12_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_5_1_w12_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);

            #endregion "5.1";

            #region "5.2";

            idTabeli = "'5.2'";
            idWiersza = "'1'";
            tab_5_2_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_5_2_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_5_2_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_5_2_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_5_2_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_5_2_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_5_2_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

            #endregion "5.2";

            #region "6";

            idTabeli = "'6'";
            idWiersza = "'1'";
            tab_6_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'2'";
            tab_6_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w02_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'3'";
            tab_6_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w03_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w03_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w03_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'4'";
            tab_6_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w04_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w04_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w04_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w04_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'5'";
            tab_6_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w05_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w05_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w05_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w05_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'6'";
            tab_6_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w06_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w06_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w06_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w06_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'7'";
            tab_6_w07_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w07_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w07_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w07_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w07_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w07_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w07_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'8'";
            tab_6_w08_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w08_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w08_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w08_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w08_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w08_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w08_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'9'";
            tab_6_w09_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w09_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w09_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w09_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w09_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w09_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w09_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'10'";
            tab_6_w10_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w10_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w10_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w10_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w10_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w10_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w10_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'11'";
            tab_6_w11_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w11_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w11_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w11_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w11_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w11_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w11_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'12'";
            tab_6_w12_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w12_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w12_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w12_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w12_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w12_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w12_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'13'";
            tab_6_w13_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w13_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w13_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w13_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w13_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w13_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w13_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'14'";
            tab_6_w14_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w14_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w14_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w14_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w14_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w14_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w14_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            idWiersza = "'15'";
            tab_6_w15_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_w15_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_w15_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_w15_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_w15_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_w15_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_w15_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

            #endregion "6";

            #region "6.1";

            idTabeli = "'6.1'";
            idWiersza = "'1'";
            tab_6_1_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_1_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_1_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_1_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_1_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_1_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_1_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_6_1_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_6_1_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_6_1_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_6_1_w01_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_6_1_w01_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_6_1_w01_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            tab_6_1_w01_c14.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
            tab_6_1_w01_c15.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
            tab_6_1_w01_c16.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
            tab_6_1_w01_c17.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
            tab_6_1_w01_c18.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
            tab_6_1_w01_c19.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
            tab_6_1_w01_c20.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
            tab_6_1_w01_c21.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
            tab_6_1_w01_c22.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
            tab_6_1_w01_c23.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
            tab_6_1_w01_c24.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
            tab_6_1_w01_c25.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
            tab_6_1_w01_c26.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
            tab_6_1_w01_c27.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'", tenPlik);
            tab_6_1_w01_c28.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'", tenPlik);
            tab_6_1_w01_c29.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'", tenPlik);
            tab_6_1_w01_c30.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'", tenPlik);
            tab_6_1_w01_c31.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'", tenPlik);
            tab_6_1_w01_c32.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'", tenPlik);
            tab_6_1_w01_c33.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'", tenPlik);
            tab_6_1_w01_c34.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'", tenPlik);
            tab_6_1_w01_c35.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'", tenPlik);
            tab_6_1_w01_c36.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'", tenPlik);
            tab_6_1_w01_c37.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'", tenPlik);
            idWiersza = "'2'";
            tab_6_1_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_1_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_1_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_1_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_1_w02_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_1_w02_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_1_w02_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_6_1_w02_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_6_1_w02_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_6_1_w02_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_6_1_w02_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_6_1_w02_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_6_1_w02_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            tab_6_1_w02_c14.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
            tab_6_1_w02_c15.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
            tab_6_1_w02_c16.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
            tab_6_1_w02_c17.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
            tab_6_1_w02_c18.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
            tab_6_1_w02_c19.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
            tab_6_1_w02_c20.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
            tab_6_1_w02_c21.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
            tab_6_1_w02_c22.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
            tab_6_1_w02_c23.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
            tab_6_1_w02_c24.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
            tab_6_1_w02_c25.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
            tab_6_1_w02_c26.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
            tab_6_1_w02_c27.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'", tenPlik);
            tab_6_1_w02_c28.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'", tenPlik);
            tab_6_1_w02_c29.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'", tenPlik);
            tab_6_1_w02_c30.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'", tenPlik);
            tab_6_1_w02_c31.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'", tenPlik);
            tab_6_1_w02_c32.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'", tenPlik);
            tab_6_1_w02_c33.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'", tenPlik);
            tab_6_1_w02_c34.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'", tenPlik);
            tab_6_1_w02_c35.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'", tenPlik);
            tab_6_1_w02_c36.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'", tenPlik);
            tab_6_1_w02_c37.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'", tenPlik);
            idWiersza = "'3'";
            tab_6_1_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_6_1_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_6_1_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_6_1_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_6_1_w03_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_6_1_w03_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_6_1_w03_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_6_1_w03_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_6_1_w03_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_6_1_w03_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_6_1_w03_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_6_1_w03_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
            tab_6_1_w03_c13.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
            tab_6_1_w03_c14.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
            tab_6_1_w03_c15.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
            tab_6_1_w03_c16.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
            tab_6_1_w03_c17.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
            tab_6_1_w03_c18.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
            tab_6_1_w03_c19.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
            tab_6_1_w03_c20.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
            tab_6_1_w03_c21.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
            tab_6_1_w03_c22.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
            tab_6_1_w03_c23.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
            tab_6_1_w03_c24.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
            tab_6_1_w03_c25.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
            tab_6_1_w03_c26.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
            tab_6_1_w03_c27.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'", tenPlik);
            tab_6_1_w03_c28.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'", tenPlik);
            tab_6_1_w03_c29.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='29'", tenPlik);
            tab_6_1_w03_c30.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='30'", tenPlik);
            tab_6_1_w03_c31.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='31'", tenPlik);
            tab_6_1_w03_c32.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='32'", tenPlik);
            tab_6_1_w03_c33.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='33'", tenPlik);
            tab_6_1_w03_c34.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='34'", tenPlik);
            tab_6_1_w03_c35.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='35'", tenPlik);
            tab_6_1_w03_c36.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='36'", tenPlik);
            tab_6_1_w03_c37.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='37'", tenPlik);

            #endregion "6.1";

            #region "7.1";

            idTabeli = "'7.1'";
            idWiersza = "'1'";
            tab_7_1_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            idWiersza = "'2'";
            tab_7_1_w02_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w02_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w02_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w02_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            idWiersza = "'3'";
            tab_7_1_w03_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w03_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w03_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w03_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            idWiersza = "'4'";
            tab_7_1_w04_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w04_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w04_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w04_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            idWiersza = "'5'";
            tab_7_1_w05_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w05_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w05_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w05_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            idWiersza = "'6'";
            tab_7_1_w06_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_7_1_w06_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_7_1_w06_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_7_1_w06_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

            #endregion "7.1";

            idTabeli = "'8.1'";
            idWiersza = "'1'";
            tab_8_1_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

            #region "8.2";

            idTabeli = "'8.2'";
            idWiersza = "'1'";
            tab_8_2_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_8_2_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_8_2_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_8_2_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_8_2_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_8_2_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_8_2_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_8_2_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

            #endregion "8.2";

            #region "8.3";

            idTabeli = "'8.3'";
            idWiersza = "'1'";
            tab_8_3_w01_c01.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
            tab_8_3_w01_c02.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
            tab_8_3_w01_c03.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
            tab_8_3_w01_c04.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
            tab_8_3_w01_c05.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
            tab_8_3_w01_c06.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
            tab_8_3_w01_c07.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
            tab_8_3_w01_c08.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
            tab_8_3_w01_c09.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
            tab_8_3_w01_c10.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
            tab_8_3_w01_c11.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
            tab_8_3_w01_c12.Text = dr.wyciagnijWartosc(tabelaDanychMSS, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);

            #endregion "8.3";
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
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21); //dane
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
                cm.log.Error(tenPlik + " generowanie pliku CSV " + ex.Message);
            }
        }
    }
}