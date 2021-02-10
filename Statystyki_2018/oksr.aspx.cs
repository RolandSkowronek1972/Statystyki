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
  
     public partial class oksr : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public pdfTables pdfT = new pdfTables();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();

        public static string tenPlik = "oktr.aspx";

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
                        //makeHeader();
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
            //id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            txt = "File name: <b>oksr.aspx</b></br>";

            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1,tenPlik);
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 6,tenPlik);
            GridView2.DataBind();
            GridView7.DataBind();
            txt = txt + cl.clear_maim_db();
            try
            {
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
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            GridView6.DataBind();
            GridView8.DataBind();
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

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {

            //pierwsza wierszowa tabela
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

                HeaderCell.Text = "C";

                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Ns";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Co";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Cps";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();


                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Łacznie";
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
                HeaderCell.ColumnSpan = 8;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }




        }



        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {

            // druga tabela

            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);
            dT.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Pozostało z poprzedniego okresu", "9", "1" });
            dT.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "W tym 6-12 miesięcy", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "12-24 miesiące", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Powyżej 24 miesiące", "1", "2" });

            //xxxxx

            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                        row = r;
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }






        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // trzecia tabela

            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);
            dT.Rows.Add(new Object[] { "1", "Za miesiąc bieżący", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Od początku roku do końca miesiąca bieżącego", "1", "1" });
            dT.Rows.Add(new Object[] { "2", "C", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ns", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nsm", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Co", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nmo", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Cps", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nkd", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT.Rows.Add(new Object[] { "3", "Imie i Nazwisko", "1", "3" });
            dT.Rows.Add(new Object[] { "3", "Wpływ", "9", "1" });



            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                        row = r;
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }



        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {

            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);
            dT.Rows.Add(new Object[] { "1", "Za miesiąc bieżący", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Od początku roku do miesiąca bieżącego", "1", "1" });
            dT.Rows.Add(new Object[] { "2", "C", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ns", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nsm", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Co", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nmo", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Cps", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Nkd", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT.Rows.Add(new Object[] { "3", "Imie i Nazwisko", "1", "3" });
            dT.Rows.Add(new Object[] { "3", "ZAŁAWIENIA", "9", "1" });

            //dT.Rows.Add(new Object[] { "1", "Za miesiąc bieżący", "1", "1" });
            //dT.Rows.Add(new Object[] { "1", "Od początku roku do miesiąca bieżącego", "1", "1" });
            /*
            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Funkcja", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Stanowisko", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand łącznie", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand łącznie", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand łącznie", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });*/
            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                        row = r;
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }


        }

        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);
            //dT.Rows.Add(new Object[] { "1", "Za miesiąc bieżący", "1", "1" });
            //dT.Rows.Add(new Object[] { "1", "Od początku roku do miesiąca bieżącego", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });

            dT.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "8", "1" });
            dT.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "W tym 6-12 miesięcy", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "12-24 miesiące", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Powyżej 24 miesiące", "1", "2" });

            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                        row = r;
                    }
                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView6.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }

        }

        protected void GridView7_RowCreated(object sender, GridViewRowEventArgs e)
        {

            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);

            dT.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "suma powyżej 12 miesięcy", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "powyżej 5 lat do 8 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "suma powyżej 8 lat", "1", "1" });
            dT.Rows.Add(new Object[] { "2", "Kategorii Spraw", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Liczba spraw (w tym zawieszone)", "11", "1" });
            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                        row = r;
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView7.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }







        }


        protected void GridView8_RowCreated(object sender, GridViewRowEventArgs e)
        {
            TableCell HeaderCell = new TableCell();
            GridViewRow HeaderGridRow = null;

            DataTable dT = new DataTable();
            DataColumn k1 = new DataColumn();
            k1.DataType = System.Type.GetType("System.String");
            DataColumn k2 = new DataColumn();
            k2.DataType = System.Type.GetType("System.String");
            DataColumn k3 = new DataColumn();
            k3.DataType = System.Type.GetType("System.String");
            DataColumn k4 = new DataColumn();
            k4.DataType = System.Type.GetType("System.String");

            dT.Columns.Add(k1);
            dT.Columns.Add(k2);
            dT.Columns.Add(k3);
            dT.Columns.Add(k4);



            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Imie i Nazwisko", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand  łącznie( wraz z wykonawczymi )", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw  i posiedzeń  jawnych za wyjątkiem posiedzeń wykonawczych ", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość wokand z posiedzeń niejawnych", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "2", "1" });
            dT.Rows.Add(new Object[] { "2", "Procent odroczeń", "1", "2" });
            dT.Rows.Add(new Object[] { "2", "Posiedzenia wykonawcze ( jawne i niejawne ) ", "1", "2" });
            int row = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (DataRow dR in dT.Rows)
                {
                    int r = int.Parse(dR[0].ToString().Trim());
                    if (r > row)
                    {
                        // new row
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                        HeaderGridRow.Font.Size = 7;
                        HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                        HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                        row = r;
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView8.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }

            }
        }

        #endregion "nagłowki tabel"



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Label8.Text = GridView1.SelectedDataKey[1].ToString() + " " + GridView1.SelectedDataKey[2].ToString();
            makeLabels();
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


                //id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    Label19.Text = "Pozostało z poprzedniego okresu za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Wpływ za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "Załatwienia na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label6.Text = "Pozostało na miesiąc następny z miesiąca:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    Label19.Text = "Pozostało z poprzedniego okresu za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wpływ za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label6.Text = "Pozostało na miesiąc następny za okres od:  " + Date1.Text + " do  " + Date2.Text;
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

            // execel begin
            string filename = "statystykiWydzialCywilny.xls";
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
            view = (DataView)statystyki0.Select(DataSourceSelectArguments.Empty);

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




        protected void LinkButton58_Click(object sender, EventArgs e)
        {
            //ooooooooooooo
            string idSedziego = (string)Session["id_sedziego"];
            string aa = (string)Session["aa"];
            string bb = (string)Session["bb"];
            string tabela = (string)Session["id_tabeli"];
            string dzial = (string)Session["id_dzialu"];
            Session["data_1"] = Date1.Text.Trim();
            Session["data_2"] = Date2.Text.Trim();
            DateTime data1 = DateTime.Parse(Date1.Text.Trim());
            DateTime data2 = DateTime.Parse(Date1.Text.Trim());
            //===================
            MemoryStream msString = pdfT.memoryStr(idSedziego, tabela, dzial, data1, data2, aa, bb);
            //===================
            Response.ContentType = "pdf/application";

            Response.AddHeader("content-disposition", "attachment;filename=Raport.pdf");
            Response.BinaryWrite(msString.ToArray());//
            Response.OutputStream.Write(msString.GetBuffer(), 0, msString.GetBuffer().Length);
            Response.Flush();

            Response.Clear();

            Response.End();


        }


    }
}