using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aglc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();
        public static string tenPlik = "aglc.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
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
            string id_dzialu = (string)Session["id_dzialu"];
            string txt = string.Empty;

            //tabela 1
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 1, Date1.Date, Date2.Date, 28, tenPlik);
                Session["tabelka001"] = Tabela2;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = Tabela2;
                gwTabela1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 2
            try
            {
                DataTable tabela02 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 2, 24, 43, tenPlik);

                Session["tabelka002"] = tabela02;
                pisz("tab_tabela2_", 10, 9, tabela02);
      
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 3
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 3, Date1.Date, Date2.Date, 26, tenPlik);
                Session["tabelka003"] = Tabela2;
                gwTabela3.DataSource = null;
                gwTabela3.DataSourceID = null;
                gwTabela3.DataSource = Tabela2;
                gwTabela3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            //tabela 4
            try
            {
                DataTable tabela04 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 4, 8, 2, tenPlik);

                Session["tabelka004"] = tabela04;
                //  wiersz 1
                pisz("tab_tabela4_", 8, 1, tabela04);
               
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
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
                lbTabela1.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";

                //lbtabela02.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";
                lbTabela3.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";
                lbTabela4.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";

                Label6.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            }
            catch
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\aglc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\aglc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                DataTable table = (DataTable)Session["tabelka001"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 26, 0, 5, false, false, false, false, false,false);

                // druga
                DataTable table2 = (DataTable)Session["tabelka002"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 10, 10, 1, 2, false);

                // trzecia
                DataTable table3 = (DataTable)Session["tabelka003"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 26, 0, 3, false, false, false, false, false,false);

                DataTable table4 = (DataTable)Session["tabelka004"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], table4, 8, 2, 1, 2, false);

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
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void naglowekTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
              
                string path = Server.MapPath("XMLHeaders") + "\\aglc1.xml";
                xMLHeaders.getHeaderFromXML(path, gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e,1);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\aglc3.xml";
                xMLHeaders.getHeaderFromXML(path, gwTabela3);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e,1);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        {
                        }
                    }
                }
            }
        }// end of pisz
       
    }
}