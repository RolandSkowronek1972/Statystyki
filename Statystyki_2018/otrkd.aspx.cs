using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class otrkd : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabele = new tabele();
        private dataReaders dr = new dataReaders();

        public string tenPlik = "otrkd.aspx";
        public string tenPlikNazwa = "otrkd";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //  //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
           

            try
            {
                string user = (string)Session["userIdNum"];
                string dzial = (string)Session["id_dzialu"];
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
                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

 CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
        }// end of Page_Load

        protected void odswiez()
        {
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
            try
            {
                tabela_1();
                tabela_2();
                tabela_3a();
            }
            catch
            {
            }

            makeLabels();
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 90, tenPlik);
            Session["tabelka001"] = tabelka01;
            GridView3.DataSource = null;
            GridView3.DataSourceID = null;
            GridView3.DataSource = tabelka01;
            GridView3.DataBind();
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 90, tenPlik);
            Session["tabelka002"] = tabelka01;
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = tabelka01;
            GridView1.DataBind();
        }

        protected void tabela_3a()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 90, tenPlik);
            Session["tabelka003"] = tabelka01;
            GridView2.DataSource = null;
            GridView2.DataSourceID = null;
            GridView2.DataSource = tabelka01;
            GridView2.DataBind();
        }

        #region "nagłowki tabel"

        #region tabela  3 ()

        private DataTable NaglowekTabeli02()
        {
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Art. 214 kpk", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Art.14 §1 kkw", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Art.43h §4 kkw", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ogółem we wszystkich fazach postępowania", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Wywiady kontrolne", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Obciążenia wywiadami zleconymi", "5", "1", "h" });

            return dT_03;
        }

        #endregion tabela  3 ()

        #region tabela  1 ()

        private DataTable Naglowektabeli01()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "Kkow", "1", "1", "v" });
            dT_01.Rows.Add(new Object[] { "1", "O", "1", "1", "v" });
            dT_01.Rows.Add(new Object[] { "1", "Art.164 §1i 2kkw", "1", "1", "v" });
            dT_01.Rows.Add(new Object[] { "1", "Art.153 §4 kkw", "1", "1", "v" });
            dT_01.Rows.Add(new Object[] { "1", "Dozór el", "1", "1", "v" });
            dT_01.Rows.Add(new Object[] { "1", "Nadzory z art.181a§kkw", "1", "1", "v" });
          

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Nazwisko i imie <br.> Kuratora", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "dozory własne od 20 do 35 (standardy <br/>na koniec okresu stat.)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Dozory powierz.od 30 do 60 (standardy)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Inne sprawy do 50 (standardy)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym", "6", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Łącznie liczba spraw do 120 (standardy)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "W tym własnych do 50 (standardy)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Sprawy zawieszone", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Dozory", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Kkow", "1", "2", "v" });
            dT_01.Rows.Add(new Object[] { "2", "Łączna liczba spraw (w tym zawieszone)", "1", "2", "v" });
            return dT_01;

        }

        #endregion tabela  1 ()

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(NaglowekTabeli02(), GridView1);
            }
        }

        protected void grvMergeHeader_RowCreated2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(NaglowekTabeli02(), GridView2);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(Naglowektabeli01(), GridView3);
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
             
                Label5.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                id_dzialu.Text = (string)Session["txt_dzialu"];

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if (((DateTime.Parse(Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day)) && ((DateTime.Parse(Date1.Text).Month == DateTime.Parse(Date2.Text).Month)))
                {
                    // cały miesiąc
                    tab2Label.Text = "Obciążenia kuratorów wywiadami zleconymi stan za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. (Obliczenia wg daty wpływu)";
                    Label2.Text = "Obciążenia kuratorów wywiadami zleconymi za miesiąc  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. (Obliczenia wg daty zamknięcia)";
                    tab1Label.Text = "Obciążenia kuratorów zawodowych wg. standardów. Stan za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. ";
                }
                else
                {
                    tab2Label.Text = "Obciążenia kuratorów wywiadami zleconymi stan  za okres od " + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString()+ " (Obliczenia wg daty wpływu)";
                    Label2.Text = "Obciążenia kuratorów wywiadami zleconymi za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString()+ " (Obliczenia wg daty zamknięcia)";
                    tab1Label.Text = "Obciążenia kuratorów zawodowych wg. standardów. Stan za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString();
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                string linia01 = string.Empty;
                string linia02 = string.Empty;
                string linia03 = string.Empty;
                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if (((DateTime.Parse(Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day)) && ((DateTime.Parse(Date1.Text).Month == DateTime.Parse(Date2.Text).Month)))
                {
                    // cały miesiąc
                    linia01 = "Obciążenia kuratorów zawodowych wg. standardów. Stan za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    linia02 = "Obciążenia kuratorów wywiadami zleconymi za miesiąc  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. (Obliczenia wg daty wpływu) ";
                    linia03 = "Obciążenia kuratorów wywiadami zleconymi za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. (Obliczenia wg daty zamknięcia) ";
                }
                else
                {
                    linia01 = "Obciążenia kuratorów zawodowych wg. standardów. Stan  za okres od " + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString();
                    linia02 = "Obciążenia kuratorów wywiadami zleconymi za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString()+ " (Obliczenia wg daty wpływu)";
                    linia03 = "Obciążenia kuratorów wywiadami zleconymi za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString()+ " (Obliczenia wg daty zamknięcia)";
                }
                try
                {
                    tabele.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 16, 0, 7, true, true, false, false, false, false, cl.nazwaSadu((string)Session["id_dzialu"]), (string)Session["txt_dzialu"], linia01);

                    tabele.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 6, 0, 7, true, true, false, false, false, false, cl.nazwaSadu((string)Session["id_dzialu"]), (string)Session["txt_dzialu"], linia02);

                    tabele.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 6, 0, 7, true, true, false, false, false, false, cl.nazwaSadu((string)Session["id_dzialu"]), (string)Session["txt_dzialu"], linia03);

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
            }
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

        protected void make_footer(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabele.makeSumRow(table, e, 1);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabele.makeSumRow(table, e, 1);
            }
        }

        protected void makeFooter2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabele.makeSumRow(table, e, 1);
            }
        }
    }
}