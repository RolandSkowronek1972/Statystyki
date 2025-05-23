﻿using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aglg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private const string tenPlik = "aglg.aspx";

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
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 19, 20, false, tenPlik);
                Session["tabelka002"] = tabelka01;
                tabela_1();
                tabela_3();
                tabela_4();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów

            try
            {
                Label11.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
                infoLabel2.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
                infoLabel3.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
                infoLabel5.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel5.Visible = false;
            }

            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 28, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela4.DataSource = null;
            gwTabela4.DataSourceID = null;
            gwTabela4.DataSource = tabelka01;
            gwTabela4.DataBind();
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

        private DataTable NaglowekTabeli_1()
        {
            DataTable dT_02 = SchematTabeliNaglowka();
            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "p-I", "1", "1", "h", "60" });
            dT_02.Rows.Add(new Object[] { "1", "p-II", "1", "1", "h", "60" });

            dT_02.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h", "60" });
            dT_02.Rows.Add(new Object[] { "2", "w tym ", "2", "1", "h", "60" });
            dT_02.Rows.Add(new Object[] { "2", "skarga kasacyjna", "1", "2", "h", "60" });
            dT_02.Rows.Add(new Object[] { "2", "o stwierdzenie niezgodności z prawem", "1", "2", "h", "60" });



            dT_02.Rows.Add(new Object[] { "3", "GC", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GC zaw", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GNC", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GCo", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GCo zaw.", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "Ga", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "Ga zaw", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "Ga KRZ", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GZ KRZ", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "GZ", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "Gz poziome", "3", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "3", "S", "1", "3", "h", "60" });
            dT_02.Rows.Add(new Object[] { "3", "WSC  ", "2", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "4", "I instancja", "5", "1", "h", "150" });
            dT_02.Rows.Add(new Object[] { "4", "II instancja", "13", "1", "h", "150" });

            dT_02.Rows.Add(new Object[] { "5", "Lp ", "1", "5", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "5", "Imię i nazwisko ", "1", "5", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "5", "ZAŁATWIENIA ", "16", "1", "h", "1000" });//
            dT_02.Rows.Add(new Object[] { "5", "Razem", "1", "5", "h", "60" });
            dT_02.Rows.Add(new Object[] { "5", "zaw", "1", "5", "h", "60" });


            return dT_02;
        }

        private DataTable NaglowekTabeli_3()
        {
            DataTable dT_03 = SchematTabeliNaglowka();
            dT_03.Clear();
            for (int i = 0; i < 10; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
                dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });
            }

            dT_03.Rows.Add(new Object[] { "2", "Rozpraw", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Posiedzeń", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na rozprawach", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na posiedzeniach", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "c", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cgg", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cz", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "N", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na początek okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesieczny wpływ ( w faktycznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Efektywny czas pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Ilość sesji", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość wyznaczonych spraw", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw odrocznych z rozpraw (bez publikacji!!!)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wskaźnik odroczeń", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwienia", "18", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Razem", "2", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Średnio miesięcznie załatwienia w efektywnym czasie pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na koniec okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wielkrotna", "1", "3", "h" });

            return dT_03;
        }

        private DataTable NaglowekTabeli_4()
        {
            DataTable dT_04 = SchematTabeliNaglowka();
            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Imię i nazwisko referendarza", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Przydział orzeczniczy", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych sesji", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych posiedzeń", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_04;
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(NaglowekTabeli_3(), gwTabela3);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(NaglowekTabeli_4(), gwTabela4);
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
                    Label15.Text = "Referendarze - sesje w miesiącu " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Referendarze - sesje w okresie od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            { }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglc.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oglc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
               

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];
                rowik = table.Rows.Count - 2;
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 18, 0, 5, false, false, false, false, false, false);

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka002"], 14, 16, 2, rowik + 7, false);

                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 7, 1, "Pozostałóść z poprzedniego miesiąca", true, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 8, 1, "Wpływ", true, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 9, 1, "Załatwienia", true, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 10, 1, "Pozostało na następny miesiąc", true, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 11, 1, "powyżej 3 do 6 miesiący", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 12, 1, "powyżej 6 do 12 miesiący", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 13, 2, "powyżej 12 do 24 miesiący", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 14, 2, "Powyżej 24 miesięcy", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[1], rowik + 15, 2, "Odroczenia", false, 0, 0);


                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 33, 0, 7, false, true, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka004"], 5, 0, 6, true, true, false, false, false, false);

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
                tb.makeHeader(NaglowekTabeli_1(), gwTabela1);
               
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
                e.Row.Cells[2].ColumnSpan = 2;
                //now make up for the colspan from cell2
                e.Row.Cells.RemoveAt(3);
                e.Row.Cells[4].ColumnSpan = 2;
                //now make up for the colspan from cell2
                e.Row.Cells.RemoveAt(6);
                e.Row.Cells[5].ColumnSpan = 2;
                //now make up for the colspan from cell2
                e.Row.Cells.RemoveAt(7);
                e.Row.Cells[15].ColumnSpan = 2;
                //now make up for the colspan from cell2
                e.Row.Cells.RemoveAt(16);
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                //  tb.makeSumRow((DataTable)Session["tabelka001"], e,1);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka003"], e, 1);
            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka004"], e, 1);
            }
        }

       

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = (DataTable)Session["tabelka002"];

            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            string idtabeli = "2";

            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliAGLG(tabelka01, 19 , idWiersza, idtabeli, "Pozostałóść z poprzedniego miesiąca", 2, 1, "normal ", "borderTopLeft ",true));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliAGLG(tabelka01, 19 , idWiersza, idtabeli, "Wpływ", 2, 1, "normal ", "borderTopLeft ", false,true));

            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliAGLG(tabelka01, 19 , idWiersza, idtabeli, "Załatwienia", 2, 1, "normal", "borderTopLeft ", false,true));

            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliAGLG(tabelka01, 19 , idWiersza, idtabeli, "Pozostałość na następny miesiąc", 2, 1, "normal", "borderTopLeft ", true));

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 19, idWiersza, idtabeli, "powyżej  3 do 6 miesięcy", 2, 1, "normal", "borderTopLeft ", false,    true));

            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 19, idWiersza, idtabeli, "powyżej 6 do 12 miesięcy", 2, 1, "normal", "borderTopLeft ", false , true));

            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 19, idWiersza, idtabeli, "powyżej 12 do 24 miesięcy", 2, 1, "normal", "borderTopLeft ", false, true));

            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 19, idWiersza, idtabeli, "powyżej 24 miesięcy", 2, 1, "normal", "borderTopLeft ", false, true));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 19, idWiersza, idtabeli, "Odroczenia", 2, 1, "normal", "borderTopLeft ", false,true));

        }
    }
}