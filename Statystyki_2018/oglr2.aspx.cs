using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglr2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "oglr2.aspx";

        private int storid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
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
            string idDzialu = (string)Session["id_dzialu"];
            string txt = string.Empty;

            DataTable tabelkaGW1 = new DataTable();
            DataTable tabelkaGW2 = new DataTable();
            DataTable tabelkaGW3 = new DataTable();
            DataTable tabelkaGW4 = new DataTable();
            DataTable tabelkaGW5 = new DataTable();
            DataTable tabelkaGW6 = new DataTable();
            DataTable tabelkaGW7 = new DataTable();
            DataTable tabelkaGW8 = new DataTable();

            try
            {
                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 1");
                tabelkaGW1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date, 30, tenPlik);
                Session["tabelka001"] = tabelkaGW1;
                Tabela1.DataSource = null;
                Tabela1.DataSourceID = null;
                Tabela1.DataSource = tabelkaGW1;
                Tabela1.DataBind();

                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 2");
                tabelkaGW2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date, 30, tenPlik);
                Session["tabelka002"] = tabelkaGW2;
                Gridview2.DataSource = null;
                Gridview2.DataSourceID = null;
                Gridview2.DataSource = tabelkaGW2;
                Gridview2.DataBind();

                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 3");
                tabelkaGW3 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date, 30, tenPlik);
                Session["tabelka003"] = tabelkaGW3;
                Gridview3.DataSource = null;
                Gridview3.DataSourceID = null;
                Gridview3.DataSource = tabelkaGW3;
                Gridview3.DataBind();
                try
                {
                    //cm.log.Info("OGLR2: wczytywanie danych do tabeli 4");
                    tabelkaGW4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 4, 1, 8, tenPlik);
                    Session["tabelka004"] = tabelkaGW4;
                    //pisz("tab_05_", 10, 9, tabela02);
                    tab_05_w01_c1.Text = tabelkaGW4.Rows[0][1].ToString().Trim();
                    tab_05_w01_c2.Text = tabelkaGW4.Rows[0][2].ToString().Trim();
                    tab_05_w01_c3.Text = tabelkaGW4.Rows[0][3].ToString().Trim();
                    tab_05_w01_c4.Text = tabelkaGW4.Rows[0][4].ToString().Trim();
                    tab_05_w01_c5.Text = tabelkaGW4.Rows[0][5].ToString().Trim();
                    tab_05_w01_c6.Text = tabelkaGW4.Rows[0][6].ToString().Trim();
                    tab_05_w01_c7.Text = tabelkaGW4.Rows[0][7].ToString().Trim();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tabela 4 " + ex.Message);
                }
                try
                {
                    //cm.log.Info("OGLR2: wczytywanie danych do tabeli 5");
                    tabelkaGW5 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 5, 8, 2, tenPlik);

                    Session["tabelka005"] = tabelkaGW5;
                    tab_06_w01_c01.Text = tabelkaGW5.Rows[0][1].ToString().Trim();
                    tab_06_w02_c01.Text = tabelkaGW5.Rows[1][1].ToString().Trim();
                    tab_06_w03_c01.Text = tabelkaGW5.Rows[2][1].ToString().Trim();
                    tab_06_w04_c01.Text = tabelkaGW5.Rows[3][1].ToString().Trim();
                    tab_06_w05_c01.Text = tabelkaGW5.Rows[4][1].ToString().Trim();
                    tab_06_w06_c01.Text = tabelkaGW5.Rows[5][1].ToString().Trim();
                    tab_06_w07_c01.Text = tabelkaGW5.Rows[6][1].ToString().Trim();
                }
                catch (Exception ex)
                {
                    cm.log.Error("OGLR2: " + ex.Message);
                }

                try
                {
                    Session["tabelka006"] = dr.tworzTabele(int.Parse((string)Session["id_dzialu"]), 6, Date1.Date, Date2.Date, 30, Gridview6, tenPlik);
                    Gridview6.DataBind();
                }
                catch (Exception ex)
                {
                    cm.log.Error("OGLR2: " + ex.Message);
                }

                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 7");
                Session["tabelka007"] = dr.tworzTabele(int.Parse((string)Session["id_dzialu"]), 7, Date1.Date, Date2.Date, 9, Gridview7, tenPlik);

                Gridview7.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error("OGLR2: " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));

                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel7.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel8.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;

                infoLabel6.Visible = false;
                infoLabel7.Visible = false;
                infoLabel8.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        protected void makeHeader()
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            #region tabela  1 (wierszowa)

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
            dT_02.Columns.Add("Column6", typeof(string));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));
            dT_03.Columns.Add("Column6", typeof(string));
            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            dT_04.Columns.Add("Column6", typeof(string));

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));
            dT_05.Columns.Add("Column6", typeof(string));

            DataTable dT_07 = new DataTable();
            dT_07.Columns.Clear();
            dT_07.Columns.Add("Column1", typeof(string));
            dT_07.Columns.Add("Column2", typeof(string));
            dT_07.Columns.Add("Column3", typeof(string));
            dT_07.Columns.Add("Column4", typeof(string));
            dT_07.Columns.Add("Column5", typeof(string));
            dT_07.Columns.Add("Column6", typeof(string));

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Columns.Add("Column5", typeof(string));
            dT_08.Columns.Add("Column6", typeof(string));

            dT_01.Clear();
            for (int i = 0; i < 8; i++)
            {
                dT_01.Rows.Add(new Object[] { "1", "Na roz-<br/>prawach", "1", "1" });
                dT_01.Rows.Add(new Object[] { "1", "Na posie-<br/>dzeniach", "1", "1" });
            }

            dT_01.Rows.Add(new Object[] { "2", "Rozpraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "posiedzeń", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Na roz-<br.>prawach", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Na posie-<br/>dzeniach", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "RC", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "RNs", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Nsm", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Rco", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Nmo", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "RCps", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Nkd", "2", "1" });

            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Sędzia", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Pozostałość na początek okresu kontrolnego", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Wpływ", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Średni miesięczny wpływ (w faktycznym czasie pracy)", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Efektywny czas pracy", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Ilość sesji", "3", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Ilośc wyznaczonych spraw", "2", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Ilość spraw odroczonych z rozpraw (bez publikacji!!!)", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Wskaźnik odroczeń", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Razem", "2", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Średnio-<br/>miesięczne załatwienia w efektywnym czasie pracy", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Pozostałość na koniec okresu kontrolnego", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Wielokrotna", "1", "3" });
            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Op", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Opm", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Nw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Liczba spraw na ostatni dzień okresu sprawozdawczego", "4", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Łącznie", "1", "2", "h" });

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "6", "1", "h", "60" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "pow.1 do 3 mies.", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "Ponad 3 mies.", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "w terminie ustawowym ", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego (czyli 14dni+) ", "8", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Sędzia/referntarz", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba sporządzonych uzasadnień", "10", "1", "h" });

            dT_03.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "12", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  3 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_04.Rows.Add(new Object[] { "1", "pow.1 do 3 mies.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_04.Rows.Add(new Object[] { "1", "Ponad 3 mies.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieusprawiedniwione", "1", "1", "h" });

            dT_04.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });

            dT_04.Rows.Add(new Object[] { "2", "w terminie ustawowym ", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego (czyli 14dni+) ", "8", "1", "h" });

            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });

            dT_04.Rows.Add(new Object[] { "3", "Sędzia/referntarz", "1", "3", "h" });
            dT_04.Rows.Add(new Object[] { "3", "Liczba sporządzonych uzasadnień", "10", "1", "h" });

            dT_04.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "12", "1", "h" });

            Session["header_04"] = dT_04;

            #endregion tabela  3 ()

            #region tabela  7 ()

            dT_07.Clear();

            for (int i = 0; i < 8; i++)
            {
                dT_07.Rows.Add(new Object[] { "1", "wpływi", "1", "1", "h" });
                dT_07.Rows.Add(new Object[] { "1", "pozostałość", "1", "1", "h" });
            }

            dT_07.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });

            dT_07.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            dT_07.Rows.Add(new Object[] { "2", "RC", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "Rco", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "RCps", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });
            dT_07.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h" });

            dT_07.Rows.Add(new Object[] { "3", "Wielkośći stan referantów (przy czym wiekość odpowiada liczbie spraw, które wpłynęły do referatu w okresie objętym notatką, a stan liczbę pozostałości)", "18", "1", "h" });

            Session["header_07"] = dT_07;

            #endregion tabela  7 ()

            #region tabela  8 ()

            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });

            dT_08.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "Od 3 do 5 lat", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "Od 5 do 8 lay", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 8 lat", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_08.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });

            dT_08.Rows.Add(new Object[] { "2", "Ilość spraw cywilnych w których postępowanie toczy się powyżej 3 lat (na koniec wrzesnia i marca kolejnych lat)", "9", "1", "h" });

            Session["header_08"] = dT_08;

            #endregion tabela  8 ()
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                //	id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela2Title.Text = "Postępowanie wykonawcze za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    lbTabela4Title.Text = "Sprawność postępowania międzyinstancyjnego w okresach wskazanych we wstępnej części pisma za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    lbTabela5Title.Text = "Sprawy Zawieszone za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela6Title.Text = "Wielkość i stan referatów (przy czym wielkość odpowiada liczbie spraw, które wpłynęły do referatu w okresie objętym notatką, a stan liczbę pozostałości). za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela7Title.Text = "Ilość spraw cywilnych w których postępowanie toczy się powyżej 3 lat (na koniec września i marca kolejnych lat): za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2Title.Text = "Postępowanie wykonawcze za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za okres od" + Date1.Text + " do  " + Date2.Text;

                    lbTabela4Title.Text = "Sprawność postępowania międzyinstancyjnego w okresach wskazanych we wstępnej części pisma za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela5Title.Text = "Sprawy Zawieszone za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela6Title.Text = "Wielkość i stan referatów (przy czym wielkość odpowiada liczbie spraw, które wpłynęły do referatu w okresie objętym notatką, a stan liczbę pozostałości). za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela7Title.Text = "Ilość spraw cywilnych w których postępowanie toczy się powyżej 3 lat (na koniec września i marca kolejnych lat): za okres od" + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglr2.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglr2";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataTable table = (DataTable)Session["tabelka001"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 32, 0, 5, false,true, false, false, false);

                //druga

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                table = (DataTable)Session["tabelka002"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table, 6, 0, 4, false, true, false, false, false);

                //traeci

                ExcelWorksheet MyWorksheet3 = MyExcel.Workbook.Worksheets[3];

                table = (DataTable)Session["tabelka003"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");

                MyWorksheet3 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table, 11, 0, 5, false, true, false, false, false);

                // czwarta statyczna

                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 1, 7, 0, 6, false);

                //piata statyczna
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 7, 1, 1, 3, false);

                // szósta

                ExcelWorksheet MyWorksheet6 = MyExcel.Workbook.Worksheets[6];

                table = (DataTable)Session["tabelka006"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");

                MyWorksheet6 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], table, 17, 0, 4, false, true, false, false, false);

                // siódma

                ExcelWorksheet MyWorksheet7 = MyExcel.Workbook.Worksheets[7];

                table = (DataTable)Session["tabelka007"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");

                MyWorksheet7 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], table, 8, 0, 3, false, false, false, false, false);

                // ósma

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

            odswiez();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }
        /*
        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }
      
        protected void makeSumRow(DataTable table, GridViewRowEventArgs e)
        {
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                try
                {
                    sumObject = table.Compute("Sum(" + "d_" + (i - 1).ToString("D2") + ")", "");
                    e.Row.Cells[i].Text = sumObject.ToString();
                }
                catch (Exception)
                { }
            }
        }
  */
        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e);
               
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void Gridview2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(dT, Gridview2);
            }
        }

        protected void Gridview2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void Gridview1_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(dT, Tabela1);
            }
        }

        protected void Gridview1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void naglowekTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(dT, Tabela1);
            }
        }

        protected void stopkaTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void naglowekTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(dT, Gridview2);
            }
        }

        protected void naglowekTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(dT, Gridview3);
            }
        }

        protected void NaglowekTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_07"];
                tabela.makeHeader(dT, Gridview6);
            }
        }

        protected void stopkaTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void Gridview3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void naglowekTabeli8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_08"];
                tabela.makeHeader(dT, Gridview7);
            }
        }

        protected void stopkaTabeli8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka007"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void Gridview6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        {
                        }
                    }
                }
            }
        }// end of pisz
    }
}