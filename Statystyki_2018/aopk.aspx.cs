/*
Last Update:
    - version 1.190127
Creation date: 2019-01-27

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aopk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopk.aspx";
        private const string tenPlikNazwa = "aopk";
        private string path = "";

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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 68, 0, 9, true, true, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 90, tenPlik);
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

            for (int i = 1; i < 67; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", i.ToString(), "1", "1" });
            }
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym w których wpłynął wniosek o transkrypcję", "1", "1" });





            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ko z rozdziału 58 kpk oraz ustawy z dn.23.02.1991r o uznanie za nieważne orzeczeń wydanych wobec osób represjonowanych ….", "1", "2" });
            for (int i = 0; i < 6; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            }

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "rozprawy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia jawne", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia niejawne", "1", "2" });

       //     tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w których wpłynął wniosek o transkrypcję", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uwzględniono", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "K", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kp", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko (ogółem)", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kop", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSNk", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Pf + nowe wykazy K-opr, K-spr (dot. kontroli operacyjnej)", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "K", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kp", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kop", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSNk", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "K", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kp", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kop", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSNk", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "z tego", "3", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "K", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kp", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kop", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSNk", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "do 3 m-cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 3 do 6 m - cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow.  6 do 12 m - cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 12 m-cy do 2 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 2 do 3 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 3 do 5 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 5 do 8 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 8 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "zakreślonych", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "niezakreślonych", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "łącznie", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w terminie ustawowym 14 dni ", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "razem po terminie ustawowym", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "nieusprawiedliwione", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "po upływie terminiu ustawowego", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "uzasadnienia wygłoszone ***", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "wpływ", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "załatwiono", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostałość", "1", "3" });

      //      tabelaNaglowkowa.Rows.Add(new Object[] { "5", "na potrzeby MS-S", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "od dnia przedłożenia sędziemu akt w celu sporządzenia uzasadnienia     (zgodnie z MS - S5o, dz. 1.4.2) *", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "od dnia wpływu wniosku do właściwego sądu (zgodnie z MS-S5o, dz. 1.4.1) **", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "lp", "1", "6" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "nazwisko i imię sędziego", "1", "6" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "WPŁYW", "8", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Załatwiono", "12", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "ZAŁATWIENIA", "6", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "sesje odbyte przez sędziego", "4", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "POZOSTAŁOŚĆ na następny m-c", "6", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "pozostało spraw starych (wszystkie kategorie spraw)", "9", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "stan spraw zawieszonych <br/> (wszystkie kategorie spraw, zgodnie z MS-S5o)", "3", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "terminowość sporządzania uzasadnień", "14", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "skargi na przewlekłość", "4", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "UWAGI", "1", "5" });

            return tabelaNaglowkowa;
        }
    }
}