using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oktkr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "oktkr.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                else
                {
                    CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                    newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                    System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                    System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                    DateTime dTime = DateTime.Now.AddMonths(-1); ;

                    if (Date1.Text.Length == 0)
                    {
                        Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                    }

                    if (Date2.Text.Length == 0)
                    {
                        Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                    }

                    Session["id_dzialu"] = idWydzial;
                    Session["data_1"] = Date1.Date.ToShortDateString();
                    Session["data_2"] = Date2.Date.ToShortDateString();

                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        clearHedersSession();
                        makeHeader();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch
            {
                Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void clearHedersSession()
        {
            Session["header_01"] = null;
            Session["header_02"] = null;
            Session["header_03"] = null;
            Session["header_04"] = null;
            Session["header_05"] = null;
            Session["header_06"] = null;
            Session["header_07"] = null;
            Session["header_08"] = null;
        }

        protected void odswiez()
        {
            string idDzialu = (string)Session["id_dzialu"];
            string txt = string.Empty; //
            try
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
                Session["tabelka001"] = dr.tworzTabele(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 32, GridView1, tenPlik);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            try
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
                Session["tabelka002"] = dr.tworzTabele(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 32, tabela_2, tenPlik);
                tabela_2.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            try
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
                Session["tabelka003"] = dr.tworzTabele(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 43, tabela_3, tenPlik);
                tabela_3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
                Label5.Visible = cl.debug(int.Parse(idDzialu));
                Label9.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                Label5.Visible = false;
                Label9.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        protected void makeHeader()
        {
            #region tabela  1 (wierszowa)

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));
            dT_02.Columns.Add("Column6", typeof(string));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));
            dT_03.Columns.Add("Column6", typeof(string));
            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            dT_04.Columns.Add("Column6", typeof(string));

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "0", "2", "1" });
            for (int i = 1; i < 16; i++)
            {
                dT_01.Rows.Add(new Object[] { "1", i.ToString(), "1", "1" });
            }
            for (int i = 0; i < 4; i++)
            {

                dT_01.Rows.Add(new Object[] { "2", "KZ", "1", "1" });
                dT_01.Rows.Add(new Object[] { "2", "KS", "1", "1" });
            }
           
            dT_01.Rows.Add(new Object[] { "2", "Ogółem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "KZ", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "KS", "1", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Ogółem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "3", "nadzór (w tym tymczasowy)", "2", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem", "1", "2" });

            dT_01.Rows.Add(new Object[] { "3", "w postępowaniu rozpozawczym", "2", "1" });
            dT_01.Rows.Add(new Object[] { "3", "w sprawach o rozwód lub separację", "2", "1" });
            dT_01.Rows.Add(new Object[] { "3", "w postępowaniu wykonawczym", "2", "1" });

            dT_01.Rows.Add(new Object[] { "4", "Nazwisko i imię kuratora", "2", "3" });
            dT_01.Rows.Add(new Object[] { "4", "Liczba spraw wykonywanych przez kuratorów", "3", "1" });
            dT_01.Rows.Add(new Object[] { "4", "Wywiady przeprowadzone przez kuratorów", "7", "1" });
            dT_01.Rows.Add(new Object[] { "4", "wykaz Op", "3", "2" });
            dT_01.Rows.Add(new Object[] { "4", "Wywiady kontrolne", "1", "3" });
            dT_01.Rows.Add(new Object[] { "4", "Posiedzenia wykonawcze", "1", "3" });

            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "o umorzenie postępowania opiekuńczego ", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o zmianę sposobu ograniczenia władzy rodzicielskiej (art. 109 § 1 i 2 kro)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "inne", "1", "1", "h", "60" });

            dT_02.Rows.Add(new Object[] { "1", "o zmianę lub uchylenie środka wychowawczego (art. 70a § 2 pkt 9 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o zmianę lub uchylenie środka wychowawczego zastosowanego w okresie próby (art. 70a § 2 pkt 10 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o zarządzenie wykon. środka poprawczego (art. 70a § 2 pkt 11 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o zmianę lub uchylenie środka tymczasowego (art. 70a § 2 pkt 12 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o odroczenie wykonania środka wychowawczego … (art. 70a § 2 pkt 13 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o nałożenie, zmianę lub uchylenie obowiązków  - art. 70  §1 upn  <br/> (art. 70a § 2 pkt 14 upn)", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "inne", "1", "1", "h", "60" });

            dT_02.Rows.Add(new Object[] { "1", "o orzeczenie ustania obowiązku poddania się leczeniu odwykowemu (art. 34 ust. 4 ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "o zmianę rodzaju zakładu leczenia odwykowego (art. 34 ust. 2 ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "inne", "1", "1", "h", "60" });

            dT_02.Rows.Add(new Object[] { "2", "Sprawy opiekuńcze <br/> - Opmk", "3", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Nieletni - Nwk", "7", "1", "h" });
            dT_02.Rows.Add(new Object[] { "2", "Dorośli - Alkk", "3", "1", "h", "120" });
            dT_02.Rows.Add(new Object[] { "2", "inne kierowane do sądu", "1", "2", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "inne kierowane do podmiotów innych niż sąd", "1", "2", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });//

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "Imię i nazwisko<br/> kuratora zawodowego", "1", "3", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "3", "Wnioski złożonych przez<br/> kuratorów w przedmiocie:", "16", "1", "h", "45" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  2 ()

            dT_03.Clear();

            for (int i = 0; i < 16; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "rozpatrzone", "1", "1", "h", "60" });
                dT_03.Rows.Add(new Object[] { "1", "w tym uwzględnione", "1", "1", "h", "60" });
            }

            dT_03.Rows.Add(new Object[] { "2", "o umorzenie postępowania opiekuńczego ", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o zmianę sposobu ograniczenia władzy rodzicielskiej (art. 109 § 1 i 2 kro)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "inne", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "o zmianę lub uchylenie środka wychowawczego (art. 70a § 2 pkt 9 upn)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o zmianę lub uchylenie środka wychowawczego zastosowanego w okresie próby (art. 70a § 2 pkt 10 upn)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o zarządzenie wykon. środka poprawczego (art. 70a § 2 pkt 11 upn)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o zmianę lub uchylenie środka tymczasowego (art. 70a § 2 pkt 12 upn)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o odroczenie wykonania środka wychowawczego … (art. 70a § 2 pkt 13 upn)", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o nałożenie, zmianę lub uchylenie obowiązków  - art. 70  §1 upn ", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "inne", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o orzeczenie ustania obowiązku poddania się leczeniu odwykowemu (art. 34 ust. 4 ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "o zmianę rodzaju zakładu leczenia odwykowego (art. 34 ust. 2 ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "inne", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Sprawy opiekuńcze - Opmk", "6", "1", "h", "10" });//
            dT_03.Rows.Add(new Object[] { "3", "Nieletni - Nwk", "14", "1", "h" });//
            dT_03.Rows.Add(new Object[] { "3", "Dorośli - Alkk", "6", "1", "h", "45" });//
            dT_03.Rows.Add(new Object[] { "3", "inne kierowane do sądu", "2", "2", "h", "45" });
            dT_03.Rows.Add(new Object[] { "3", "inne kierowane do podmiotów innych niż sąd", "2", "2", "h", "45" });//
            dT_03.Rows.Add(new Object[] { "3", "Razem", "2", "2", "h", "45" });

            dT_03.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h", "10" });//
            dT_03.Rows.Add(new Object[] { "4", "Imię i nazwisko<br/> kuratora zawodowego", "1", "4", "h", "130" });//
            dT_03.Rows.Add(new Object[] { "4", "Wnioski złożonych przez kuratorów w przedmiocie:", "32", "1", "h", "45" });//

            Session["header_03"] = dT_03;

            #endregion tabela  2 ()
        }

        #endregion "nagłowki tabel"

        protected void makeLabels()
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                //	id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    tabela1Label.Text = "";// "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela2Label.Text = "Wykaz wniosków złożonych przez kuratorów sądowych za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela3Label.Text = "Wykaz wniosków złożonych przez kuratorów sądowych za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Wykaz wniosków złożonych przez kuratorów sądowych  za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela1Label.Text = "";// "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela3Label.Text = "Wykaz wniosków złożonych przez kuratorów sądowych  za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            { }
        }

       

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oktkr.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oktkr";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table1 = (DataTable)Session["tabelka001"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table1, 16, 0, 8, true, true, false, false, false);

                // druga

                DataTable table2 = (DataTable)Session["tabelka002"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 17, 0, 8, true, true, false, false, false);

                //trzecia

                DataTable table3 = (DataTable)Session["tabelka003"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 33, 0, 9, true, true, false, false, false);

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

            odswiez();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

      

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
               
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader( dT, GridView1);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void naglowekTabeli_tabela_2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_02"];
                tb.makeHeader(dT, tabela_2);
            }
        }

        protected void stopkaTabeli_tabela_2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void naglowekTabeli_tabela_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_03"];
                tb.makeHeader(dT, tabela_3);
            }
        }

        protected void stopkaTabeli_tabela_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 1);
            }
        }
    }
}