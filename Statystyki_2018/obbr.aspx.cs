/*
Last Update:
     - version 1.190414
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
    public partial class obbr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "obbr.aspx";

        private int storid = 0;
        private int rowIndex = 1;

        private const string tenPlikNazwa = "obbr";
        public string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null) return;
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));

                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel3.Visible = false;
                infoLabel1.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            //odswiezenie danych
            tabela_1();

            tabela_3();
            tabela_4();
            tabela_5();
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\obbr.xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\obbr";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza
                DataTable table1 = (DataTable)Session["tabelka001"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table1, 13, 0, 3, false, false, false, false, false);

                //pod tabela
                int rowik = table1.Rows.Count - 4;

                tb.komorkaExcela(MyWorksheet1, rowik + 7, 1, "Zaległość z poprzedniego miesiąca", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 8, 1, "Wpływ", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 9, 1, "Załatwienia", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 10, 1, "Pozostało na następny miesiąc", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 11, 1, "3-6 miesięcy", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 12, 1, "6-12 miesięcy", true, 0, 4);
                tb.komorkaExcela(MyWorksheet1, rowik + 13, 1, "ponad 12 miesięcy", true, 0, 4);

                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 2; i < 10; i++)
                    {
                        try
                        {
                            MyWorksheet1.Cells[rowik + 7, i + 4].Value = double.Parse(dR[i - 1].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet1.Cells[rowik + 7, i + 4].Value = dR[i - 1].ToString().Trim();
                        }

                        MyWorksheet1.Cells[rowik + 7, i + 4].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 7, i + 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                    rowik++;
                }

                DataTable table2 = (DataTable)Session["tabelka003"];
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 5, 7, 1, 5, false);

                // trzecia

                DataTable table3 = (DataTable)Session["tabelka004"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 4, 0, 3, false, false, false, false, false);

                // czwarta

                DataTable table4 = (DataTable)Session["tabelka005"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table4, 9, 0, 3, false, false, false, false, false);

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
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 15, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void tabela_4()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
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
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka005"] = tabelka01;
            gwTabela5.DataSource = null;
            gwTabela5.DataSourceID = null;
            gwTabela5.DataSource = tabelka01;
            gwTabela5.DataBind();
        }

        protected void tabela_3()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 3, 20, 20, tenPlik);
                Session["tabelka003"] = tabelka01;
                //row 1
                tab_7_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_7_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_7_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_7_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_7_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_7_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();

                //row 2
                tab_7_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_7_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_7_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_7_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_7_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_7_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();

                //row 3
                tab_7_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_7_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_7_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_7_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_7_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_7_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                //row 3
                tab_7_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_7_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_7_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_7_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_7_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_7_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();

                //row 3
                tab_7_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_7_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_7_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_7_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_7_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_7_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
        }

        private DataTable tabela_2()
        {
            //dane do tabeli sumującej po tabelą nr 1
            DataTable tabelka01 = new DataTable();
            try
            {
                tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 7, 8, tenPlik);
                Session["tabelka002"] = tabelka01;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            return tabelka01;
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\obbr.xlsx");
                DataTable dT = tb.naglowek(path, 1);
                tb.makeHeader(dT, gwTabela1);
            }
            else
            {
                if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
                {
                    rowIndex = 0;
                    AddNewRow(sender, e);
                }
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\obbr.xlsx");
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(dT, gwTabela4);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\obbr.xlsx");
                DataTable dT = tb.naglowek(path, 4);
                tb.makeHeader(dT, gwTabela5);
            }
        }

        protected void gwTabela1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = tabela_2();
            if (tabelka01 == null)
            {
                return;
            }

            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            string idtabeli = "2";

            // nowy wiersz
            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "zaległości z poprzedniego miesiąca", 5, 0, "", "borderAll center"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Wpłynęło", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Załatwiono", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Pozostało na miesiąc następny", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Powyżej 3-6 miesięcy", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Powyżej 6-12 miesięcy", 5, 0, "", "borderAll center"));
           
            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 9, idWiersza, idtabeli, "Powyżej 12 miesięcy", 5, 0, "", "borderAll center"));
        }
    }
}