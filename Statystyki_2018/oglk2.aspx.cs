using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglk2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "oglk2.aspx";

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
            string id_dzialu = (string)Session["id_dzialu"];

            //tabela 1
            try
            {
                DataTable Tabela1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 1, DateTime.Parse(Date1.Date.ToShortDateString()), Date2.Date, 10, tenPlik);
                Session["tabelka001"] = Tabela1;
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.DataSource = Tabela1;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 2
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 2, Date1.Date, Date2.Date, 14, tenPlik);
                Session["tabelka002"] = Tabela2;
                GridView2.DataSource = null;
                GridView2.DataSourceID = null;
                GridView2.DataSource = Tabela2;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            try
            {
                DataTable Tabela3 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 3, Date1.Date, Date2.Date, 5, tenPlik);
                Session["tabelka003"] = Tabela3;
                GridView3.DataSource = null;
                GridView3.DataSourceID = null;
                GridView3.DataSource = Tabela3;
                GridView3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // czwarta
            try
            {
                DataTable TabelaDanych = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 4, 1, 6, tenPlik);
                Session["tabelka004"] = TabelaDanych;
                pisz("tab_04_", 1, 5, TabelaDanych);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            // piąta
            try
            {
                DataTable TabelaDanych = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 5, 1, 8, tenPlik);
                Session["tabelka005"] = TabelaDanych;
                pisz("tab_05_", 1, 8, TabelaDanych);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // szósta
            try
            {
                DataTable Tabela6 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 6, Date1.Date, Date2.Date, 8, tenPlik);
                Session["tabelka006"] = Tabela6;
                GridView6.DataSource = null;
                GridView6.DataSourceID = null;
                GridView6.DataSource = Tabela6;
                GridView6.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // siódma
            try
            {
                DataTable Tabela = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 7, 5, 3, tenPlik);
                Session["tabelka007"] = Tabela;
                pisz("tab_07_", 5, 3, Tabela);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // ósma
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 8, 4, 3, tenPlik);
                Session["tabelka008"] = Tabela4;
                pisz("tab_08_", 4, 3, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dziewiąta
            try
            {
                DataTable Tabela4 = new DataTable();
                Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 9, 4, 3, tenPlik);
                Session["tabelka009"] = Tabela4;
                pisz("tab_09_", 4, 3, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dziesiata
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 10, 18, 8, tenPlik);
                Session["tabelka010"] = Tabela4;
                pisz("tab_10_", 17, 6, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // jedenasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 11, 12, 8, tenPlik);
                Session["tabelka011"] = Tabela4;
                pisz("tab_11_", 5, 6, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dwunasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 12, 4, 2, tenPlik);
                Session["tabelka012"] = Tabela4;
                pisz("tab_12_", 4, 2, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // trzynasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 13, 19, 10, tenPlik);
                Session["tabelka013"] = Tabela4;
                pisz("tab_13_", 18, 9, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // czternasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, id_dzialu, 14, 16, 8, tenPlik);
                Session["tabelka014"] = Tabela4;
                pisz("tab_14_", 15, 6, Tabela4);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();
            try
            {
                bool visible = cl.debug(int.Parse(id_dzialu));
                Label11.Visible = visible;
                infoLabel1.Visible = visible;
                infoLabel2.Visible = visible;
                infoLabel3.Visible = visible;
                infoLabel4.Visible = visible;
                infoLabel5.Visible = visible;
                infoLabel6.Visible = visible;
                infoLabel7.Visible = visible;
                infoLabel8.Visible = visible;
                infoLabel9.Visible = visible;
                infoLabel10.Visible = visible;
                infoLabel11.Visible = visible;
                infoLabel12.Visible = visible;
                infoLabel13.Visible = visible;
                infoLabel14.Visible = visible;
            }
            catch
            {
                Label11.Visible = false;
                infoLabel1.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;

                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
                infoLabel6.Visible = false;
                infoLabel7.Visible = false;
                infoLabel8.Visible = false;
                infoLabel9.Visible = false;
                infoLabel10.Visible = false;
                infoLabel11.Visible = false;
                infoLabel12.Visible = false;
                infoLabel13.Visible = false;
                infoLabel14.Visible = false;
            }
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

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Imię i Nazwisko", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Od 3 do 5 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Od 5 do 8 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Pow. 8 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });
            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "Pow. jednego roku", "1", "1", "h" });

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();
            dT_03.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Areszt powyżej 12 miesięcy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Areszt powyżej 24  miesięcy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "Areszt powyżej 12 miesięcy", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Areszt powyżej 24 miesięcy", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
            Session["header_04"] = dT_04;

            #endregion tabela  4 ()

            #region tabela  6 ()

            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ogółem", "1", "1", "h" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Nazwisko i imie sędziego", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Wpływ do repozytorium/Wykazu", "6", "1", "h" });
            Session["header_06"] = dT_06;

            #endregion tabela  6 ()
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, GridView2);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(sn, dT, GridView2);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(sn, dT, GridView3);
            }
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
                    lbTabela1.Text = "Ilość spraw karnych, w których postępowanie toczy się powyżej 3 lat za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela2.Text = "Ilość spraw wykroczeniowych „W”, w których postępowanie toczy się powyżej 1 roku za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela3.Text = "Sprawy aresztowe na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela4.Text = "Wykaz mediacji na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela5.Text = "Informacja dot. pracy biegłych sądowych (WAB) na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela6.Text = "Informacja z wpływu spraw na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela7.Text = "Sparwy zawieszone na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela8.Text = "Ilość spraw Kp dot. przesłuchania trybie art. 185 a-d kpk na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela9.Text = "Ewidencja spraw odroczonych  na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela10.Text = "TABELA 1- NALEŻNOŚCI SĄDOWE I ZALEGŁOŚCI WE WPŁYWACH DO BUDŻETU SKARBU PAŃSTWA  na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela11.Text = "TABELA 2 - ILOŚĆ (KWOTA) KIEROWANYCH SPRAW DO EGZEKUCJI KOMORNICZYCH na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela12.Text = "TABELA 3 - ILOŚĆ OSÓB (SPRAW PROBACYJNYCH na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela13.Text = "INFORMACJA O REALIZACJI NALEŻNOŚCI na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    lbTabela1.Text = "Ilość spraw karnych, w których postępowanie toczy się powyżej 3 lat za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2.Text = "Ilość spraw wykroczeniowych „W”, w których postępowanie toczy się powyżej 1 roku: za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela3.Text = "Sprawy aresztowe za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela4.Text = "Wykaz mediacji na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela5.Text = "Informacja dot. pracy biegłych sądowych (WAB) na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela6.Text = "Informacja z wpływu spraw na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela7.Text = "Sparwy zawieszone na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela8.Text = "Ilość spraw Kp dot. przesłuchania trybie art. 185 a-d kpk na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela9.Text = "Ewidencja spraw odroczonych  na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela10.Text = "TABELA 1- NALEŻNOŚCI SĄDOWE I ZALEGŁOŚCI WE WPŁYWACH DO BUDŻETU SKARBU PAŃSTWA  na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela11.Text = "TABELA 2 - ILOŚĆ (KWOTA) KIEROWANYCH SPRAW DO EGZEKUCJI KOMORNICZYCH na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela12.Text = "TABELA 3 - ILOŚĆ OSÓB (SPRAW PROBACYJNYCH na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela13.Text = "INFORMACJA O REALIZACJI NALEŻNOŚCI na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
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
            string path = Server.MapPath("Template") + "\\oglk2.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglk2";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 7, 0, 7, false, true, false, false, false);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 1, 0, 7, false, true, false, false, false);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 3, 1, 5, false, true, false, false, false);
                MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 2, 4, 4, 2, false);

            //    MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 3, 1, 5, false, true, false, false, false);
             //   MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 6, 1, 5, false, true, false, false, false);
             //   MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 2, 4, 4, 2, false);
            //   MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 1, 12, 2, 5, false);
             //   MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka008"], 1, 12, 2, 5, false);
            //    MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka009"], 3, 4, 2, 7, false);
            //    MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka010"], 7, 1, 5, false, true, false, false, false);
            //    MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka011"], 7, 1, 5, false, true, false, false, false);
           //     MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka012"], 7, 1, 5, false, true, false, false, false);

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
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void naglowekTabeli1a(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(dT, GridView1);
            }
        }

        protected void naglowekTabeli6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_06"];
                tabela.makeHeader(dT, GridView6);
            }
        }

        protected void stopkaTabeli6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        private void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    try
                    {
                        var kontrolka = this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (kontrolka != null)
                        {
                            var typKontrolki = kontrolka.GetType();
                            var nazwaTypu = typKontrolki.Name;
                            cm.log.Info(tenPlik + " nazwaTypu " + nazwaTypu);
                            if (string.Equals(nazwaTypu.ToString(), "Label"))
                            {
                                cm.log.Info(tenPlik + " Typ Label ");
                                Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                                tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                            }
                            else
                            {
                                cm.log.Info(tenPlik + " Typ textbox ");

                                TextBox tbx = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                                tbx.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error(tenPlik + " pisz " + ex.Message);
                    }
                    /*
                    try
                    {
                        Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (tb != null)
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        TextBox tbx = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (tbx != null)
                        {
                            tbx.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    */
                }
            }
        }// end of pisz
    }
}