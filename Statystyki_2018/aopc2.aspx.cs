/*
Last Update:
    - version 1.200409
Creation date: 2019-01-21

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aopc2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopc2.aspx";
        private const string tenPlikNazwa = "aopc2";
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
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 76, 0, 7, true, true, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 80, tenPlik);
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

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcję", "1", "1" });

            for (int i = 0; i < 8; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na rozprawę", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na posiedzenie", "1", "2" });
            }

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "rozprawy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "posiedzenia jawne", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "posiedzenia niejawne", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "uwzględniono", "1", "2" });
   
            //wpływ
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ca", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Cz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga kasacyjna", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga o stw. niezg. z pr.", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Wykaz S", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSNc ", "1", "3" });
            //wyznaczono

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ca", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Cz", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC sk. kasacyjna", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC sk.o stw. niezg. z pr.", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Wykaz S", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSNc ", "2", "1" });

            //zalatwienia
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ca", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Cz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga kasacyjna", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga o stw. niezg. z pr.", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Wykaz S", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSNc ", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "z tego", "3", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ca", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Cz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga kasacyjna", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSC skarga o stw. niezg. z pr.", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Wykaz S", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WSNc ", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "do 3 m-cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 3 do 6 m-cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 6 do 12 m-cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 8 lat", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "zakreślonych", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "niezakreślonych", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "łącznie", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w terminie ustawowym 14 dni", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "razem po terminie ustawowym", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "nieusprawiedliwione", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "po upływie terminiu ustawowego", "8", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone***", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "wpływ", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "załatwiono", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pozostałość", "1", "3" });

          //  tabelaNaglowkowa.Rows.Add(new Object[] { "3", "WPŁYW", "1", "1" });
         //   tabelaNaglowkowa.Rows.Add(new Object[] { "3", "rozstrzygnięcie", "2", "1" });

         //   tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "3" });
        //    tabelaNaglowkowa.Rows.Add(new Object[] { "3", "z tego", "3", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "od dnia doręczenia sędziemu wniosku do sporządzenia uzasadnienia(zgodnie z MS-S1o, dz. 1.4.2)*", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "od dnia wpływu wniosku do właściwego sądu (zgodnie z MS-S1o, dz. 1.4.1) **", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "lp", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "nazwisko i imię sędziego", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WPŁYW", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Załatwiono", "16", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ZAŁATWIENIA", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "sesje odbyte przez sędziego", "4", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "POZOSTAŁOŚĆ na następny m-c", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pozostało spraw starych - wszystkie kategorie spraw <br/>(bez czasu trwania mediacji, zgodnie z dz. 2.1.1.1 MS-S1o)", "9", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "stan spraw zawieszonych wszystkie kategorie spraw<br/> ( bez czasu trwania mediacji, zgodnie z MS-S1o)", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "terminowość sporządzania uzasadnień ", "14", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "skargi na przewlekłość", "4", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "UWAGI", "1", "5" });

            return tabelaNaglowkowa;
        }
    }
}