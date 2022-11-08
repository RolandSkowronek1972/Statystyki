using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace Statystyki_2018
{
 
    
    public partial class onsg : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();
        dataReaders dr = new dataReaders();
        public tabele tabela = new tabele();
        const string tenPlik = "onsg.aspx";
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

            #region tabela  1 (wierszowa)


            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();


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
            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GC upr.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GC  razem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "9", "1" });
            Session["header_01"] = dT_01;

            #endregion
            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "za miesiąc bieżący ", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_02.Rows.Add(new Object[] { "2", "GC", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GC upr", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GC Razem", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GNs", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GNc", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GCo", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "GCps", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "WSC", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_02.Rows.Add(new Object[] { "3", "Imie i Nazwisko sędziego", "1", "3" });
            dT_02.Rows.Add(new Object[] { "3", "WPŁYW", "10", "1" });


            Session["header_02"] = dT_02;
          
            #endregion

            #region tabela  3 ()

            dT_03.Clear();



            dT_03.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GC upr", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GC Razem", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "GSCps", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "WSC", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "przek. refund.", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            
            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Imie i Nazwisko sędziego", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Załatwienia", "10", "1" });

            Session["header_03"] = dT_03;
            //   makeHeader3(sn, dT_03);
            #endregion

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GC upr.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GC Razem", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "WSC", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "9", "1" });
            dT_04.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "W tym 6-12 miesięcy", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "12-24 miesiące", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Powyżej 24 miesiące", "1", "2" });
            Session["header_04"] = dT_04;
            //  makeHeader4(sn, dT_04);
            #endregion

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Wyznaczonych odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand wyznaczonych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Wyznacz. odbytych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });

            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw wyznacz.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "odbytych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });

            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z pos. niejaw. wyznacz.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand  wyzn. odbytych", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });


            Session["header_05"] = dT_05;
            //    makeHeader6(sn, dT_05);


            #endregion



        }

        protected void odswiez()
        {
          
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            txt = "File name: onsg.aspx";

            txt = txt + cl.clear_maim_db();
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1,tenPlik);
            GridView2.DataBind();


            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                //txt = txt + cl.uzupelnij_statusy();
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

            try
            {
                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 6");
                DataTable tabela1 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 6, 6, 23, tenPlik);
                Session["tabelkaGW002"] = tabela1;

                tab_06_w01_c01.Text = tabela1.Rows[0][1].ToString().Trim();
                tab_06_w01_c02.Text = tabela1.Rows[0][2].ToString().Trim();
                tab_06_w01_c03.Text = tabela1.Rows[0][3].ToString().Trim();
                tab_06_w01_c04.Text = tabela1.Rows[0][4].ToString().Trim();
                tab_06_w01_c05.Text = tabela1.Rows[0][5].ToString().Trim();
                tab_06_w01_c06.Text = tabela1.Rows[0][6].ToString().Trim();
                tab_06_w01_c07.Text = tabela1.Rows[0][7].ToString().Trim();
                tab_06_w01_c08.Text = tabela1.Rows[0][8].ToString().Trim();
                tab_06_w01_c09.Text = tabela1.Rows[0][9].ToString().Trim();
                tab_06_w01_c10.Text = tabela1.Rows[0][10].ToString().Trim();
                tab_06_w01_c11.Text = tabela1.Rows[0][11].ToString().Trim();
                tab_06_w01_c12.Text = tabela1.Rows[0][12].ToString().Trim();
                tab_06_w01_c13.Text = tabela1.Rows[0][13].ToString().Trim();
                tab_06_w01_c14.Text = tabela1.Rows[0][14].ToString().Trim();
                tab_06_w01_c15.Text = tabela1.Rows[0][15].ToString().Trim();
                tab_06_w01_c16.Text = tabela1.Rows[0][16].ToString().Trim();
                tab_06_w01_c17.Text = tabela1.Rows[0][17].ToString().Trim();
                tab_06_w01_c18.Text = tabela1.Rows[0][18].ToString().Trim();
                tab_06_w01_c19.Text = tabela1.Rows[0][19].ToString().Trim();
                tab_06_w01_c20.Text = tabela1.Rows[0][20].ToString().Trim();
                tab_06_w01_c21.Text = tabela1.Rows[0][21].ToString().Trim();
                tab_06_w01_c22.Text = tabela1.Rows[0][22].ToString().Trim();
                //wiersz 2
                tab_06_w02_c01.Text = tabela1.Rows[1][1].ToString().Trim();
                tab_06_w02_c02.Text = tabela1.Rows[1][2].ToString().Trim();
                tab_06_w02_c03.Text = tabela1.Rows[1][3].ToString().Trim();
                tab_06_w02_c04.Text = tabela1.Rows[1][4].ToString().Trim();
                tab_06_w02_c05.Text = tabela1.Rows[1][5].ToString().Trim();
                tab_06_w02_c06.Text = tabela1.Rows[1][6].ToString().Trim();
                tab_06_w02_c07.Text = tabela1.Rows[1][7].ToString().Trim();
                tab_06_w02_c08.Text = tabela1.Rows[1][8].ToString().Trim();
                tab_06_w02_c09.Text = tabela1.Rows[1][9].ToString().Trim();
                tab_06_w02_c10.Text = tabela1.Rows[1][10].ToString().Trim();
                tab_06_w02_c11.Text = tabela1.Rows[1][11].ToString().Trim();
                tab_06_w02_c12.Text = tabela1.Rows[1][12].ToString().Trim();
                tab_06_w02_c13.Text = tabela1.Rows[1][13].ToString().Trim();
                tab_06_w02_c14.Text = tabela1.Rows[1][14].ToString().Trim();
                tab_06_w02_c15.Text = tabela1.Rows[1][15].ToString().Trim();
                tab_06_w02_c16.Text = tabela1.Rows[1][16].ToString().Trim();
                tab_06_w02_c17.Text = tabela1.Rows[1][17].ToString().Trim();
                tab_06_w02_c18.Text = tabela1.Rows[1][18].ToString().Trim();
                tab_06_w02_c19.Text = tabela1.Rows[1][19].ToString().Trim();
                tab_06_w02_c20.Text = tabela1.Rows[1][20].ToString().Trim();
                tab_06_w02_c21.Text = tabela1.Rows[1][21].ToString().Trim();
                tab_06_w02_c22.Text = tabela1.Rows[1][22].ToString().Trim();
                //wiersz 3
                tab_06_w03_c01.Text = tabela1.Rows[2][1].ToString().Trim();
                tab_06_w03_c02.Text = tabela1.Rows[2][2].ToString().Trim();
                tab_06_w03_c03.Text = tabela1.Rows[2][3].ToString().Trim();
                tab_06_w03_c04.Text = tabela1.Rows[2][4].ToString().Trim();
                tab_06_w03_c05.Text = tabela1.Rows[2][5].ToString().Trim();
                tab_06_w03_c06.Text = tabela1.Rows[2][6].ToString().Trim();
                tab_06_w03_c07.Text = tabela1.Rows[2][7].ToString().Trim();
                tab_06_w03_c08.Text = tabela1.Rows[2][8].ToString().Trim();
                tab_06_w03_c09.Text = tabela1.Rows[2][9].ToString().Trim();
                tab_06_w03_c10.Text = tabela1.Rows[2][10].ToString().Trim();
                tab_06_w03_c11.Text = tabela1.Rows[2][11].ToString().Trim();
                tab_06_w03_c12.Text = tabela1.Rows[2][12].ToString().Trim();
                tab_06_w03_c13.Text = tabela1.Rows[2][13].ToString().Trim();
                tab_06_w03_c14.Text = tabela1.Rows[2][14].ToString().Trim();
                tab_06_w03_c15.Text = tabela1.Rows[2][15].ToString().Trim();
                tab_06_w03_c16.Text = tabela1.Rows[2][16].ToString().Trim();
                tab_06_w03_c17.Text = tabela1.Rows[2][17].ToString().Trim();
                tab_06_w03_c18.Text = tabela1.Rows[2][18].ToString().Trim();
                tab_06_w03_c19.Text = tabela1.Rows[2][19].ToString().Trim();
                tab_06_w03_c20.Text = tabela1.Rows[2][20].ToString().Trim();
                tab_06_w03_c21.Text = tabela1.Rows[2][21].ToString().Trim();
                tab_06_w03_c22.Text = tabela1.Rows[2][22].ToString().Trim();
                //wiersz4
                tab_06_w04_c01.Text = tabela1.Rows[3][1].ToString().Trim();
                tab_06_w04_c02.Text = tabela1.Rows[3][2].ToString().Trim();
                tab_06_w04_c03.Text = tabela1.Rows[3][3].ToString().Trim();
                tab_06_w04_c04.Text = tabela1.Rows[3][4].ToString().Trim();
                tab_06_w04_c05.Text = tabela1.Rows[3][5].ToString().Trim();
                tab_06_w04_c06.Text = tabela1.Rows[3][6].ToString().Trim();
                tab_06_w04_c07.Text = tabela1.Rows[3][7].ToString().Trim();
                tab_06_w04_c08.Text = tabela1.Rows[3][8].ToString().Trim();
                tab_06_w04_c09.Text = tabela1.Rows[3][9].ToString().Trim();
                tab_06_w04_c10.Text = tabela1.Rows[3][10].ToString().Trim();
                tab_06_w04_c11.Text = tabela1.Rows[3][11].ToString().Trim();
                tab_06_w04_c12.Text = tabela1.Rows[3][12].ToString().Trim();
                tab_06_w04_c13.Text = tabela1.Rows[3][13].ToString().Trim();
                tab_06_w04_c14.Text = tabela1.Rows[3][14].ToString().Trim();
                tab_06_w04_c15.Text = tabela1.Rows[3][15].ToString().Trim();
                tab_06_w04_c16.Text = tabela1.Rows[3][16].ToString().Trim();
                tab_06_w04_c17.Text = tabela1.Rows[3][17].ToString().Trim();
                tab_06_w04_c18.Text = tabela1.Rows[3][18].ToString().Trim();
                tab_06_w04_c19.Text = tabela1.Rows[3][19].ToString().Trim();
                tab_06_w04_c20.Text = tabela1.Rows[3][20].ToString().Trim();
                tab_06_w04_c21.Text = tabela1.Rows[3][21].ToString().Trim();
                tab_06_w04_c22.Text = tabela1.Rows[3][22].ToString().Trim();
                //wiersz 5
                tab_06_w05_c01.Text = tabela1.Rows[4][1].ToString().Trim();
                tab_06_w05_c02.Text = tabela1.Rows[4][2].ToString().Trim();
                tab_06_w05_c03.Text = tabela1.Rows[4][3].ToString().Trim();
                tab_06_w05_c04.Text = tabela1.Rows[4][4].ToString().Trim();
                tab_06_w05_c05.Text = tabela1.Rows[4][5].ToString().Trim();
                tab_06_w05_c06.Text = tabela1.Rows[4][6].ToString().Trim();
                tab_06_w05_c07.Text = tabela1.Rows[4][7].ToString().Trim();
                tab_06_w05_c08.Text = tabela1.Rows[4][8].ToString().Trim();
                tab_06_w05_c09.Text = tabela1.Rows[4][9].ToString().Trim();
                tab_06_w05_c10.Text = tabela1.Rows[4][10].ToString().Trim();
                tab_06_w05_c11.Text = tabela1.Rows[4][11].ToString().Trim();
                tab_06_w05_c12.Text = tabela1.Rows[4][12].ToString().Trim();
                tab_06_w05_c13.Text = tabela1.Rows[4][13].ToString().Trim();
                tab_06_w05_c14.Text = tabela1.Rows[4][14].ToString().Trim();
                tab_06_w05_c15.Text = tabela1.Rows[4][15].ToString().Trim();
                tab_06_w05_c16.Text = tabela1.Rows[4][16].ToString().Trim();
                tab_06_w05_c17.Text = tabela1.Rows[4][17].ToString().Trim();
                tab_06_w05_c18.Text = tabela1.Rows[4][18].ToString().Trim();
                tab_06_w05_c19.Text = tabela1.Rows[4][19].ToString().Trim();
                tab_06_w05_c20.Text = tabela1.Rows[4][20].ToString().Trim();
                tab_06_w05_c21.Text = tabela1.Rows[4][21].ToString().Trim();
                tab_06_w05_c22.Text = tabela1.Rows[4][22].ToString().Trim();

                //wiersz 6
                tab_06_w06_c01.Text = tabela1.Rows[5][1].ToString().Trim();
                tab_06_w06_c02.Text = tabela1.Rows[5][2].ToString().Trim();
                tab_06_w06_c03.Text = tabela1.Rows[5][3].ToString().Trim();
                tab_06_w06_c04.Text = tabela1.Rows[5][4].ToString().Trim();
                tab_06_w06_c05.Text = tabela1.Rows[5][5].ToString().Trim();
                tab_06_w06_c06.Text = tabela1.Rows[5][6].ToString().Trim();
                tab_06_w06_c07.Text = tabela1.Rows[5][7].ToString().Trim();
                tab_06_w06_c08.Text = tabela1.Rows[5][8].ToString().Trim();
                tab_06_w06_c09.Text = tabela1.Rows[5][9].ToString().Trim();
                tab_06_w06_c10.Text = tabela1.Rows[5][10].ToString().Trim();
                tab_06_w06_c11.Text = tabela1.Rows[5][11].ToString().Trim();
                tab_06_w06_c12.Text = tabela1.Rows[5][12].ToString().Trim();
                tab_06_w06_c13.Text = tabela1.Rows[5][13].ToString().Trim();
                tab_06_w06_c14.Text = tabela1.Rows[5][14].ToString().Trim();
                tab_06_w06_c15.Text = tabela1.Rows[5][15].ToString().Trim();
                tab_06_w06_c16.Text = tabela1.Rows[5][16].ToString().Trim();
                tab_06_w06_c17.Text = tabela1.Rows[5][17].ToString().Trim();
                tab_06_w06_c18.Text = tabela1.Rows[5][18].ToString().Trim();
                tab_06_w06_c19.Text = tabela1.Rows[5][19].ToString().Trim();
                tab_06_w06_c20.Text = tabela1.Rows[5][20].ToString().Trim();
                tab_06_w06_c21.Text = tabela1.Rows[5][21].ToString().Trim();
                tab_06_w06_c22.Text = tabela1.Rows[5][22].ToString().Trim();





            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }

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
            //  makeAllHeaders();

        }

        #region "nagłowki tabel"
        TableCell HeaderCell_(string text, int columns, int rows)
        {
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = text;
            HeaderCell.ColumnSpan = columns;
            HeaderCell.RowSpan = rows;
            return HeaderCell;


        }
        GridViewRow Grw(object sender)
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
                    GridView6.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }









        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                    Label19.Text = "Wpływ za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    //Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label6.Text = "Pozostało na miesiąc następny z miesiąca:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    infoLabel6.Text = "Struktura pozostałości – pozostało razem spraw - w tym zawieszonych";
                }
                else
                {
                    Label19.Text = "Wpływ za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Załatwienia za okres od" + Date1.Text + " do  " + Date2.Text;
                    //Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label6.Text = "Pozostało na miesiąc następny za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    infoLabel6.Text = "Struktura pozostałości – pozostało razem spraw - w tym zawieszonych";
                }
            }
            catch
            {}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            FileInfo tenPlikExcela = new FileInfo(tenPlik);
            string path = Server.MapPath("Template") + "\\" + Path.GetFileNameWithoutExtension(tenPlikExcela.Name) + ".xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\" + Path.GetFileNameWithoutExtension(tenPlikExcela.Name);

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataView view = (DataView)dane_do_tabeli_1 .Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                foreach (var row in table.Rows)
                {
                    for (int i = 0; i < 8; i++)
                    {
                        // ROBIENIE 
                    }
                }
//                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 14, 1, 6, true, false, false, false, false);

                //druga

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                DataView view2 = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                
                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 12,0 , 4, true, false, false, false, false);

                //trzecia
                DataView view3 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table3 = view3.ToTable();

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 12, 1, 4, false, false, false, false, false);

                //czwarta
                DataView view4 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

                DataTable table4 = view4.ToTable();

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table4, 15, 0, 3, true, false, false, false, false);


                //piąta
                DataView view5 = (DataView)tabela_5.Select(DataSourceSelectArguments.Empty);

                DataTable table5 = view5.ToTable();

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], table5, 20, 0, 3, true, false, false, false, false);


                //piąta
                DataTable table6 = (DataTable)Session["tabelkaGW002"];

                  MyWorksheet2 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[6], table6,5, 22, 2, 4 ,false);
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







            // execel begin
            /*
            string filename = "statystykiWydzialCywilny.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();*/
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
            view = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);

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







        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                makeHeader2(sn, dT);
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                makeHeader1(sn, dT);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                makeHeader3(sn, dT);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_04"];
                makeHeader4(sn, dT);
            }
        }

        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                makeHeader6(sn, dT);
            }
        }
    }
}