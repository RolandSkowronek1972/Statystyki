﻿/*
Last Update:
    - version 1.211201
Creation date: 2019-12-11

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace Statystyki_2018
{
    public partial class oopp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopp.aspx";
        private const string tenPlikNazwa = "oopp";
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
            }
            catch
            {
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
            DataTable tabela = (DataTable)Session["tabelka001"];
            if (tabela == null)
            {
                return;
            }
            foreach (DataRow dr in tabela.Select($"id=0"))
                dr.Delete();
            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 90, 0, 7, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 120, 0, 7, true, true, false, false, false);

                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 7, 2, "Styczeń", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 8, 2, "Luty", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 9, 2, "Marzec", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 10, 2, "Kwiecień", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 11, 2, "Maj", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 12, 2, "Czerwiec", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 13, 2, "Lipiec", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 14, 2, "Sierpień", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 15, 2, "Wrzesień", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 16, 2, "Październik", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 17, 2, "Listopad", false, 0, 0);
                tb.komorkaExcela(MyExcel.Workbook.Worksheets[2], 18, 2, "Grudzień", false, 0, 0);
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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 220, tenPlik)));

            Session["tabelka001"] = tabelka01;

            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();
            ASPxGridView1.KeyFieldName = "id_sedziego";
            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Width = Panel1.Width;
            idDzialu = "5";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");

            string[] teksty01 = new string[] { "Ogółem", "P", "Np", "Po", "WSC", "Pz", "U", "Uo", "WSC", "Uz", "WSNc" };

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 1, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", 12, idDzialu, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 34, idDzialu, false, szerokoscKolumny, "Załatwienia"));

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("(na potrzeby MS-S)");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_45", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia jawne", "posiedzenia niejawne" }, 46, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            ASPxGridView1.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 49, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "do 3 mie- sięcy", "pow. 3 do 6 m-cy", "pow. 6 do 12 m-cy", "pow.12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 60, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 69, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[4] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 72, idDzialu, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");
            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[8] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 76, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_84", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_85", idDzialu, "", false, szerokoscKolumny));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_86", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "ogółem", "uwzględniono" }, 87, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_89", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_90", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 91; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_z_miesiacami(Date1.Date, Date2.Date, idDzialu, 2, 120, tenPlik));
            Session["tabelka002"] = tabelka01;
            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.DataSource = tabelka01;
            ASPxGridView2.DataBind();
            ASPxGridView2.Visible = true;
            Label7.Visible = true;
            if (ASPxGridView2.VisibleRowCount == 0)
            {
                ASPxGridView2.Visible = false;
                Label7.Visible = false;
                return;
            }

            ASPxGridView2.KeyFieldName = "id";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;
            string idTabeli = "2";
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Miesiąc", "miesiac", idTabeli, "", true, 250));

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");

            string[] teksty01 = new string[] { "Ogółem", "P", "Np", "Po", "WSC", "Pz", "U", "Uo", "WSC", "Uz", "WSNc" };

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty01, 1, idTabeli, false, szerokoscKolumny, "WPŁYW"));

            ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumnyMiesieczne(teksty01, "Załatwiono", 12, idTabeli, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty01, 34, idTabeli, false, szerokoscKolumny, "Załatwienia"));

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("(na potrzeby MS-S)");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("ogółem", "d_45", idTabeli, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "rozprawy", "posiedzenia jawne", "posiedzenia niejawne" }, 46, idTabeli, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            ASPxGridView2.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty01, 49, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Ogółem", "do 3 mie- sięcy", "pow. 3 do 6 m-cy", "pow. 6 do 12 m-cy", "pow.12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 60, idTabeli, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw)"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 69, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumnaMiesieczna(new string[4] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 72, idTabeli, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");
            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumnaMiesieczna(new string[8] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 76, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView2.Columns.Add(liczbaSporzadzonychUzasadnien);

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("uzasadnienia wygłoszone *", "d_84", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_85", idTabeli, "", false, szerokoscKolumny));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("wpływ", "d_86", idTabeli, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[2] { "ogółem", "uwzględniono" }, 87, idTabeli, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("pozostałość", "d_89", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Uwagi", "d_90", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView2.TotalSummary.Clear();
            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 91; i++)
            {
                ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            { }
        }
    }
}