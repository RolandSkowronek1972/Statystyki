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
    public partial class ansp : System.Web.UI.Page
    {
        private HSSFWorkbook hssfworkbook;
        public Class1 cl = new Class1();
        public pdfTables pdfT = new pdfTables();
        public common cm = new common();
        public tabele tabela = new tabele();
        public static string tenPlik = "ansp.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null)
                {
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

        protected void makeHeader()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("exl1", typeof(int));
            dT_01.Columns.Add("exl2", typeof(int));
            dT_01.Columns.Add("exl3", typeof(int));
            dT_01.Columns.Add("exl4", typeof(int));
            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("exl1", typeof(int));
            dT_02.Columns.Add("exl2", typeof(int));
            dT_02.Columns.Add("exl3", typeof(int));
            dT_02.Columns.Add("exl4", typeof(int));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("exl1", typeof(int));
            dT_03.Columns.Add("exl2", typeof(int));
            dT_03.Columns.Add("exl3", typeof(int));
            dT_03.Columns.Add("exl4", typeof(int));
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

            #region tabela  1 (wierszowa)

            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1", 0, 0, 1, 1 });
            dT_01.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1", 0, 0, 2, 2 });
            dT_01.Rows.Add(new Object[] { "2", "U", "1", "2", 0, 0, 1, 1 });
            dT_01.Rows.Add(new Object[] { "2", "Ua", "1", "2", 0, 0, 2, 2 });
            dT_01.Rows.Add(new Object[] { "2", "Uo", "1", "2", 0, 0, 3, 3 });
            dT_01.Rows.Add(new Object[] { "2", "Uz", "1", "2", 0, 0, 4, 4 });
            dT_01.Rows.Add(new Object[] { "2", "P", "1", "2", 0, 0, 5, 5 });
            dT_01.Rows.Add(new Object[] { "2", "Np", "1", "2", 0, 0, 6, 6 });
            dT_01.Rows.Add(new Object[] { "2", "Po", "1", "2", 0, 0, 7, 7 });
            dT_01.Rows.Add(new Object[] { "2", "Pa", "1", "2", 0, 0, 8, 8 });
            dT_01.Rows.Add(new Object[] { "2", "Pz", "1", "2", 0, 0, 9, 9 });
            dT_01.Rows.Add(new Object[] { "2", "WSC", "2", "1", 0, 1, 10, 11 });
            dT_01.Rows.Add(new Object[] { "2", "S", "1", "2", 0, 1, 12, 12 });

            dT_01.Rows.Add(new Object[] { "2", "Łącznie", "1", "2", 0, 1, 13, 13 });

            dT_01.Rows.Add(new Object[] { "3", "Ruch spraw", "1", "3", 0, 1, 0, 0 });
            dT_01.Rows.Add(new Object[] { "3", "sprawy wg. repertoriów lub wykazów", "13", "1", 0, 0, 1, 13 });

            Session["header_01"] = dT_01;
            makeHeader1(sn, dT_01);

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1", 0, 0, 1, 1 });
            dT_02.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1", 0, 0, 1, 1 });
            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1", 0, 0, 1, 1 });
            dT_02.Rows.Add(new Object[] { "1", "W tym nieusprawie-<br/>dliwione", "1", "1", 0, 0, 1, 1 });
            dT_02.Rows.Add(new Object[] { "1", "Urlopy", "1", "1", 0, 0, 1, 1 });
            dT_02.Rows.Add(new Object[] { "1", "Zwolnienia", "1", "1", 0, 0, 1, 1 });

            dT_02.Rows.Add(new Object[] { "2", "Rozprawy razem (31)", "1", "2", 0, 1, 4, 4 });
            dT_02.Rows.Add(new Object[] { "2", "posiedzenia razem", "1", "2", 0, 1, 5, 5 });
            dT_02.Rows.Add(new Object[] { "2", "U", "1", "2", 0, 1, 6, 6 });
            dT_02.Rows.Add(new Object[] { "2", "Ua", "1", "2", 0, 1, 7, 7 });
            dT_02.Rows.Add(new Object[] { "2", "Uo", "1", "2", 0, 1, 8, 8 });
            dT_02.Rows.Add(new Object[] { "2", "Uz", "1", "2", 0, 1, 9, 9 });
            dT_02.Rows.Add(new Object[] { "2", "P", "1", "2", 0, 1, 9, 9 });
            dT_02.Rows.Add(new Object[] { "2", "Np", "1", "2", 0, 1, 10, 10 });
            dT_02.Rows.Add(new Object[] { "2", "Po", "1", "2", 0, 1, 11, 11 });
            dT_02.Rows.Add(new Object[] { "2", "Pa", "1", "2", 0, 1, 12, 12 });
            dT_02.Rows.Add(new Object[] { "2", "Pz", "1", "2", 0, 1, 13, 13 });
            dT_02.Rows.Add(new Object[] { "2", "WSC", "2", "1", 0, 0, 14, 15 });
            dT_02.Rows.Add(new Object[] { "2", "S", "1", "2", 0, 1, 12, 12 });
            dT_02.Rows.Add(new Object[] { "2", "Razem", "1", "2", 0, 1, 13, 13 });

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", 0, 2, 0, 0 });
            dT_02.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", 0, 2, 1, 1 });
            dT_02.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3", 0, 2, 2, 2 });
            dT_02.Rows.Add(new Object[] { "3", "Funkcja", "1", "3", 0, 2, 3, 3 });

            dT_02.Rows.Add(new Object[] { "3", "Liczba sesji", "2", "1", 0, 0, 6, 8 });
            dT_02.Rows.Add(new Object[] { "3", "Załatwienia", "13", "1", 0, 0, 9, 19 });
            dT_02.Rows.Add(new Object[] { "3", "Ilość sporządzonych uzasadnień", "1", "3", 0, 3, 20, 20 });
            dT_02.Rows.Add(new Object[] { "3", "Ilość uzasadnień po terminie ustawowym bądz przedłużonym", "2", "2", 0, 1, 21, 22 });
            dT_02.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", 0, 3, 23, 23 });

            dT_02.Rows.Add(new Object[] { "3", "Nieobecności", "2", "2", 0, 1, 24, 25 });
            Session["header_02"] = dT_02;

            makeHeader2(sn, dT_02);

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1" });
            dT_03.Rows.Add(new Object[] { "2", "U", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Ua", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Uo", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Uz", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "P", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Np", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Po", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Pa", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Pz", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "2", "1" });
            dT_03.Rows.Add(new Object[] { "2", "S", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Funkcja", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Wyznaczenia", "13", "1" });
            dT_03.Rows.Add(new Object[] { "3", "Odroczenia - liczba spraw odroczonych", "1", "3" });

            Session["header_03"] = dT_03;
            makeHeader3(sn, dT_03);

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "2", "GU bez ,,of'", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GU ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GU Razem", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp bez  ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "2", "GN", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Gzd", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUo", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUn", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUz", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUk", "1", "2" });

            dT_04.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1" });

            Session["header_04"] = dT_04;
            makeHeader4(sn, dT_04);

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand Łącznie", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw ", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z posiedzeń  ", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            Session["header_05"] = dT_05;

            makeHeader6(sn, dT_05);

            #endregion tabela  5 ()

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "Za bieżący miesiącZZZZZ", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GU ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GU Razem", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp bez  ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp ''of''", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp Razem", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUk", "1", "1" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "13", "1" });

            dT_06.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });
            Session["header_06"] = dT_06;

            makeHeader7(sn, dT_06);

            #endregion tabela  6 ()

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUk", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Struktura pozostałości (wydział ogółem – liczba spraw)", "13", "1" });

            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_08"] = dT_08;
            makeHeader8(sn, dT_08);

            #endregion tabela  8 ()

            #region tabela  10 ()

            DataTable dT_10 = new DataTable();

            dT_10.Columns.Clear();
            dT_10.Columns.Add("Column1", typeof(string));
            dT_10.Columns.Add("Column2", typeof(string));
            dT_10.Columns.Add("Column3", typeof(string));
            dT_10.Columns.Add("Column4", typeof(string));

            dT_10.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "K razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "W", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "liczba spraw (w tym zawieszone)", "15", "1" });

            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_10"] = dT_10;

            #endregion tabela  10 ()
        }

        protected void odswiez()
        {
            string yyx = (string)Session["id_dzialu"];

            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            txt = "File name: <b>ansc.aspx</b></br>";
            txt = txt + "id działu=" + yyx + "</br>";
            txt = txt + cl.clear_maim_db();
            cl.deleteRowTable();
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1, tenPlik);

            GridView1.DataBind();

            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 6, tenPlik);

            // dopasowanie opisów
            makeLabels();
            GridView2.DataBind();
            GridView1.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            //  GridView5.DataBind();
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
            // makeHeader();
        }

        #region "nagłowki tabel"

        private TableCell HeaderCell_(string text, int columns, int rows)
        {
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = text;
            HeaderCell.ColumnSpan = columns;
            HeaderCell.RowSpan = rows;
            return HeaderCell;
        }

        private GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;
        }

        protected void makeHeader1(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader2(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader3(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader4(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader6(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView5.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader7(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView6.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader8(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView7.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
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
                    Label17.Text = "Wyznaczenia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label19.Text = "Załatwienia  z ubieglego miesiąca w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                   
                }
                else
                {
                    Label17.Text = "Wyznaczenia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label19.Text = "Załatwienia  z ubieglego miesiąca w okresie od:   " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            { }
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

        private DataRow[] getData(DataTable dTab, string expression)
        {
            DataRow[] foundRows = null;
            if (dTab != null)
            {
                foundRows = dTab.Select(expression);
            }
            return foundRows;
        }

        private void generate_my_data()
        {
            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");//*

            DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();

            DataTable dT = (DataTable)Session["header_01"];
            table.TableName = "Załatwienia";
            table.Columns.Remove("id_");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 0, 0);
            IRow row0 = sheet0.CreateRow(0);

            #region tabela1

            foreach (DataRow dR in getData(dT, "Column1=3"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row0.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1, exc2, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            row0 = sheet0.CreateRow(1);
            foreach (DataRow dR in getData(dT, "Column1=2"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row0.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1 + 1, exc2 + 1, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            row0 = sheet0.CreateRow(2);
            foreach (DataRow dR in getData(dT, "Column1=1"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row0.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1 + 2, exc2 + 2, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            int rol = 3;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
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

            #endregion tabela1

            #region drugi arkusz

            // druga tabela
            view = (DataView)dane_do_tabeli_2.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
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
            //
            //robienie
            int ro = 2;

            //-----------------

            IDataFormat format = hssfworkbook.CreateDataFormat();

            ISheet sheet1 = hssfworkbook.CreateSheet("Załatwienia");
            IRow row2 = sheet1.CreateRow(0);

            dT.Clear();
            dT = (DataTable)Session["header_02"];
            //===========

            foreach (DataRow dR in getData(dT, "Column1=3"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row2.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1, exc2, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            row2 = sheet0.CreateRow(1);
            foreach (DataRow dR in getData(dT, "Column1=2"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row2.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1 + 1, exc2 + 1, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            row2 = sheet0.CreateRow(2);
            foreach (DataRow dR in getData(dT, "Column1=1"))
            {
                string text = dR[1].ToString().Trim();
                int exc1 = int.Parse(dR[4].ToString().Trim());
                int exc2 = int.Parse(dR[5].ToString().Trim());
                int exc3 = int.Parse(dR[6].ToString().Trim());
                int exc4 = int.Parse(dR[7].ToString().Trim());
                row2.CreateCell(exc3).SetCellValue(text);
                if ((exc1 != exc2) || (exc3 != exc4))
                {
                    crs = new NPOI.SS.Util.CellRangeAddress(exc1 + 2, exc2 + 2, exc3, exc4);
                    sheet0.AddMergedRegion(crs);
                }
            }

            rol = 3;
            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet0.CreateRow(rol);
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
                rol++;
            }// end foreach

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

            #endregion drugi arkusz

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

            row2.CreateCell(5).SetCellValue("GU bez ''of''");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("GU ''of''");
            row2.CreateCell(8).SetCellValue("GU Razem");
            row2.CreateCell(9).SetCellValue("GUp bez  '''of'");
            row2.CreateCell(10).SetCellValue("GUp ''of''");
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
            table.Columns.Remove("id_tabeli");
            //table.Columns.Remove("id_dzialu");
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

            row2.CreateCell(5).SetCellValue("GU bez ''of''");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("GU ''of''");
            row2.CreateCell(8).SetCellValue("GU Razem");
            row2.CreateCell(9).SetCellValue("GUp bez  '''of'");
            row2.CreateCell(10).SetCellValue("GUp ''of''");
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
            makeHeader();
        }
    }
}