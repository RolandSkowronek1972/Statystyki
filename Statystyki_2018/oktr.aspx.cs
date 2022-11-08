using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oktr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "oktr.aspx";

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
                tabelkaGW2 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 17, 17, tenPlik);
                Session["tabelkaGW002"] = tabelkaGW2;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }

            try
            {
                //cm.log.Info(tenPlik + ": wczytywanie danych do tabeli 1");
                tabelkaGW1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 1, Date1.Date, Date2.Date, 16, tenPlik);
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
                cm.log.Info(tenPlik + ": wczytywanie danych do tabeli 3");
                tabelkaGW3 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date, 30, tenPlik);
                Session["tabelkaGW003"] = tabelkaGW3;
                Gridview3.DataSource = null;
                Gridview3.DataSourceID = null;
                Gridview3.DataSource = tabelkaGW3;
                Gridview3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

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
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        private DataTable NaglowekTabeli01()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));
            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "sprawy rodzinne - nieletnich", "3", "1" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy cywilne – małoletnich", "6", "1" });

            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Nazwisko i imię sędziego", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Załatwienia", "9", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Zaż. Poz. RCz", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Absencja w dn. rob.", "1", "3" });

            return dT_01;
        }

        #region tabela  2 ()

        private DataTable NaglowekTabeli02()
        {
            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));
            dT_02.Columns.Add("Column6", typeof(string));
            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h", "60" });
            dT_02.Rows.Add(new Object[] { "1", "Nazwisko i imie sędziego ", "1", "1", "h", "60" });
            dT_02.Rows.Add(new Object[] { "1", "RC", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "RNs", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });

            dT_02.Rows.Add(new Object[] { "1", "RCo", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "RCz", "1", "1" });

            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_02;
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
                    lbTabela3Title.Text = "Wpływ spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela3Title.Text = "Wpływ spraw za okres od" + Date1.Text + " do  " + Date2.Text;
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
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 16, 0, 8, true, true, false, false, false);

                // pod tabela z tebeli nr 2

                int rowik = table.Rows.Count + 2; ;

                tabela.komorkaExcela(MyWorksheet1, rowik + 7, 1, "Pozostałość z poprzedniego miesiąca", true, 0, 2);
                tabela.komorkaExcela(MyWorksheet1, rowik + 8, 1, "Wpłynęło", true, 0, 2);
                tabela.komorkaExcela(MyWorksheet1, rowik + 9, 1, "Załatwiono", true, 0, 2);

                tabela.komorkaExcela(MyWorksheet1, rowik + 10, 1, "Pozostało na miesiąc następny", true, 0, 2);
                tabela.komorkaExcela(MyWorksheet1, rowik + 11, 1, "Zaległość powyżej 3 – 6 miesięcy", true, 0, 2);
                tabela.komorkaExcela(MyWorksheet1, rowik + 12, 1, "Zaległość powyżej 6 miesięcy", true, 0, 2);
                tabela.komorkaExcela(MyWorksheet1, rowik + 13, 1, "Zaległość powyżej 12 miesięcy", true, 0, 2);

                DataTable dane = (DataTable)Session["tabelkaGW002"];
                for (int i = 0; i < 14; i++)
                {
                    for (int j = 0; j < 7; j++)
                    {
                        try
                        {
                            tabela.komorkaExcela(MyWorksheet1, rowik + 7 + j, i + 3, dane.Rows[j][i].ToString(), false, 0, 0);
                        }
                        catch (Exception ex)
                        {
                            cm.log.Error(tenPlik + " " + ex.Message);
                        }
                    }
                }

                //druga

                table = (DataTable)Session["tabelkaGW003"];
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table, 10, 0, 5, true, true, false, false, false);

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

        protected void Gridview1_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli01(), Tabela1);
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
                tabela.makeHeader(NaglowekTabeli01(), Tabela1);
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
                tabela.makeHeader(NaglowekTabeli02(), Gridview3);
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

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.PodsumowanieTabeli((DataTable)Session["tabelkaGW001"], 14, "normal borderTopLeft"));

            string idtabeli = "2";

            // nowy wiersz
            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Pozostałość z poprzedniego miesiąca", 3, 1, "normal", "borderTopLeft", false));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Wpłynęło", 3, 1, "normal", "borderTopLeft", false));

            // nowy wiersz
            idWiersza = 3;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Załatwiono", 3, 1, "normal", "borderTopLeft", false));

            // nowy wiersz
            idWiersza = 4;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Pozostało na miesiąc następny", 3, 1, "normal", "borderTopLeft", false));

            // nowy wiersz

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Zaległość powyżej 3 – 6 miesięcy", 3, 1, "normal", "borderTopLeft", false));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Zaległość powyżej 6 miesięcy", 3, 1, "normal", "borderTopLeft", false));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 13, idWiersza, idtabeli, "Zaległość powyżej 12 miesięcy", 3, 1, "normal", "borderTopLeft", false));
        }
    }
}