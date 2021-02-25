/*
Last Update:
    - version 1.181121
Creation date: 2018-11-21

*/

using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class otrpOLD : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();
        public string tenPlik = "otrp.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //   //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);

            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            Session["id_dzialu"] = idWydzial;
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();

            clearHedersSession();

            try
            {
                string user = (string)Session["userIdNum"];
                string dzial = (string)Session["id_dzialu"];
                bool dost = cm.dostep(dzial, user);
                if (!dost)
                {
                    Server.Transfer("default.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        odswiez();
                    }
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
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
            Session["sesja"] = "s3030";
            try
            {
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                }

                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
            }
            catch
            { }
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            txt = txt + cl.clear_maim_db();

            int dzial = int.Parse((string)Session["id_dzialu"]);

            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_wierszy(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), yyx, 1, tenPlik);
                GridView2.DataBind();
                txt = txt + cl.generuj_dane_do_tabeli_(dzial, 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }

            GridView1.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            { }
            Label11.Text = txt;
        }

        #region "nagłowki tabel"

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // najnizszy
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();

                HeaderCell.Text = "P";

                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Np";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Po";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "U";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Uo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "WSC";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "Łącznie";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                ////  drugi wiersz

                //W tym      nieusprawiedliwione

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.Font.Size = 10;
                HeaderCell = new TableCell();

                HeaderCell.Text = "Ruch spraw";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sprawy według repetoriów i wykazów";
                HeaderCell.ColumnSpan = 7;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "rozprawy";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "posiedzenia";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "P";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Np";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Po";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "U";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Uo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "WSC";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Urolopy";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Zwolnienia";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Liczba sesji";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Załatwienia";
                HeaderCell.ColumnSpan = 7;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Il. sporządzonych uzasadnień";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nieobecności";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "P";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Np";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Po";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "U";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Uo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "WSC";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wyznaczenia";
                HeaderCell.ColumnSpan = 7;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Odroczenia liczba spraw odroczonych";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "P";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Np";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Po";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "U";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Uo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "WSC";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Pozostało w referatach spraw kategorii";
                HeaderCell.ColumnSpan = 15;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label8.Text = GridView1.SelectedDataKey[1].ToString() + " " + GridView1.SelectedDataKey[2].ToString();
            //makeLabels();
        }

        #endregion "obsługa oncommand  tabel z nazwiskami"

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["date_1"] = Date1.Text.Trim();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin
            string filename = "statystykiWydzialPracy.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();
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
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 7);
            sheet0.AddMergedRegion(crs);

            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("P");
            row0.CreateCell(2).SetCellValue("Np");
            row0.CreateCell(3).SetCellValue("Po");
            row0.CreateCell(4).SetCellValue("U");
            row0.CreateCell(5).SetCellValue("Uo");
            row0.CreateCell(6).SetCellValue("WSC");
            row0.CreateCell(7).SetCellValue("Łącznie");

            int rol = 2;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);
                for (int i = 0; i < 8; i++)
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
            view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table = view.ToTable();
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
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
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 7, 13);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(14).SetCellValue("Il. sporządzonych uzasadnień");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 14, 14);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(15).SetCellValue("Nieobecności");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 15, 16);
            sheet1.AddMergedRegion(crs);

            row2 = sheet1.CreateRow(1);

            row2.CreateCell(5).SetCellValue("rozprawy");
            row2.CreateCell(6).SetCellValue("posiedzenia");
            row2.CreateCell(7).SetCellValue("P");
            row2.CreateCell(8).SetCellValue("Np");
            row2.CreateCell(9).SetCellValue("Po");
            row2.CreateCell(10).SetCellValue("U");
            row2.CreateCell(11).SetCellValue("Uo");
            row2.CreateCell(12).SetCellValue("WSC");
            row2.CreateCell(13).SetCellValue("Razem");
            row2.CreateCell(15).SetCellValue("Urlopy");
            row2.CreateCell(16).SetCellValue("Zwolnienia");

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
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 11);
            sheet2.AddMergedRegion(crs);

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 12, 12);
            sheet2.AddMergedRegion(crs);
            row2.CreateCell(12).SetCellValue("Odroczenia liczba spraw odroczonych");
            row2 = sheet2.CreateRow(1);

            row2.CreateCell(5).SetCellValue("P");
            row2.CreateCell(6).SetCellValue("Np");
            row2.CreateCell(7).SetCellValue("Po");
            row2.CreateCell(8).SetCellValue("U");
            row2.CreateCell(9).SetCellValue("Uo");
            row2.CreateCell(10).SetCellValue("WSC");
            row2.CreateCell(11).SetCellValue("Razem");

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
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            //makeLabels();
        }
    }
}