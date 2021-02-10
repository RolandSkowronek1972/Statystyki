using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oktk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public tabele tb = new tabele();
        public static string tenPlik = "oktk.aspx";

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
            string yyx = (string)Session["id_dzialu"];
            //	id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cl.deleteRowTable();
            DataTable tabelka2 = new DataTable();
            txt = txt + cl.clear_maim_db();
            try
            {
                //cm.log.Info(tenPlik + " generowanie danych do tabeli 2");
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka001"] = tabelka01;
                //cm.log.Info(tenPlik + " wypełnianie danymi tabeli 2");
                //row 1
                tab_1_w01_col01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_1_w01_col02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_1_w01_col03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_1_w01_col04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_1_w01_col05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_1_w01_col06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_1_w01_col07.Text = tabelka01.Rows[0][7].ToString().Trim();
                //row 2
                tab_1_w02_col01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_1_w02_col02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_1_w02_col03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_1_w02_col04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_1_w02_col05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_1_w02_col06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_1_w02_col07.Text = tabelka01.Rows[1][7].ToString().Trim();

                //row 3
                tab_1_w03_col01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_1_w03_col02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_1_w03_col03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_1_w03_col04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_1_w03_col05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_1_w03_col06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_1_w03_col07.Text = tabelka01.Rows[2][7].ToString().Trim();

                //row 4
                tab_1_w04_col01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_1_w04_col02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_1_w04_col03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_1_w04_col04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_1_w04_col05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_1_w04_col06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_1_w04_col07.Text = tabelka01.Rows[3][7].ToString().Trim();

                //row 5
                tab_1_w05_col01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_1_w05_col02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_1_w05_col03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_1_w05_col04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_1_w05_col05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_1_w05_col06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_1_w05_col07.Text = tabelka01.Rows[4][7].ToString().Trim();

                //row 6
                tab_1_w06_col01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_1_w06_col02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_1_w06_col03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_1_w06_col04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_1_w06_col05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_1_w06_col06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_1_w06_col07.Text = tabelka01.Rows[5][7].ToString().Trim();

                //row 7
                tab_1_w07_col01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_1_w07_col02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_1_w07_col03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_1_w07_col04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_1_w07_col05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_1_w07_col06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_1_w07_col07.Text = tabelka01.Rows[6][7].ToString().Trim();

                //row 8
                tab_1_w08_col01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_1_w08_col02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_1_w08_col03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_1_w08_col04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_1_w08_col05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_1_w08_col06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_1_w08_col07.Text = tabelka01.Rows[7][7].ToString().Trim();

                //row 9
                tab_1_w09_col01.Text = tabelka01.Rows[8][1].ToString().Trim();
                tab_1_w09_col02.Text = tabelka01.Rows[8][2].ToString().Trim();
                tab_1_w09_col03.Text = tabelka01.Rows[8][3].ToString().Trim();
                tab_1_w09_col04.Text = tabelka01.Rows[8][4].ToString().Trim();
                tab_1_w09_col05.Text = tabelka01.Rows[8][5].ToString().Trim();
                tab_1_w09_col06.Text = tabelka01.Rows[8][6].ToString().Trim();
                tab_1_w09_col07.Text = tabelka01.Rows[8][7].ToString().Trim();

                //row10
                tab_1_w10_col01.Text = tabelka01.Rows[9][1].ToString().Trim();
                tab_1_w10_col02.Text = tabelka01.Rows[9][2].ToString().Trim();
                tab_1_w10_col03.Text = tabelka01.Rows[9][3].ToString().Trim();
                tab_1_w10_col04.Text = tabelka01.Rows[9][4].ToString().Trim();
                tab_1_w10_col05.Text = tabelka01.Rows[9][5].ToString().Trim();
                tab_1_w10_col06.Text = tabelka01.Rows[9][6].ToString().Trim();
                tab_1_w10_col07.Text = tabelka01.Rows[9][7].ToString().Trim();

                //row11
                tab_1_w11_col01.Text = tabelka01.Rows[10][1].ToString().Trim();
                tab_1_w11_col02.Text = tabelka01.Rows[10][2].ToString().Trim();
                tab_1_w11_col03.Text = tabelka01.Rows[10][3].ToString().Trim();
                tab_1_w11_col04.Text = tabelka01.Rows[10][4].ToString().Trim();
                tab_1_w11_col05.Text = tabelka01.Rows[10][5].ToString().Trim();
                tab_1_w11_col06.Text = tabelka01.Rows[10][6].ToString().Trim();
                tab_1_w11_col07.Text = tabelka01.Rows[10][7].ToString().Trim();

                //row12
                tab_1_w12_col01.Text = tabelka01.Rows[11][1].ToString().Trim();
                tab_1_w12_col02.Text = tabelka01.Rows[11][2].ToString().Trim();
                tab_1_w12_col03.Text = tabelka01.Rows[11][3].ToString().Trim();
                tab_1_w12_col04.Text = tabelka01.Rows[11][4].ToString().Trim();
                tab_1_w12_col05.Text = tabelka01.Rows[11][5].ToString().Trim();
                tab_1_w12_col06.Text = tabelka01.Rows[11][6].ToString().Trim();
                tab_1_w12_col07.Text = tabelka01.Rows[11][7].ToString().Trim();

                //row12
                tab_1_w13_col01.Text = tabelka01.Rows[12][1].ToString().Trim();
                tab_1_w13_col02.Text = tabelka01.Rows[12][2].ToString().Trim();
                tab_1_w13_col03.Text = tabelka01.Rows[12][3].ToString().Trim();
                tab_1_w13_col04.Text = tabelka01.Rows[12][4].ToString().Trim();
                tab_1_w13_col05.Text = tabelka01.Rows[12][5].ToString().Trim();
                tab_1_w13_col06.Text = tabelka01.Rows[12][6].ToString().Trim();
                tab_1_w13_col07.Text = tabelka01.Rows[12][7].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            //cm.log.Info (tenPlik+ " Tabela danych -  liczba wierszy: " + tabelka2.Rows.Count.ToString());
            txt = txt + "Tabela danych -  liczba wierszy: " + tabelka2.Rows.Count.ToString() + Environment.NewLine;

            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = true;
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            id_dzialu.Text = (string)Session["txt_dzialu"];
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
            //  makeHeader2(sn, dT_01);

            #endregion tabela  1 (wierszowa)

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
            //  makeHeader1(sn, dT_02);

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "CG-G", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ns-Rej.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RAZEM (r.3-8)", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "CG-G", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns-Rej.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RAZEM (r.3-8)", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba odbytych sesji - wokandy", "2", "2", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na rozprawie", "9", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "wyrok, postan., kończ. postę.", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "wyroki zaoczne", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "ugody", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "inne", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na posiedzeniach", "11", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwiono spraw ogółem (r.9+22)", "1", "3", "v" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()
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
                    tabela1Label.Text = " Liczba sesji i wyznaczonych spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    tabela2Label.Text = " Liczba sesji i wyznaczonych spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela1Label.Text = " Liczba sesji i wyznaczonych spraw a za okres od " + Date1.Text + " do  " + Date2.Text;

                    tabela2Label.Text = " Liczba sesji i wyznaczonych spraw a za okres od " + Date1.Text + " do  " + Date2.Text;
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
            string path = Server.MapPath("Template") + "\\oktk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oktk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
            try
            {
                //  File.Delete(fNewFile.FullName);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka002"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
            }//end of using

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                //   MyWorksheeCells[4, 3].Value = "Informacja statystyczna z ruchu spraw cywilnych za okres od " + Date1.Text + " do " + Date2.Text;
                int rowik = 4;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    MyWorksheet.Cells[rowik, 1].Value = (rowik - 3).ToString();
                    MyWorksheet.Cells[rowik, 2].Value = dR[5].ToString().Trim() + " " + dR[4].ToString().Trim() + " " + dR[3].ToString().Trim();

                    MyWorksheet.Cells[rowik, 1].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;

                    MyWorksheet.Cells[rowik, 2].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;

                    for (int i = 8; i < 20; i++)
                    {
                        MyWorksheet.Cells[rowik, i - 5].Value = dR[i - 1].ToString().Trim();
                        MyWorksheet.Cells[rowik, i - 5].Style.ShrinkToFit = true;

                        MyWorksheet.Cells[rowik, i - 5].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                        MyWorksheet.Cells[rowik, i - 5].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                        MyWorksheet.Cells[rowik, i - 5].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                        MyWorksheet.Cells[rowik, i - 5].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    }
                    rowik++;
                }

                MyWorksheet.Cells[rowik, 2].Value = "Razem";
                for (int i = 1; i < 13; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    string result = "";
                    txt = txt + digit;
                    try
                    {
                        sumObject = tabelka001.Compute("Sum(" + txt + ")", "");
                        result = sumObject.ToString();
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error(tenPlik + " " + ex.Message);
                    }

                    MyWorksheet.Cells[rowik, i + 2].Value = result;
                    MyWorksheet.Cells[rowik, i + 2].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, i + 2].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, i + 2].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, i + 2].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;

                    MyWorksheet.Cells[rowik, 1].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 1].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;

                    MyWorksheet.Cells[rowik, 2].Style.Border.Top.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Left.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Right.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                    MyWorksheet.Cells[rowik, 2].Style.Border.Bottom.Style = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                }

                // druga

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                DataTable drugaDt = (DataTable)Session["tabelka001"];
                //row 1
                //            tab_1_w01_col01.Text = tabelka01.Rows[0][1].ToString().Trim();
                rowik = 3;
                foreach (DataRow dRR in drugaDt.Rows)
                {
                    for (int col = 0; col < 8; col++)
                    {
                        if (rowik < 14)
                        {
                            MyWorksheet2.Cells[rowik, col + 6].Value = dRR[col].ToString().Trim();// "XX";// rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                        }
                        else
                        {
                            if (rowik == 14)
                            {
                                MyWorksheet2.Cells[14, 7].Value = dRR[1].ToString().Trim();// "XX";// rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                                MyWorksheet2.Cells[14, 13].Value = dRR[7].ToString().Trim();// "XX";// rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                            }
                            if (rowik == 15)
                            {
                                MyWorksheet2.Cells[15, 7].Value = dRR[1].ToString().Trim();// "XX";// rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                                MyWorksheet2.Cells[15, 13].Value = dRR[7].ToString().Trim();// "XX";// rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                            }
                        }
                    }
                    rowik++;
                }

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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                tb.makeHeader(sn, dT, GridView1);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataView view = (DataView)tabela_1.Select(DataSourceSelectArguments.Empty);
                //tabela_1
                DataTable table = view.ToTable();// (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}