using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace Statystyki_2018
{
    public partial class akak2 : System.Web.UI.Page
    {
        public dataReaders dr = new dataReaders();
        public Class1 cl = new Class1();
        public pdfTables pdfT = new pdfTables();
        public common cm = new common();
        public tabele tabela = new tabele();
        public static string tenPlik = "akak2.aspx";

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
            cl.deleteRowTable();

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
                LB_113.Text = tabelka01.Rows[0][12].ToString().Trim();
                LB_114.Text = tabelka01.Rows[0][13].ToString().Trim();
                LB_115.Text = tabelka01.Rows[0][14].ToString().Trim();
                LB_116.Text = tabelka01.Rows[0][15].ToString().Trim();
                LB_117.Text = tabelka01.Rows[0][16].ToString().Trim();

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
                LB_213.Text = tabelka01.Rows[1][12].ToString().Trim();
                LB_214.Text = tabelka01.Rows[1][13].ToString().Trim();
                LB_215.Text = tabelka01.Rows[1][14].ToString().Trim();
                LB_216.Text = tabelka01.Rows[1][15].ToString().Trim();
                LB_217.Text = tabelka01.Rows[1][16].ToString().Trim();
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
                LB_313.Text = tabelka01.Rows[2][12].ToString().Trim();
                LB_314.Text = tabelka01.Rows[2][13].ToString().Trim();
                LB_315.Text = tabelka01.Rows[2][14].ToString().Trim();
                LB_316.Text = tabelka01.Rows[2][15].ToString().Trim();
                LB_317.Text = tabelka01.Rows[2][16].ToString().Trim();
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
                LB_413.Text = tabelka01.Rows[3][12].ToString().Trim();
                LB_414.Text = tabelka01.Rows[3][13].ToString().Trim();
                LB_415.Text = tabelka01.Rows[3][14].ToString().Trim();
                LB_416.Text = tabelka01.Rows[3][15].ToString().Trim();
                LB_4_17.Text = tabelka01.Rows[3][17].ToString().Trim();
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
                LB_513.Text = tabelka01.Rows[4][12].ToString().Trim();
                LB_514.Text = tabelka01.Rows[4][13].ToString().Trim();
                LB_515.Text = tabelka01.Rows[4][14].ToString().Trim();
                LB_516.Text = tabelka01.Rows[4][15].ToString().Trim();
                LB_517.Text = tabelka01.Rows[4][16].ToString().Trim();
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
                LB_613.Text = tabelka01.Rows[5][12].ToString().Trim();
                LB_614.Text = tabelka01.Rows[5][13].ToString().Trim();
                LB_615.Text = tabelka01.Rows[5][14].ToString().Trim();
                LB_616.Text = tabelka01.Rows[5][15].ToString().Trim();
                LB_617.Text = tabelka01.Rows[5][16].ToString().Trim();
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
                LB_713.Text = tabelka01.Rows[6][12].ToString().Trim();
                LB_714.Text = tabelka01.Rows[6][13].ToString().Trim();
                LB_715.Text = tabelka01.Rows[6][14].ToString().Trim();
                LB_716.Text = tabelka01.Rows[6][15].ToString().Trim();
                LB_717.Text = tabelka01.Rows[6][16].ToString().Trim();
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
                LB_813.Text = tabelka01.Rows[7][12].ToString().Trim();
                LB_814.Text = tabelka01.Rows[7][13].ToString().Trim();
                LB_815.Text = tabelka01.Rows[7][14].ToString().Trim();
                LB_816.Text = tabelka01.Rows[7][15].ToString().Trim();
                LB_817.Text = tabelka01.Rows[7][16].ToString().Trim();
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
                LB_913.Text = tabelka01.Rows[8][12].ToString().Trim();
                LB_914.Text = tabelka01.Rows[8][13].ToString().Trim();
                LB_915.Text = tabelka01.Rows[8][14].ToString().Trim();
                LB_916.Text = tabelka01.Rows[8][15].ToString().Trim();
                LB_917.Text = tabelka01.Rows[8][16].ToString().Trim();
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
                LB_1013.Text = tabelka01.Rows[9][12].ToString().Trim();
                LB_1014.Text = tabelka01.Rows[9][13].ToString().Trim();
                LB_1015.Text = tabelka01.Rows[9][14].ToString().Trim();
                LB_1016.Text = tabelka01.Rows[9][15].ToString().Trim();
                LB_1017.Text = tabelka01.Rows[9][16].ToString().Trim();
                //row11
                LB_11_1.Text = tabelka01.Rows[10][1].ToString().Trim();
                LB_11_2.Text = tabelka01.Rows[10][2].ToString().Trim();
                LB_11_3.Text = tabelka01.Rows[10][3].ToString().Trim();
                LB_11_4.Text = tabelka01.Rows[10][4].ToString().Trim();
                LB_11_5.Text = tabelka01.Rows[10][5].ToString().Trim();
                LB_11_6.Text = tabelka01.Rows[10][6].ToString().Trim();
                LB_11_7.Text = tabelka01.Rows[10][7].ToString().Trim();
                LB_11_8.Text = tabelka01.Rows[10][8].ToString().Trim();
                LB_1110.Text = tabelka01.Rows[10][9].ToString().Trim();
                LB_1111.Text = tabelka01.Rows[10][10].ToString().Trim();
                LB_1112.Text = tabelka01.Rows[10][11].ToString().Trim();
                LB_1113.Text = tabelka01.Rows[10][12].ToString().Trim();
                LB_1114.Text = tabelka01.Rows[10][13].ToString().Trim();
                LB_1115.Text = tabelka01.Rows[10][14].ToString().Trim();
                LB_1116.Text = tabelka01.Rows[10][15].ToString().Trim();
                LB_1117.Text = tabelka01.Rows[10][16].ToString().Trim();

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
                LB_1213.Text = tabelka01.Rows[11][12].ToString().Trim();
                LB_1214.Text = tabelka01.Rows[11][13].ToString().Trim();
                LB_1215.Text = tabelka01.Rows[11][14].ToString().Trim();
                LB_1216.Text = tabelka01.Rows[11][15].ToString().Trim();
                LB_1217.Text = tabelka01.Rows[11][16].ToString().Trim();
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
                LB_1313.Text = tabelka01.Rows[12][12].ToString().Trim();
                LB_1314.Text = tabelka01.Rows[12][13].ToString().Trim();
                LB_1315.Text = tabelka01.Rows[12][14].ToString().Trim();
                LB_1316.Text = tabelka01.Rows[12][15].ToString().Trim();
                LB_1317.Text = tabelka01.Rows[12][16].ToString().Trim();
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
                LB_1413.Text = tabelka01.Rows[13][12].ToString().Trim();
                LB_1414.Text = tabelka01.Rows[13][13].ToString().Trim();
                LB_1415.Text = tabelka01.Rows[13][14].ToString().Trim();
                LB_1416.Text = tabelka01.Rows[13][15].ToString().Trim();
                LB_1417.Text = tabelka01.Rows[13][16].ToString().Trim();


                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 7, Date1.Date, Date2.Date);
                //txt = txt + cl.uzupelnij_statusy();

            }
            catch
            {

            }

            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView5.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();


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
            #endregion


            #region tabela  2 ()

            dT_02.Clear();


            dT_02.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h" });//


            dT_02.Rows.Add(new Object[] { "1", "Ka", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym wykroczenia", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "ogółem odroczono na rozprawie", "1", "1", "h" });//

            dT_02.Rows.Add(new Object[] { "1", "% odroczeń", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "ilość odroczeń publikacji wyroków", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Ka", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym wykroczenia", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Kz", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym wykroczenia", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Kzw", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "WKK", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Wykaz S - sądowy", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Wykaz S - prokuratorski", "1", "1", "h" });//


            dT_02.Rows.Add(new Object[] { "1", "RAZEM  (r.8 - 16)", "1", "1", "h" });//



            dT_02.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych sesji (wokandy)", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na rozprawę", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "ilość spraw odroczonych ", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Liczba wyznaczonych spraw na posiedzenie", "10", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Wyznaczono spraw ogółem (r.3+17)", "1", "2", "h" });//




            Session["header_02"] = dT_02;
            //  makeHeader1(sn, dT_02);


            #endregion
            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });





            dT_03.Rows.Add(new Object[] { "2", "Ka", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "w tym wykroczeniowe", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ka", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "w tym wykroczeniowe", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kz", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "w tym wykroczeniowe", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kzw", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WKK", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "S sądowe", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "S prokuratorskie", "1", "2", "h" });



            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba odbytych sesji (wokandy)", "2", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na rozprawie", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na posiedzeniach ", "9", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "RAZEM (r.5-13)", "1", "3", "v" });

            dT_03.Rows.Add(new Object[] { "3", "załatwiono spraw ogółem (r.3+14)", "1", "3", "v" });






            Session["header_03"] = dT_03;
            //  makeHeader3(sn, dT_03);
            #endregion



            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });


            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "L", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "ilość dni nieobecności w danym miesiącu", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "ilość sporządzonych uzasadnień ogółem", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "w  terminie ustawowym", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego", "12", "1" });





            //ilość dni nieobecności w danym miesiącu

            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Imie i nazwisko sędziego", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień ", "14", "1" });
            dT_04.Rows.Add(new Object[] { "3", "zaległe uzasadnienia nie sporządzone mimo upływu terminu", "4", "2" });
            dT_04.Rows.Add(new Object[] { "3", "liczba spraw, w których niewniesiono środka zaskażenia ", "2", "2" });
            dT_04.Rows.Add(new Object[] { "3", " nieobecności w pracy  (zwolnienia, urlopy…) ", "1", "2" });


            Session["header_04"] = dT_04;

            //  makeHeader6(sn, dT_05);

            #endregion

            #region tabela  5 ()

            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "L.p.", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Sędziowie", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "1", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "2", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "3", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "4", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "5", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "6", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "7", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "Ka", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "Kz", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Kzw", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "Ko", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "WKK", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "S", "1", "1" });

            dT_05.Rows.Add(new Object[] { "3", "Sprawy wg Ksiąg", "2", "2" });
            dT_05.Rows.Add(new Object[] { "3", "Liczba załatwionych  spraw od początku roku", "6", "1" });
            dT_05.Rows.Add(new Object[] { "3", "RAZEM (r.9,14-16)", "1", "2" });


            Session["header_05"] = dT_05;
            //Session["header_07"] = dT_05;

            //     makeHeader7(sn, dT_06);
            #endregion

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Pozostało z na następny miesiąc", "8", "1" });

            dT_08.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });

            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_08"] = dT_08;
            //  makeHeader8(sn, dT_08);
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
                    Label19.Text = "IIa Liczba sesji i wyznaczonych spraw przez sędziów (II instancja) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "IIIa Liczba odbytych sesji i załatwionych spraw przez sędziów (II instancja) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "IV Terminowość sporządzania uzasadnień, absencja na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa karnych za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                    Label2.Text = "V.Liczba załatwionych spraw od początku roku";
                }
                else
                {
                    Label19.Text = "IIa Liczba sesji i wyznaczonych spraw przez sędziów (II instancja) za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "IIIa Liczba odbytych sesji i załatwionych spraw przez sędziów (II instancja) za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "IV Terminowość sporządzania uzasadnień, absencja za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa karnych za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "V.Liczba załatwionych spraw od początku roku";
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
            string path = Server.MapPath("Template") + "\\akac.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\akac";

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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {


            }//end of using



            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];




                MyWorksheet.Cells[4, 3].Value = "Informacja statystyczna z ruchu spraw cywilnych za okres od " + Date1.Text + " do " + Date2.Text;
                int rowik = 10;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 1; i < 22; i++)
                    {
                        if (i == 15)
                        {
                            i = i + 1;

                        }
                        if (rowik <= 22)
                        {
                            MyWorksheet.Cells[rowik + 3, i + 3].Value = dR[i - 1].ToString().Trim();

                            MyWorksheet.Cells[rowik + 3, i + 3].Style.ShrinkToFit = true;
                        }

                    }
                    rowik++;
                }


                for (int i = 1; i < 22; i++)
                {
                    if (i == 15)
                    {
                        i = i + 1;
                    }
                    object sumObject;
                    string txt = "d";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = tabelka001.Compute("Sum(" + txt + ")", "");



                    MyWorksheet.Cells[26, i + 3].Value = sumObject.ToString();

                }





                // druga 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                table.Columns.Remove("ident");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");


                //   MyWorksheet2.Cells[1, 3].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                rowik = 1;
                foreach (DataRow dR in table.Rows)
                {
                    MyWorksheet2.Cells[rowik + 7, 2].Value = rowik.ToString(); // "AAAAAAA";// dR[0].ToString().Trim() + " " + dR[0].ToString().Trim();
                    MyWorksheet2.Cells[rowik + 7, 3].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();

                    for (int i = 3; i < 29; i++)
                    {
                        MyWorksheet2.Cells[rowik + 7, i + 2].Value = dR[i].ToString().Trim();
                        MyWorksheet2.Cells[rowik + 7, i + 2].Style.ShrinkToFit = true;
                    }
                    rowik++;
                }
                MyWorksheet2.Cells[rowik + 7, 3].Value = "Razem";
                for (int i = 3; i < 29; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    MyWorksheet2.Cells[rowik + 7, i + 3].Value = sumObject.ToString();
                }

                // trzecia 


                ExcelWorksheet MyWorksheet3 = MyExcel.Workbook.Worksheets[3];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                table2.Columns.Remove("ident");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");


                rowik = 2;
                foreach (DataRow dR in table2.Rows)
                {
                    MyWorksheet3.Cells[rowik + 7, 2].Value = rowik.ToString();
                    MyWorksheet3.Cells[rowik + 7, 3].Value = dR[1].ToString().Trim();
                    MyWorksheet3.Cells[rowik + 7, 4].Value = dR[2].ToString().Trim();
                    for (int i = 3; i < 29; i++)
                    {
                        MyWorksheet3.Cells[rowik + 7, i + 2].Value = dR[i].ToString().Trim();
                        MyWorksheet3.Cells[rowik + 7, i + 2].Style.ShrinkToFit = true;
                    }
                    rowik++;
                }
                MyWorksheet3.Cells[rowik + 7, 3].Value = "Razem";
                for (int i = 3; i < 29; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table2.Compute("Sum(" + txt + ")", "");


                    MyWorksheet3.Cells[rowik + 7, i].Value = sumObject.ToString();
                }


                // czwarta 


                ExcelWorksheet MyWorksheet4 = MyExcel.Workbook.Worksheets[4];

                DataView view3 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

                DataTable table3 = view2.ToTable();
                table3.Columns.Remove("ident");
                table3.Columns.Remove("id_sedziego");
                table3.Columns.Remove("stanowisko");
                table3.Columns.Remove("funkcja");


                rowik = 1;
                foreach (DataRow dR in table3.Rows)
                {
                    MyWorksheet4.Cells[rowik + 6, 1].Value = rowik.ToString();
                    MyWorksheet4.Cells[rowik + 6, 2].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();

                    for (int i = 3; i < 26; i++)
                    {
                        MyWorksheet3.Cells[rowik + 6, i + 2].Value = dR[i].ToString().Trim();
                        MyWorksheet4.Cells[rowik + 6, i + 2].Style.ShrinkToFit = true;
                    }
                    rowik++;
                }
                MyWorksheet4.Cells[rowik + 7, 2].Value = "Razem";
                for (int i = 3; i < 26; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table3.Compute("Sum(" + txt + ")", "");


                    MyWorksheet4.Cells[rowik + 7, i].Value = sumObject.ToString();
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
                       cm.log.Error(tenPlik + " " + ex.Message );

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

      

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(sn, dT, GridView5);
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
    }
}