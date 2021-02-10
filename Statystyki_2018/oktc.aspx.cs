using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oktc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "oktc.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                else
                {
                    CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                    newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                    System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                    System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                    DateTime dTime = DateTime.Now.AddMonths(-1); ;

                    if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                    if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                    Session["id_dzialu"] = idWydzial;
                    Session["data_1"] = Date1.Date.ToShortDateString();
                    Session["data_2"] = Date2.Date.ToShortDateString();

                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        clearHedersSession();
                        makeHeader();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch
            {
                Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void clearHedersSession()
        {
            Session["header_01"] = null;
            Session["header_02"] = null;
            Session["header_03"] = null;
            Session["header_04"] = null;
            Session["header_05"] = null;
            Session["header_06"] = null;
            Session["header_07"] = null;
            Session["header_08"] = null;
        }

        protected void odswiez()
        {
            Session["sesja"] = "s3030";

            string yyx = (string)Session["id_dzialu"];

            string txt = string.Empty; //
            DataTable tabelkaGW1 = new DataTable();
            DataTable tabelkaGW2 = new DataTable();
            DataTable tabelkaGW3 = new DataTable();

            try
            {
                //cm.log.Info("OKTC: wczytywanie danych do tabeli 2");
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka001"] = tabelka01;
                //cm.log.Info("OKTC: wczytywanie danych do tabeli 4");
                DataTable tabelka02 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 4, 20, 20, tenPlik);
                Session["tabelka002"] = tabelka02;
                //cm.log.Info("OKTC: wczytywanie danych do tabeli 6");
                DataTable tabelka03 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 6, 20, 20, tenPlik);
                Session["tabelka003"] = tabelka03;

                //row 1
                tab_1_w01_col01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_1_w01_col02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_1_w01_col03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_1_w01_col04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_1_w01_col05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_1_w01_col06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_1_w01_col07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_1_w01_col08.Text = tabelka01.Rows[0][8].ToString().Trim();
                //row 2
                tab_1_w02_col01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_1_w02_col02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_1_w02_col03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_1_w02_col04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_1_w02_col05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_1_w02_col06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_1_w02_col07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_1_w02_col08.Text = tabelka01.Rows[1][8].ToString().Trim();
                //row 3
                tab_1_w03_col01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_1_w03_col02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_1_w03_col03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_1_w03_col04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_1_w03_col05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_1_w03_col06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_1_w03_col07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_1_w03_col08.Text = tabelka01.Rows[2][8].ToString().Trim();
                //row 4
                tab_1_w04_col01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_1_w04_col02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_1_w04_col03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_1_w04_col04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_1_w04_col05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_1_w04_col06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_1_w04_col07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_1_w04_col08.Text = tabelka01.Rows[3][8].ToString().Trim();
                //row 5
                tab_1_w05_col01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_1_w05_col02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_1_w05_col03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_1_w05_col04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_1_w05_col05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_1_w05_col06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_1_w05_col07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_1_w05_col08.Text = tabelka01.Rows[4][8].ToString().Trim();
                //row 6
                tab_1_w06_col01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_1_w06_col02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_1_w06_col03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_1_w06_col04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_1_w06_col05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_1_w06_col06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_1_w06_col07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_1_w06_col08.Text = tabelka01.Rows[5][8].ToString().Trim();
                //row 7
                tab_1_w07_col01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_1_w07_col02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_1_w07_col03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_1_w07_col04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_1_w07_col05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_1_w07_col06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_1_w07_col07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_1_w07_col08.Text = tabelka01.Rows[6][8].ToString().Trim();
                //row 8
                tab_1_w08_col01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_1_w08_col02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_1_w08_col03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_1_w08_col04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_1_w08_col05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_1_w08_col06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_1_w08_col07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_1_w08_col08.Text = tabelka01.Rows[7][8].ToString().Trim();
                //row 9
                tab_1_w09_col01.Text = tabelka01.Rows[8][1].ToString().Trim();
                tab_1_w09_col02.Text = tabelka01.Rows[8][2].ToString().Trim();
                tab_1_w09_col03.Text = tabelka01.Rows[8][3].ToString().Trim();
                tab_1_w09_col04.Text = tabelka01.Rows[8][4].ToString().Trim();
                tab_1_w09_col05.Text = tabelka01.Rows[8][5].ToString().Trim();
                tab_1_w09_col06.Text = tabelka01.Rows[8][6].ToString().Trim();
                tab_1_w09_col07.Text = tabelka01.Rows[8][7].ToString().Trim();
                tab_1_w09_col08.Text = tabelka01.Rows[8][8].ToString().Trim();
                tab_1_w09_col08.Text = tabelka01.Rows[8][8].ToString().Trim();

                //tabela 3

                //row 1
                tab_2_w01_col01.Text = tabelka02.Rows[0][1].ToString().Trim();
                tab_2_w01_col02.Text = tabelka02.Rows[0][2].ToString().Trim();
                tab_2_w01_col03.Text = tabelka02.Rows[0][3].ToString().Trim();
                tab_2_w01_col04.Text = tabelka02.Rows[0][4].ToString().Trim();
                tab_2_w01_col05.Text = tabelka02.Rows[0][5].ToString().Trim();
                tab_2_w01_col06.Text = tabelka02.Rows[0][6].ToString().Trim();
                tab_2_w01_col07.Text = tabelka02.Rows[0][7].ToString().Trim();
                tab_2_w01_col08.Text = tabelka02.Rows[0][8].ToString().Trim();
                tab_2_w01_col09.Text = tabelka02.Rows[0][9].ToString().Trim();

                //row 2
                tab_2_w02_col01.Text = tabelka02.Rows[1][1].ToString().Trim();
                tab_2_w02_col02.Text = tabelka02.Rows[1][2].ToString().Trim();
                tab_2_w02_col03.Text = tabelka02.Rows[1][3].ToString().Trim();
                tab_2_w02_col04.Text = tabelka02.Rows[1][4].ToString().Trim();
                tab_2_w02_col05.Text = tabelka02.Rows[1][5].ToString().Trim();
                tab_2_w02_col06.Text = tabelka02.Rows[1][6].ToString().Trim();
                tab_2_w02_col07.Text = tabelka02.Rows[1][7].ToString().Trim();
                tab_2_w02_col08.Text = tabelka02.Rows[1][8].ToString().Trim();
                tab_2_w02_col09.Text = tabelka02.Rows[1][9].ToString().Trim();

                //row 3
                tab_2_w03_col01.Text = tabelka02.Rows[2][1].ToString().Trim();
                tab_2_w03_col02.Text = tabelka02.Rows[2][2].ToString().Trim();
                tab_2_w03_col03.Text = tabelka02.Rows[2][3].ToString().Trim();
                tab_2_w03_col04.Text = tabelka02.Rows[2][4].ToString().Trim();
                tab_2_w03_col05.Text = tabelka02.Rows[2][5].ToString().Trim();
                tab_2_w03_col06.Text = tabelka02.Rows[2][6].ToString().Trim();
                tab_2_w03_col07.Text = tabelka02.Rows[2][7].ToString().Trim();
                tab_2_w03_col08.Text = tabelka02.Rows[2][8].ToString().Trim();
                tab_2_w03_col09.Text = tabelka02.Rows[2][9].ToString().Trim();
                //row 4
                tab_2_w04_col01.Text = tabelka02.Rows[3][1].ToString().Trim();
                tab_2_w04_col02.Text = tabelka02.Rows[3][2].ToString().Trim();
                tab_2_w04_col03.Text = tabelka02.Rows[3][3].ToString().Trim();
                tab_2_w04_col04.Text = tabelka02.Rows[3][4].ToString().Trim();
                tab_2_w04_col05.Text = tabelka02.Rows[3][5].ToString().Trim();
                tab_2_w04_col06.Text = tabelka02.Rows[3][6].ToString().Trim();
                tab_2_w04_col07.Text = tabelka02.Rows[3][7].ToString().Trim();
                tab_2_w04_col08.Text = tabelka02.Rows[3][8].ToString().Trim();
                tab_2_w04_col09.Text = tabelka02.Rows[3][9].ToString().Trim();
                //row 5
                tab_2_w05_col01.Text = tabelka02.Rows[4][1].ToString().Trim();
                tab_2_w05_col02.Text = tabelka02.Rows[4][2].ToString().Trim();
                tab_2_w05_col03.Text = tabelka02.Rows[4][3].ToString().Trim();
                tab_2_w05_col04.Text = tabelka02.Rows[4][4].ToString().Trim();
                tab_2_w05_col05.Text = tabelka02.Rows[4][5].ToString().Trim();
                tab_2_w05_col06.Text = tabelka02.Rows[4][6].ToString().Trim();
                tab_2_w05_col07.Text = tabelka02.Rows[4][7].ToString().Trim();
                tab_2_w05_col08.Text = tabelka02.Rows[4][8].ToString().Trim();
                tab_2_w05_col09.Text = tabelka02.Rows[4][9].ToString().Trim();
                //row 6
                tab_2_w06_col01.Text = tabelka02.Rows[5][1].ToString().Trim();
                tab_2_w06_col02.Text = tabelka02.Rows[5][2].ToString().Trim();
                tab_2_w06_col03.Text = tabelka02.Rows[5][3].ToString().Trim();
                tab_2_w06_col04.Text = tabelka02.Rows[5][4].ToString().Trim();
                tab_2_w06_col05.Text = tabelka02.Rows[5][5].ToString().Trim();
                tab_2_w06_col06.Text = tabelka02.Rows[5][6].ToString().Trim();
                tab_2_w06_col07.Text = tabelka02.Rows[5][7].ToString().Trim();
                tab_2_w06_col08.Text = tabelka02.Rows[5][8].ToString().Trim();
                tab_2_w06_col09.Text = tabelka02.Rows[5][9].ToString().Trim();
                //row 7
                tab_2_w07_col01.Text = tabelka02.Rows[6][1].ToString().Trim();
                tab_2_w07_col02.Text = tabelka02.Rows[6][2].ToString().Trim();
                tab_2_w07_col03.Text = tabelka02.Rows[6][3].ToString().Trim();
                tab_2_w07_col04.Text = tabelka02.Rows[6][4].ToString().Trim();
                tab_2_w07_col05.Text = tabelka02.Rows[6][5].ToString().Trim();
                tab_2_w07_col06.Text = tabelka02.Rows[6][6].ToString().Trim();
                tab_2_w07_col07.Text = tabelka02.Rows[6][7].ToString().Trim();
                tab_2_w07_col08.Text = tabelka02.Rows[6][8].ToString().Trim();
                tab_2_w07_col09.Text = tabelka02.Rows[6][9].ToString().Trim();
                //row 8
                tab_2_w08_col01.Text = tabelka02.Rows[7][1].ToString().Trim();
                tab_2_w08_col02.Text = tabelka02.Rows[7][2].ToString().Trim();
                tab_2_w08_col03.Text = tabelka02.Rows[7][3].ToString().Trim();
                tab_2_w08_col04.Text = tabelka02.Rows[7][4].ToString().Trim();
                tab_2_w08_col05.Text = tabelka02.Rows[7][5].ToString().Trim();
                tab_2_w08_col06.Text = tabelka02.Rows[7][6].ToString().Trim();
                tab_2_w08_col07.Text = tabelka02.Rows[7][7].ToString().Trim();
                tab_2_w08_col08.Text = tabelka02.Rows[7][8].ToString().Trim();
                tab_2_w08_col09.Text = tabelka02.Rows[7][9].ToString().Trim();
                //row 9
                tab_2_w09_col01.Text = tabelka02.Rows[8][1].ToString().Trim();
                tab_2_w09_col02.Text = tabelka02.Rows[8][2].ToString().Trim();
                tab_2_w09_col03.Text = tabelka02.Rows[8][3].ToString().Trim();
                tab_2_w09_col04.Text = tabelka02.Rows[8][4].ToString().Trim();
                tab_2_w09_col05.Text = tabelka02.Rows[8][5].ToString().Trim();
                tab_2_w09_col06.Text = tabelka02.Rows[8][6].ToString().Trim();
                tab_2_w09_col07.Text = tabelka02.Rows[8][7].ToString().Trim();
                tab_2_w09_col08.Text = tabelka02.Rows[8][8].ToString().Trim();
                tab_2_w09_col09.Text = tabelka02.Rows[8][9].ToString().Trim();

                //tabela 3

                //row 1
                tab_3_w01_col01.Text = tabelka03.Rows[0][1].ToString().Trim();
                tab_3_w01_col02.Text = tabelka03.Rows[0][2].ToString().Trim();
                tab_3_w01_col03.Text = tabelka03.Rows[0][3].ToString().Trim();
                tab_3_w01_col04.Text = tabelka03.Rows[0][4].ToString().Trim();
                tab_3_w01_col05.Text = tabelka03.Rows[0][5].ToString().Trim();
                tab_3_w01_col06.Text = tabelka03.Rows[0][6].ToString().Trim();
                tab_3_w01_col07.Text = tabelka03.Rows[0][7].ToString().Trim();
                tab_3_w01_col08.Text = tabelka03.Rows[0][8].ToString().Trim();
                tab_3_w01_col09.Text = tabelka03.Rows[0][9].ToString().Trim();
                tab_3_w01_col10.Text = tabelka03.Rows[0][10].ToString().Trim();
                //row 2
                tab_3_w02_col01.Text = tabelka03.Rows[1][1].ToString().Trim();
                tab_3_w02_col02.Text = tabelka03.Rows[1][2].ToString().Trim();
                tab_3_w02_col03.Text = tabelka03.Rows[1][3].ToString().Trim();
                tab_3_w02_col04.Text = tabelka03.Rows[1][4].ToString().Trim();
                tab_3_w02_col05.Text = tabelka03.Rows[1][5].ToString().Trim();
                tab_3_w02_col06.Text = tabelka03.Rows[1][6].ToString().Trim();
                tab_3_w02_col07.Text = tabelka03.Rows[1][7].ToString().Trim();
                tab_3_w02_col08.Text = tabelka03.Rows[1][8].ToString().Trim();
                tab_3_w02_col09.Text = tabelka03.Rows[1][9].ToString().Trim();
                tab_3_w02_col10.Text = tabelka03.Rows[1][10].ToString().Trim();
                //row 3
                tab_3_w03_col01.Text = tabelka03.Rows[2][1].ToString().Trim();
                tab_3_w03_col02.Text = tabelka03.Rows[2][2].ToString().Trim();
                tab_3_w03_col03.Text = tabelka03.Rows[2][3].ToString().Trim();
                tab_3_w03_col04.Text = tabelka03.Rows[2][4].ToString().Trim();
                tab_3_w03_col05.Text = tabelka03.Rows[2][5].ToString().Trim();
                tab_3_w03_col06.Text = tabelka03.Rows[2][6].ToString().Trim();
                tab_3_w03_col07.Text = tabelka03.Rows[2][7].ToString().Trim();
                tab_3_w03_col08.Text = tabelka03.Rows[2][8].ToString().Trim();
                tab_3_w03_col09.Text = tabelka03.Rows[2][9].ToString().Trim();
                tab_3_w03_col10.Text = tabelka03.Rows[2][10].ToString().Trim();

                //row 4
                tab_3_w04_col01.Text = tabelka03.Rows[3][1].ToString().Trim();
                tab_3_w04_col02.Text = tabelka03.Rows[3][2].ToString().Trim();
                tab_3_w04_col03.Text = tabelka03.Rows[3][3].ToString().Trim();
                tab_3_w04_col04.Text = tabelka03.Rows[3][4].ToString().Trim();
                tab_3_w04_col05.Text = tabelka03.Rows[3][5].ToString().Trim();
                tab_3_w04_col06.Text = tabelka03.Rows[3][6].ToString().Trim();
                tab_3_w04_col07.Text = tabelka03.Rows[3][7].ToString().Trim();
                tab_3_w04_col08.Text = tabelka03.Rows[3][8].ToString().Trim();
                tab_3_w04_col09.Text = tabelka03.Rows[3][9].ToString().Trim();
                tab_3_w04_col10.Text = tabelka03.Rows[3][10].ToString().Trim();

                //row 5
                tab_3_w05_col01.Text = tabelka03.Rows[4][1].ToString().Trim();
                tab_3_w05_col02.Text = tabelka03.Rows[4][2].ToString().Trim();
                tab_3_w05_col03.Text = tabelka03.Rows[4][3].ToString().Trim();
                tab_3_w05_col04.Text = tabelka03.Rows[4][4].ToString().Trim();
                tab_3_w05_col05.Text = tabelka03.Rows[4][5].ToString().Trim();
                tab_3_w05_col06.Text = tabelka03.Rows[4][6].ToString().Trim();
                tab_3_w05_col07.Text = tabelka03.Rows[4][7].ToString().Trim();
                tab_3_w05_col08.Text = tabelka03.Rows[4][8].ToString().Trim();
                tab_3_w05_col09.Text = tabelka03.Rows[4][9].ToString().Trim();
                tab_3_w05_col10.Text = tabelka03.Rows[4][10].ToString().Trim();

                //row 6
                tab_3_w06_col01.Text = tabelka03.Rows[5][1].ToString().Trim();
                tab_3_w06_col02.Text = tabelka03.Rows[5][2].ToString().Trim();
                tab_3_w06_col03.Text = tabelka03.Rows[5][3].ToString().Trim();
                tab_3_w06_col04.Text = tabelka03.Rows[5][4].ToString().Trim();
                tab_3_w06_col05.Text = tabelka03.Rows[5][5].ToString().Trim();
                tab_3_w06_col06.Text = tabelka03.Rows[5][6].ToString().Trim();
                tab_3_w06_col07.Text = tabelka03.Rows[5][7].ToString().Trim();

                tab_3_w06_col08.Text = tabelka03.Rows[5][8].ToString().Trim();
                tab_3_w06_col09.Text = tabelka03.Rows[5][9].ToString().Trim();
                tab_3_w06_col10.Text = tabelka03.Rows[5][10].ToString().Trim();

                //row 7
                tab_3_w07_col01.Text = tabelka03.Rows[6][1].ToString().Trim();
                tab_3_w07_col02.Text = tabelka03.Rows[6][2].ToString().Trim();
                tab_3_w07_col03.Text = tabelka03.Rows[6][3].ToString().Trim();
                tab_3_w07_col04.Text = tabelka03.Rows[6][4].ToString().Trim();
                tab_3_w07_col05.Text = tabelka03.Rows[6][5].ToString().Trim();
                tab_3_w07_col06.Text = tabelka03.Rows[6][6].ToString().Trim();
                tab_3_w07_col07.Text = tabelka03.Rows[6][7].ToString().Trim();
                tab_3_w07_col08.Text = tabelka03.Rows[6][8].ToString().Trim();
                tab_3_w07_col09.Text = tabelka03.Rows[6][9].ToString().Trim();
                tab_3_w07_col10.Text = tabelka03.Rows[6][10].ToString().Trim();

                //row 8
                tab_3_w08_col01.Text = tabelka03.Rows[7][1].ToString().Trim();
                tab_3_w08_col02.Text = tabelka03.Rows[7][2].ToString().Trim();
                tab_3_w08_col03.Text = tabelka03.Rows[7][3].ToString().Trim();
                tab_3_w08_col04.Text = tabelka03.Rows[7][4].ToString().Trim();
                tab_3_w08_col05.Text = tabelka03.Rows[7][5].ToString().Trim();
                tab_3_w08_col06.Text = tabelka03.Rows[7][6].ToString().Trim();
                tab_3_w08_col07.Text = tabelka03.Rows[7][7].ToString().Trim();
                tab_3_w08_col08.Text = tabelka03.Rows[7][8].ToString().Trim();
                tab_3_w08_col09.Text = tabelka03.Rows[7][9].ToString().Trim();
                tab_3_w08_col10.Text = tabelka03.Rows[7][10].ToString().Trim();

                //row 9
                tab_3_w09_col01.Text = tabelka03.Rows[8][1].ToString().Trim();
                tab_3_w09_col02.Text = tabelka03.Rows[8][2].ToString().Trim();
                tab_3_w09_col03.Text = tabelka03.Rows[8][3].ToString().Trim();
                tab_3_w09_col04.Text = tabelka03.Rows[8][4].ToString().Trim();
                tab_3_w09_col05.Text = tabelka03.Rows[8][5].ToString().Trim();
                tab_3_w09_col06.Text = tabelka03.Rows[8][6].ToString().Trim();
                tab_3_w09_col07.Text = tabelka03.Rows[8][7].ToString().Trim();
                tab_3_w09_col08.Text = tabelka03.Rows[8][8].ToString().Trim();
                tab_3_w09_col09.Text = tabelka03.Rows[8][9].ToString().Trim();
                tab_3_w09_col10.Text = tabelka03.Rows[8][10].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("OKTC: " + ex.Message);
            }

            try

            {
                cl.clear_maim_db();
                //cm.log.Info("OKTC: wczytywanie danych do tabeli 1");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date);

                //cm.log.Info("OKTC: wczytywanie danych do tabeli 4");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);

                //cm.log.Info("OKTC: wczytywanie danych do tabeli 5");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
            }
            
            catch (Exception ex)
            {
                cm.log.Error("OKTC: " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label6.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

      

        #region "nagłowki tabel"

        protected void makeHeader()
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            #region tabela  1

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));

            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));

            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "2C", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "2C", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego wg funkcji w Wydziale", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość sesji", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Liczba przesł. osób", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "WPŁYW", "7", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "ZAŁATWIENIA", "7", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Absencja w dniach roboczych", "1", "2", "h" });

            Session["header_01"] = dT_01;

            #endregion tabela  1

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Posiedzenia", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Posiedzenia", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "K", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Kp", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Ko", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Kop", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "W", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1", "v" });//

            dT_02.Rows.Add(new Object[] { "2", "Lp", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ilość odbytych sesji", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba załatwionych spraw na rozprawach i posiedzeniach", "6", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Absencja w dniach roboczych (urlopy, zwolnienia lekarskie)", "1", "2", "h" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "C", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nc", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Co", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Cps", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ns", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Wykaz N", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Cupr", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "C", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nc", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Co", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Cps", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ns", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Wykaz N", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Cupr", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego wg funkcji w Wydziale", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ilość sesji", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Liczba przesł. osób", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WPŁYW", "7", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "2", "ZAŁATWIENIA", "7", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Absencja w dniach roboczych", "1", "2", "h" });

            Session["header_03"] = dT_03;
            //  makeHeader3(sn, dT_03);

            #endregion tabela  3 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "I C", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Nc", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Co", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Cps", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 1Ns", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2C", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2Nc", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2Co", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2 Ns", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "I C", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Nc", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Co", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I Cps", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 1Ns", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2C", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2Nc", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2Co", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "I 2 Ns", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego wg funkcji w Wydziale", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Liczba przesł. osób", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "WPŁYW", "9", "1", "h" });
            dT_05.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "v" });

            dT_05.Rows.Add(new Object[] { "2", "ZAŁATWIENIA", "9", "1", "h" });
            dT_05.Rows.Add(new Object[] { "2", "RAZEM", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Absencja w dniach roboczych", "1", "2", "h" });

            Session["header_05"] = dT_05;
            //  makeHeader3(sn, dT_05);

            #endregion tabela  5 ()
        }

        #endregion "nagłowki tabel"

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
                Label6.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                //id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    tabela1Label.Text = "Informacja o ruchu spraw w Wydziale Cywilnym za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela3Label.Text = "Informacje o ruchach spraw w Wydziale Cywilnym Sekcji Nieprocesowej za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela1Label.Text = "Informacja o ruchu spraw w Wydziale Cywilnym za za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela3Label.Text = " Informacje o ruchach spraw w Wydziale Cywilnym Sekcji Nieprocesowej za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

     
        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oktc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oktc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka002"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataView view = (DataView)tabela_1.Select(DataSourceSelectArguments.Empty);
                DataTable table = view.ToTable();
                table.Columns.Remove("ident");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 19, 1, 4, true, true, false, false, false);

                //   MyWorksheet2.Cells[1, 3].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                rowik = table.Rows.Count - 3;

                // pod tabela z tebeli nr 2

                // obwodnia

                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {
                    for (int i = 1; i < 21; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i + 1].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i + 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                }
                //------------

                MyWorksheet1.Cells[rowik + 7, 3, rowik + 7, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 3].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 3, rowik + 8, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 3].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 3, rowik + 9, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 3].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 3, rowik + 10, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 3].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 3, rowik + 11, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 3].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 3, rowik + 17, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 3].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13, 4, rowik + 13, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 4, rowik + 14, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 4].Value = " 6-12 miesięcy";

                MyWorksheet1.Cells[rowik + 15, 4, rowik + 15, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 4].Value = " 12-24 miesięcy (do 2 lat)";

                MyWorksheet1.Cells[rowik + 16, 4, rowik + 16, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 4].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17, 4, rowik + 17, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 4].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka002 = (DataTable)Session["tabelka001"];

                for (int i = 0; i < 8; i++)
                {
                    for (int j = 0; j < 10; j++)
                    {
                     tb.komorkaExcela(MyWorksheet1, i + rowik + 7, j + 3, tabelka002.Rows[i][j].ToString(), false, 1, 1);
                    }
                }

                // druga

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();

                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 23, 1, 4, true, true, false, false, false);

                // trzecia

                DataView view4 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);
                DataTable table3 = view4.ToTable();

                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 23, 1, 4, true, true, false, false, false);

                try
                {
                    MyExcel.SaveAs(fNewFile);

                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }//end of using
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataView view = (DataView)tabela_1.Select(DataSourceSelectArguments.Empty);
                //tabela_1
                DataTable table = view.ToTable();
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader(sn, dT, GridView1);
            }
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //nagłówek tabeli 3
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tb.makeHeader(sn, dT, GridView2);
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                tb.makeHeader(sn, dT, GridView3);
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)

            {
                DataTable table = (DataTable)Session["tabelkaGW002"];//((DataView)tabela_1.Select(DataSourceSelectArguments.Empty)).ToTable();

                tb.makeSumRow(table, e, 20);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW003"];
                tb.makeSumRow(table, e, 24);
            }
        }
    }
}