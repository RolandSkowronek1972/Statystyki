using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class onsr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
       
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "onsr.aspx";

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
            {
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
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1, tenPlik);
                txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 6, tenPlik);
                tabela_02();
                tabela_03();
                tabela_04();
                tabela_05();
                tabela_07();
                /*
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 7, Date1.Date, Date2.Date);*/
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
        }

        private void tabela_02()
        {
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2", cl.debug(int.Parse((string)Session["id_dzialu"])));
            Session["tabelka002"] = dr.tworzTabele((int.Parse((string)Session["id_dzialu"])), 2, Date1.Date, Date2.Date, 23, GridView1, tenPlik);
            GridView1.DataBind();
        }
        private void tabela_03()
        {
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3", cl.debug(int.Parse((string)Session["id_dzialu"])));
            Session["tabelka003"] = dr.tworzTabele((int.Parse((string)Session["id_dzialu"])), 3, Date1.Date, Date2.Date, 23, GridView3, tenPlik);
            GridView3.DataBind();
        }

        private void tabela_04()
        {
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4", cl.debug(int.Parse((string)Session["id_dzialu"])));
            Session["tabelka003"] = dr.tworzTabele((int.Parse((string)Session["id_dzialu"])), 4, Date1.Date, Date2.Date, 23, GridView4, tenPlik);
            GridView4.DataBind();
        }

        private void tabela_05()
        {
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5", cl.debug(int.Parse((string)Session["id_dzialu"])));
            Session["tabelka003"] = dr.tworzTabele((int.Parse((string)Session["id_dzialu"])), 5, Date1.Date, Date2.Date, 23, GridView6, tenPlik);
            GridView6.DataBind();
        }
        private void tabela_07()
        {
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7", cl.debug(int.Parse((string)Session["id_dzialu"])));
            Session["tabelka003"] = dr.tworzTabele((int.Parse((string)Session["id_dzialu"])), 7, Date1.Date, Date2.Date, 23, GridView8, tenPlik);
            GridView8.DataBind();
        }

        #region "nagłowki tabel"

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

            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));

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
            dT_01.Rows.Add(new Object[] { "1", "RC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "RNs", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "RCo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "RCps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "8", "1" });
            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "RC", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "RNs", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "RCo", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "RCps", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_02.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Pozostało z ubiegłego miesiąca", "8", "1" });

            dT_02.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });

            Session["header_02"] = dT_02;
            //  makeHeader1(sn, dT_02);

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_03.Rows.Add(new Object[] { "2", "RC", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Nsm", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "RCo", "1", "2" });
            dT_03.Rows.Add(new Object[] { "1", "Nmo", "1", "2" });
            dT_03.Rows.Add(new Object[] { "1", "RCps", "1", "2" });
            dT_03.Rows.Add(new Object[] { "1", "Nkd", "1", "2" });

            dT_03.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "10", "1" });
            Session["header_03"] = dT_03;
            //  makeHeader3(sn, dT_03);

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "2", "RC", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "RNs", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Nsm", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "RCo", "1", "2" });
            dT_04.Rows.Add(new Object[] { "1", "Nmo", "1", "2" });
            dT_04.Rows.Add(new Object[] { "1", "RCps", "1", "2" });
            dT_04.Rows.Add(new Object[] { "1", "Nkd", "1", "2" });

            dT_04.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwienia", "9", "1" });
            Session["header_04"] = dT_04;
            //   makeHeader4(sn, dT_04);

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "WYZNACZONYCH", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "ODROCZONYCH", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "WYZNACZONYCH", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "ODROCZONYCH", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "WYZNACZONYCH", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "ODROCZONYCH", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand  łącznie( wraz z wykonawczymi )", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "ILOŚĆ SPRAW NA WOKANDZIE", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "PROCENT ODROCZEŃ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw  i posiedzeń  jawnych za wyjątkiem posiedzeń wykonawczych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "ILOŚĆ SPRAW NA WOKANDZIE", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "PROCENT ODROCZEŃ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z posiedzeń niejawnych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "ILOŚĆ SPRAW NA WOKANDZIE", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "PROCENT ODROCZEŃ", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Posiedzenia wykonawcze ( jawne i niejawne ) ", "1", "2" });

            Session["header_05"] = dT_05;

            #endregion tabela  5 ()

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 12 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 5 do 8 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "ponad 8 lat", "1", "1" });

            dT_06.Rows.Add(new Object[] { "2", "Opis.", "1", "2" });

            dT_06.Rows.Add(new Object[] { "2", "Struktura pozostałości  -   liczba spraw  ( w tym zawieszone) ", "11", "1" });
            Session["header_06"] = dT_06;
            Session["header_07"] = dT_06;

            //     makeHeader7(sn, dT_06);

            #endregion tabela  6 ()

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "RC", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "RNs", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "RCo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "RCps", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Pozostało z na następny miesiąc", "8", "1" });

            dT_08.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });

            Session["header_08"] = dT_08;

            #endregion tabela  8 ()
        }

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
                DataTable dT = (DataTable)Session["header_03"];
                tb.makeHeader(dT, GridView3);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_04"];
                tb.makeHeader(dT, GridView4);
            }
        }

        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_05"];
                tb.makeHeader(dT, GridView6);
            }
        }

        protected void GridView7_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_07"];
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

        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label8.Text = GridView1.SelectedDataKey[1].ToString() + " " + GridView1.SelectedDataKey[2].ToString();
            makeLabels();
        }

        #endregion "obsługa oncommand  tabel z nazwiskami"

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
                    Label2.Text = "Pozostało na następny miesiąc w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    Label19.Text = "Pozostało z ubiegłego miesiąca za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wpływ za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label34.Text = "Pozostało na następny z okresu od:  " + Date1.Text + " do  " + Date2.Text;
                    Label35.Text = "Struktura pozostałości -liczba spraw (w tym zawieszone) w okresie od:   " + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "Pozostało na następny z okresu od:  " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

      

        protected void Button3_Click(object sender, EventArgs e)
        {


            string path = Server.MapPath("Template") + "\\onsr.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\onsr";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {

                //dane_do_tabeli_1
                DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);
                DataTable table = view.ToTable();
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

              
                tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], table, 10, 8, 0, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 14, 0, 3, true, true, true, true, true, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 10, 0, 3, true, true, true, true, true, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka003"], 9, 0, 3, true, true, true, true, true, false);

                
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
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tb.makeHeader(dT, GridView1);
            }
        }
    }
}