/*
Last Update:
    - version 1.190815
Creation date: 2019-08-15

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class okt2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private const string tenPlik = "okt2.aspx";
        private const string tenPlikNazwa = "okt2";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }

                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }

                path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
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
            }
            catch
            { }
            odswiez();
            debug();
        }// end of Page_Load

        private void debug()
        {
            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }

                LabelNazwaSadu.Text = cl.nazwaSadu(idDzialu);
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch
            {
                infoLabel2.Visible = false;
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            if (Session["id_dzialu"] == null) return;
            
            tabela_1();
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\" + tenPlikNazwa + ".xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\" + tenPlikNazwa + "";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 14, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 7, 0, 3, false, false, false, false, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka0016"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka0017"], 7, 0, 3, false, false, false, false, false);

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka008"], 4, 2, 2, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka009"], 1, 11, 2, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka010"], 4, 3, 2, 1, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[13], (DataTable)Session["tabelka011"], 8, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[14], (DataTable)Session["tabelka012"], 6, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[15], (DataTable)Session["tabelka013"], 7, 0, 4, false, false, false, false, false);

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

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 25, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela2.DataSource = null;
            gwTabela2.DataSourceID = null;
            gwTabela2.DataSource = tabelka01;
            gwTabela2.DataBind();
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    string path = Server.MapPath("XMLHeaders") + "\\okt2.xml";
                    xMLHeaders.getHeaderFromXML(path, gwTabela2);
                   
                }
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 1");
                tb.makeSumRow((DataTable)Session["tabelka001"], e, 0);
            }
        }
        /*
        private DataTable makeheader02()
        {
            #region tabela  2 ()

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));

            dT_01.Clear();

            for (int i = 1; i < 11; i++)
            {
                dT_01.Rows.Add(new Object[] { i.ToString(), "zaw", "1", "1", "h", "60" });//
            }
            dT_01.Rows.Add(new Object[] { "1-14 dni", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "15-30 dni", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "pow. 1 do 3 mies.", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "ponad 3 mies.", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//

            dT_01.Rows.Add(new Object[] { "3", "Razem", "2", "1", "h" });//
            dT_01.Rows.Add(new Object[] { "3", "w terminie ustawowym", "2", "1", "h" });//
            dT_01.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "1", "8", "h", "120" });//

            dT_01.Rows.Add(new Object[] { "4", "L.p.", "1", "3", "h", "10" });//
            dT_01.Rows.Add(new Object[] { "4", "Sędzia", "1", "3", "h", "130" });
            dT_01.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "9", "1", "h", "60" });//

            return dT_01;

            #endregion tabela  2 ()
        }*/
    }
}