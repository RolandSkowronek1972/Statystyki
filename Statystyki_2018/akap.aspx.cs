using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace Statystyki_2018
{
    public partial class akap : System.Web.UI.Page
    {
        public dataReaders dr = new dataReaders();
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public static string tenPlik = "akap.aspx";

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
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            txt = txt + cl.clear_maim_db();
            try
            {

                DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 1,20,20,tenPlik);
                Session["tabelka001"] = tabelka01;
                //row 1
                LB_12.Text = tabelka01.Rows[0][1].ToString().Trim();
                LB_13.Text = tabelka01.Rows[0][2].ToString().Trim();
                LB_14.Text = tabelka01.Rows[0][3].ToString().Trim();
                LB_15.Text = tabelka01.Rows[0][4].ToString().Trim();
                LB_16.Text = tabelka01.Rows[0][5].ToString().Trim();
                LB_17.Text = tabelka01.Rows[0][6].ToString().Trim();
                LB_18.Text = tabelka01.Rows[0][7].ToString().Trim();
                LB_19.Text = tabelka01.Rows[0][8].ToString().Trim();
                LB_110.Text = tabelka01.Rows[0][9].ToString().Trim();
                LB_111.Text = tabelka01.Rows[0][10].ToString().Trim();
                LB_112.Text = tabelka01.Rows[0][11].ToString().Trim();

                //row 2
                LB_22.Text = tabelka01.Rows[1][1].ToString().Trim();
                LB_23.Text = tabelka01.Rows[1][2].ToString().Trim();
                LB_24.Text = tabelka01.Rows[1][3].ToString().Trim();
                LB_25.Text = tabelka01.Rows[1][4].ToString().Trim();
                LB_26.Text = tabelka01.Rows[1][5].ToString().Trim();
                LB_27.Text = tabelka01.Rows[1][6].ToString().Trim();
                LB_28.Text = tabelka01.Rows[1][7].ToString().Trim();
                LB_29.Text = tabelka01.Rows[1][8].ToString().Trim();
                LB_210.Text = tabelka01.Rows[1][9].ToString().Trim();
                LB_211.Text = tabelka01.Rows[1][10].ToString().Trim();
                LB_212.Text = tabelka01.Rows[1][11].ToString().Trim();

                //row 3
                LB_32.Text = tabelka01.Rows[2][1].ToString().Trim();
                LB_33.Text = tabelka01.Rows[2][2].ToString().Trim();
                LB_34.Text = tabelka01.Rows[2][3].ToString().Trim();
                LB_35.Text = tabelka01.Rows[2][4].ToString().Trim();
                LB_36.Text = tabelka01.Rows[2][5].ToString().Trim();
                LB_37.Text = tabelka01.Rows[2][6].ToString().Trim();
                LB_38.Text = tabelka01.Rows[2][7].ToString().Trim();
                LB_39.Text = tabelka01.Rows[2][8].ToString().Trim();
                LB_310.Text = tabelka01.Rows[2][9].ToString().Trim();
                LB_311.Text = tabelka01.Rows[2][10].ToString().Trim();
                LB_312.Text = tabelka01.Rows[2][11].ToString().Trim();


                //row 4
                LB_42.Text = tabelka01.Rows[3][1].ToString().Trim();
                LB_43.Text = tabelka01.Rows[3][2].ToString().Trim();
                LB_44.Text = tabelka01.Rows[3][3].ToString().Trim();
                LB_45.Text = tabelka01.Rows[3][4].ToString().Trim();
                LB_46.Text = tabelka01.Rows[3][5].ToString().Trim();
                LB_47.Text = tabelka01.Rows[3][6].ToString().Trim();
                LB_48.Text = tabelka01.Rows[3][7].ToString().Trim();
                LB_49.Text = tabelka01.Rows[3][8].ToString().Trim();
                LB_410.Text = tabelka01.Rows[3][9].ToString().Trim();
                LB_411.Text = tabelka01.Rows[3][10].ToString().Trim();
                LB_412.Text = tabelka01.Rows[3][11].ToString().Trim();


                //row 5
                LB_52.Text = tabelka01.Rows[4][1].ToString().Trim();
                LB_53.Text = tabelka01.Rows[4][2].ToString().Trim();
                LB_54.Text = tabelka01.Rows[4][3].ToString().Trim();
                LB_55.Text = tabelka01.Rows[4][4].ToString().Trim();
                LB_56.Text = tabelka01.Rows[4][5].ToString().Trim();
                LB_57.Text = tabelka01.Rows[4][6].ToString().Trim();
                LB_58.Text = tabelka01.Rows[4][7].ToString().Trim();
                LB_59.Text = tabelka01.Rows[4][8].ToString().Trim();
                LB_510.Text = tabelka01.Rows[4][9].ToString().Trim();
                LB_511.Text = tabelka01.Rows[4][10].ToString().Trim();
                LB_512.Text = tabelka01.Rows[4][11].ToString().Trim();


                //row 6
                LB_62.Text = tabelka01.Rows[5][1].ToString().Trim();
                LB_63.Text = tabelka01.Rows[5][2].ToString().Trim();
                LB_64.Text = tabelka01.Rows[5][3].ToString().Trim();
                LB_65.Text = tabelka01.Rows[5][4].ToString().Trim();
                LB_66.Text = tabelka01.Rows[5][5].ToString().Trim();
                LB_67.Text = tabelka01.Rows[5][6].ToString().Trim();
                LB_68.Text = tabelka01.Rows[5][7].ToString().Trim();
                LB_69.Text = tabelka01.Rows[5][8].ToString().Trim();
                LB_610.Text = tabelka01.Rows[5][9].ToString().Trim();
                LB_611.Text = tabelka01.Rows[5][10].ToString().Trim();
                LB_612.Text = tabelka01.Rows[5][11].ToString().Trim();

                //row 7
                LB_72.Text = tabelka01.Rows[6][1].ToString().Trim();
                LB_73.Text = tabelka01.Rows[6][2].ToString().Trim();
                LB_74.Text = tabelka01.Rows[6][3].ToString().Trim();
                LB_75.Text = tabelka01.Rows[6][4].ToString().Trim();
                LB_76.Text = tabelka01.Rows[6][5].ToString().Trim();
                LB_77.Text = tabelka01.Rows[6][6].ToString().Trim();
                LB_78.Text = tabelka01.Rows[6][7].ToString().Trim();
                LB_79.Text = tabelka01.Rows[6][8].ToString().Trim();
                LB_710.Text = tabelka01.Rows[6][9].ToString().Trim();
                LB_711.Text = tabelka01.Rows[6][10].ToString().Trim();
                LB_712.Text = tabelka01.Rows[6][11].ToString().Trim();


                //row 8
                LB_82.Text = tabelka01.Rows[7][1].ToString().Trim();
                LB_83.Text = tabelka01.Rows[7][2].ToString().Trim();
                LB_84.Text = tabelka01.Rows[7][3].ToString().Trim();
                LB_85.Text = tabelka01.Rows[7][4].ToString().Trim();
                LB_86.Text = tabelka01.Rows[7][5].ToString().Trim();
                LB_87.Text = tabelka01.Rows[7][6].ToString().Trim();
                LB_88.Text = tabelka01.Rows[7][7].ToString().Trim();
                LB_89.Text = tabelka01.Rows[7][8].ToString().Trim();
                LB_810.Text = tabelka01.Rows[7][9].ToString().Trim();
                LB_811.Text = tabelka01.Rows[7][10].ToString().Trim();
                LB_812.Text = tabelka01.Rows[7][11].ToString().Trim();

                //row 9
                LB_92.Text = tabelka01.Rows[8][1].ToString().Trim();
                LB_93.Text = tabelka01.Rows[8][2].ToString().Trim();
                LB_94.Text = tabelka01.Rows[8][3].ToString().Trim();
                LB_95.Text = tabelka01.Rows[8][4].ToString().Trim();
                LB_96.Text = tabelka01.Rows[8][5].ToString().Trim();
                LB_97.Text = tabelka01.Rows[8][6].ToString().Trim();
                LB_98.Text = tabelka01.Rows[8][7].ToString().Trim();
                LB_99.Text = tabelka01.Rows[8][8].ToString().Trim();
                LB_910.Text = tabelka01.Rows[8][9].ToString().Trim();
                LB_911.Text = tabelka01.Rows[8][10].ToString().Trim();
                LB_912.Text = tabelka01.Rows[8][11].ToString().Trim();

                //row10
                LB_102.Text = tabelka01.Rows[9][1].ToString().Trim();
                LB_103.Text = tabelka01.Rows[9][2].ToString().Trim();
                LB_104.Text = tabelka01.Rows[9][3].ToString().Trim();
                LB_105.Text = tabelka01.Rows[9][4].ToString().Trim();
                LB_106.Text = tabelka01.Rows[9][5].ToString().Trim();
                LB_107.Text = tabelka01.Rows[9][6].ToString().Trim();
                LB_108.Text = tabelka01.Rows[9][7].ToString().Trim();
                LB_109.Text = tabelka01.Rows[9][8].ToString().Trim();
                LB_1010.Text = tabelka01.Rows[9][9].ToString().Trim();
                LB_1011.Text = tabelka01.Rows[9][10].ToString().Trim();
                LB_1012.Text = tabelka01.Rows[9][11].ToString().Trim();


                //row11
                LB_11_2.Text = tabelka01.Rows[10][1].ToString().Trim();
                LB_11_3.Text = tabelka01.Rows[10][2].ToString().Trim();
                LB_11_4.Text = tabelka01.Rows[10][3].ToString().Trim();
                LB_11_5.Text = tabelka01.Rows[10][4].ToString().Trim();
                LB_11_6.Text = tabelka01.Rows[10][5].ToString().Trim();
                LB_11_7.Text = tabelka01.Rows[10][6].ToString().Trim();
                LB_11_8.Text = tabelka01.Rows[10][7].ToString().Trim();
                LB_11_9.Text = tabelka01.Rows[10][8].ToString().Trim();
                LB_11_10.Text = tabelka01.Rows[10][9].ToString().Trim();
                LB_11_11.Text = tabelka01.Rows[10][10].ToString().Trim();
                LB_11_12.Text = tabelka01.Rows[10][11].ToString().Trim();
                /*LB_11_13.Text = tabelka01.Rows[10][12].ToString().Trim();
                LB_1114.Text = tabelka01.Rows[10][13].ToString().Trim();
                LB_1115.Text = tabelka01.Rows[10][14].ToString().Trim();
                LB_1116.Text = tabelka01.Rows[10][15].ToString().Trim();
                LB_1117.Text = tabelka01.Rows[10][16].ToString().Trim();
                LB_1118.Text = tabelka01.Rows[10][17].ToString().Trim();
                LB_1119.Text = tabelka01.Rows[10][18].ToString().Trim();
                LB_1120.Text = tabelka01.Rows[10][19].ToString().Trim();
                */

                //row12
                LB_122.Text = tabelka01.Rows[11][1].ToString().Trim();
                LB_123.Text = tabelka01.Rows[11][2].ToString().Trim();
                LB_124.Text = tabelka01.Rows[11][3].ToString().Trim();
                LB_125.Text = tabelka01.Rows[11][4].ToString().Trim();
                LB_126.Text = tabelka01.Rows[11][5].ToString().Trim();
                LB_127.Text = tabelka01.Rows[11][6].ToString().Trim();
                LB_128.Text = tabelka01.Rows[11][7].ToString().Trim();
                LB_129.Text = tabelka01.Rows[11][8].ToString().Trim();
                LB_1210.Text = tabelka01.Rows[11][9].ToString().Trim();
                LB_1211.Text = tabelka01.Rows[11][10].ToString().Trim();
                LB_1212.Text = tabelka01.Rows[11][11].ToString().Trim();


                //row13
                LB_132.Text = tabelka01.Rows[12][1].ToString().Trim();
                LB_133.Text = tabelka01.Rows[12][2].ToString().Trim();
                LB_134.Text = tabelka01.Rows[12][3].ToString().Trim();
                LB_135.Text = tabelka01.Rows[12][4].ToString().Trim();
                LB_136.Text = tabelka01.Rows[12][5].ToString().Trim();
                LB_137.Text = tabelka01.Rows[12][6].ToString().Trim();
                LB_138.Text = tabelka01.Rows[12][7].ToString().Trim();
                LB_139.Text = tabelka01.Rows[12][8].ToString().Trim();
                LB_1310.Text = tabelka01.Rows[12][9].ToString().Trim();
                LB_1311.Text = tabelka01.Rows[12][10].ToString().Trim();
                LB_1312.Text = tabelka01.Rows[12][11].ToString().Trim();


                //row14
                LB_142.Text = tabelka01.Rows[13][1].ToString().Trim();
                LB_143.Text = tabelka01.Rows[13][2].ToString().Trim();
                LB_144.Text = tabelka01.Rows[13][3].ToString().Trim();
                LB_145.Text = tabelka01.Rows[13][4].ToString().Trim();
                LB_146.Text = tabelka01.Rows[13][5].ToString().Trim();
                LB_147.Text = tabelka01.Rows[13][6].ToString().Trim();
                LB_148.Text = tabelka01.Rows[13][7].ToString().Trim();
                LB_149.Text = tabelka01.Rows[13][8].ToString().Trim();
                LB_1410.Text = tabelka01.Rows[13][9].ToString().Trim();
                LB_1411.Text = tabelka01.Rows[13][10].ToString().Trim();
                LB_1412.Text = tabelka01.Rows[13][11].ToString().Trim();



                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 7, Date1.Date, Date2.Date);
                //txt = txt + cl.uzupelnij_statusy();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            GridView5.DataBind();
            GridView7.DataBind();
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


        #region "nagłowki tabel"
        protected void makeHeader()
        {

            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            Session["header_01"] = null;
            Session["header_02"] = null;
            Session["header_03"] = null;
            Session["header_04"] = null;
            Session["header_05"] = null;
            Session["header_06"] = null;
            Session["header_07"] = null;
            Session["header_08"] = null;

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
            //   Session["header_01"] = dT_01;

            #endregion


            #region tabela  2 ()
            //pierwsza sedziowska
            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "6-12 m-cy", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "pow 12<br/> m-cy", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "U", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Uo", "1", "1", "h" });//

            dT_02.Rows.Add(new Object[] { "1", "Razem<br/> (r.6-7)", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "U", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Uo", "1", "1", "h" });//

            dT_02.Rows.Add(new Object[] { "1", "WSC", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Razem <br/>(r.12-14)", "1", "1", "h" });//

            dT_02.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "W tym spraw starych", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na rozprawę", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ilość spraw odroczonych", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "% odroczeń", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "w tym ilość odroczeń publikacji orzeczeń", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na posiedzenie ", "4", "1", "h" });//



            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Ilość spraw <br/>w referacie <br/>(na koniec okresu stat.)", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Liczba wyznaczonych sesji - wokandy łącznie pion ubezp. oraz pracy ", "2", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Wyznaczenia", "10", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Wyznaczono spraw ogółem (r.8+15)", "1", "3", "h" });//





            Session["header_02"] = dT_02;
            //  makeHeader1(sn, dT_02);


            #endregion
            #region tabela  3 ()
            //druga sedziowska
            dT_03.Clear();
            dT_03.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "Sędziowie", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "1", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "2", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "3", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "4", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "5", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "6", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "7", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "8", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "1", "9", "1", "1", "h" });//

            dT_03.Rows.Add(new Object[] { "1", "10", "1", "1", "h" });//




            dT_03.Rows.Add(new Object[] { "2", "rozprawy", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "2", "posiedzenia", "1", "1", "h" });//

            dT_03.Rows.Add(new Object[] { "2", "U", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "2", "Uo", "1", "1", "h" });//

            dT_03.Rows.Add(new Object[] { "2", "Razem (r.3-4)", "1", "1", "h" });//

            dT_03.Rows.Add(new Object[] { "2", "U", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "2", "Uo", "1", "1", "h" });//

            dT_03.Rows.Add(new Object[] { "2", "Wykaz Kas-z", "1", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "2", "Razem (r.6-8)", "1", "1", "v" });//

            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na rozprawie", "3", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na posiedzeniu", "4", "1", "h" });//



            dT_03.Rows.Add(new Object[] { "4", "Sprawy wg Ksiąg", "2", "3", "h" });//
            dT_03.Rows.Add(new Object[] { "4", "Liczba odbytych sesji - wokandy łącznie pion ubezp. oraz pracy", "2", "2", "h" });//
            dT_03.Rows.Add(new Object[] { "4", "ZAŁATWIENIA", "7", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "4", "Załatwiono spraw ogółem (r.5+9)", "1", "3", "h" });//


            Session["header_03"] = dT_03;

            #endregion



            #region tabela  4 ()

            dT_04.Clear();
            dT_04.Rows.Add(new Object[] { "1", "6-12 m-cy", "1", "1", "v" });//
            dT_04.Rows.Add(new Object[] { "1", "pow 12 m-cy", "1", "1", "v" });//

            dT_04.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "1", "Po", "1", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "1", "Wykaz Kas-z", "1", "1", "h" });//

            dT_04.Rows.Add(new Object[] { "1", "Razem (r.4-6)", "1", "1", "v" });//

            dT_04.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "1", "Po", "1", "1", "h" });//

            dT_04.Rows.Add(new Object[] { "1", "Np", "1", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "1", "Wykaz Kas-z", "1", "1", "h" });//

            dT_04.Rows.Add(new Object[] { "1", "WSC", "1", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "1", "Razem (r.11-15)", "1", "1", "v" });//

            dT_04.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "v" });//
            dT_04.Rows.Add(new Object[] { "2", "W tym spraw starych", "2", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na rozprawie", "4", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "2", "Ilość spraw odroczonych", "1", "2", "h" });//
            dT_04.Rows.Add(new Object[] { "2", "% odroczeń", "1", "2", "h" });//
            dT_04.Rows.Add(new Object[] { "2", "w tym ilość odroczeń publikacji orzeczeń", "1", "2", "h" });//
            dT_04.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na posiedzeniu ", "6", "1", "h" });//



            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });//
            dT_04.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });//
            dT_04.Rows.Add(new Object[] { "3", "Ilość spraw <br/>w referacie <br/>(na koniec okresu stat.)", "3", "1", "h" });//
                                                                                                                              //   dT_04.Rows.Add(new Object[] { "3", "Liczba wyznaczonych sesji - wokandy łącznie pion ubezp. oraz pracy ", "2", "2", "h" });//
            dT_04.Rows.Add(new Object[] { "3", "Wyznaczenia", "13", "1", "h" });//
            dT_04.Rows.Add(new Object[] { "3", "Wyznaczono spraw ogółem (r.7+13)", "1", "3", "h" });//



            Session["header_04"] = dT_04;



            #endregion

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "L.p.", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Sędziowie", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "1", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "2", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "3", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "4", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "5", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "6", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "7", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "8", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "9", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "10", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "11", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "P", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Po", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Wykaz Kas-z", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Razem r.1-3", "1", "1" });


            dT_05.Rows.Add(new Object[] { "2", "P", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Po", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Np", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Wykaz Kas-z", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "WSC", "1", "1", "v" });
            dT_05.Rows.Add(new Object[] { "2", "Razem r.5-9", "1", "1" });



            dT_05.Rows.Add(new Object[] { "3", "Liczba spraw załatwionych na rozprawie", "4", "1" });
            dT_05.Rows.Add(new Object[] { "3", "Liczba spraw załatwionych na rozprawie", "6", "1" });


            dT_05.Rows.Add(new Object[] { "4", "Skargi wg ksiąg ", "2", "3" });
            dT_05.Rows.Add(new Object[] { "4", "ZAŁATWIENIA", "10", "1" });
            dT_05.Rows.Add(new Object[] { "4", "Załatwionych spraw ogółem (r.4+10)", "1", "3" });


            Session["header_05"] = dT_05;



            #endregion

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();


            dT_06.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_06.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "w tym nieuspra<br/>wiedliwione", "1", "1" });

            dT_06.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "w tym nieuspra<br/>wiedliwione", "1", "1" });

            dT_06.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "w tym nieuspra<br/>wiedliwione", "1", "1" });

            dT_06.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });

            dT_06.Rows.Add(new Object[] { "1", "L", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "ilość dni nieobecności w danym miesiącu", "1", "1" });


            dT_06.Rows.Add(new Object[] { "2", "ilość sporządzonych uzasadnień ogółem", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "w  terminie ustawowym", "1", "2" });

            dT_06.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego", "12", "1" });


            dT_06.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_06.Rows.Add(new Object[] { "3", "Imie i nazwisko", "1", "3" });
            dT_06.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień", "14", "1" });
            dT_06.Rows.Add(new Object[] { "3", "Uzasadnienie wygłoszone art. 328 par. 1 kpc", "1", "3" });
            dT_06.Rows.Add(new Object[] { "3", "Liczba wniosków o trankrypcje uzasadnień wygłoszonych w trybie art.. 328 par. 1 kpc", "1", "3" });
            dT_06.Rows.Add(new Object[] { "3", "zaległe uzasadnienia nie sporządzone mimo upływu terminu", "4", "2" });
            dT_06.Rows.Add(new Object[] { "3", "liczba spraw, w których niewniesiono środka zaskażenia ", "2", "2" });
            dT_06.Rows.Add(new Object[] { "3", "nieobecności w pracy (zwolnienia, urlopy…)", "1", "2" });




            Session["header_06"] = dT_06;
            //  Session["header_07"] = dT_06;


            #endregion

            #region tabela  7()

            DataTable dT_07 = new DataTable();
            dT_07.Columns.Clear();
            dT_07.Columns.Add("Column1", typeof(string));
            dT_07.Columns.Add("Column2", typeof(string));
            dT_07.Columns.Add("Column3", typeof(string));
            dT_07.Columns.Add("Column4", typeof(string));
            dT_07.Columns.Add("Column5", typeof(string));
            dT_07.Clear();

            dT_07.Rows.Add(new Object[] { "1", "L.p.", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "Sędziowie", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "1", "1", "1" });

            dT_07.Rows.Add(new Object[] { "1", "2", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "3", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "4", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "5", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "6", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "7", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "8", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "9", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "10", "1", "1" });
            dT_07.Rows.Add(new Object[] { "1", "11", "1", "1" });

            dT_07.Rows.Add(new Object[] { "2", "U", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "Uo", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "WSC", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "razem (r.1-3)", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "P", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "Po", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "Np", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "Wykaz kas-z", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "WSC", "1", "1" });
            dT_07.Rows.Add(new Object[] { "2", "razem (r.5-9)", "1", "1" });


            dT_07.Rows.Add(new Object[] { "3", "Sprawy wg Ksiąg", "2", "2" });
            dT_07.Rows.Add(new Object[] { "3", "ZAŁATWIENIA od początku roku", "10", "1" });
            dT_07.Rows.Add(new Object[] { "3", "Załatwionych spraw ogółem (r.4+10)", "1", "2" });
            Session["header_07"] = dT_07;

            #endregion



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

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, GridView1);
            }
        } //end of grvMergeHeader_RowCreated

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(sn, dT, GridView3);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_04"];
                tabela.makeHeader(sn, dT, GridView4);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(sn, dT, GridView5);
            }
        }

        protected void GridView6_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_06"];
                tabela.makeHeader(sn, dT, GridView6);
            }
        }

        protected void GridView7_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_07"];
                tabela.makeHeader(sn, dT, GridView7);
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
                    Label19.Text = " II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu ubezpieczeń społ. przez sędziów za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Label17.Text = "II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu prawa pracy przez sędziów za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu prawa pracy przez sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa cywilnych za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                    Label2.Text = "IV Terminowość sporządzania uzasadnień, absencja za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label7.Text = "V. Liczba załatwionych spraw od początku roku";



                }
                else
                {
                    Label19.Text = "II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu ubezpieczeń społ. przez sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    //	Label17.Text = "II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu prawa pracy przez sędziów za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "II Liczba sesji, wyznaczonych i załatwionych spraw z zakresu prawa pracy przez sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa cywilnych za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "IV Terminowość sporządzania uzasadnień, absencja za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label7.Text = "V. Liczba załatwionych spraw od początku roku";
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
            string path = Server.MapPath("Template") + "\\akap.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\akap";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
            try
            {
                File.Delete(fNewFile.FullName);
            }
            catch (Exception ex)
            {
                                cm.log.Error(tenPlik + " " + ex.Message );    
            }

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];


            try
            {
                using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
                {
                    // pierwsza

                    ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];


                    DataTable table = (DataTable)Session["tabelka001"];
                    DataView view = table.DefaultView;
                    int j = 8;
                    foreach (DataRow dR in table.Rows)
                    {
                        for (int i = 3; i < 14; i++)
                        {
                            if (j < 21)
                            {
                                manageCells(MyWorksheet, j, i + 2, dR[i - 2].ToString().Trim());
                            }
                        }
                        j++;
                    }


                    // druga 
                    view = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 2, view, 7, 19);


                    // trzecia 

                    DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 3, view2, 7, 13);

                    // czwarta 
                    DataView view3 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 4, view3, 7, 20);


                    // piąta 
                    DataView view5 = (DataView)tabela_5.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 5, view5, 8, 14);



                    // szósta 
                    DataView view6 = (DataView)tabela_6.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 6, view6, 6, 26);


                    DataView view7 = (DataView)tabela_7.Select(DataSourceSelectArguments.Empty);
                    robArkusz(MyExcel, 7, view7, 6, 14);


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
                           cm.log.Error(tenPlik + " " + ex.Message );
                    }

                }//end of using
                odswiez();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
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
                tabela.makeHeader(sn, dT, GridView1);
            }
        }

     

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_2.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }






        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_3.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_5.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }


        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_6.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }

        protected void GridView7_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_7.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e,1);

            }
        }

        protected void robArkusz(ExcelPackage MyExcel, int nrArkusza, DataView View, int rowikPlus, int ilKolumn)
        {

            ExcelWorksheet MyWorksheet8 = MyExcel.Workbook.Worksheets[nrArkusza];

            DataTable table7 = View.ToTable();
            try
            {
                table7.Columns.Remove("ident");
                table7.Columns.Remove("id_sedziego");
                table7.Columns.Remove("stanowisko");
            }
            catch
            { }

            //        table.Columns.Remove("funkcja");
            int rowik = 1;
            foreach (DataRow dR in table7.Rows)
            {
                manageCells(MyWorksheet8, rowik + rowikPlus, 1, rowik.ToString());
                manageCells(MyWorksheet8, rowik + rowikPlus, 2, dR[1].ToString().Trim() + " " + dR[2].ToString().Trim());
                for (int i = 3; i < ilKolumn; i++)
                {
                    manageCells(MyWorksheet8, rowik + rowikPlus, i, dR[i + 1].ToString().Trim());
                }
                rowik++;
            }
            manageCells(MyWorksheet8, rowik + rowikPlus, 2, "Razem");

            try
            {
                for (int i = 1; i < ilKolumn - 2; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table7.Compute("Sum(" + txt + ")", "");
                    manageCells(MyWorksheet8, rowik + rowikPlus, i + 2, sumObject.ToString());
                }
            }
            catch 
            { }



        }

        protected void manageCells(ExcelWorksheet sheet, int rowik, int col, string value)
        {
            try
            {
                sheet.Cells[rowik, col].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                sheet.Cells[rowik, col].Style.ShrinkToFit = true;
                try
                {
                    sheet.Cells[rowik, col].Value = double.Parse(value);

                }
                catch 
                {
                    sheet.Cells[rowik, col].Value = value;
                }


            }
            catch
            { } // end of try
        }


    }
}
