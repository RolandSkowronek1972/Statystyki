using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private int storid = 0;
        private int rowIndex = 1;

        public static string tenPlik = "oglr.aspx";

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

        protected void tabela_1x()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, tenPlik);
                Session["tabelka001"] = tabelka01;
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.DataSource = tabelka01;
                GridView1.DataBind();
            }
            catch
            { }
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 35, tenPlik);
                Session["tabelka003"] = tabelka01;
                GridView3.DataSource = null;
                GridView3.DataSourceID = null;
                GridView3.DataSource = tabelka01;
                GridView3.DataBind();
            }
            catch
            { }
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 35, tenPlik);
                Session["tabelka004"] = tabelka01;
                GridView4.DataSource = null;
                GridView4.DataSourceID = null;
                GridView4.DataSource = tabelka01;
                GridView4.DataBind();
            }
            catch
            { }
        }

        protected void odswiez()
        {
            string id_dzialu = (string)Session["id_dzialu"];
            string txt = string.Empty;
            cl.clear_maim_db();
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 30, tenPlik);
                Session["tabelka002"] = tabelka01;
                //cm.log.Info(tenPlik + " : Wygenerowano dal tabeli 2" + tabelka01.Rows.Count.ToString() + " wierszy");
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }

            tabela_1x();
            tabela_3();
            tabela_4();

            // dopasowanie opisów

            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel2.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel3.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel5.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;

                infoLabel5.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        private DataTable SchematTabeliNaglowka()
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

        #region tabela  3 ()

        private DataTable NaglowekTabeli_3()
        {
            DataTable dT_03 = SchematTabeliNaglowka();

            dT_03.Clear();
            for (int i = 0; i < 8; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
                dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });
            }

            dT_03.Rows.Add(new Object[] { "2", "Rozpraw", "1", "2", "v" });
            dT_03.Rows.Add(new Object[] { "2", "Posiedzeń", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "v" });
            dT_03.Rows.Add(new Object[] { "2", "Na rozprawach", "1", "2", "v" });
            dT_03.Rows.Add(new Object[] { "2", "Na posiedzeniach", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "2", "Rc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Rco", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RCps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Pozos-tałość na początek okresu kontro-lnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesie-czny wpływ ( w fakty-cznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Efektywny czas pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Ilość sesji", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość wyznaczonych spraw", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw odrocznych z rozpraw (bez publikacji!!!)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wskaźnik odroczeń", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Razem", "2", "2", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średnio miesię-cznie załat-wienia w efek-tywnym czasie pracy", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Pozos-tałość na koniec okresu kont-rolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wielo-krotna", "1", "3", "h" });

            return dT_03;
        }

        #endregion tabela  3 ()

        #region tabela  4 ()

        private DataTable NaglowekTabeli_4()
        {
            DataTable dT_04 = SchematTabeliNaglowka();

            dT_04.Clear();
            //Alk	Op	Opm	Nw

            dT_04.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            dT_04.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            return dT_04;
        }

        #endregion tabela  4 ()

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeaderT3(NaglowekTabeli_3(), GridView3);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli_4(), GridView4);
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
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label15.Text = "Postępowanie wykonawcze w miesiącu " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Postępowanie wykonawcze w okresie od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglr.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oglr";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 24, 2, 7, false, false, false, false, false);

                rowik = ((DataTable)Session["tabelka001"]).Rows.Count + 1;

                // pod tabela z tebeli nr 2
                tabela.komorkaExcela(MyWorksheet1, rowik + 6, 3, "Zaległość z poprzedniego miesiąca", true, 0, 1);

                tabela.komorkaExcela(MyWorksheet1, rowik + 7, 3, "Wpływ", true, 0, 1);
                tabela.komorkaExcela(MyWorksheet1, rowik + 8, 3, "Załatwienia", true, 0, 1);
                tabela.komorkaExcela(MyWorksheet1, rowik + 9, 3, "Pozostało na następny miesiąc", true, 0, 1);
                tabela.komorkaExcela(MyWorksheet1, rowik + 10, 3, "odroczono", true, 0, 1);
                tabela.komorkaExcela(MyWorksheet1, rowik + 11, 3, "Zaległość", true, 5, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 11, 4, "3-6 miesięcy", false, 0, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 12, 4, "6-12 miesięcy", false, 0, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 13, 4, "12-24 miesięcy", false, 0, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 14, 4, "24-35 miesięcy", false, 0, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 15, 4, "36-60 miesięcy", false, 0, 0);
                tabela.komorkaExcela(MyWorksheet1, rowik + 16, 4, "Powyżej 60 miesięcy (powyżej 5 lat)", false, 0, 0);

                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j < ilWierszy - 4)
                    {
                        for (int i = 2; i < 24; i++)
                        {
                            try
                            {
                                string value = (dR[i - 1].ToString().Trim());
                                tabela.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 6, i + 3, value, false, 0, 0);
                                // MyWorksheet1.Cells[rowik + 6, i + 3].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {
                                //   MyWorksheet1.Cells[rowik + 6, i + 3].Value = dR[i - 1].ToString().Trim();
                            }
                            //   MyWorksheet1.Cells[rowik + 6, i + 3].Style.ShrinkToFit = true;
                            //  MyWorksheet1.Cells[rowik + 6, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        }
                        rowik++;
                        j++;
                        if (j > 10)
                        {
                            break;
                        }
                    }
                }

                // trzecia

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 31, 2, 7, false, true, false, false, false);

                // czwarta

                DataTable table4 = (DataTable)Session["tabelka004"];

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table4, 6, 0, 7, false, true, false, false, false);

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
                string path = Server.MapPath("XMLHeaders") + "\\oglr_01.xml";
                xMLHeaders.getHeaderFromXML(path, GridView1);
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
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tabela.makeSumRow(table, e, 1);
            }
        }

        private GridViewRow wierszTabeli1(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz tabelka001
            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 3, "borderTopLeft "));

            for (int i = 1; i < 25; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }
            return NewTotalRow;
        }

        private GridViewRow wierszTabeli2(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("Zaległość", 6, 1, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 2, "borderTopLeft  "));
            for (int i = 1; i < 25; i++)
            {
                try
                {
                    string txt = tabelka01.Rows[idWiersza - 1][i].ToString().Trim();
                    NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }

            return NewTotalRow;
        }

        private GridViewRow wierszTabeli3(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 2, "borderTopLeft  "));

            for (int i = 1; i < 25; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";

            // nowy wiersz
            int idWiersza = 0;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca"));

            idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "wpływ"));

            // nowy wiersz
            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "pozostałość na następny miesiąc"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "odroczono"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "3-6 miesiący "));
            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "6-12 miesięcy "));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "12-24 miesięcy (do 2 lat) "));
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "24-36 miesięcy (2-3 lat) "));
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "36-60 miesięcy (3-5 lat) "));
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "Powyżej 60 miesięcy (powyżej 5 lat) "));
        }
    }
}