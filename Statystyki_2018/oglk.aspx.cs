using OfficeOpenXml;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    using System;

    public partial class oglk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private int storid = 0;
        private int rowIndex = 1;
        private const string tenPlik = "oglk.aspx";

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
                //   Server.Transfer("default.aspx");
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

            string txt = string.Empty;
            cl.deleteRowTable();

            try
            {
                //cm.log.Info(tenPlik+ "ładowanie danych do tabeli 2");
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, false, tenPlik);
                Session["tabelka002"] = tabelka01;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            tabela_1();
            tabela_3();
            tabela_5();

            try
            {
                DataTable tabelka04 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 4, 10, 2, false, tenPlik);
                Session["tabelka004"] = tabelka04;

                // wypełnianie danych labeli
                tab_4_w01_c01.Text = tabelka04.Rows[0][1].ToString().Trim();
                tab_4_w01_c02.Text = tabelka04.Rows[0][2].ToString().Trim();

                tab_4_w02_c01.Text = tabelka04.Rows[1][1].ToString().Trim();
                tab_4_w02_c02.Text = tabelka04.Rows[1][2].ToString().Trim();

                tab_4_w03_c01.Text = tabelka04.Rows[2][1].ToString().Trim();
                tab_4_w03_c02.Text = tabelka04.Rows[2][2].ToString().Trim();

                tab_4_w04_c01.Text = tabelka04.Rows[3][1].ToString().Trim();
                tab_4_w04_c02.Text = tabelka04.Rows[3][2].ToString().Trim();

                tab_4_w05_c01.Text = tabelka04.Rows[4][1].ToString().Trim();
                tab_4_w05_c02.Text = tabelka04.Rows[4][2].ToString().Trim();

                tab_4_w06_c01.Text = tabelka04.Rows[5][1].ToString().Trim();
                tab_4_w06_c02.Text = tabelka04.Rows[5][2].ToString().Trim();

                tab_4_w07_c01.Text = tabelka04.Rows[6][1].ToString().Trim();
                tab_4_w07_c02.Text = tabelka04.Rows[6][2].ToString().Trim();

                tab_4_w08_c01.Text = tabelka04.Rows[7][1].ToString().Trim();
                tab_4_w08_c02.Text = tabelka04.Rows[7][2].ToString().Trim();

                tab_4_w09_c01.Text = tabelka04.Rows[8][1].ToString().Trim();
                tab_4_w09_c02.Text = tabelka04.Rows[8][2].ToString().Trim();

                tab_4_w10_c01.Text = tabelka04.Rows[9][1].ToString().Trim();
                tab_4_w10_c02.Text = tabelka04.Rows[9][2].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            GridView3.DataBind();
            GridView5.DataBind();

            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel2.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel3.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel4.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel5.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            Session["tabelka001"] = dr.tworzTabele(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, GridView1, tenPlik);
            GridView1.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            Session["tabelka003"] = dr.tworzTabele(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 35, GridView3, tenPlik);
            GridView3.DataBind();
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            Session["tabelka005"] = dr.tworzTabele(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 40, GridView5, tenPlik);
            GridView5.DataBind();
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

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));
            dT_06.Columns.Add("Column6", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "8", "1" });
            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "1", "2", "1", "h", "165" });//
            dT_02.Rows.Add(new Object[] { "1", "2", "1", "1", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "1", "3", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "4", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "5", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "6", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "7", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "8", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "9", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "10", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "11", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "12", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "13", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "14", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "15", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "16", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "17", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "18", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "19", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "20", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "21", "1", "1", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "2", "pub- liczne", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "prywatki", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "wyrokiem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "nakazem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "inne", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "Ko", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "1Ko", "1", "1", "h", "45" });//;

            dT_02.Rows.Add(new Object[] { "3", "K", "1", "2", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego  ", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "załawione", "3", "1", "h", "135" });//
            dT_02.Rows.Add(new Object[] { "3", "Ko", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "Kp", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "W", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "w tym zała- twione na podst. art.. 93 kpw (NK)", "1", "2", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "4", "Dni rozp- rawy", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Dni posie- dzeń", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Karne", "10", "1", "h", "450" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Wykrocze- niowe", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "4", "Kop", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy karne i wykro- cze- niowe", "1", "3", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "5", "L.p.", "1", "4", "h", "35" });

            dT_02.Rows.Add(new Object[] { "5", "Sędzia", "1", "4", "h", "130" });//Choroby I urlopy w dniach roboczych
            dT_02.Rows.Add(new Object[] { "5", "Choroby i urlopy w dniach roboczych", "1", "4", "h", "130" });//

            dT_02.Rows.Add(new Object[] { "5", "Ilość sesji", "2", "1", "h", "90" });
            dT_02.Rows.Add(new Object[] { "5", "Ilość spraw skier. na wokandy", "1", "4", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "5", "Załatwienia", "14", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "5", "Med", "1", "4", "h", "45" });
            dT_02.Rows.Add(new Object[] { "5", "Sprawy zawie- szone", "1", "4", "h", "45" });
            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "W   ", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ogółem", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nazwisko i imię", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wpływ do repertorium/wykazu", "6", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "L", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Efektywny okres oczekiwania", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wyznaczonych ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość odroczeń ", "2", "1", "H" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość przerw ", "2", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Załatwienia ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie K", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Stan referatów ", "6", "1", "H" });
            Session["header_05"] = dT_05;

            dT_06.Clear();
            dT_06.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Stan referatów ", "6", "1", "H" });

            Session["header_06"] = dT_06;

            #endregion tabela  5 ()
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];
                tb.makeHeader(dT, GridView3);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_05"];
                tb.makeHeader(dT, GridView5);
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
                    tabela2Label.Text = "Informacja z ruchu spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Informacja z wpływu spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label2.Text = "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //     Label15.Text = "Załatwienia na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Informacja z ruchu spraw za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Informacja z wpływu spraw za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    //    Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

     
        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 21, 0, 7, false, false, false, false, false);
                // pod tabela z tebeli nr 2

                // obwodnia
                rowik = table.Rows.Count;
                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {
                    for (int i = 1; i < 22; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                }
                //------------

                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 1, rowik + 11, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 1, rowik + 17, 1].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 1].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 12, 2, rowik + 12, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 2].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13, 2, rowik + 13, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 2].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 2, rowik + 14, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 2].Value = " 6-12 miesięcy";
                MyWorksheet1.Cells[rowik + 15, 2, rowik + 15, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 2].Value = " 12-24 miesięcy (do 2 lat)";

                MyWorksheet1.Cells[rowik + 16, 2, rowik + 16, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 2].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17, 2, rowik + 17, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 2].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;

                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j <= ilWierszy - 10)
                    {
                        for (int i = 2; i < 18; i++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {
                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = dR[i - 1].ToString().Trim();
                            }
                        }
                        j++;
                    }
                    rowik++;
                }

                // trzecia

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 7, 0, 5, false, true, false, false, false,false);

                
            //    MyWorksheet1.Cells[1, 1].Value = "Ewidencja spraw odroczonych  ";
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka004"], 10, 2, 3, 3, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka005"], 29 , 0, 3, false, true, false, false, false,false);

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
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();window.PrintPreview();", true);
            makeLabels();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tb.makeHeader(dT, GridView1);
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
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e);
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
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 1);
            }
        }

        //podtabela

        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e);
            }
        }

        private GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli, string drugiText, int colSpanDrugi, int rowSpanDrugi, string cssStyleDrugi)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(drugiText, 7, 2, "borderTopLeft "));

            NewTotalRow.Cells.Add(tb.cela(tekst, colSpan, rowSpan, cssStyleDlaTabeli));
            for (int i = 1; i < 17; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
            }

            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            string idtabeli = "2";
            DataTable tabelka01 = (DataTable)Session["tabelka002"];

            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca", 6, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Wpływ", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Załatwienie", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "pozostałość na następny miesiąc", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "0-3 miesiący ", 4, 1, "normal", "borderTopLeft col_60 normal", "w tym", 7, 2, "borderTopLeft normal"));
            //     GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "0-3 miesiący "));
            // nowy wiersz
            idWiersza = 6;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "3-6 miesięcy", 4, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "6-12 miesięcy ", 4, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "12-24 miesięcy</br> (do 2 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "24-36 miesięcy </br>(2-3 lat))", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "36-60 miesięcy </br>(3-5 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Powyżej 60 miesięcy </br>(powyżej</br> 5 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));
        }
    }
}