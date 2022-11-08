/*
Last Update:
    - version 1.220313
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
    public partial class akrg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "akrg.aspx";
        private const string tenPlikNazwa = "akrg";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }
                Session["id_dzialu"] = idWydzial;
                String IdentyfikatorUzytkownika = string.Empty;
                IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                DataTable parametry = cm.makeParameterTable();
                parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


                if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 12, 15, 1, 5, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 28, 0, 5, false, true, true, true, true);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 17, 0, 5, false, true, true, true, true);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu, 1, 12, 16, tenPlik);
            Session["tabelka001"] = tabelka01;
            pisz("tab_1_", 15, 16, tabelka01);
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 37, tenPlik);
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
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
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
                tb.makeHeader(Naglowek2(), gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Naglowek3(), gwTabela3);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka003"], e, 4);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka002"], e, 2);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka001"], e, 0);
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
                            tb.Text = dane.Rows[wiersz - 1][kolumna - 1].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz

        #region tabela  2 ()

        private DataTable Naglowek2()
        {
            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1", "h" });

            dT_02.Rows.Add(new Object[] { "2", "rozp-rawy", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "posie-dzenia", "1", "2", "h" });

            dT_02.Rows.Add(new Object[] { "2", "GC", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Ga-KRZ", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Gz p-I", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Gz p-II", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Gz-KRZ", "1", "2", "h" });
            dT_02.Rows.Add(new Object[] { "2", "WSC", "2", "1", "h" });//WSNc
            dT_02.Rows.Add(new Object[] { "2", "WSNc", "1", "2", "h" });//WSNc
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
            dT_02.Rows.Add(new Object[] { "3", "Załatwienia", "15", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ilość sporządzonych uzasadnień wyroków (bez wygłoszonych)", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "w tym ilość uzasadnień zwróconych po terminie ustawowym bądź przedłużonym", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Nieobecności (ilość dni)", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "ETAT", "1", "3", "h" });

            dT_02.Rows.Add(new Object[] { "3", "GC merytoryczne", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ga merytoryczne", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ilość sporządzonych uzasadnień", "1", "3", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Ilość uzasadnień zwróconych po terminie ustawowym bądź przedłużonym", "2", "1", "h" });
            dT_02.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });

            return dT_02;
        }

        #endregion tabela  2 ()

        #region tabela  3 ()

        private DataTable Naglowek3()
        {
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "skarga kasacyjna", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "skarga o stwierdzenie niezgodności z prawem", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "GC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ga-KRZ", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Gz p-I", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Gz p-II", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Gz-KRZ", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSNc", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "S", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Funkcja", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Imie", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko Sędziego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wyznaczenia (merytoryczne)", "15", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Odroczenia  -  liczba spraw odroczonych", "1", "3", "h" });

            return dT_03;
        }

        #endregion tabela  3 ()
    }
}