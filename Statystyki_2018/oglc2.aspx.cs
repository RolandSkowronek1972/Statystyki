using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglc2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "oglc2.aspx";

        private int storid = 0;
        private int rowIndex = 1;

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
            string dzial = (string)Session["id_dzialu"];
            string txt = string.Empty;
            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, false, tenPlik);
                Session["tabelka002"] = tabelka01;
            }
            catch
            { }
            try
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
                Session["tabelka001"] = dr.tworzTabele(int.Parse(dzial), 1, Date1.Date, Date2.Date, 20, GridView1, tenPlik);
                GridView1.DataBind();
                Session["tabelka003"] = dr.tworzTabele(int.Parse(dzial), 3, Date1.Date, Date2.Date, 17, GridView2, tenPlik);
                GridView2.DataBind();
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");

                Session["tabelka004"] = dr.tworzTabele(int.Parse(dzial), 4, Date1.Date, Date2.Date, 30, GridView3, tenPlik);
                GridView3.DataBind();
                Session["tabelka006"] = dr.tworzTabele(int.Parse(dzial), 6, Date1.Date, Date2.Date, 30, GridView4, tenPlik);
                GridView4.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            try
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
                DataTable tabelka04 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 5, 20, 20, false, tenPlik);
                Session["tabelka005"] = tabelka04;

                tab_04_w01_c01.Text = tabelka04.Rows[0][1].ToString().Trim();
                tab_04_w01_c2.Text = tabelka04.Rows[0][2].ToString().Trim();
                tab_04_w01_c3.Text = tabelka04.Rows[0][3].ToString().Trim();
                tab_04_w01_c4.Text = tabelka04.Rows[0][4].ToString().Trim();
                tab_04_w01_c5.Text = tabelka04.Rows[0][5].ToString().Trim();
                tab_04_w01_c6.Text = tabelka04.Rows[0][6].ToString().Trim();
                tab_04_w01_c7.Text = tabelka04.Rows[0][7].ToString().Trim();
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(dzial));
                infoLabel2.Visible = cl.debug(int.Parse(dzial));
                infoLabel3.Visible = cl.debug(int.Parse(dzial));
                infoLabel4.Visible = cl.debug(int.Parse(dzial));
                infoLabel5.Visible = cl.debug(int.Parse(dzial));
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

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cgg", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Referendarz sądowy", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Pozostałość na </br>początek okresu</br> kontrolnego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wpływ.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Średni miesięczny wpływ (w faktycznym czasie pracy)", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Efektywny</br> czas</br> pracy ", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Ilość posiedzeń", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Załatwienia kończące postępowanie / niekończące postępowania", "7", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Średnio miesięcznie razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Pozostałości na koniec okresu kontrolnego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wielokrotna", "1", "2" });

            dT_01.Rows.Add(new Object[] { "3", "Wydajność referendarzy sądowych orzekających w Wydziale ( w oreksach odpowiednio ja wyżej)", "19", "1" });

            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Sędzia / referendarz", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Od 3 do 5 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Od 5 do 8 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "powyżej  8 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "2", "Ilość spraw cywilnych w których postępowanie toczy się powyżej 3 lat (na koniec września i marca kolejnych lat ):", "10", "1", "h" });

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            for (int i = 0; i < 7; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "wpływ", "1", "1", "v" });
                dT_03.Rows.Add(new Object[] { "1", "pozostałość", "1", "1", "v" });
            }

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Sędzia /referendarz", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "C", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cgg", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wsc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem pozostałości", "1", "2", "h", "60" });//

            dT_03.Rows.Add(new Object[] { "3", "Wielkość i stan referatów ( przy czym wielkość odpowiada liczbie spraw, które wpłyneły do referatu w okresie objętym notatką, a stan liczbę pozostałości).", "19", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Imię i nazwisko referendarza", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Przydział orzeczniczy", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych sesji", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych posiedzeń", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            Session["header_04"] = dT_04;

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "Ogółem ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "po upływie terminu ustalonego (czyli 14dni+)", "8", "1", "H" });

            dT_05.Rows.Add(new Object[] { "3", "Sędzia/referendarz", "1", "3", "H" });
            dT_05.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień", "10", "1", "H" });

            dT_05.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "H" });

            dT_05.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "11", "1", "H" });
            //
            Session["header_05"] = dT_05;

            #endregion tabela  5 ()
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(dT, GridView2);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(dT, GridView3);
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
                    tabela2Label.Text = "Sprawozdanie za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela2Title.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label15.Text = "Sesje w miesiącu " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie  za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2Title.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Sesje w okresie od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            { }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglc2.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oglc2";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            DataTable table = (DataTable)Session["tabelka001"];
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
                int rowik = 0;
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 18, 0, 4, false, false, false, false, false);
                rowik = table.Rows.Count - 3;
                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 2].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 2].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";

                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 2].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Załatwienia";

                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 2].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 11, 1, rowik + 17, 1].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " w tym";
                MyWorksheet1.Cells[rowik + 11, 2].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 12, 2].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 13, 2].Value = " 6-12 miesięcy";

                MyWorksheet1.Cells[rowik + 14, 2].Value = " 12-24 miesięcy (do 2 lat)";
                MyWorksheet1.Cells[rowik + 15, 2].Value = " 24 - 36 miesięcy </ br > (2 - 3 lat))";
                
                MyWorksheet1.Cells[rowik + 16, 2].Value = " 36-60 miesięcy (3-5 lat)";
            
                MyWorksheet1.Cells[rowik + 17, 2].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka002"];
                MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka002"], 11, 16, 2, rowik + 7, false);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 8, 0, 3, false, true, false, false, false);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka004"], 17, 0, 4, false, true, false, false, false);
                MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka005"], 1, 7, 0, 9, false);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka006"], 11, 0, 11, false, true, false, false, false);

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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader((DataTable)Session["header_01"], GridView1);
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
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_04"];
                tabela.makeHeader(dT, GridView4);
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                //   tabela.makeSumRow(table, e,2);
            }
        }

        protected void GridView4_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(dT, GridView4);
            }
        }

        protected void GridView4_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["tabelka006"], e, 1);
            }
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            string idtabeli = "2";
            DataTable tabelka01 = (DataTable)Session["tabelka002"];

            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Wpływ", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Załatwienie", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "pozostałość na następny miesiąc", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "0-3 miesiący ", 1, 1, "normal", "borderTopLeft col_60 normal", "w tym", 7, 2, "borderTopLeft normal"));

            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "3-6 miesięcy", 1, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "6-12 miesięcy ", 1, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "12-24 miesięcy</br> (do 2 lat)", 1, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "24-36 miesięcy </br>(2-3 lat))", 1, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "36-60 miesięcy </br>(3-5 lat)", 1, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Powyżej 60 miesięcy </br>(powyżej</br> 5 lat)", 1, 1, "normal", "borderTopLeft col_60 normal"));
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["tabelka004"], e);
            }
        }
    }
}