/*
Last Update:
    - version 1.190123
Creation date: 2018-11-21

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aglg2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aglg2.aspx";
        private const string tenPlikNazwa = "aglg2";
        private string path = "";
        private int storid = 0;
        private int rowIndex = 1;


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

        protected void clearHedersSession()
        {
            Session["makeHeader"] = null;
        }

        protected DataTable makeHeader_01()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "Rozpraw", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Posiedzeń", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem I i II instancja", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem I i II instancja", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "%odroczeń/wyznaczeń GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "% odrczeń/ wyzn.Ga", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "śr. Ilość spraw na rozprawie", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Efektywny czas pracy", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Ilość sesji", "3", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw na rozprawie", "3", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość odroczonych spraw", "3", "1" });

            return dT_01;
        }

        protected DataTable makeHeader_02()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gu", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GS", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Efektywny czas pracy", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Załatwienia", "9", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Razem załatwienia ", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Średnia miesięczna łączna liczba załatwień w efektywnym czasie pracy", "1", "2" });

            return dT_01;
        }

        protected DataTable makeHeader_03()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędziowie funkcyjni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ilość dni pracy w okresie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "nieobecność", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "obecność", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ilość dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "wynik", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "efekt. okres w miesiącach", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_04()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędziowie liniowi", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ilość dni pracy w okresie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "nieobecność", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "obecność", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ilość dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "wynik", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "efekt. okres w miesiącach", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_05()
        {
            //spr.>2 lata I ins
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędzia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od 2 do 3 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od 3 do 5 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od  5 do 8 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow. 8 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_06()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędzia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od 2 do 3 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od 3 do 5 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od  5 do 8 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow. 8 lat", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_07()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędzia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od 3 do 6 miesięcy", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "od  6 do 12 miesięcy", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow. 12 miesięcy", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_08()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędzia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_09()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();
            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "Sędzia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gco", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_10()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();
            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "wpływ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "załatwienia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pozostałość", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "wskaźnik pozostałości", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "wpływ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "załatwienia", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pozostałość", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "wskaźnik pozostałości", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "CG", "4", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ga", "4", "1" });
            return dT_01;
        }

        protected DataTable makeHeader_13()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();
            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego (czyli 14 dni+)", "8", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Sędzia", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień", "10", "1" });

            return dT_01;
        }

        protected DataTable makeHeader_14()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();
            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione ", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego (czyli 14 dni+)", "8", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Sędzia", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień", "10", "1" });

            return dT_01;
        }

        protected DataTable makeHeader_16()
        {
            DataTable dT_01 = tb.SchematTabelinaglowkowej();
            dT_01.Clear();
            int miesiac = Date1.Date.Month;
            for (int i = 0; i < 6; i++)
            {
                int miech = miesiac + i;
                if (miech > 12)
                {
                    miech = miech - 12;
                }
                string rzymski = cm.podajMiesiacRzymski(miech);

                dT_01.Rows.Add(new Object[] { "1", "wyznaczonych <br/>" + rzymski, "1", "1" });
                dT_01.Rows.Add(new Object[] { "1", "odroczonych <br/>" + rzymski, "1", "1" });
            }

            dT_01.Rows.Add(new Object[] { "1", "wyznaczonych", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });

            for (int i = 0; i < 6; i++)
            {
                dT_01.Rows.Add(new Object[] { "2", "Ilość spraw", "2", "1" });
            }

            dT_01.Rows.Add(new Object[] { "2", "Razem ilość spraw ", "2", "1" });

            return dT_01;
        }

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
                //  Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel6.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel7.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel8.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel9.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel10.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel12.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel13.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel14.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel1.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
                infoLabel6.Visible = false;
                infoLabel7.Visible = false;
                infoLabel8.Visible = false;
                infoLabel9.Visible = false;
                infoLabel10.Visible = false;

                infoLabel11.Visible = false;
                infoLabel12.Visible = false;
                infoLabel13.Visible = false;
                infoLabel14.Visible = false;
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            clearHedersSession();
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
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            tabela_9();
            tabela_10();
            tabela_11();
            tabela_12();
            tabela_13();
            tabela_14();
            tabela_15();
            tabela_16();
            tabela_17();
            tabela_18();
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
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 14, 0, 6, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 7, 0, 3, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 7, 0, 3, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 10, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 10, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 8, 0, 4, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka008"], 6, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka009"], 6, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka010"], 9, 0, 4, false, true, false, false, false);      
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka011"], 10,3,0, 7, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka012"], 10, 3, 0, 7, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka012"], 1, 1, 6, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[13], (DataTable)Session["tabelka013"], 11, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[14], (DataTable)Session["tabelka014"], 11, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[15], (DataTable)Session["tabelka015"], 1, 7, 0, 9, false);   
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[16], (DataTable)Session["tabelka016"], 15, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[17], (DataTable)Session["tabelka017"], 15, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[18], (DataTable)Session["tabelka018"], 3, 11, 1, 8, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 15, tenPlik);
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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 15, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela4.DataSource = null;
            gwTabela4.DataSourceID = null;
            gwTabela4.DataSource = tabelka01;
            gwTabela4.DataBind();
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka005"] = tabelka01;
            gwTabela5.DataSource = null;
            gwTabela5.DataSourceID = null;
            gwTabela5.DataSource = tabelka01;
            gwTabela5.DataBind();
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 6, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka006"] = tabelka01;
            gwTabela6.DataSource = null;
            gwTabela6.DataSourceID = null;
            gwTabela6.DataSource = tabelka01;
            gwTabela6.DataBind();
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 7, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka007"] = tabelka01;
            gwTabela7.DataSource = null;
            gwTabela7.DataSourceID = null;
            gwTabela7.DataSource = tabelka01;
            gwTabela7.DataBind();
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 8, Date1.Date, Date2.Date, 10, tenPlik);
            Session["tabelka008"] = tabelka01;
            gwTabela8.DataSource = null;
            gwTabela8.DataSourceID = null;
            gwTabela8.DataSource = tabelka01;
            gwTabela8.DataBind();
        }

        protected void tabela_9()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 9, Date1.Date, Date2.Date, 10, tenPlik);
            Session["tabelka009"] = tabelka01;
            gwTabela9.DataSource = null;
            gwTabela9.DataSourceID = null;
            gwTabela9.DataSource = tabelka01;
            gwTabela9.DataBind();
        }

        protected void tabela_10()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 10, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka010"] = tabelka01;
            gwTabela10.DataSource = null;
            gwTabela10.DataSourceID = null;
            gwTabela10.DataSource = tabelka01;
            gwTabela10.DataBind();
        }

        protected void tabela_11()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 11, 10, 4, tenPlik);
            Session["tabelka011"] = tabelka01;

            pisztb("tab_11_", 10, 3, tabelka01);
        }

        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 12, 7, 4, tenPlik);
            Session["tabelka012"] = tabelka01;
            pisztb("tab_12_", 7, 3, tabelka01);
        }

        protected void tabela_13()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 13, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka013"] = tabelka01;
            gwTabela13.DataSource = null;
            gwTabela13.DataSourceID = null;
            gwTabela13.DataSource = tabelka01;
            gwTabela13.DataBind();
        }

        protected void tabela_14()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 14, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka014"] = tabelka01;
            gwTabela14.DataSource = null;
            gwTabela14.DataSourceID = null;
            gwTabela14.DataSource = tabelka01;
            gwTabela14.DataBind(); ;
        }

        protected void tabela_15()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 15");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 15, 2, 10, tenPlik);
            Session["tabelka015"] = tabelka01;
            pisz("tab_15_", 1, 7, tabelka01);
        }

        protected void tabela_16()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 16, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka016"] = tabelka01;
            gwTabela16.DataSource = null;
            gwTabela16.DataSourceID = null;
            gwTabela16.DataSource = tabelka01;
            gwTabela16.DataBind(); ;
        }

        protected void tabela_17()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 17");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 17, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka017"] = tabelka01;
            gwTabela17.DataSource = null;
            gwTabela17.DataSourceID = null;
            gwTabela17.DataSource = tabelka01;
            gwTabela17.DataBind(); ;
        }

        protected void tabela_18()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 18");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 18, 4, 12, tenPlik);
            Session["tabelka018"] = tabelka01;
            pisz("tab_18_", 4, 12, tabelka01);
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_01(), gwTabela1);
            }
            else
            {
                if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
                {
                    rowIndex = 0;
                }
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_02(), gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_03(), gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_04(), gwTabela4);
            }
        }

        protected void naglowekTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_05(), gwTabela5);
            }
        }

        protected void naglowekTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_06(), gwTabela6);
            }
        }

        protected void naglowekTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_07(), gwTabela7);
            }
        }

        protected void naglowekTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_08(), gwTabela8);
            }
        }

        protected void naglowekTabeli_gwTabela9(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_09(), gwTabela9);
            }
        }

        protected void naglowekTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_10(), gwTabela10);
            }
        }

        protected void naglowekTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_13(), gwTabela13);
            }
        }

        protected void naglowekTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_14(), gwTabela14);
            }
        }

        protected void stopkaTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 14
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka014"];
                tb.makeSumRow(table, e, 0, "Razem");
            }
        }

        protected void stopkaTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 13
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka013"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka010"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka008"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela9(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka009"], e, 0, "Razem");
            }
        }

        protected void stopkaTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka007"];
                tb.makeSumRow(table, e, 0, "Razem");
            }
        }

        protected void stopkaTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e, 0, "Razem");
            }
        }

        protected void stopkaTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 0);
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

        protected void gwTabela13_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                        { }
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
                        catch { }
                    }
                }
            }
        }// end of pisz

        protected void gwTabela5_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void naglowekTabeli_gwTabela16(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_16(), gwTabela16);
            }
        }

        protected void stopkaTabeli_gwTabela16(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 16
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka016"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void naglowekTabeli_gwTabela17(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(makeHeader_16(), gwTabela17);
            }
        }

        protected void stopkaTabeli_gwTabela17(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka017"];
                tb.makeSumRow(table, e, 1);
            }
        }
    }
}