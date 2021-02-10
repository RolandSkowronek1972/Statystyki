using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aglg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        public static string tenPlik = "aglg.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;

            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                else
                {
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

        protected void odswiez()
        {
            string id_dzialu = (string)Session["id_dzialu"];

            //tabela 1
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 1, Date1.Date, Date2.Date, 28, tenPlik);
                Session["tabelka001"] = Tabela2;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = Tabela2;
                gwTabela1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 2
            try
            {
                DataTable tabela02 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 2, 24, 43, tenPlik);

                Session["tabelka002"] = tabela02;

                //  wiersz 1
                tab_tabela2_w01_c01.Text = tabela02.Rows[0][1].ToString().Trim();
                tab_tabela2_w01_c02.Text = tabela02.Rows[0][2].ToString().Trim();
                tab_tabela2_w01_c03.Text = tabela02.Rows[0][3].ToString().Trim();
                tab_tabela2_w01_c04.Text = tabela02.Rows[0][4].ToString().Trim();
                tab_tabela2_w01_c05.Text = tabela02.Rows[0][5].ToString().Trim();
                tab_tabela2_w01_c06.Text = tabela02.Rows[0][6].ToString().Trim();
                tab_tabela2_w01_c07.Text = tabela02.Rows[0][7].ToString().Trim();
                tab_tabela2_w01_c08.Text = tabela02.Rows[0][8].ToString().Trim();
                tab_tabela2_w01_c09.Text = tabela02.Rows[0][9].ToString().Trim();
                //  wiersz 2
                tab_tabela2_w02_c01.Text = tabela02.Rows[1][1].ToString().Trim();
                tab_tabela2_w02_c02.Text = tabela02.Rows[1][2].ToString().Trim();
                tab_tabela2_w02_c03.Text = tabela02.Rows[1][3].ToString().Trim();
                tab_tabela2_w02_c04.Text = tabela02.Rows[1][4].ToString().Trim();
                tab_tabela2_w02_c05.Text = tabela02.Rows[1][5].ToString().Trim();
                tab_tabela2_w02_c06.Text = tabela02.Rows[1][6].ToString().Trim();
                tab_tabela2_w02_c07.Text = tabela02.Rows[1][7].ToString().Trim();
                tab_tabela2_w02_c08.Text = tabela02.Rows[1][8].ToString().Trim();
                tab_tabela2_w02_c09.Text = tabela02.Rows[1][9].ToString().Trim();
                //  wiersz 3
                tab_tabela2_w03_c01.Text = tabela02.Rows[2][1].ToString().Trim();
                tab_tabela2_w03_c02.Text = tabela02.Rows[2][2].ToString().Trim();
                tab_tabela2_w03_c03.Text = tabela02.Rows[2][3].ToString().Trim();
                tab_tabela2_w03_c04.Text = tabela02.Rows[2][4].ToString().Trim();
                tab_tabela2_w03_c05.Text = tabela02.Rows[2][5].ToString().Trim();
                tab_tabela2_w03_c06.Text = tabela02.Rows[2][6].ToString().Trim();
                tab_tabela2_w03_c07.Text = tabela02.Rows[2][7].ToString().Trim();
                tab_tabela2_w03_c08.Text = tabela02.Rows[2][8].ToString().Trim();
                tab_tabela2_w03_c09.Text = tabela02.Rows[2][9].ToString().Trim();
                //  wiersz 4
                tab_tabela2_w04_c01.Text = tabela02.Rows[3][1].ToString().Trim();
                tab_tabela2_w04_c02.Text = tabela02.Rows[3][2].ToString().Trim();
                tab_tabela2_w04_c03.Text = tabela02.Rows[3][3].ToString().Trim();
                tab_tabela2_w04_c04.Text = tabela02.Rows[3][4].ToString().Trim();
                tab_tabela2_w04_c05.Text = tabela02.Rows[3][5].ToString().Trim();
                tab_tabela2_w04_c06.Text = tabela02.Rows[3][6].ToString().Trim();
                tab_tabela2_w04_c07.Text = tabela02.Rows[3][7].ToString().Trim();
                tab_tabela2_w04_c08.Text = tabela02.Rows[3][8].ToString().Trim();
                tab_tabela2_w04_c09.Text = tabela02.Rows[3][9].ToString().Trim();
                //  wiersz 5
                tab_tabela2_w05_c01.Text = tabela02.Rows[4][1].ToString().Trim();
                tab_tabela2_w05_c02.Text = tabela02.Rows[4][2].ToString().Trim();
                tab_tabela2_w05_c03.Text = tabela02.Rows[4][3].ToString().Trim();
                tab_tabela2_w05_c04.Text = tabela02.Rows[4][4].ToString().Trim();
                tab_tabela2_w05_c05.Text = tabela02.Rows[4][5].ToString().Trim();
                tab_tabela2_w05_c06.Text = tabela02.Rows[4][6].ToString().Trim();
                tab_tabela2_w05_c07.Text = tabela02.Rows[4][7].ToString().Trim();
                tab_tabela2_w05_c08.Text = tabela02.Rows[4][8].ToString().Trim();
                tab_tabela2_w05_c09.Text = tabela02.Rows[4][9].ToString().Trim();
                //  wiersz 6
                tab_tabela2_w06_c01.Text = tabela02.Rows[5][1].ToString().Trim();
                tab_tabela2_w06_c02.Text = tabela02.Rows[5][2].ToString().Trim();
                tab_tabela2_w06_c03.Text = tabela02.Rows[5][3].ToString().Trim();
                tab_tabela2_w06_c04.Text = tabela02.Rows[5][4].ToString().Trim();
                tab_tabela2_w06_c05.Text = tabela02.Rows[5][5].ToString().Trim();
                tab_tabela2_w06_c06.Text = tabela02.Rows[5][6].ToString().Trim();
                tab_tabela2_w06_c07.Text = tabela02.Rows[5][7].ToString().Trim();
                tab_tabela2_w06_c08.Text = tabela02.Rows[5][8].ToString().Trim();
                tab_tabela2_w06_c09.Text = tabela02.Rows[5][9].ToString().Trim();
                //  wiersz 7
                tab_tabela2_w07_c01.Text = tabela02.Rows[6][1].ToString().Trim();
                tab_tabela2_w07_c02.Text = tabela02.Rows[6][2].ToString().Trim();
                tab_tabela2_w07_c03.Text = tabela02.Rows[6][3].ToString().Trim();
                tab_tabela2_w07_c04.Text = tabela02.Rows[6][4].ToString().Trim();
                tab_tabela2_w07_c05.Text = tabela02.Rows[6][5].ToString().Trim();
                tab_tabela2_w07_c06.Text = tabela02.Rows[6][6].ToString().Trim();
                tab_tabela2_w07_c07.Text = tabela02.Rows[6][7].ToString().Trim();
                tab_tabela2_w07_c08.Text = tabela02.Rows[6][8].ToString().Trim();
                tab_tabela2_w07_c09.Text = tabela02.Rows[6][9].ToString().Trim();
                //  wiersz 8
                tab_tabela2_w08_c01.Text = tabela02.Rows[7][1].ToString().Trim();
                tab_tabela2_w08_c02.Text = tabela02.Rows[7][2].ToString().Trim();
                tab_tabela2_w08_c03.Text = tabela02.Rows[7][3].ToString().Trim();
                tab_tabela2_w08_c04.Text = tabela02.Rows[7][4].ToString().Trim();
                tab_tabela2_w08_c05.Text = tabela02.Rows[7][5].ToString().Trim();
                tab_tabela2_w08_c06.Text = tabela02.Rows[7][6].ToString().Trim();
                tab_tabela2_w08_c07.Text = tabela02.Rows[7][7].ToString().Trim();
                tab_tabela2_w08_c08.Text = tabela02.Rows[7][8].ToString().Trim();
                tab_tabela2_w08_c09.Text = tabela02.Rows[7][9].ToString().Trim();
                //  wiersz 9
                tab_tabela2_w09_c01.Text = tabela02.Rows[8][1].ToString().Trim();
                tab_tabela2_w09_c02.Text = tabela02.Rows[8][2].ToString().Trim();
                tab_tabela2_w09_c03.Text = tabela02.Rows[8][3].ToString().Trim();
                tab_tabela2_w09_c04.Text = tabela02.Rows[8][4].ToString().Trim();
                tab_tabela2_w09_c05.Text = tabela02.Rows[8][5].ToString().Trim();
                tab_tabela2_w09_c06.Text = tabela02.Rows[8][6].ToString().Trim();
                tab_tabela2_w09_c07.Text = tabela02.Rows[8][7].ToString().Trim();
                tab_tabela2_w09_c08.Text = tabela02.Rows[8][8].ToString().Trim();
                tab_tabela2_w09_c09.Text = tabela02.Rows[8][9].ToString().Trim();
                //  wiersz 10
                tab_tabela2_w10_c01.Text = tabela02.Rows[9][1].ToString().Trim();
                tab_tabela2_w10_c02.Text = tabela02.Rows[9][2].ToString().Trim();
                tab_tabela2_w10_c03.Text = tabela02.Rows[9][3].ToString().Trim();
                tab_tabela2_w10_c04.Text = tabela02.Rows[9][4].ToString().Trim();
                tab_tabela2_w10_c05.Text = tabela02.Rows[9][5].ToString().Trim();
                tab_tabela2_w10_c06.Text = tabela02.Rows[9][6].ToString().Trim();
                tab_tabela2_w10_c07.Text = tabela02.Rows[9][7].ToString().Trim();
                tab_tabela2_w10_c08.Text = tabela02.Rows[9][8].ToString().Trim();
                tab_tabela2_w10_c09.Text = tabela02.Rows[9][9].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 3
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(id_dzialu), 3, Date1.Date, Date2.Date, 26, tenPlik);
                Session["tabelka003"] = Tabela2;
                gwTabela3.DataSource = null;
                gwTabela3.DataSourceID = null;
                gwTabela3.DataSource = Tabela2;
                gwTabela3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            //tabela 4
            try
            {
                DataTable tabela04 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 4, 8, 2, tenPlik);

                Session["tabelka004"] = tabela04;

                //  wiersz 1
                tab_tabela4_w01_c01.Text = tabela04.Rows[0][1].ToString().Trim();

                //  wiersz 2
                tab_tabela4_w02_c01.Text = tabela04.Rows[1][1].ToString().Trim();

                //  wiersz 3
                tab_tabela4_w03_c01.Text = tabela04.Rows[2][1].ToString().Trim();

                //  wiersz 4
                tab_tabela4_w04_c01.Text = tabela04.Rows[3][1].ToString().Trim();

                //  wiersz 5
                tab_tabela4_w05_c01.Text = tabela04.Rows[4][1].ToString().Trim();

                //  wiersz 6
                tab_tabela4_w06_c01.Text = tabela04.Rows[5][1].ToString().Trim();

                //  wiersz 7
                tab_tabela4_w07_c01.Text = tabela04.Rows[6][1].ToString().Trim();

                //  wiersz 8
                tab_tabela4_w08_c01.Text = tabela04.Rows[7][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();
        }

        #region "nagłowki tabel"

        private DataTable header_03()
        {
            DataTable dT_03 = tabela.SchematTabelinaglowkowej();

            #region tabela  3 ()

            dT_03.Clear();

            for (int i = 0; i < 6; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "Odrocz.", "1", "1", "h" });
                dT_03.Rows.Add(new Object[] { "1", "Odrocz publ.", "1", "1", "h" });
            }
            dT_03.Rows.Add(new Object[] { "1", "Odrocz.", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Odrocz publ.", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "GC", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GNc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GCo I insta", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ga", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Gz", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Go II insta", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "GS", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Sędzia", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Odroczenia", "16", "1", "h" });
            return dT_03;

            #endregion tabela  3 ()
        }

        #endregion "nagłowki tabel"

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tabela.SchematTabelinaglowkowej();

            for (int i = 0; i < 9; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            }

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo I inst.", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Go II inst.", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GS", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "3", "1", "h" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Nazwisko i imię sędziego", "1", "3", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Załatwienia", "28", "1", "h" });
            return tabelaNaglowkowa;
        }

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
                lbTabela1.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";

                lbTabela3.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";
                lbTabela4.Text = "Miesięczny ruch spraw w " + Date2.Date.Year.ToString() + " roku.";
                Label6.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            }
            catch
            { }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\aglg.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\aglg";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                DataTable table = (DataTable)Session["tabelka001"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 28, 0, 5, false, false, false, false, false);

                // druga
                DataTable table2 = (DataTable)Session["tabelka002"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 10, 10, 1, 3, false);

                // trzecia
                DataTable table3 = (DataTable)Session["tabelka003"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 17, 0, 5, false, false, false, false, false);

                DataTable table4 = (DataTable)Session["tabelka004"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], table4, 8, 2, 1, 3, false);

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

        protected void naglowekTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tabela.makeSumRow((DataTable)Session["tabelka001"], e, 1);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabela.makeHeader(header_03(), gwTabela3);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e, 1);
            }
        }
    }
}