using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class onsu : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private const string tenPlik = "onsu.aspx";

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
            }
        }// end of Page_Load

        protected void odswiez()
        {
            string id_dzialu = (string)Session["id_dzialu"];
            DataTable tabela01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 1, 11, 11, tenPlik);
            pisz("tab_1_", 10, 9, tabela01);
            Session["tabelka001"] = tabela01;
            Session["tabelka002"] = dr.tworzTabele(int.Parse(id_dzialu), 2, Date1.Date, Date2.Date, 14, Tabela_02, tenPlik);
            Tabela_02.DataBind();
            Session["tabelka003"] = dr.tworzTabele(int.Parse(id_dzialu), 3, Date1.Date, Date2.Date, 14, Tabela_03, tenPlik);
            Tabela_03.DataBind();
            Session["tabelka004"] = dr.tworzTabele(int.Parse(id_dzialu), 4, Date1.Date, Date2.Date, 14, Tabela_04, tenPlik);
            Tabela_04.DataBind();
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
                id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    Label17.Text = "Wpływ za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label15.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    //Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                  //  Label35.Text = "Pozostało na następny miesiąc w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label19.Text = "Pozostało z ubieglego miesiąca w miesiącu:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    Label17.Text = "Wpływ za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od" + Date1.Text + " do  " + Date2.Text;
                    //Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                  //  Label35.Text = "Pozostało na następny z okresu od:  " + Date1.Text + " do  " + Date2.Text;
                    Label19.Text = "Pozostało z ubieglego miesiąca w okresie od:   " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void tworzPlikExcel(object sender, EventArgs e)
        {
            // excell
            string path = Server.MapPath("Template") + "\\onsu.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\onsu";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                DataTable table = (DataTable)Session["tabelka001"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], table, 10, 10, 0, 3, false);

                // druga
                DataTable table2 = (DataTable)Session["tabelka002"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 26, 0, 3, true, true, true, true, true, true);

                // trzecia
                DataTable table3 = (DataTable)Session["tabelka003"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 9, 0, 3, true, true, true, true, true, true);

                DataTable table4 = (DataTable)Session["tabelka004"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table4, 8, 0, 3, true, true, true, true, true, true);
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

        protected void naglowekTabeli_Tabela_02(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\onsu2.xml";
                xMLHeaders.getHeaderFromXML(path, Tabela_02);
            }
        }

        protected void naglowekTabeli_Tabela_03(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\onsu3.xml";
                xMLHeaders.getHeaderFromXML(path, Tabela_03);
            }
        }

        protected void naglowekTabeli_Tabela_04(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\onsu4.xml";
                xMLHeaders.getHeaderFromXML(path, Tabela_04);
            }
        }

        protected void stopkaTabeli_Tabela_02(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabela.makeSumRow(table, e, 5, 5);
            }
        }

        protected void stopkaTabeli_Tabela_03(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 5, 5);
            }
        }

        protected void stopkaTabeli_Tabela_04(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tabela.makeSumRow(table, e, 5, 5);
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