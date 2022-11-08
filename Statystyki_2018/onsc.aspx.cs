using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace Statystyki_2018
{
   
public partial class onsc : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        private dataReaders dr = new dataReaders();
        private tabele tb = new tabele();
        const string tenPlik = "onsc.aspx";

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


        void makeHeader()
        {

            //tabele
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





            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "6", "1" });
            Session["header_01"] = dT_01;
            //  makeHeader2(sn, dT_01);
            #endregion
            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Pozostało z ubiegłego miesiąca", "15", "1" });

            Session["header_02"] = dT_02;

            //  makeHeader1(sn, dT_02);
            #endregion
            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_03.Rows.Add(new Object[] { "2", "C", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Cps", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "7", "1" });
            Session["header_03"] = dT_03;
            //   makeHeader3(sn, dT_03);
            #endregion

            #region tabela  4 ()


            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));



            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "2", "C", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Ns", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Nc", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Co", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Cps", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwienia", "7", "1" });
            dT_04.Rows.Add(new Object[] { "3", "Uwagi", "1", "3" });
            Session["header_04"] = dT_04;
            //  makeHeader4(sn, dT_04);

            #endregion

            #region tabela  5 ()


            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));

            dT_05.Clear();



            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość odbytych wokand łącznie", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw ", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z posiedzeń niejawnych ", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });



            Session["header_05"] = dT_05;

            //  makeHeader6(sn, dT_05);
            #endregion

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "6", "1" });

            dT_06.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "2" });
            Session["header_06"] = dT_06;

            //   makeHeader7(sn, dT_06);
            #endregion

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "suma powyżej 12 miesięcy", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });

            dT_08.Rows.Add(new Object[] { "1", "powyżej 5 do 8 lat", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "ponad 8 lat", "1", "1" });

            dT_08.Rows.Add(new Object[] { "2", "kategoria spraw", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Miesiąc", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "liczba spraw ( w tym zawieszone) ", "11", "1" });


            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_08"] = dT_08;
            //    makeHeader8(sn, dT_08);
            #endregion



        }

        protected void odswiez()
        {
           
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; 
            txt = "File name: <b>onsc.aspx</b></br>";
            txt = txt + cl.clear_maim_db();

            cl.deleteRowTable();
            try
            {
                DataTable tabela1 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, yyx, 1, 11, 6, tenPlik);
                Session["tabela01"] = tabela1;
                tab_01_w01_c01.Text = tabela1.Rows[0][1].ToString().Trim();
                tab_01_w01_c02.Text = tabela1.Rows[0][2].ToString().Trim();
                tab_01_w01_c03.Text = tabela1.Rows[0][3].ToString().Trim();
                tab_01_w01_c04.Text = tabela1.Rows[0][4].ToString().Trim();
                tab_01_w01_c05.Text = tabela1.Rows[0][5].ToString().Trim();
                tab_01_w01_c06.Text = tabela1.Rows[0][6].ToString().Trim();
                //wiersz 2
                tab_01_w02_c01.Text = tabela1.Rows[1][1].ToString().Trim();
                tab_01_w02_c02.Text = tabela1.Rows[1][2].ToString().Trim();
                tab_01_w02_c03.Text = tabela1.Rows[1][3].ToString().Trim();
                tab_01_w02_c04.Text = tabela1.Rows[1][4].ToString().Trim();
                tab_01_w02_c05.Text = tabela1.Rows[1][5].ToString().Trim();
                tab_01_w02_c06.Text = tabela1.Rows[1][6].ToString().Trim();
                //wiersz 3
                tab_01_w03_c01.Text = tabela1.Rows[2][1].ToString().Trim();
                tab_01_w03_c02.Text = tabela1.Rows[2][2].ToString().Trim();
                tab_01_w03_c03.Text = tabela1.Rows[2][3].ToString().Trim();
                tab_01_w03_c04.Text = tabela1.Rows[2][4].ToString().Trim();
                tab_01_w03_c05.Text = tabela1.Rows[2][5].ToString().Trim();
                tab_01_w03_c06.Text = tabela1.Rows[2][6].ToString().Trim();
                //wiersz 4
                tab_01_w04_c01.Text = tabela1.Rows[3][1].ToString().Trim();
                tab_01_w04_c02.Text = tabela1.Rows[3][2].ToString().Trim();
                tab_01_w04_c03.Text = tabela1.Rows[3][3].ToString().Trim();
                tab_01_w04_c04.Text = tabela1.Rows[3][4].ToString().Trim();
                tab_01_w04_c05.Text = tabela1.Rows[3][5].ToString().Trim();
                tab_01_w04_c06.Text = tabela1.Rows[3][6].ToString().Trim();
                //wiersz 5 
                tab_01_w05_c01.Text = tabela1.Rows[4][1].ToString().Trim();
                tab_01_w05_c02.Text = tabela1.Rows[4][2].ToString().Trim();
                tab_01_w05_c03.Text = tabela1.Rows[4][3].ToString().Trim();
                tab_01_w05_c04.Text = tabela1.Rows[4][4].ToString().Trim();
                tab_01_w05_c05.Text = tabela1.Rows[4][5].ToString().Trim();
                tab_01_w05_c06.Text = tabela1.Rows[4][6].ToString().Trim();
                //wiersz 6
                tab_01_w06_c01.Text = tabela1.Rows[5][1].ToString().Trim();
                tab_01_w06_c02.Text = tabela1.Rows[5][2].ToString().Trim();
                tab_01_w06_c03.Text = tabela1.Rows[5][3].ToString().Trim();
                tab_01_w06_c04.Text = tabela1.Rows[5][4].ToString().Trim();
                tab_01_w06_c05.Text = tabela1.Rows[5][5].ToString().Trim();
                tab_01_w06_c06.Text = tabela1.Rows[5][6].ToString().Trim();

                //wiersz 7
                tab_01_w07_c01.Text = tabela1.Rows[6][1].ToString().Trim();
                tab_01_w07_c02.Text = tabela1.Rows[6][2].ToString().Trim();
                tab_01_w07_c03.Text = tabela1.Rows[6][3].ToString().Trim();
                tab_01_w07_c04.Text = tabela1.Rows[6][4].ToString().Trim();
                tab_01_w07_c05.Text = tabela1.Rows[6][5].ToString().Trim();
                tab_01_w07_c06.Text = tabela1.Rows[6][6].ToString().Trim();
                //wiersz 8
                tab_01_w08_c01.Text = tabela1.Rows[7][1].ToString().Trim();
                tab_01_w08_c02.Text = tabela1.Rows[7][2].ToString().Trim();
                tab_01_w08_c03.Text = tabela1.Rows[7][3].ToString().Trim();
                tab_01_w08_c04.Text = tabela1.Rows[7][4].ToString().Trim();
                tab_01_w08_c05.Text = tabela1.Rows[7][5].ToString().Trim();
                tab_01_w08_c06.Text = tabela1.Rows[7][6].ToString().Trim();
                //wiersz 9
                tab_01_w09_c01.Text = tabela1.Rows[8][1].ToString().Trim();
                tab_01_w09_c02.Text = tabela1.Rows[8][2].ToString().Trim();
                tab_01_w09_c03.Text = tabela1.Rows[8][3].ToString().Trim();
                tab_01_w09_c04.Text = tabela1.Rows[8][4].ToString().Trim();
                tab_01_w09_c05.Text = tabela1.Rows[8][5].ToString().Trim();
                tab_01_w09_c06.Text = tabela1.Rows[8][6].ToString().Trim();
                //wiersz 10
                tab_01_w10_c01.Text = tabela1.Rows[9][1].ToString().Trim();
                tab_01_w10_c02.Text = tabela1.Rows[9][2].ToString().Trim();
                tab_01_w10_c03.Text = tabela1.Rows[9][3].ToString().Trim();
                tab_01_w10_c04.Text = tabela1.Rows[9][4].ToString().Trim();
                tab_01_w10_c05.Text = tabela1.Rows[9][5].ToString().Trim();
                tab_01_w10_c06.Text = tabela1.Rows[9][6].ToString().Trim();
                //wiersz 11
                tab_01_w11_c01.Text = tabela1.Rows[10][1].ToString().Trim();
                tab_01_w11_c02.Text = tabela1.Rows[10][2].ToString().Trim();
                tab_01_w11_c03.Text = tabela1.Rows[10][3].ToString().Trim();
                tab_01_w11_c04.Text = tabela1.Rows[10][4].ToString().Trim();
                tab_01_w11_c05.Text = tabela1.Rows[10][5].ToString().Trim();
                tab_01_w11_c06.Text = tabela1.Rows[10][6].ToString().Trim();



            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : Ładowanie danych do tabeli 1 : " + ex.Message);
            }
            try
            {
                DataTable tabela1 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, yyx, 7,5, 13, tenPlik);
                pisz("tab_07_", 6, 13, tabela1);
             
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik+" : Ładowanie danych do tabeli 7 : "+ex.Message);
            }

            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, Date1.Date, Date2.Date);
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, Date1.Date, Date2.Date);
                
                //	txt = txt + cl.uzupelnij_statusy();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : Ładowanie danych do tabel 2-6 : " + ex.Message);
            }
        
            //  
            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView3.DataBind();
            GridView5.DataBind();
            GridView6.DataBind();
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

            //   makeHeades();

        }

        

      
       

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
                    Label17.Text = "Wpływ za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label15.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    //Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label35.Text = "Pozostało na następny miesiąc w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label19.Text = "Pozostało z ubieglego miesiąca w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    Label17.Text = "Wpływ za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od" + Date1.Text + " do  " + Date2.Text;
                    //Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;

                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label35.Text = "Pozostało na następny z okresu od:  " + Date1.Text + " do  " + Date2.Text;
                    Label19.Text = "Pozostało z ubieglego miesiąca w okresie od:   " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);

        }


        protected void newPrint()
        {
            //  excell();
            string path = Server.MapPath("Template") + "\\onsc.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\onsc";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
            
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {

                //Worksheets[1]

                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);
                
                DataTable table =(DataTable)Session["tabela01"];
                
             
              
                int rowik = 1;
                foreach (DataRow dR in table.Rows)
                {
                    for (int i = 1; i <7; i++)
                    {
                        MyWorksheet.Cells[rowik + 2, i+1].Value = dR[i].ToString().Trim();
                        MyWorksheet.Cells[rowik + 2, i+1].Style.ShrinkToFit = true;
                    }
                    rowik++;
                }

                // druga 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                view = null;
                table = null;
                 view = (DataView)statystyki .Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view.ToTable();

                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 11, 0, 3, true, false, false, false, true);

                //trzecia

                view = null;
                table2 = null;
                view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);
                table2 = view.ToTable();
                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table2, 8, 0, 4, true, false, false, false, true);
                //czwarta

                
                view = null;
                table2 = null;

                view = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);
                table2 = view.ToTable();
                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table2, 9, 0, 4, true, false, false, false, true);

                MyWorksheet2 = MyExcel.Workbook.Worksheets[5];

                view = null;
                table2 = null;

                view = (DataView)tabela_5.Select(DataSourceSelectArguments.Empty);
                table2 = view.ToTable();

                //piata
               
                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], table2, 9, 0, 4, true, false, false, false, true);



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
                    Label11.Text = Label11.Text + "Save Error massage " + ex.Message + "<br/>";
                }

            }




        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            newPrint();

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
                tb.makeHeader(dT, GridView5);
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
               
                DataTable dT = (DataTable)Session["header_06"];
                tb.makeHeader(dT, GridView7);
            }
        }

       

        protected void GridViewx_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_08"];
                // makeHeader9(sn, dT);
            }
        }

        protected void stopkaTabeli_GridView6(object sender, GridViewRowEventArgs e)
        {
      
        }
        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        {
                        }
                    }
                }
            }
        }// end of pisz
    }
}