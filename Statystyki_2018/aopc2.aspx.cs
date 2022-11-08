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
    public partial class aopc2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aopc2.aspx";
        private const string tenPlikNazwa = "aopc2";
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
                odswiez();
                debug();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": błąd: " + ex.Message);
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 90, 0, 7, true, true, false, false, false);
         
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
            if (tabelka01 == null)
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

          
         
            string[] teksty01 = new string[] { "Ogółem", "Ca", "Cz", "Co", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.s", "Wykaz s", "WSNc" };
            string[] teksty02 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m-cy", "pow. 6 do 12 m-cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            string[] teksty03 = new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" };


            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01,  1, idTabeli, false, szerokoscKolumny, "Wpływ"));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", 9, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 25, idTabeli, false, szerokoscKolumny, "Załatwienia"));
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziegoNew(33, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 37, idTabeli, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty02, 45, idTabeli, false, szerokoscKolumny, "pozostało spraw starych - wszystkie kategorie spraw (łącznie z czasem trwania mediacji, zgodnie z dz. 2.1.1. MS-S1o)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty03, 54, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych  (wszystkie kategorie spraw, łącznie z czasem trwania mediacji, zgodnie z MS-S1o)"));



            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 57, idTabeli, false, szerokoscKolumny, "terminowość sporządzania uzasadnień przez sędziów na wniosek (zgodnie z MS-S1o, dz. 1.4.1.a ) *");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 61, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym <br> których wpłynął wniosek o transkrypcje " },69, idTabeli,  false, szerokoscKolumny,"Uzasadnienia wygłoszone"));
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);

            GridViewBandColumn liczbaSporzadzonychUzasadnien2 = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 71, idTabeli, false, szerokoscKolumny, "terminowość sporządzania uzasadnień przez sędziów z urzędu (zgodnie z MS-S1o, dz. 1.4.1.b ) *");

            GridViewBandColumn PoUplywie2 = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 75, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien2.Columns.Add(PoUplywie2);
            liczbaSporzadzonychUzasadnien2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym <br> których wpłynął wniosek o transkrypcje " }, 83, idTabeli, false, szerokoscKolumny, "Uzasadnienia wygłoszone"));
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien2);
            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(85, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_89", idTabeli, "", false, szerokoscKolumny));

          
            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 89; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

    

    
        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        private GridViewBandColumn sekcjaZpodwojnymiPodkolumnami(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            string[] teksty01 = new string[] { "Ogółem", "Ca", "Cz", "Co", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.s", "Wykaz s", "WSNc" };

            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I + II instancja łącznie"));

            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", przesuniecie + 2, idTabeli, szerokoscKolumny));
      
            return kolumna;
        }

        private GridViewBandColumn stanSprawZawieszonych(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw, bez czasu trwania mediacji, zgodnie z MS-S19o)");

            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I  instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie + 3, idTabeli, false, szerokoscKolumny, "II instancja"));

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

     
    }
}