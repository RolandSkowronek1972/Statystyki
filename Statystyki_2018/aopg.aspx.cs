/*
Last Update:
    - version 1.191210
Creation date: 2019-12-16

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace Statystyki_2018
{
    public partial class aopg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aopg.aspx";
        private const string tenPlikNazwa = "aopg";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
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
                odswiez();
                debug();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": błąd: "+ ex.Message);
            }
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 186, 0, 8, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 66, 0, 9, true, true, false, false, false);

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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 240, tenPlik)));
            if (tabelka01==null)
            {
                cm.log.Error(tenPlik + ": brak danych do tabeli 1");
            }
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
            string idTabeli = "1";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

              string[] teksty03 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "Ga", "Gz", "WSC", "S" };

            ASPxGridView1.Columns.Add(sekcjaMniejsza("Wpływ", 2, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Wyznaczono", 19, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Załatwiono", 53, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(sekcjaMniejsza("Załatwienia", 87, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziego(104, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(sekcjaMniejsza("POZOSTAŁOŚĆ na następny m-c", 107, idTabeli, szerokoscKolumny));

            #region pozostało spraw starych

            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m-cy", "pow. 6 do 12 m-cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty04, 124, idTabeli, false, szerokoscKolumny, "pozostało spraw starych - wszystkie kategorie spraw (bez czasu trwania mediacji, zgodnie z dz. 2.1.1.1 MS-S19o)"));

            #endregion pozostało spraw starych

            ASPxGridView1.Columns.Add(stanSprawZawieszonych(133, idTabeli, szerokoscKolumny));

            GridViewBandColumn t1 = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (zgodnie z MS - S19o, dz. 1.4 - tylko kat.GC, GNs(I inst.) oraz Ga, Gz(II inst.) * ");
            string[] teksty05 = new string[] { "I + II instancja", "I instancja", "II instancja" };
            string[] teksty06 = new string[] {  "I instancja", "II instancja" };
            t1.Columns.Add (DevExpressXXL.podKolumna(teksty05, 139, idTabeli, false, szerokoscKolumny, "ogółem"));
            t1.Columns.Add(DevExpressXXL.podKolumna(teksty05, 142, idTabeli, false, szerokoscKolumny, "w terminie ustawowym"));
            t1.Columns.Add(DevExpressXXL.podKolumna(teksty05, 145, idTabeli, false, szerokoscKolumny, "razem po terminie ustawowym"));
            t1.Columns.Add(DevExpressXXL.podKolumna(teksty06, 148, idTabeli, false, szerokoscKolumny, "nieuspra-wiedliwione"));

            // po uplywie terminu
            GridViewBandColumn poUplywieTerminuUstawowego = DevExpressXXL.GetBoundColumn("po upływie terminu ustawowego");

            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 150, idTabeli, false, szerokoscKolumny, "1-14 dni"));
            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 153, idTabeli, false, szerokoscKolumny, "w tym nieusprawie-dliwione"));

            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 156, idTabeli, false, szerokoscKolumny, "15-30 dni"));
            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 159, idTabeli, false, szerokoscKolumny, "w tym nieusprawie-dliwione"));

            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 162, idTabeli, false, szerokoscKolumny, "powyżej 1 do 3 mies."));
            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 165, idTabeli, false, szerokoscKolumny, "w tym nieusprawie-dliwione"));

            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 168, idTabeli, false, szerokoscKolumny, "ponad 3 mies."));
            poUplywieTerminuUstawowego.Columns.Add(DevExpressXXL.podKolumna(teksty05, 171, idTabeli, false, szerokoscKolumny, "w tym nieusprawie-dliwione"));
            t1.Columns.Add(poUplywieTerminuUstawowego);
            ASPxGridView1.Columns.Add(t1);


            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym  w których wpłynął wniosek o transkrypcję" }, 174, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym  w których projekt został zaakceptowany przez sędziego" }, 176, idTabeli, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent"));

           
            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(178, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.mediacje(182, idTabeli, szerokoscKolumny));
            //   ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_209", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, 185, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));
           
            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 211; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        private GridViewColumn dwieInstancje(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny, string[] teksty)
        {
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, przesuniecie, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, teksty.Length + przesuniecie, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 240, tenPlik)));
            Session["tabelka002"] = tabelka01;
            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.DataSource = tabelka01;
            ASPxGridView2.DataBind();

            ASPxGridView2.KeyFieldName = "id";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;
            string idTabeli = "2";

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            string[] teksty01 = new string[] { "I + II Instancja", "I Instancja", "II Instancja" };
            string[] teksty02 = new string[] { "I + II Instancja", "I Instancja", "GC", "II Instancja", "Ga", "Gz" };
            string[] teksty03 = new string[] { "I Instancja", "II Instancja" };

            GridViewBandColumn kolumna_liczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień");

            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(teksty01, 1, idTabeli, false, szerokoscKolumny, "Ogółem"));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(teksty02, 4, idTabeli, false, szerokoscKolumny, "w terminie ustawowym"));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(teksty03, 10, idTabeli, false, szerokoscKolumny, "razem po terminie ustawowym"));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(teksty03, 12, idTabeli, false, szerokoscKolumny, "nieusprawiedliwione"));

            GridViewBandColumn kolumna_PoUplywie = DevExpressXXL.GetBoundColumn("po upływie terminu ustawowego");
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 14, idTabeli, false, szerokoscKolumny, "1-14 dni"));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 20, idTabeli, false, szerokoscKolumny, "w tym nieusprawiedliwione"));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 26, idTabeli, false, szerokoscKolumny, "15-30 dni"));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 32, idTabeli, false, szerokoscKolumny, "w tym nieusprawiedliwione"));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 38, idTabeli, false, szerokoscKolumny, "powyżej 1 do 3 mies."));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 44, idTabeli, false, szerokoscKolumny, "w tym nieusprawiedliwione"));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 50, idTabeli, false, szerokoscKolumny, "ponad 3 mies."));
            kolumna_PoUplywie.Columns.Add(DevExpressXXL.podKolumna(teksty02, 56, idTabeli, false, szerokoscKolumny, "w tym nieusprawiedliwione"));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_PoUplywie);

            //po upływie terminu ustawowego
            ASPxGridView2.Columns.Add(kolumna_liczbaSporzadzonychUzasadnien);

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym  w których wpłynął wniosek o transkrypcję" }, 62, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 64, idTabeli, false, szerokoscKolumny, "iczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent"));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_66", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView2.TotalSummary.Clear();

            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem", "miesiac"));

            for (int i = 1; i < 104; i++)
            {
                ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        private GridViewBandColumn sekcjaZpodwojnymiPodkolumnami(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "WSC skarga o stw. niezg. z pr.s", "Wykaz U","WNSc" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe", "WNSc" };

            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I + II instancja łącznie"));

            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "I instancja", przesuniecie + 2, idTabeli, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty02, "II instancja", przesuniecie + 18, idTabeli, szerokoscKolumny));

            return kolumna;
        }

        private GridViewBandColumn stanSprawZawieszonych(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
           
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw, bez czasu trwania mediacji, zgodnie z MS-S19o)");
          
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I  instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie+3, idTabeli, false, szerokoscKolumny, "II instancja"));

            return kolumna;
        }

        private GridViewBandColumn sekcjaMniejsza(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)

        {
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "WSC skarga o stw. niezg. z pr.s", "Wykaz U", "WSNc" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe", "WSNc" };
        
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty01, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty02, przesuniecie + 9, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
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
            {
            }
        }

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
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
            {
            }
        }
    }
}