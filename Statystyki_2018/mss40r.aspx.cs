using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss40r : System.Web.UI.Page
    {
        public static string tenPlik = "mss1r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();
        public dataReaders dr = new dataReaders();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
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
            if (Session["ustawDate40"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate40"] = "X";
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
           // odswiez();
            makeLabels();
        }// end of Page_Load

        protected void odswiez()
        {
           
          
            string yyx = (string)Session["id_dzialu"];

       

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                string idDzialu = (string)Session["id_dzialu"];
                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 30);
                //wypełnianie lebeli



                #region "tabela I.1"
                //tab_C11_w01_c01
                idTabeli = "'1.1'";
                idWiersza = "'1'";
                //wiersz 1

                tab_c111_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w01_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'2'";
                //wiersz 2
                tab_c111_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w02_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'3'";
                //wiersz 3
                tab_c111_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w03_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'4'";
                //wiersz 3
                tab_c111_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w04_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w04_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w04_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w04_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'5'";
                //wiersz 3
                tab_c111_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w05_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w05_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w05_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w05_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w05_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'6'";
                //wiersz 3
                tab_c111_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w06_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w06_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w06_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w06_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w06_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'7'";
                //wiersz 3
                tab_c111_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w07_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w07_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w07_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w07_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w07_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'8'";
                //wiersz 3
                tab_c111_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w08_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w08_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w08_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w08_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w08_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w08_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'9'";
                //wiersz 3
                tab_c111_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w09_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w09_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w09_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w09_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w09_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w09_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'10'";
                //wiersz 3
                tab_c111_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w10_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w10_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w10_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w10_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w10_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w10_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'11'";
                //wiersz 1
                tab_c111_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w11_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w11_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w11_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w11_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w11_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w11_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'12'";
                //wiersz 2
                tab_c111_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w12_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w12_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w12_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w12_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w12_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w12_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'13'";
                //wiersz 3
                tab_c111_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w13_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w13_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w13_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w13_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w13_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w13_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w13_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w13_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'14'";
                //wiersz 3
                tab_c111_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w14_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w14_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w14_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w14_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w14_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w14_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w14_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w14_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w14_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w14_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'15'";
                //wiersz 3
                tab_c111_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w15_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w15_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w15_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w15_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w15_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w15_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w15_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w15_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w15_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w15_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'16'";
                //wiersz 3
                tab_c111_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w16_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w16_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w16_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w16_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w16_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w16_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w16_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w16_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w16_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w16_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'17'";
                //wiersz 3
                tab_c111_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w17_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w17_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w17_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w17_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w17_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w17_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w17_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w17_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w17_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w17_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'18'";
                //wiersz 3
                tab_c111_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w18_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w18_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w18_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w18_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w18_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w18_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w18_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w18_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w18_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w18_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'19'";
                //wiersz 3
                tab_c111_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w19_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w19_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w19_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w19_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w19_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w19_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w19_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w19_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w19_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w19_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w19_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w19_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'20'";
                //wiersz 3
                tab_c111_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w20_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w20_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w20_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w20_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w20_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w20_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w20_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w20_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w20_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w20_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w20_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w20_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                idWiersza = "'21'";
                //wiersz 3
                tab_c111_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c111_w21_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c111_w21_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c111_w21_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c111_w21_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c111_w21_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c111_w21_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c111_w21_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_c111_w21_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_c111_w21_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_c111_w21_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_c111_w21_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_c111_w21_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                #endregion "tabela I.1"

                #region "tabela I.1.a"

                idTabeli = "'1.1.a'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C11a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C11a_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C11a_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C11a_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C11a_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C11a_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C11a_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C11a_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C11a_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C11a_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C11a_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C11a_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C11a_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C11a_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C11a_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C11a_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C11a_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C11a_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                #endregion "tabela I.1.a"

                #region "tabela I.1.1"

                idTabeli = "'1.1.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_c1111_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'2'";
                //wiersz 2
                tab_c1111_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'3'";
                //wiersz 3
                tab_c1111_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'4'";
                //wiersz 3
                tab_c1111_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'5'";
                //wiersz 3
                tab_c1111_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'6'";
                //wiersz 3
                tab_c1111_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'7'";
                //wiersz 3
                tab_c1111_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'8'";
                //wiersz 3
                tab_c1111_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w08_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'9'";
                //wiersz 3
                tab_c1111_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w09_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'10'";
                //wiersz 10
                tab_c1111_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w10_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'11'";
                //wiersz 11
                tab_c1111_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w11_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'12'";
                //wiersz 12
                tab_c1111_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w12_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                idWiersza = "'13'";
                //wiersz 13
                tab_c1111_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_c1111_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_c1111_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_c1111_w13_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_c1111_w13_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_c1111_w13_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_c1111_w13_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_c1111_w13_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabela I.1.1"

                #region "tabela 1.2.1"

                idTabeli = "'1.2.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C121_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C121_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C121_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C121_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'5'";
                //wiersz 3
                tab_C121_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'6'";
                //wiersz 3
                tab_C121_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'7'";
                //wiersz 7
                tab_C121_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'8'";
                //wiersz 8
                tab_C121_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'9'";
                //wiersz 9
                tab_C121_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'10'";
                //wiersz 3
                tab_C121_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'11'";
                //wiersz 1
                tab_C121_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'12'";
                //wiersz 2
                tab_C121_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'13'";
                //wiersz 3
                tab_C121_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'14'";
                //wiersz 3
                tab_C121_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'15'";
                //wiersz 15
                tab_C121_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'16'";
                //wiersz 3
                tab_C121_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'17'";
                //wiersz 3
                tab_C121_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'18'";
                //wiersz 3
                tab_C121_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'19'";
                //wiersz 3
                tab_C121_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w19_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w19_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'20'";
                //wiersz 3
                tab_C121_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w20_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w20_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'21'";
                //wiersz 3
                tab_C121_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w21_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w21_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'22'";
                //wiersz 2
                tab_C121_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w22_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w22_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'23'";
                //wiersz 23
                tab_C121_w23_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w23_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w23_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'24'";
                //wiersz 24
                tab_C121_w24_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w24_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w24_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'25'";
                //wiersz 3
                tab_C121_w25_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w25_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w25_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'26'";
                //wiersz 3
                tab_C121_w26_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w26_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w26_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'27'";
                //wiersz 3
                tab_C121_w27_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w27_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w27_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'28'";
                //wiersz 3
                tab_C121_w28_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w28_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w28_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'29'";
                //wiersz 3
                tab_C121_w29_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w29_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w29_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'30'";
                //wiersz 30
                tab_C121_w30_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w30_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w30_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'31'";
                //wiersz 31
                tab_C121_w31_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w31_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w31_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'32'";
                //wiersz 32
                tab_C121_w32_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w32_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w32_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'33'";
                //wiersz 33
                tab_C121_w33_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w33_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w33_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'34'";
                //wiersz 34
                tab_C121_w34_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C121_w34_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C121_w34_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "tabela 1.2.1"

                #region "tabela I.2.2"

                idTabeli = "'1.2.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C122_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C122_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C122_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'4'";
                //wiersz 4
                tab_C122_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "tabela I.2.2"

                #region "tabela I.2.3"

                idTabeli = "'1.2.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C123_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "tabela I.2.3"

                #region "tabela I.3"

                idTabeli = "'1.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C13_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C13_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C13_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C13_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C13_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C13_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C13_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C13_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C13_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C13_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C13_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C13_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C13_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C13_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C13_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C13_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C13_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C13_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C13_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C13_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C13_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C13_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C13_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C13_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C13_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C13_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C13_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C13_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C13_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C13_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C13_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C13_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C13_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");

                #endregion "tabela I.3"
                //tab_C14_w01_c01
                #region "tabela I.4"
                pisz(" tab_C14_", 9, 14, tabela2, "'1.4'", yyx); 
                idTabeli = "'1.4'";
                idWiersza = "'1'";
                //  tab_C14_w01_c01.Text =
                tab_C14_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C14_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C14_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C14_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C14_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C14_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C14_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C14_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C14_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C14_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C14_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C14_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
          
                idWiersza = "'2'";
                //wiersz 2
                tab_C14_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C14_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C14_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C14_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C14_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C14_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C14_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C14_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C14_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C14_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C14_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C14_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
        
                idWiersza = "'3'";
                //wiersz 3
                tab_C14_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C14_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C14_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C14_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C14_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C14_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C14_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C14_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C14_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C14_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C14_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C14_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
      
                idWiersza = "'4'";
                //wiersz 3
                tab_C14_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C14_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C14_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C14_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C14_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C14_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C14_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C14_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C14_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C14_w04_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C14_w04_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C14_w04_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
         
            
                #endregion "tabela I.4"

                #region "tabela C2.1"

                idTabeli = "'2.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C2_1_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C2_1_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w02_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w02_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w02_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C2_1_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w03_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w03_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w03_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C2_1_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w04_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w04_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w04_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'5'";
                //wiersz 3
                tab_C2_1_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w05_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w05_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w05_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w05_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'6'";
                //wiersz 3
                tab_C2_1_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w06_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w06_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w06_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w06_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'7'";
                //wiersz 3
                tab_C2_1_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w07_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w07_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w07_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w07_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w07_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w07_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w07_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w07_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w07_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'8'";
                //wiersz 3
                tab_C2_1_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w08_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w08_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w08_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w08_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w08_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w08_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w08_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w08_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w08_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'9'";
                //wiersz 3
                tab_C2_1_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w09_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w09_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w09_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w09_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w09_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w09_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w09_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w09_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w09_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'10'";
                //wiersz 3
                tab_C2_1_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w10_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w10_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w10_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w10_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w10_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w10_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w10_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w10_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w10_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'11'";
                //wiersz 1
                tab_C2_1_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w11_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w11_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w11_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w11_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w11_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w11_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w11_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w11_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w11_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                idWiersza = "'12'";
                //wiersz 2
                tab_C2_1_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C2_1_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C2_1_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C2_1_w12_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C2_1_w12_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C2_1_w12_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C2_1_w12_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C2_1_w12_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C2_1_w12_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C2_1_w12_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C2_1_w12_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C2_1_w12_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");

                #endregion "tabela C2.1"

                #region "tabela C2.1.a"

                idTabeli = "'2.1.a'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C21a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C21a_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'2'";
                //wiersz 2
                tab_C21a_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C21a_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C21a_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C21a_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                #endregion "tabela C2.1.a"

                #region "tabela C2.2.1"

                idTabeli = "'2.2.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C221_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C221_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C221_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C221_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'5'";
                //wiersz 3
                tab_C221_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'6'";
                //wiersz 3
                tab_C221_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'7'";
                //wiersz 3
                tab_C221_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'8'";
                //wiersz 3
                tab_C221_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'9'";
                //wiersz 3
                tab_C221_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'10'";
                //wiersz 3
                tab_C221_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'11'";
                //wiersz 1
                tab_C221_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'12'";
                //wiersz 2
                tab_C221_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'13'";
                //wiersz 3
                tab_C221_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'14'";
                //wiersz 3
                tab_C221_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'15'";
                //wiersz 3
                tab_C221_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'16'";
                //wiersz 3
                tab_C221_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C221_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C221_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "tabela C2.2.1"

                #region "tabela C2.2.2"

                idTabeli = "'2.2.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C222_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "tabela C2.2.2"

                #region "tabela C2.3"

                idTabeli = "'2.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C23_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C23_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C23_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C23_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C23_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C23_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C23_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C23_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C23_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C23_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C23_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C23_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C23_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C23_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C23_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C23_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C23_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C23_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");

                #endregion "tabela C2.3"

                #region "tabela C2.4"

                idTabeli = "'2.4'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C24_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C24_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C24_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C24_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'5'";
                //wiersz 3
                tab_C24_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'6'";
                //wiersz 3
                tab_C24_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'7'";
                //wiersz 3
                tab_C24_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                idWiersza = "'8'";
                //wiersz 3
                tab_C24_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion "tabela C2.4"

                #region "tabela C3.1.1"

                //tab_C311_w01_c01
                idTabeli = "'3.1.1'";
                idWiersza = "'1'";
             
                tab_C311_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C311_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C311_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C311_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C311_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C311_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C311_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C311_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C311_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C311_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C311_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C311_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_C311_w01_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");
                tab_C311_w01_c14.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'");
                tab_C311_w01_c15.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'");
                tab_C311_w01_c16.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'");
                tab_C311_w01_c17.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'");
                tab_C311_w01_c18.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'");
                tab_C311_w01_c19.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'");
                tab_C311_w01_c20.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'");
                tab_C311_w01_c21.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'");
                tab_C311_w01_c22.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'");
                tab_C311_w01_c23.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'");
                tab_C311_w01_c24.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'");
                tab_C311_w01_c25.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'");
                tab_C311_w01_c26.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'");
                tab_C311_w01_c27.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='27'");
                tab_C311_w01_c28.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='28'");
                idWiersza = "'2'";
               

                #endregion "tabela C3.1.1"

                #region "tabela C3.1.2"

                idTabeli = "'3.1.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C312_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C312_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C312_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C312_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C312_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C312_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                #endregion "tabela C3.1.2"

                #region "tabela C3.1.3"

                //tab_C313_w01_c01
                idTabeli = "'3.1.3'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C313_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C313_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C313_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_C313_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_C313_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_C313_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_C313_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_C313_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_C313_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");
                tab_C313_w01_c10.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'");
                tab_C313_w01_c11.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'");
                tab_C313_w01_c12.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'");
                tab_C313_w01_c13.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'");

                #endregion "tabela C3.1.3"

                #region "tabela C4.1.1"

                idTabeli = "'4.1.1'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C411_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C411_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C411_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C411_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C411_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C411_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C411_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C411_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C411_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C411_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C411_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C411_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "tabela C4.1.1"

                #region "tabela C4.1.2"

                idTabeli = "'4.1.2'";
                idWiersza = "'1'";
                //wiersz 1
                tab_C412_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C412_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C412_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'2'";
                //wiersz 2
                tab_C412_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C412_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C412_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'3'";
                //wiersz 3
                tab_C412_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C412_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C412_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                idWiersza = "'4'";
                //wiersz 3
                tab_C412_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_C412_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_C412_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");

                #endregion "tabela C4.1.2"
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            {
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

        //    Label11.Text = txt;
            //  Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
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
                // Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

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

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                DataRow dr = foundRows[0];
                result = dr[4].ToString();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
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
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                  //  DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21,tenPlik); //dane
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

                    Response.Flush();
                    Response.End();
                }
            }
            catch
            {
            }
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
                    else
                    {
                        cm.log.Error(tenPlik+" pisz () -> nie znaleziono kontrolki "+ controlName);
                    }
                }
            }
        }// end of pisz

    }
}