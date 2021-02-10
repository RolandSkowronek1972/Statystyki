using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oktg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "oktg.aspx";

        private int storid = 0;
        private int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                   // Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
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

    

        protected void odswiez()
        {
            string idDzialu = (string)Session["id_dzialu"];
            string txt = string.Empty;

            DataTable tabelkaGW1 = new DataTable();
            DataTable tabelkaGW2 = new DataTable();
            DataTable tabelkaGW3 = new DataTable();

            try
            {
                //cm.log.Info("OGLR2: wczytywanie danych do tabeli 2");
                tabelkaGW2 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 11, 8, tenPlik);
                Session["tabelkaGW002"] = tabelkaGW2;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }

            try
            {
                //cm.log.Info(tenPlik + ": wczytywanie danych do tabeli 1");
                tabelkaGW1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date, 30, tenPlik);
                Session["tabelkaGW001"] = tabelkaGW1;
                Tabela1.DataSource = null;
                Tabela1.DataSourceID = null;
                Tabela1.DataSource = tabelkaGW1;
                Tabela1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }

            try
            {
                //cm.log.Info(tenPlik+": wczytywanie danych do tabeli 3");
                tabelkaGW3 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date, 10, tenPlik);
                Session["tabelkaGW003"] = tabelkaGW3;
                Gridview3.DataSource = null;
                Gridview3.DataSourceID = null;
                Gridview3.DataSource = tabelkaGW3;
                Gridview3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error("OGLR2: " + ex.Message);
            }

            try
            {
                Label11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
            }

            Label11.Text = txt;
        }

        #region "nagłowki tabel"

      

        private DataTable schenatTabeliNaglowkowej()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));
            return dT_01;
        }

        private DataTable Naglowektabeli01()
        {
            DataTable dataTable = schenatTabeliNaglowkowej();
            dataTable.Clear();
            for (int i = 0; i < 3; i++)
            {
                dataTable.Rows.Add(new Object[] { "1", "GC", "1", "1" });
                dataTable.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
                dataTable.Rows.Add(new Object[] { "1", "GNs", "1", "1" });           
                dataTable.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
                dataTable.Rows.Add(new Object[] { "1", "Gco", "1", "1" });
                dataTable.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
                dataTable.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            }

            dataTable.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });

            dataTable.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dataTable.Rows.Add(new Object[] { "2", "Ilość odbytych sesji/spraw", "1", "2" });
            dataTable.Rows.Add(new Object[] { "2", "Liczba przesłuchanych stron", "1", "2" });
            dataTable.Rows.Add(new Object[] { "2", "Wpływ", "7", "1" });
            dataTable.Rows.Add(new Object[] { "2", "Załatwienia", "7", "1" });
            dataTable.Rows.Add(new Object[] { "2", "Zaległość", "7", "1" });

            dataTable.Rows.Add(new Object[] { "2", "Absencja w dn. rob.", "1", "2" });
            return dataTable;
        }

        #region tabela  2 ()

        private DataTable naglowekTabeli02()

        {
            DataTable dataTable = schenatTabeliNaglowkowej();
            dataTable.Clear();
            //GC Gz GNs GNc Gco GCps
            dataTable.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
            dataTable.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dataTable.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h", "60" });
            dataTable.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego wg funkcji w wydziale", "1", "2", "h", "60" });
            dataTable.Rows.Add(new Object[] { "2", "Zaległości", "7", "1", "h", });

            return dataTable;
        }

        #endregion tabela  2 ()

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
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za okres od" + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            FileInfo tenPlikExcela = new FileInfo(tenPlik);
            string path = Server.MapPath("Template") + "\\" + Path.GetFileNameWithoutExtension(tenPlikExcela.Name) + ".xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\" + Path.GetFileNameWithoutExtension(tenPlikExcela.Name);

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

           

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataTable table = (DataTable)Session["tabelkaGW001"];

                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 24, 0, 6, true, true, false, false, false, true);

                int iloscWierszy = table.Rows.Count;
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 7, 1, "Pozostało z okresu poprzedniego", true, 0, 3);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 8, 1, "Wpływ spraw", true, 0, 3);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 9, 1, "załatwienia", true, 0, 3);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 10, 1, "pozostałość na okres następny", true, 0, 3);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 11, 1, "Zaległość", true, 4, 2);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 11, 4, "3-6 miesiecy", false, 0, 0);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 12, 4, "6-12 miesiecy", false, 0, 0);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 13, 4, "12 m-cy do 2 lat)", false, 0, 0);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 14, 4, "2-3 lat", false, 0, 0);
                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 15, 4, "powyżej 3 lat", false, 0, 0);

         
                //druga
                DataTable table2 = (DataTable)Session["tabelkaGW002"];
                try
                {
                    for (int i = 0; i < 9; i++)
                    {
                        for (int j = 0; j < 7; j++)
                        {
                            string value = table2.Rows[i][j + 1].ToString();
                            tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], iloscWierszy + 7 + i, j + 5, value, false, 0, 0);
                        }
                    }
                }
                catch (Exception)
                {
                  
                }
                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                table = (DataTable)Session["tabelkaGW003"];

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table, 8, 0, 5, true, false, false, false, false, false);

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

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW001"];
                tabela.makeSumRow(table, e);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }
     
        protected void Gridview1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void naglowekTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
              
                tb.makeHeader(Naglowektabeli01(), Tabela1);
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

        protected void stopkaTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void naglowekTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(naglowekTabeli02(), Gridview3);
            }
        }

        protected void stopkaTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW002"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void Gridview3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW003"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.PodsumowanieTabeli((DataTable)Session["tabelkaGW001"], 24, "normal borderTopLeft gray"));

            // nowy wiersz
            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "Pozostało z okresu poprzedniego", 4, 1, "normal", "borderTopLeft"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "Wpływ spraw", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz
            idWiersza = 3;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "załatwienia", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz
            idWiersza = 4;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "pozostałość na okres następny", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "3-6 miesiecy", 1, 1, "normal", "", "Zaległość", 5, 3, "borderTopLeft "));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "6-12 miesiecy", 1, 1, "normal", "borderTopLeft"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "12 m-cy do 2 lat)", 1, 1, "normal", "borderTopLeft"));
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "2-3 lat", 1, 1, "normal", "borderTopLeft"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 8, idWiersza, idtabeli, "powyżej 3 lat", 1, 1, "normal", "borderTopLeft"));
        }
    }
}