/*
Last Update:
     - version 1.190414
Creation date: 2018-11-21

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class okrk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        private int storid = 0;
        private int rowIndex = 1;

        public static string tenPlik = "okrk.aspx";

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

                    if (Date1.Text.Length == 0)
                    {
                        Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                    }

                    if (Date2.Text.Length == 0)
                    {
                        Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                    }

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

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka001"] = tabelka01;
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = tabelka01;
            GridView1.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka003"] = tabelka01;
            GridView3.DataSource = null;
            GridView3.DataSourceID = null;
            GridView3.DataSource = tabelka01;
            GridView3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka004"] = tabelka01;
            GridView4.DataSource = null;
            GridView4.DataSourceID = null;
            GridView4.DataSource = tabelka01;
            GridView4.DataBind();
        }

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
            string txt = string.Empty;

            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka002"] = tabelka01;
                //row 1
                tabela_1();
                tabela_3();
                tabela_4();
                tabela_5();
            }
            catch (Exception ex)
            {
                txt = txt + ex.Message + Environment.NewLine;
            }

            // dopasowanie opisów
            makeLabels();

            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;
            Label11.Visible = false;
            infoLabel2.Visible = false;
            infoLabel3.Visible = false;

            infoLabel5.Visible = false;
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = cl.debug(int.Parse(yyx));

                infoLabel5.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_5()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka005"] = tabelka01;
            GridView5.DataSource = null;
            GridView5.DataSourceID = null;
            GridView5.DataSource = tabelka01;
            GridView5.DataBind();
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

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h", "60" });
            dT_01.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h", "60" });

            dT_01.Rows.Add(new Object[] { "1", "wyroki łączne", "1", "1", "h", "60" });
            dT_01.Rows.Add(new Object[] { "1", "tryby szybkie (335,338a,336,387kpk)", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h", "60" });
            dT_01.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h", "60" });

            dT_01.Rows.Add(new Object[] { "2", "Urlopy", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Zwolnienia", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "po upływie teminu ustawowego", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra- <br/>wiedliwione", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2", "h", "120" });

            dT_01.Rows.Add(new Object[] { "2", "K", "4", "1", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h", "120" });

            dT_01.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "W", "2", "1", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h", "120" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });

            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });
            dT_01.Rows.Add(new Object[] { "3", "Funkcja.", "1", "3", "h", "10" });
            dT_01.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_01.Rows.Add(new Object[] { "3", "Liczba sesji", "1", "3", "h", "60" });
            dT_01.Rows.Add(new Object[] { "3", "Etat", "1", "3", "h", "60" });
            dT_01.Rows.Add(new Object[] { "3", "Nieobecności", "2", "1", "h", "45" });
            dT_01.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień", "4", "1", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień orzeczeń merytorycznych", "4", "1", "h", "45" });
            dT_01.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "ZAŁATWIENIA", "11", "1", "h", "45" });
            dT_01.Rows.Add(new Object[] { "3", "UWAGI", "1", "3", "h", "45" });

            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "2", "RC", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNc", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RCo", "2", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h", "120" });

            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "2", "", "2", "1", "h", "120" });

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "22", "1", "h", "45" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Posiedzeni", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Posiedzeni", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "K", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "W", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "K", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stanowisko.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wyznaczenia", "9", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stan referatów ( pozostałość na sędziego)", "7", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesieczny wpływ ( w faktycznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Uwagi", "1", "3", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();
            //Alk	Op	Opm	Nw

            dT_04.Rows.Add(new Object[] { "1", "poprzednich okresów", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "bieżącego m-ca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "z", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "2", "z", "1", "1", "h" });

            dT_04.Rows.Add(new Object[] { "2", "Wyrok", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Wyrok zaoczny", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Postanowienie", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "zaw.", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Inne", "1", "2" });

            // dT_04.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "3", "Wyznaczonych", "1", "3", "h" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwionych", "2", "1", "h" });
            dT_04.Rows.Add(new Object[] { "3", "Odroczonych (liczba % w stosunku do wyznaczon.)", "2", "2", "h" });

            dT_04.Rows.Add(new Object[] { "3", "Inne", "5", "1", "h" });

            dT_04.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
            dT_04.Rows.Add(new Object[] { "4", "Sędzia", "1", "4", "h" });
            dT_04.Rows.Add(new Object[] { "4", "Ilość spraw", "10", "1", "h" });
            Session["header_04"] = dT_04;

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "Dyzur areszt.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Urlop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "L4 (opieka nad dzieckiem)", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilosc wokand wynikających z zakresu czynności", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "czas sesyjny Spraw merytorycznych", "1", "2", "H" });

            dT_05.Rows.Add(new Object[] { "2", "Przzyczyna nie wyznaczania wokand (w dniach)", "3", "1", "H" });

            Session["header_05"] = dT_05;

            #endregion tabela  5 ()
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(dT, GridView3);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_04"];
                tabela.makeHeader(dT, GridView4);
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
                    tabela1Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela3Label.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Tabela4label.Text = "Postępowanie wykonawcze w miesiącu " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela1Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela3Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    Tabela4label.Text = "Postępowanie wykonawcze w okresie od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            { }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\okrk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\okrk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];

                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 27, 0, 9, true, false, true, true, true);

                rowik = table.Rows.Count + 3;
                //------------
                MyWorksheet1.Cells[rowik + 6, 1, rowik + 17, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 6, 1].Value = "RAZEM";
                MyWorksheet1.Cells[rowik + 6, 1, rowik + 17, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 6, 4, rowik + 6, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 6, 4].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 6, 4, rowik + 6, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 7, 4, rowik + 7, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 4].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 7, 4, rowik + 7, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 8, 4, rowik + 8, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 4].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 8, 4, rowik + 8, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 9, 4, rowik + 9, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 4].Value = "Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 9, 4, rowik + 9, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 10, 4, rowik + 10, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 4].Value = "powyżej 3 - 6 miesięcy";
                MyWorksheet1.Cells[rowik + 10, 4, rowik + 10, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 11, 4, rowik + 11, 19].Merge = true;

                MyWorksheet1.Cells[rowik + 11, 4].Value = " powyżej 6 - 12 miesięcy";
                MyWorksheet1.Cells[rowik + 11, 4, rowik + 11, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = " ponad 12 miesięcy";
                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 14].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 13, 4, rowik + 17, 6].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = " w tym";
                MyWorksheet1.Cells[rowik + 13, 7, rowik + 13, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 7].Value = "powyżej 12 miesiecy  - 2 lat";
                MyWorksheet1.Cells[rowik + 13, 4, rowik + 17, 6].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                MyWorksheet1.Cells[rowik + 13, 7, rowik + 13, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 14, 7, rowik + 14, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 7].Value = "powyżej 2 lat - do 3 lat";
                MyWorksheet1.Cells[rowik + 14, 7, rowik + 14, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 15, 7, rowik + 15, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 7].Value = "powyżej 3 lat - do 5 lat";
                MyWorksheet1.Cells[rowik + 15, 7, rowik + 15, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 16, 7, rowik + 16, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 7].Value = "powyżej 5 lat - do 8 lat";
                MyWorksheet1.Cells[rowik + 16, 7, rowik + 16, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 17, 7, rowik + 17, 19].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 7].Value = "powyżej 8 lat";
                MyWorksheet1.Cells[rowik + 17, 7, rowik + 17, 19].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j < ilWierszy - 4)
                    {
                        try
                        {
                            tabela.komorkaExcela(MyWorksheet1, rowik + 6, 20, dR[1].ToString().Trim(), true, 0, 1, true, false);
                        }
                        catch
                        {
                        }

                        for (int i = 2; i < 5; i++)
                        {
                            try
                            {
                                tabela.komorkaExcela(MyWorksheet1, rowik + 6, i + 20, dR[i].ToString().Trim(), false, 0, 0, true, false);
                            }
                            catch
                            {
                                //     MyWorksheet1.Cells[rowik + 6, i + 15].Value = dR[i].ToString().Trim();
                            }
                        }
                        // kolejna podwojna

                        try
                        {
                            tabela.komorkaExcela(MyWorksheet1, rowik + 6, 25, dR[5].ToString().Trim(), true, 0, 1, true, false);
                        }
                        catch
                        {
                        }
                        // pojedyncze
                        for (int i = 6; i < 11; i++)
                        {
                            try
                            {
                                tabela.komorkaExcela(MyWorksheet1, rowik + 6, i + 21, dR[i].ToString().Trim(), false, 0, 0, true, false);
                            }
                            catch
                            {
                            }
                        }

                        rowik++;
                        j++;
                        if (j > 11)
                        {
                            break;
                        }
                    }
                }

                // trzecia

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 18, 0, 9, true, true, true, true, true);
                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka004"], 11, 0, 5, false, true, false, false, false);
                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka005"], 7, 0, 4, true, true, false, false, false);

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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(dT, GridView1);
            }
            else
            {
                if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
                {
                    rowIndex = 0;
                    AddNewRow(sender, e);
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                //  DataTable table = ((DataView)tabela_1.Select(DataSourceSelectArguments.Empty)).ToTable();
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["tabelka003"], e, 2);
            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["tabelka004"], e);
            }
        }

        private GridViewRow wierszTabeli(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("Razem", 12, 3, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 14, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza - 1][0].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze

            //trzy pojedyncze
            for (int i = 1; i < 11; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
          /*  NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!4!3')\">" + tabelka01.Rows[idWiersza - 1][4].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 5; i < 10; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
          */
            return NewTotalRow;
        }

        private GridViewRow wierszTabeli1(int idWiersza, string idtabeli, string tekst)
        {
            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            // nowy wiersz
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 14, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza - 1][0].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze

            //trzy pojedyncze
            for (int i = 1; i < 11; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
            /*NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!4!3')\">" + tabelka01.Rows[idWiersza - 1][4].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 5; i < 10; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            */
            return NewTotalRow;
        }

        private GridViewRow wierszTabeli2(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("w tym", 5, 2, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 12, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza - 1][0].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze

            //trzy pojedyncze
            for (int i = 1; i < 11; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            /*//podwojna komorka pod w
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!4!3')\">" + tabelka01.Rows[idWiersza - 1][4].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
                                                                                                                                                                                                                                                                                    //trzy pojedyncze
            for (int i = 5; i < 10; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }*/

            return NewTotalRow;
        }

        private GridViewRow wierszTabeli3(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 12, "borderTopLeft  "));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza - 1][0].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze

            //trzy pojedyncze
            for (int i = 1; i < 11; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
        /*    NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!4!3')\">" + tabelka01.Rows[idWiersza - 1][4].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 5; i < 10; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
        */
            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";
            //  DataTable tabelka01 = (DataTable)Session["tabelka001"];

            // nowy wiersz
            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli(idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "wpływ"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "pozostałość na następny miesiąc"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "powyżej 3-6 m-cy"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "powyżej 6-12 m-cy"));
            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "ponad 12 miesięcy "));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "powyżej 12 miesięcy - do 2 lat"));

            // nowy wiersz
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 2 lat - do 3 lat"));
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 3 lat - do 5 lat"));
            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 5 lat - do 8 lat"));
            idWiersza = 12;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 8 lat"));
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void NaglowekTabeli5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(dT, GridView5);
            }
        }

        protected void stopkaTabeli5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["header_04"], e);
            }
        }
    }
}