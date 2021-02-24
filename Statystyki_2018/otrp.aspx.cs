using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class otrp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public tabele tb = new tabele();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private const string fileId = "otrp";
        private const string tenPlik = "otrp.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
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
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            }

            Session["data_1"] = Date1.Date.Year.ToString() + "-" + Date1.Date.Month.ToString("D2") + "-" + Date1.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_1"]);
            Session["data_2"] = Date2.Date.Year.ToString() + "-" + Date2.Date.Month.ToString("D2") + "-" + Date2.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_"]);

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
                        //makeLabels();
                    }
                }
            }
            catch
            {
                //   Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
        {
            string idDzialu = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                DataTable Tabela1 = cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, idDzialu, 1, 12, 16, tenPlik);

                Session["tabelka001"] = Tabela1;
                GridView2.DataSource = null;
                GridView2.DataSourceID = null;
                GridView2.DataSource = Tabela1;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
            }

            try
            {
                Session["tabelka002"] = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 17, tenPlik);
                Session["tabelka003"] = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 17, tenPlik);
                Session["tabelka004"] = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 17, tenPlik);
                string path = Server.MapPath("XMLHeaders") + "\\" + "otrp.xml";
                StringBuilder Tabele = new StringBuilder();
                Tabele.Append(xMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), "2", (DataTable)Session["tabelka002"], true, true, true, true, tenPlik));
                Tabele.Append(xMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), "3", (DataTable)Session["tabelka003"], true, true, true, true, tenPlik));
                Tabele.Append(xMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), "4", (DataTable)Session["tabelka004"], true, true, true, true, tenPlik));

                tablePlaceHolder01.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id1" });
            }
            catch
            {
            }

            //     makeLabels();

            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(NaglowekTabeli1(), GridView2);
            }
        }

        private DataTable NaglowekTabeli1()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "P", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Np", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Po", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Pz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "U", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Uo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Uz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "9", "1" });
            return dT_01;
        }

        #endregion "nagłowki tabel"

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin

            string path = Server.MapPath("Template") + "\\otrp.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\otrp";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];
                table.Columns.Remove("Id_");
                try
                {
                    for (int i = 1; i < 11; i++)
                    {
                        for (int j = 0; j < 10; j++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[4 + j, i].Style.ShrinkToFit = true;
                                MyWorksheet1.Cells[4 + j, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                                MyWorksheet1.Cells[4 + j, i].Value = table.Rows[j][i ].ToString();
                            }
                            catch
                            {
                            }
                        }
                    }
                }
                catch
                {
                }

                // druga
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 14, 0, 6, true, false, true, true, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 10, 0, 4, true, false, true, true, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 10, 0, 4, true, false, true, true, false);

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
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }
    }
}