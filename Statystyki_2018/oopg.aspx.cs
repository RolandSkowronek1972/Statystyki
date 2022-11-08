/*
Last Update:
    - version 1.210307
Creation date: 2018-12-11

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace Statystyki_2018
{
    public partial class oopg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopg.aspx";
        private const string tenPlikNazwa = "oopg";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null)
                {
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

        protected void TimerTick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            imgLoader.Visible = false;
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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 106, 0, 8, true, true, false, false, false);
                tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 12, 116, 0, 8, false);

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
            string idTabeli = "5";
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 114, tenPlik)));

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
            
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

         //   GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            string[] teksty00 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC", "WSNc", "Gz" };

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty00, 2, idTabeli, false, szerokoscKolumny, "WPŁYW"));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty00, "WYZNACZONO", 11, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty00, "ZAŁATWIONO", 29, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty00, 47, idTabeli, false, szerokoscKolumny, "ZAŁATWIENIA"));
            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_56", idTabeli, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 57, idTabeli, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);
            ASPxGridView1.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego


            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty00, 59, idTabeli, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny miesiąc"));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem",  " do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m-cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 68, idTabeli, false, szerokoscKolumny, "pozostało spraw starych "));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 77, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));


            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 80, idTabeli, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 84, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_92", idTabeli, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw, do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_93", idTabeli, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 94, idTabeli, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_96", idTabeli, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "uwzględniono" }, 97, idTabeli, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_99", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            mediacje.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WPŁYW  liczba spraw, w których strony skierowano do mediacji      ", "d_100", idTabeli, "", false, szerokoscKolumny));
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 101, idTabeli, false, szerokoscKolumny, "rozstrzygnięcie"));
            ASPxGridView1.Columns.Add(mediacje);
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_103", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, 104, idTabeli, false, szerokoscKolumny, "suma kontrolna"));


            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 107; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            string idTabeli = "2";
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

            ASPxGridView2.KeyFieldName = "id";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Miesiąc", "miesiac", idTabeli, "", true, 250));

            string[] teksty00 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC", "WSNc", "Gz" };
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC",  };
            //  ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty00,  1, idTabeli, false, szerokoscKolumny, "Wpływ"));
            //  ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumnyMiesieczne(teksty00, "WYZNACZONO", 41, idTabeli, szerokoscKolumny));

            // ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "na rozprawie", "na posiedzeniu" }, 81, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia >=załatwienia)"));

            //------------------------------------------------------

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty00, 1, idTabeli, false, szerokoscKolumny, "WPŁYW"));
            ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumnyMiesieczne(teksty00, "WYZNACZONO", 10, idTabeli, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumnyMiesieczne(teksty00, "ZAŁATWIONO", 28, idTabeli, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty00, 46, idTabeli, false, szerokoscKolumny, "ZAŁATWIENIA"));
            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("ogółem", "d_55", idTabeli, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[2] { "rozprawy", "posiedzenia" }, 56, idTabeli, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);
            ASPxGridView2.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego


            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty00, 58, idTabeli, false, szerokoscKolumny, "pozostało spraw starych - wszystkie kategorie spraw (bez czasu trwania mediacji, zgodnie z dz. 2.1.1.1 MS - S19r)"));

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Ogółem", " do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m-cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 67, idTabeli, false, szerokoscKolumny, "pozostało spraw starych "));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 76, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));


            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumnaMiesieczna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 79, idTabeli, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumnaMiesieczna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 83, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("uzasadnienia wygłoszone *", "d_91", idTabeli, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Liczba spraw, do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_92", idTabeli, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 93, idTabeli, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));
            ASPxGridView2.Columns.Add(liczbaSporzadzonychUzasadnien);

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("wpływ", "d_95", idTabeli, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "ogółem", "uwzględniono" }, 96, idTabeli, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("pozostałość", "d_98", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            mediacje.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WPŁYW  liczba spraw, w których strony skierowano do mediacji      ", "d_99", idTabeli, "", false, szerokoscKolumny));
            mediacje.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 100, idTabeli, false, szerokoscKolumny, "rozstrzygnięcie"));
            ASPxGridView2.Columns.Add(mediacje);

            GridViewBandColumn wskaznikOpanowaniaWplywu = DevExpressXXL.GetBoundColumn("wskaźnik opanowania wpływu (%)");
           

            wskaznikOpanowaniaWplywu.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty01, 102, idTabeli, false,szerokoscKolumny, "z tego kategorie spraw"));
            
            ASPxGridView2.Columns.Add(wskaznikOpanowaniaWplywu);
            GridViewBandColumn wskaznikPozostalosci = DevExpressXXL.GetBoundColumn("wskaźnik pozostałości");


            wskaznikPozostalosci.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty01, 109, idTabeli, false, szerokoscKolumny, "z tego kategorie spraw"));

            ASPxGridView2.Columns.Add(wskaznikPozostalosci);


            //------------------------------------------------------
            ASPxGridView2.TotalSummary.Clear();

            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem", "miesiac"));

            for (int i = 1; i < 116; i++)
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