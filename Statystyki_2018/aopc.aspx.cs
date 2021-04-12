/*
Last Update:
    - version 1.210203
Creation date: 2019-04-21

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aopc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopc.aspx";
        private const string tenPlikNazwa = "aopc";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial == null)
            {
                Server.Transfer("default.aspx");
                return;
            }
            try
            {
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
            }
            catch
            {
                infoLabel1.Visible = false;
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

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 112, 0, 10, true, false, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 230, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 1);
            }
        }

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            for (int i = 1; i < 112; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", i.ToString(), "1", "1" });
            }
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółęm", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których wpłynął wniosek o transkrypcję", "1", "1" });
          

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co (wnioski o zwoln. od kosztów sąd. i ustanow. pełnom. przed złożeniem pozwu)", "1", "2" });
     
            for (int i = 0; i < 16; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            }
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o rozwód", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o separację", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "RC (do 31.01.2018)", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "od 1.02.2018", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Rozprawy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia jawne", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia niejawne", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o rozwód", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o separację", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "RC (do 31.01.2018)", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "od 1.02.2018", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w których wpłynął wniosek o transkrypcję", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "rozpoznano", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pozostałość", "1", "2" });
         
                for (int i = 0; i < 2; i++)
                 {
                    tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
                }

        

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSNc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Cz", "1", "4" });



            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "RC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C od 1.02.2018 r.", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-Rej", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSNc", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Cz", "2", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" }); //51
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSNc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Cz", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "3", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "8", "2" });//98
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSNc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Cz", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "do 3 mies.", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 3 do 6 m - cy", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow.  6 do 12 m - cy", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 12 m-cy do 2 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 2 do 3 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 3 do 5 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 5 do 8 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow.  8 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "zakreślonych", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "niezakreślonych", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "łącznie", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w terminie ustawowym 14 dni", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "razem po terminie ustawowym", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "nieusprawiedliwione", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "po upływie terminiu ustawowego", "8", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "uzasadnienia wygłoszone ***", "2", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "od dnia doręczenia sędziemu wniosku do sporządzenia uzasadnienia (zgodnie z MS-S1o, dz. 1.4.2)* ", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "od dnia wpływu wniosku do właściwego sądu (zgodnie z MS-S1o, dz. 1.4.1) **", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "lp", "1", "7" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "imię i nazwisko sędziego", "1", "7" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "WPŁYW", "12", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Załatwiono", "32", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "ZAŁATWIENIA", "16", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "sesje odbyte przez sędziego", "4", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "POZOSTAŁOŚĆ na następny m-c", "16", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "pozostało spraw starych (wszystkie kategorie spraw)<br/>pozostało spraw starych - wszystkie kategorie spraw (bez czasu trwania mediacji, zgodnie z dz. 2.1.1.1 MS-S1o)", "9", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "stan spraw zawieszonych (wszystkie kategorie spraw, bez czasu trwania mediacji, zgodnie z MS-S1o)", "3", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "terminowość sporządzania uzasadnień", "14", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "skargi na przewlekłość", "4", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "UWAGI", "1", "6" });

            return tabelaNaglowkowa;
        }

        private DataTable header_02()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            for (int i = 0; i < 8; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "I + II Inst.", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "I Inst.", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "GC", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "II Inst.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
            }

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I + II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I + II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies. ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies. ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
         //   tabelaNaglowkowa.Rows.Add(new Object[] { "2", "aaaaw których wpłynął wniosek o transkrypcję", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w terminie ustawowym", "6", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "razem po terminie ustawowym", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "nieusprawiedliwione", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "48", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Razem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "imię i nazwisko sędziego", "1", "4", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "61", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "uzasadnienia wygłoszone *", "2", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Uwagi", "1", "4", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_05()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            return tabelaNaglowkowa;
        }

        private DataTable header_11()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "skierowano do wykonania", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "inny sposób", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Załatwienia", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pozostało", "1", "2" });

            return tabelaNaglowkowa;
        }

        private DataTable header_10()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Efektywny okres orzekania", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw", "6", "1" });

            return tabelaNaglowkowa;
        }

        private DataTable header_12()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "utrzymano  w mocy", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono ", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "zmienionoKp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "częściowo uchylono", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pozostawiono bez rozpoznania ", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Rodzaje orzeczeń ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "6", "1" });

            return tabelaNaglowkowa;
        }
    }
}