using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class onsk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "onsk.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }
                String IdentyfikatorUzytkownika = string.Empty;
                IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                DataTable parametry = cm.makeParameterTable();
                parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


                if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
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
            { }
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

        private DataTable Header_2()
        {
            DataTable naglowek = tb.SchematTabelinaglowkowej();
            naglowek.Clear();

            naglowek.Rows.Add(new Object[] { "1", "K-publiczne", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K -wyrok łączny", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K-skarb.", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K-pryw.", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K tryb. 55 kpk", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K razem", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "W", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Pozostało z ubiegłego miesiąca", "15", "1" });

            return naglowek;
        }

        private DataTable Header_3()
        {
            DataTable naglowek = tb.SchematTabelinaglowkowej();
            naglowek.Clear();

            naglowek.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            naglowek.Rows.Add(new Object[] { "2", "K-publ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K-wyrok łączny", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K-skarb.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K pryw.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K Tryb 55 kpk", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K Razem", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Ko", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Kp", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Kop", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "W", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            naglowek.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            naglowek.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            naglowek.Rows.Add(new Object[] { "3", "Wpływ", "12", "1" });

            return naglowek;
        }

        private DataTable Header_4()
        {
            DataTable naglowek = tb.SchematTabelinaglowkowej();
            naglowek.Clear();

            naglowek.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            naglowek.Rows.Add(new Object[] { "2", "K-publ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K-wyrok łączny  ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K-skarb.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K pryw.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K Tryb 55 kpk ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "K Razem ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Ko ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Kp ", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Kop", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "W", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            naglowek.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            naglowek.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            naglowek.Rows.Add(new Object[] { "3", "Załatwienia", "12", "1" });
            Session["header_04"] = naglowek;

            return naglowek;
        }

        private DataTable Header_5()
        {
            #region tabela  5 ()

            DataTable naglowek = tb.SchematTabelinaglowkowej();
            naglowek.Clear();

            naglowek.Rows.Add(new Object[] { "1", "K-publiczne", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K -wyrok łączny", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K-skarb.", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K-pryw.", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K tryb. 55 kpk", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "K razem", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "W", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            naglowek.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            naglowek.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });

            naglowek.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "15", "1" });
            return naglowek;

            #endregion tabela  5 ()
        }

        protected void makeHeader()
        {
            #region tabela  1 (wierszowa)

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));

            DataTable naglowek = new DataTable();
            naglowek.Columns.Clear();
            naglowek.Columns.Add("Column1", typeof(string));
            naglowek.Columns.Add("Column2", typeof(string));
            naglowek.Columns.Add("Column3", typeof(string));
            naglowek.Columns.Add("Column4", typeof(string));

            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "K-publ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "K -wyrok łączny", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "K-skarb.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "K-pryw.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "K tryb. 55 kpk", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "K razem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "W", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "11", "1" });
            Session["header_01"] = dT_01;
            //makeHeader2(sn, dT_01);

            #endregion tabela  1 (wierszowa)

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "Ilość spraw wyznaczonych", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Ilość spraw odroczonych", "1", "1" });
            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Ilość wyznaczonych wokand łącznie", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "ilość spraw na wokandach", "2", "1" });
            dT_06.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Ilość wyznaczonych  wokand łacznie", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "ilość spraw  wyznaczonych  na wokandach", "1", "2" });

            Session["header_06"] = dT_06;

            #endregion tabela  6 ()

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "WYZNACZONYCH", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "ODROCZONYCH", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Ilość wyznaczonych wokand łącznie", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "ILOŚĆ SPRAW NA WOKANDZIE", "2", "1" });
            dT_08.Rows.Add(new Object[] { "2", "PROCENT ODROCZEŃ", "1", "2" });

            Session["header_08"] = dT_08;

            #endregion tabela  8 ()

            #region tabela  9 ()

            DataTable dt_09 = new DataTable();

            dt_09.Columns.Clear();
            dt_09.Columns.Add("Column1", typeof(string));
            dt_09.Columns.Add("Column2", typeof(string));
            dt_09.Columns.Add("Column3", typeof(string));
            dt_09.Columns.Add("Column4", typeof(string));

            dt_09.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "suma po wyżej 12 miesięcy", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 5 do 8 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "1", "powyżej 8 lat", "1", "1" });
            dt_09.Rows.Add(new Object[] { "2", "Miesiąc", "1", "2" });
            dt_09.Rows.Add(new Object[] { "2", "liczba spraw (w tym zawieszone)", "11", "1" });

            Session["header_09"] = dt_09;

            #endregion tabela  9 ()

            #region tabela  10 ()

            DataTable dT_10 = new DataTable();

            dT_10.Columns.Clear();
            dT_10.Columns.Add("Column1", typeof(string));
            dT_10.Columns.Add("Column2", typeof(string));
            dT_10.Columns.Add("Column3", typeof(string));
            dT_10.Columns.Add("Column4", typeof(string));

            dT_10.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "suma po wyżej 12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 5 do 8 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "powyżej 8 lat", "1", "1" });
            dT_10.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "liczba spraw (w tym zawieszone)", "11", "1" });

            Session["header_10"] = dT_10;

            #endregion tabela  10 ()

            #region tabela  11 ()

            DataTable dT_11 = new DataTable();

            dT_11.Columns.Clear();
            dT_11.Columns.Add("Column1", typeof(string));
            dT_11.Columns.Add("Column2", typeof(string));
            dT_11.Columns.Add("Column3", typeof(string));
            dT_11.Columns.Add("Column4", typeof(string));

            dT_11.Rows.Add(new Object[] { "1", "SPRAWY według repertoriów i wykazów ", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "K", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "w tym : wyrok łaczny", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "W", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            dT_11.Rows.Add(new Object[] { "1", "Ogółem liczba spraw wyznaczonych", "1", "1" });
            Session["header_10"] = dT_11;

            #endregion tabela  11 ()

            #region tabela  przestawna ()

            DataTable dT_12 = new DataTable();

            dT_12.Columns.Clear();
            dT_12.Columns.Add("Column1", typeof(string));
            dT_12.Columns.Add("Column2", typeof(string));
            dT_12.Columns.Add("Column3", typeof(string));
            dT_12.Columns.Add("Column4", typeof(string));

            dT_12.Rows.Add(new Object[] { "1", "SPRAWY według repertoriów i wykazów ", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "K", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "w tym : wyrok łaczny", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "W", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            dT_12.Rows.Add(new Object[] { "1", "Ogółem liczba spraw wyznaczonych", "1", "1" });
            Session["header_12"] = dT_12;

            #endregion tabela  przestawna ()
        }

        protected void odswiez()
        {
            Session["data_1"] = Date1.Text;
            Session["data_2"] = Date2.Text;
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            txt = "File name: <b>onsk.aspx</b></br>";

            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1, tenPlik);
                txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 10, tenPlik);

                try
                {
                    DataTable dt01 = cl.generuj_dane_do_tabeli_wierszy_przestawnych1(Date1.Date, Date2.Date, yyx, 1000, 1, tenPlik);
                    cm.log.Error(tenPlik + " generuj_dane_do_tabeli_przestawnych 1000 il wierszy" + dt01.Rows.Count.ToString());

                    GridView13.DataSource = null;
                    GridView13.ShowHeader = false;
                    GridView13.DataSourceID = null;
                    GridView13.AutoGenerateColumns = false;
                    GridView13.DataSource = dt01;
                    GridView13.DataBind();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " generuj_dane_do_tabeli_przestawnych 1000 " + ex.Message);
                }

                try
                {
                    DataTable dt01 = cl.generuj_dane_do_tabeli_wierszy_przestawnych1(Date1.Date, Date2.Date, yyx, 1002, 1, tenPlik);

                    GridView15.DataSource = null;
                    GridView15.ShowHeader = false;
                    GridView15.DataSourceID = null;
                    GridView15.AutoGenerateColumns = false;
                    GridView15.DataSource = dt01;
                    GridView15.DataBind();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " generuj_dane_do_tabeli_przestawnych 1002 " + ex.Message);
                }

                //====================================================
                try
                {
                    DataTable dt01 = cl.generuj_dane_do_tabeli_przestawnych(int.Parse((string)Session["id_dzialu"]), 1001, Date1.Date, Date2.Date, tenPlik);
                    // DataTable dt01 = dr.tworzTabele(int.Parse((string)Session["id_dzialu"]), 1001, Date1.Date, Date2.Date, 30, GridView14, tenPlik);
                    GridView14.DataSource = null;
                    GridView14.ShowHeader = false;
                    GridView14.DataSourceID = null;
                    GridView14.AutoGenerateColumns = false;
                    GridView14.DataSource = dt01;
                    GridView14.DataBind();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " generuj_dane_do_tabeli_przestawnych 1001 " + ex.Message);
                }
                try
                {
                    DataTable dt01 = cl.generuj_dane_do_tabeli_przestawnych(int.Parse((string)Session["id_dzialu"]), 1003, Date1.Date, Date2.Date, tenPlik);

                    GridView16.DataSource = null;
                    GridView16.ShowHeader = false;
                    GridView16.DataSourceID = null;
                    GridView16.AutoGenerateColumns = false;
                    GridView16.DataSource = dt01;
                    GridView16.DataBind();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " generuj_dane_do_tabeli_przestawnych 1003 " + ex.Message);
                }

                DataTable dt1 = cl.generuj_dane_do_tabeli_wierszy_przestawnych1(Date1.Date, Date2.Date, yyx, 2000, 1, tenPlik);

                GridView17.DataSource = null;
                GridView17.ShowHeader = false;
                GridView17.DataSourceID = null;
                GridView17.AutoGenerateColumns = false;
                GridView17.DataSource = dt1;
                GridView17.DataBind();

                DataTable dt2 = cl.generuj_dane_do_tabeli_przestawnych(int.Parse((string)Session["id_dzialu"]), 2001, Date1.Date, Date2.Date, tenPlik);

                GridView18.DataSource = null;
                GridView18.ShowHeader = false;
                GridView18.DataSourceID = null;
                GridView18.AutoGenerateColumns = false;
                GridView18.DataSource = dt2;
                GridView18.DataBind();

                DataTable dt3 = cl.generuj_dane_do_tabeli_wierszy_przestawnych1(Date1.Date, Date2.Date, yyx, 2002, 1, tenPlik);

                GridView19.DataSource = null;
                GridView19.ShowHeader = false;
                GridView19.DataSourceID = null;
                GridView19.AutoGenerateColumns = false;
                GridView19.DataSource = dt3;
                GridView19.DataBind();

                DataTable dt4 = cl.generuj_dane_do_tabeli_przestawnych(int.Parse((string)Session["id_dzialu"]), 2003, Date1.Date, Date2.Date, tenPlik);

                GridView20.DataSource = null;
                GridView20.ShowHeader = false;
                GridView20.DataSourceID = null;
                GridView20.AutoGenerateColumns = false;
                GridView20.DataSource = dt4;
                GridView20.DataBind();

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 8, Date1.Date, Date2.Date);
                txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }

            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            GridView6.DataBind();
            GridView7.DataBind();
            GridView8.DataBind();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            makeHeader();
        }

        #region "nagłowki tabel"

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader(dT, GridView2);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Header_3(), GridView3);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Header_4(), GridView4);
            }
        }

        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Header_5(), GridView6);
            }
        }

        protected void GridView7_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_09"];
                tb.makeHeader(dT, GridView7);
            }
        }

        protected void GridView8_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_08"];
                tb.makeHeader(dT, GridView8);
            }
        }

        protected void GridViewPR_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_10"];
                tb.makeHeader(dT, GridView13);
            }
        }

        protected void GridViewPR2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_10"];
                tb.makeHeader(dT, GridView17);
            }
        }

        protected void GridView9_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_09"];
                tb.makeHeader(dT, GridView9);
            }
        }

        protected void GridView11_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_09"];
                tb.makeHeader(dT, GridView11);
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

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
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    Label19.Text = "Pozostało z ubiegłego miesiąca za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Wpływ za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "Załatwienia na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label34.Text = "Pozostało na następny miesiąc w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label35.Text = "Struktura pozostałości -liczba spraw (w tym zawieszone) w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    Label19.Text = "Pozostało z ubiegłego miesiąca za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wpływ za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label34.Text = "Pozostało na następny z okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label35.Text = "Struktura pozostałości -liczba spraw (w tym zawieszone) w okresie od:   " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin
            string filename = "statystykiWydzialCywilny.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();
        }

        private void InitializeWorkbook()
        {
            hssfworkbook = new HSSFWorkbook();

            SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
            si.Subject = "";
            si.Title = "statystyki";
            hssfworkbook.SummaryInformation = si;
        }

        private MemoryStream WriteToStream()
        {
            //Write the stream data of workbook to the root directory
            MemoryStream file = new MemoryStream();

            hssfworkbook.Write(file);
            return file;
        }

        private void generate_my_data()
        {
            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");

            DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);

            DataTable table = view.ToTable();

            IRow row0 = sheet0.CreateRow(0);
            table.TableName = "Załatwienia";
            table.Columns.Remove("id_");

            row0.CreateCell(0).SetCellValue("Opis");
            row0.CreateCell(1).SetCellValue("Sprawy według repetoriów i wykazów");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 8);
            sheet0.AddMergedRegion(crs);

            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("C");
            row0.CreateCell(2).SetCellValue("CG-G");
            row0.CreateCell(3).SetCellValue("Ns");
            row0.CreateCell(4).SetCellValue("Nc");
            row0.CreateCell(5).SetCellValue("Co");
            row0.CreateCell(6).SetCellValue("Cps");

            row0.CreateCell(7).SetCellValue("WSC");
            row0.CreateCell(8).SetCellValue("Łącznie");

            int rol = 2;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);
                for (int i = 0; i < 9; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row0.CreateCell(i).SetCellValue(ji);
                        row0.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row0.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                rol++;
            }// end foreach

            // druga tabela
            view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table = view.ToTable();
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            //table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");
            //
            //robienie
            int ro = 2;

            //-----------------

            IDataFormat format = hssfworkbook.CreateDataFormat();

            //-----------------

            ISheet sheet1 = hssfworkbook.CreateSheet("Załatwienia");

            IRow row2 = sheet1.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(1).SetCellValue("Nazwisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(2).SetCellValue("Imię");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(3).SetCellValue("Funkcja");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(4).SetCellValue("Stanowisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Liczba sesji");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 6);

            sheet1.AddMergedRegion(crs);

            row2.CreateCell(7).SetCellValue("Załatwienia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 7, 14);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(15).SetCellValue("Il. sporządzonych uzasadnień");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 15, 15);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(16).SetCellValue("Nieobecności");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 16, 17);
            sheet1.AddMergedRegion(crs);

            row2 = sheet1.CreateRow(1);

            row2.CreateCell(5).SetCellValue("rozprawy");
            row2.CreateCell(6).SetCellValue("posiedzenia");
            row2.CreateCell(7).SetCellValue("C");
            row2.CreateCell(8).SetCellValue("C-GC");
            row2.CreateCell(9).SetCellValue("Ns");
            row2.CreateCell(10).SetCellValue("Nc");
            row2.CreateCell(11).SetCellValue("Co");
            row2.CreateCell(12).SetCellValue("Cps");
            row2.CreateCell(13).SetCellValue("WSC");
            row2.CreateCell(14).SetCellValue("Razem");
            row2.CreateCell(16).SetCellValue("Urlopy");
            row2.CreateCell(17).SetCellValue("Zwolnienia");

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet1.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach
             // trzeci sheet

            view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_10");
            table.Columns.Remove("d_11");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");

            sheet1.AutoSizeColumn(0, true);
            sheet1.AutoSizeColumn(1, true);

            ISheet sheet2 = hssfworkbook.CreateSheet("Wyznaczenia");

            row2 = sheet2.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet2.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Wyznaczenia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 12);
            sheet2.AddMergedRegion(crs);

            row2 = sheet2.CreateRow(1);

            row2.CreateCell(5).SetCellValue("C");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("Ns");
            row2.CreateCell(8).SetCellValue("Nc");
            row2.CreateCell(9).SetCellValue("Co");
            row2.CreateCell(10).SetCellValue("Cps");
            row2.CreateCell(11).SetCellValue("WSC");
            row2.CreateCell(12).SetCellValue("Razem");
            row2.CreateCell(13).SetCellValue("Odroczenia liczba spraw odroczonych");
            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet2.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach

            // czwarty sheet

            view = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            //        table.Columns.Remove("id_tabeli");
            //       table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_09");
            table.Columns.Remove("d_10");
            table.Columns.Remove("d_11");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");

            ISheet sheet3 = hssfworkbook.CreateSheet("Stan referatów sędziów");

            row2 = sheet3.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet3.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Pozostało w referatach spraw kategorii");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 12);
            sheet3.AddMergedRegion(crs);

            row2 = sheet3.CreateRow(1);

            row2.CreateCell(5).SetCellValue("C");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("Ns");
            row2.CreateCell(8).SetCellValue("Nc");
            row2.CreateCell(9).SetCellValue("Co");
            row2.CreateCell(10).SetCellValue("Cps");
            row2.CreateCell(11).SetCellValue("WSC");
            row2.CreateCell(12).SetCellValue("Razem");
            // row2.CreateCell(12).SetCellValue("Odroczenia liczba spraw odroczonych");
            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet3.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void show9998(object sender, CommandEventArgs e)
        {
            string eem = e.CommandArgument.ToString();
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Header_2(), GridView1);
            }
        }
    }
}