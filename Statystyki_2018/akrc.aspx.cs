/*
Last Update:
    - version 1.200620
Creation date: 2019-01-05

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class akrc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "akrc.aspx";
        private const string tenPlikNazwa = "akrc";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null) return;
                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost) Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
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
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel3.Visible = false;
                infoLabel1.Visible = false;
                infoLabel2.Visible = false;
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
            makeHeader();
            tabela_1();
            tabela_2();
            tabela_3();
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

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 12, 18, 1, 5, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 33, 0, 5, true, true, false, false, true);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 16, 0, 5, true, true, true, true, true);

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
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu, 1, 12, 17, tenPlik);
            Session["tabelka001"] = tabelka01;
            pisz("tab_1_", 12, 17, tabelka01);
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 39, tenPlik);
            Session["tabelka002"] = tabelka01;
            gwTabela2.DataSource = null;
            gwTabela2.DataSourceID = null;
            gwTabela2.DataSource = tabelka01;
            gwTabela2.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 20, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];//tb.naglowek(path, 2);
                tb.makeHeader(dT, gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];//tb.naglowek(path, 2);
                tb.makeHeader(dT, gwTabela3);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 4);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 2);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 0);
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
                            string idKolumny = "d_" + kolumna.ToString("D2");
                            tb.Text = dane.Rows[wiersz - 1][idKolumny].ToString().Trim();
                        }
                        catch
                        {
                        }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void pisztb(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
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

        //headers
        protected void makeHeader()
        {
            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));

            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "Razem C", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "w tym rozwód", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "w tym separacja", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "Razem Ns", "1", "1", "h" });

            dT_02.Rows.Add(new Object[] { "1", "w tym separacja", "1", "1", "h" });

            dT_02.Rows.Add(new Object[] { "1", "Skarga kasacyjna", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "skarga o stwier-dzenie niezgod-ności z prawem", "1", "1", "h" });

            dT_02.Rows.Add(new Object[] { "2", "rozp-rawy", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "posie-dzenia", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "CGG", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Nc", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Rejestr prasy", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Ca", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Cz", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Cz p-I", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Cz P-II", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "WSC", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "S", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "w tym nieuspra-wiedliwione", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Urlopy", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Zwolnienia", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "w tym nieuspra-wiedliwione", "1", "2", "h" });

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });

            dT_02.Rows.Add(new Object[] { "3", "Imie", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko Sędziego", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Liczba sesji", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Załatwienia", "17", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ilość sporządzonych uzasadnień wyroków", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ilość uzasadnień zwróconych po terminie ustawowym bądź przedłużonym", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Nieobecności (ilość dni)", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "ETAT", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "załatwienia merytoryczne C", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "załatwienia merytoryczne Ca", "1", "3", "h" });

            dT_02.Rows.Add(new Object[] { "3", "Ilość sporządzonych uzasadnień", "1", "3", "h" });

            dT_02.Rows.Add(new Object[] { "3", "Ilość uzasadnień zwróconych po terminie ustawowym bądź przedłużonym", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "C", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "CGG", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "Rejestr prasy", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ca", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cz", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cz p-I", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cz p-II", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "S", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RAZEM ", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Funkcja", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Imie", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Nazwisko Sędziego", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Wyznaczenia", "14", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Odroczenia  -  liczba spraw odroczonych", "1", "3", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()
        }
    }
}