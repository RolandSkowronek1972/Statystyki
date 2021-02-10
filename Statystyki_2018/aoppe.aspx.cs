/*
Last Update:
    - version 1.190127
Creation date: 2019-01-27

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aoppe : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aoppe.aspx";
        private const string tenPlikNazwa = "aoppe";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
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

                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
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
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }
                //Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch
            { }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel1.Visible = false;
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            //odswiezenie danych
            tabela_1();
            LabelNazwaSadu.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 38, 0, 6, true, true, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 40, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka001"], e, 1);
            }
        }

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uwzględniono", "1", "1" });
            for (int i = 0; i < 4; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Kzw", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Kow", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pen", "1", "2" });
            }
           
           
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "do 3 m-cy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 6 m - cy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow.  6 do 12 m - cy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 12 m-cy do 2 lat", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 2 do 3 lat", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 5 lat", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 5 do 8 lat", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow.  8 lat", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "załatwiono", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pozostałość", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "lp", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "nazwisko i imię sędziego", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "zaległość z poprzedniego roku", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WPŁYW", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Wyznaczono", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ZAŁATWIENIA", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "sesje odbyte", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "POZOSTAŁOŚĆ na następny m-c", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "stan spraw zawieszonych <br/> (wszystkie kategorie spraw, zgodnie z MS-S5o)", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pozostało spraw starych", "9", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "skargi na przewlekłość", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Uwagi", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "1" });

            return tabelaNaglowkowa;
        }
    }
}