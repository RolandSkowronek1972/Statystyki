/*
Last Update:
    - version 1.230205
Creation date: 2023-02-05

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private const string tenPlik = "oglk.aspx";

        private int storid = 0;
        private int rowIndex = 1;

        private const string tenPlikNazwa = "oglk";
        public string path = "";

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
                //   Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
            //odswiezenie danych
            tabela_1();
            Tabela_3();
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\oczu.xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\oczu";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza
                DataTable table1 = (DataTable)Session["tabelka001"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table1, 45, 0, 12, true, true, false, false, false);

                //pod tabela
                int rowik = table1.Rows.Count +6;

                tb.komorkaExcela(MyWorksheet1, rowik + 7, 1, "Zaległość z poprzedniego miesiąca", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 8, 1, "Wpływ", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 9, 1, "Załatwienia", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 10, 1, "Pozostało na następny miesiąc", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 11, 1, "w tym", true, 4, 0);
                tb.komorkaExcela(MyWorksheet1, rowik + 11, 2, "3-6 miesięcy", true, 0, 0);
                tb.komorkaExcela(MyWorksheet1, rowik + 12, 2, "6-12 miesięcy", true, 0, 0);
                tb.komorkaExcela(MyWorksheet1, rowik + 13, 2, "od 1 roku do 2 lat", true, 0, 0);
                tb.komorkaExcela(MyWorksheet1, rowik + 14, 2, "od 2 lat do 3 lat", true, 0, 0);
                tb.komorkaExcela(MyWorksheet1, rowik + 15, 2, "powyżej 3 lat", true, 0, 0);
                DataTable tabelka001 = (DataTable)Session["tabelka002"];
                int licznik = 0;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    
                    for (int i =0; i < 4; i++)
                    {
                       tb. komorkaExcela(MyWorksheet1, rowik + 7, (i*2)+3 , dR[i ].ToString().Trim(), true, 0, 1, true, false);

                       
                    }
                    tb.komorkaExcela(MyWorksheet1, rowik + 7, 11, dR[5].ToString().Trim(), false, 0, 0, true, false);
                    rowik++;
                    licznik++;
                    if (licznik==9)
                    {
                        break;
                    }
                }

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 60, tenPlik);

            Session["tabelka001"] = tabelka01;

            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        private DataTable tabela_2()
        {
            //dane do tabeli sumującej po tabelą nr 1
            DataTable tabelka01 = new DataTable();
            try
            {
                tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 20, 18, tenPlik);
                Session["tabelka002"] = tabelka01;
                //row 1
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            return tabelka01;
        }
        private void Tabela_3()
        {

            try
            {
                DataTable tabelka04 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, ((string)Session["id_dzialu"]), 4, 10, 2, tenPlik);
                Session["tabelka004"] = tabelka04;

                // wypełnianie danych labeli
                tab_4_w01_c01.Text = tabelka04.Rows[0][1].ToString().Trim();
                tab_4_w01_c02.Text = tabelka04.Rows[0][2].ToString().Trim();

                tab_4_w02_c01.Text = tabelka04.Rows[1][1].ToString().Trim();
                tab_4_w02_c02.Text = tabelka04.Rows[1][2].ToString().Trim();

                tab_4_w03_c01.Text = tabelka04.Rows[2][1].ToString().Trim();
                tab_4_w03_c02.Text = tabelka04.Rows[2][2].ToString().Trim();

                tab_4_w04_c01.Text = tabelka04.Rows[3][1].ToString().Trim();
                tab_4_w04_c02.Text = tabelka04.Rows[3][2].ToString().Trim();

                tab_4_w05_c01.Text = tabelka04.Rows[4][1].ToString().Trim();
                tab_4_w05_c02.Text = tabelka04.Rows[4][2].ToString().Trim();

                tab_4_w06_c01.Text = tabelka04.Rows[5][1].ToString().Trim();
                tab_4_w06_c02.Text = tabelka04.Rows[5][2].ToString().Trim();

                tab_4_w07_c01.Text = tabelka04.Rows[6][1].ToString().Trim();
                tab_4_w07_c02.Text = tabelka04.Rows[6][2].ToString().Trim();

                tab_4_w08_c01.Text = tabelka04.Rows[7][1].ToString().Trim();
                tab_4_w08_c02.Text = tabelka04.Rows[7][2].ToString().Trim();

                tab_4_w09_c01.Text = tabelka04.Rows[8][1].ToString().Trim();
                tab_4_w09_c02.Text = tabelka04.Rows[8][2].ToString().Trim();

                tab_4_w10_c01.Text = tabelka04.Rows[9][1].ToString().Trim();
                tab_4_w10_c02.Text = tabelka04.Rows[9][2].ToString().Trim();

                tab_4_w11_c01.Text = tabelka04.Rows[10][1].ToString().Trim();
                tab_4_w11_c02.Text = tabelka04.Rows[10][2].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

        }
        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("XMLHeaders") + "\\" + tenPlikNazwa + ".xml";
                xMLHeaders.getHeaderFromXML(path, gwTabela1);
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

            GridView GridView1 = (GridView)sender;
           

            string idtabeli = "2";

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.PodsumowanieTabeli((DataTable)Session["tabelka001"], 22, "normal borderTopLeft gray"));

            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca", 7, 0, "", "borderAll center"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "Wpływ", 7, 0, "", "borderAll center"));

            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "Wpływ spraw do rozpoznania przez referendarzy sądowych", 7, 0, "gray", "borderAll center gray"));

            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "Załatwienia", 7, 0, "gray", "borderAll center gray"));

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "Pozostałość na następny miesiąc", 7, 0, "", "borderAll center"));
         
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "3 - 6 miesięcy", 6, 1, "", "borderAll center", "Zaległość", 7, 1, "borderAll center"));

            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "6-12 miesięcy", 6, 0, "", "borderAll center"));
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "12-24 miesięcy (do 2 lat)", 6, 0, "", "borderAll center"));
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "24-36 miesięcy (2-3 lat)", 6, 0, "", "borderAll center"));
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "36-60 miesięcy (3-5 lat)", 6, 0, "", "borderAll center"));
            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeliOGLK(tabelka01, 16, idWiersza, idtabeli, "powyżej 60 miesięcy (powyżej 5 lat)", 6, 0, "", "borderAll center"));
        }
    }
}