using OfficeOpenXml;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    using System;

    public partial class oczp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();
        private int storid = 0;
        private int rowIndex = 1;
        private const string tenPlik = "oczp.aspx";

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
                        clearHedersSession();
                        makeHeader();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch 
            {
                //   Server.Transfer("default.aspx");
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
            string id_dzialu = (string)Session["id_dzialu"];

            string txt = string.Empty;
            cl.deleteRowTable();

            try
            {
             
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 20, false, tenPlik);
                Session["tabelka002"] = tabelka01;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            tabela_1();     
            makeLabels();
            gwTabela1.DataBind();
        

            txt = txt + "GridView1 liczba wierszy: " + gwTabela1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel2.Visible = cl.debug(int.Parse(id_dzialu));
             
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
               
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            Session["tabelka001"] = dr.tworzTabele(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, gwTabela1, tenPlik);
            gwTabela1.DataBind();
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

            #endregion tabela  1 (wierszowa)

        

          
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
                    tabela2Label.Text = "Informacja z ruchu spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
             
                }
                else
                {
                    tabela2Label.Text = "Informacja z ruchu spraw za okres od " + Date1.Text + " do  " + Date2.Text;
                   
                }
            }
            catch
            {
            }
        }

     
        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 21, 0, 7, false, false, false, false, false);
                // pod tabela z tebeli nr 2

                // obwodnia
                rowik = table.Rows.Count;
                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {
                    for (int i = 1; i < 22; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                }
                //------------

                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 1, rowik + 11, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 1, rowik + 17, 1].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 1].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 12, 2, rowik + 12, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 2].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13, 2, rowik + 13, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 2].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 2, rowik + 14, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 2].Value = " 6-12 miesięcy";
                MyWorksheet1.Cells[rowik + 15, 2, rowik + 15, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 2].Value = " 12-24 miesięcy (do 2 lat)";

                MyWorksheet1.Cells[rowik + 16, 2, rowik + 16, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 2].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17, 2, rowik + 17, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 2].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;

                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j <= ilWierszy - 10)
                    {
                        for (int i = 2; i < 18; i++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {
                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = dR[i - 1].ToString().Trim();
                            }
                        }
                        j++;
                    }
                    rowik++;
                }

                // trzecia

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka003"], 7, 0, 5, false, true, false, false, false,false);

                
          
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

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();window.PrintPreview();", true);
            makeLabels();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\oczp.xml";
                xMLHeaders.getHeaderFromXML(path, gwTabela1);
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
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

    

        //podtabela

        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e);
            }
        }

        private GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli, string drugiText, int colSpanDrugi, int rowSpanDrugi, string cssStyleDrugi)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(drugiText, 7, 2, "borderTopLeft "));

            NewTotalRow.Cells.Add(tb.cela(tekst, colSpan, rowSpan, cssStyleDlaTabeli));
            for (int i = 1; i < 17; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
            }

            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            string idtabeli = "2";
            DataTable tabelka01 = (DataTable)Session["tabelka002"];

            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca", 6, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Wpływ", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Załatwienie", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "pozostałość na następny miesiąc", 6, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "0-3 miesiący ", 4, 1, "normal", "borderTopLeft col_60 normal", "w tym", 7, 2, "borderTopLeft normal"));
            //     GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "0-3 miesiący "));
            // nowy wiersz
            idWiersza = 6;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "3-6 miesięcy", 4, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "6-12 miesięcy ", 4, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "12-24 miesięcy</br> (do 2 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "24-36 miesięcy </br>(2-3 lat))", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "36-60 miesięcy </br>(3-5 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Powyżej 60 miesięcy </br>(powyżej</br> 5 lat)", 4, 1, "normal", "borderTopLeft col_60 normal"));
        }
    }
}