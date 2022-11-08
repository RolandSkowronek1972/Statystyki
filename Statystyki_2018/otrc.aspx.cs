using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class otrc : System.Web.UI.Page
    {
        private const string tenPlik = "otrc.aspx";
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
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
            String IdentyfikatorUzytkownika = string.Empty;
            IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


            if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
            {
                Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
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
                    Server.Transfer("default.aspx?info='Użytkownik " + user + " nie praw do działu nr " + dzial + "'");
                }
                else
                {
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
                //  Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
        {
            int idDzialu = 0;
            try
            {
                idDzialu = int.Parse((string)Session["id_dzialu"]);
            }
            catch
            { }
            if (idDzialu == 0)
            {
                cm.log.Error(tenPlik + " Error: brak dzialu");
                return;
            }

            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = "id dzialu=" + idDzialu.ToString() + "<br/>";
            txt = txt + cl.clear_maim_db();
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, idDzialu.ToString(), 1, tenPlik);
            GridView2.DataBind();
            Session["tabelka002"] = dr.tworzTabele(idDzialu, 2, Date1.Date, Date2.Date, 23, GridView1, tenPlik);
            Session["tabelka003"] = dr.tworzTabele(idDzialu, 3, Date1.Date, Date2.Date, 13, GridView3, tenPlik);
            Session["tabelka004"] = dr.tworzTabele(idDzialu, 4, Date1.Date, Date2.Date, 13, GridView4, tenPlik);
            GridView1.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            // dopasowanie opisów
            makeLabels();
            Label11.Visible = false;
            try
            {
                Label11.Visible = cl.debug(idDzialu);
            }
            catch
            { }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli1(), GridView2);
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
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "CGg", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "10", "1" });
            return dT_01;
        }

        private DataTable NaglowekTabeli2()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "1-14", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "15-30", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow.1 do 3 miesięcy", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ponad 3 miesiące", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "rozprawy", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "posiedzenia", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "C", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Cz", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "CGg", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "N", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ns", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Nc", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Co", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Cps", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "WSC", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "po upłuwie terminu ustawowyowego", "4", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Urlopy", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Zwolnienia", "1", "2" });

            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Funkcja", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Imie i nazwisko sędziego", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Liczba sesji", "2", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Załatwienia", "10", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Terminowość sporządzenia uzasadnień", "6", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Nieobecności (Liczzba dni)", "2", "1" });

            return dT_01;
        }

        private DataTable NaglowekTabeli3()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "CGg", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Stanowisko", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Funkcja", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Wyznaczenia", "10", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Odroczenia - liczba spraw odroczonych", "1", "2" });
            return dT_01;
        }

        private DataTable NaglowekTabeli4()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "CGg", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Stanowisko", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Funkcja", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Pozostało w referatach spraw kategorii", "10", "1" });

            return dT_01;
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli2(), GridView1);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli3(), GridView3);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(NaglowekTabeli4(), GridView4);
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
                    Label19.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label17.Text = "Wyznaczenia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    Label19.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wyznaczenia za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin

            string path = Server.MapPath("Template") + "\\otrc.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\otrc";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);
                DataTable table = view.ToTable();

                MyWorksheet1 = tabela.tworzArkuszwExcleBezSedziowZopisem(MyExcel.Workbook.Worksheets[1], table, 10, 10, 1, 3, true);
                // druga
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 22, 0, 4, true, true, true, true, true);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 12, 0, 3, true, true, true, true, true);
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 11, 0, 3, true, true, true, true, true);

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

        protected void StopkaTabeli02(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabela.makeSumRow(table, e, 3);
            }
        }

        protected void StopkaTabeli03(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 3);
            }
        }

        protected void StopkaTabeli04(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tabela.makeSumRow(table, e, 3);
            }
        }
    }
}