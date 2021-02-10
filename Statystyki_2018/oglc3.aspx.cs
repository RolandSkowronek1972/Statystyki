/*
Last Update:
    - version 1.160417
Creation date: 2018-12-11

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglc3 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "oglc3.aspx";
        private const string tenPlikNazwa = "oglc3";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
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
                string idDzialu = (string)Session["id_dzialu"];
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }

                LabelNazwaSadu.Text = cl.nazwaSadu(idDzialu);
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();

                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel6.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel7.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel8.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel9.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel12.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel13.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel14.Visible = cl.debug(int.Parse(idDzialu));
              
                infoLabel16.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel17.Visible = cl.debug(int.Parse(idDzialu));
              
            }
            catch
            {
                infoLabel4.Visible = false;
                infoLabel1.Visible = false;
                infoLabel5.Visible = false;
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
            //makeHeader();
            //odswiezenie danych
            tabela_1();
            tabela_2();
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            tabela_9();
            tabela_10();
            tabela_11();
            tabela_12();
            tabela_13();
            tabela_14();
            tabela_15();
            tabela_16();
            tabela_17();
            tabela_18();
            dateLabel01.Text = Date1.Date.ToShortDateString() + " - " + Date2.Date.ToShortDateString();
            dateLabel02.Text = Date1.Date.ToShortDateString() + " - " + Date2.Date.ToShortDateString();
            dateLabel3.Text = Date1.Date.ToShortDateString() + " - " + Date2.Date.ToShortDateString();
            LabelText01.Text = "Wyznaczenie pierszej rozprawy (od daty wpływu do dnia, w którym odbyła się pierwsza rozprawa) w okresie od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            LabelText02.Text = "Wyznaczenie pierszej rozprawy (od daty wpływu do dnia, w którym odbyła się pierwsza rozprawa) w okresie od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString(); ;
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 14, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 7, 0, 3, false, false, false, false, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka0016"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka0017"], 7, 0, 3, false, false, false, false, false);


                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka008"], 4, 2, 2, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka009"], 1, 11, 2, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka010"], 4, 3, 2, 1, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[13], (DataTable)Session["tabelka011"], 8, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[14], (DataTable)Session["tabelka012"], 6, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[15], (DataTable)Session["tabelka013"], 7, 0, 4, false, false, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 1, 4, 12, tenPlik);
            Session["tabelka001"] = tabelka01;
            pisz("tab_1_", 4, 12, tabelka01);
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 35, tenPlik);
            Session["tabelka002"] = tabelka01;
            gwTabela2.DataSource = null;
            gwTabela2.DataSourceID = null;
            gwTabela2.DataSource = tabelka01;
            gwTabela2.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 3, 16, 3, tenPlik);
            Session["tabelka003"] = tabelka01;
            pisz("tab_3_", 16, 3, tabelka01);
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 4, 16, 4, tenPlik);
            Session["tabelka004"] = tabelka01;
            pisz("tab_4_", 16, 4, tabelka01);
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 5, 7, 4, tenPlik);
            Session["tabelka005"] = tabelka01;
            pisz("tab_5_", 7, 3, tabelka01);
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 6, 6, 8, tenPlik);
            Session["tabelka006"] = tabelka01;
            pisz("tab_6_", 6, 8, tabelka01);
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 7, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka007"] = tabelka01;
            gwTabela7.DataSource = null;
            gwTabela7.DataSourceID = null;
            gwTabela7.DataSource = tabelka01;
            gwTabela7.DataBind();
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 8, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka008"] = tabelka01;
            gwTabela8.DataSource = null;
            gwTabela8.DataSourceID = null;
            gwTabela8.DataSource = tabelka01;
            gwTabela8.DataBind();
        }

        protected void tabela_9()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 9, 1, 11, tenPlik);
            Session["tabelka009"] = tabelka01;
            pisz("tab_9_", 1, 11, tabelka01);
        }

        protected void tabela_10()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 10, 2,12, tenPlik);
            Session["tabelka010"] = tabelka01;
            pisz("tab_10_", 1, 12, tabelka01);
        }

        protected void tabela_11()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 11, Date1.Date, Date2.Date, 6, tenPlik);
            Session["tabelka011"] = tabelka01;
            gwTabela11.DataSource = null;
            gwTabela11.DataSourceID = null;
            gwTabela11.DataSource = tabelka01;
            gwTabela11.DataBind();
        }

        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 12, Date1.Date, Date2.Date, 6, tenPlik);
            Session["tabelka012"] = tabelka01;
            gwTabela12.DataSource = null;
            gwTabela12.DataSourceID = null;
            gwTabela12.DataSource = tabelka01;
            gwTabela12.DataBind();
        }

        protected void tabela_13()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 13, 8, 5, tenPlik);
            Session["tabelka013"] = tabelka01;
            pisz("tab_13_", 8, 5, tabelka01);
        }

        protected void tabela_14()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 14");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 14, 8, 7  , tenPlik);
            Session["tabelka014"] = tabelka01;
            pisz("tab_14_", 8, 6, tabelka01);
        }

        protected void tabela_15()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 15");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 15, Date1.Date, Date2.Date, 10, tenPlik);
            Session["tabelka015"] = tabelka01;
            gwTabela15.DataSource = null;
            gwTabela15.DataSourceID = null;
            gwTabela15.DataSource = tabelka01;
            gwTabela15.DataBind();
        }

        protected void tabela_16()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 16, Date1.Date, Date2.Date, 500, tenPlik);
            Session["tabelka016"] = tabelka01;
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia HTML 16");
            tworztabelkeHTML3("K2", 10, 16, tabelka01);
        }
        protected void tabela_17()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 17");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 17, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka017"] = tabelka01;
            gwTabela16.DataSource = null;
            gwTabela16.DataSourceID = null;
            gwTabela16.DataSource = tabelka01;
            gwTabela16.DataBind();
        }
        protected void tabela_18()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 18");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 18, Date1.Date, Date2.Date, 23, tenPlik);
            Session["tabelka018"] = tabelka01;
            gwTabela17.DataSource = null;
            gwTabela17.DataSourceID = null;
            gwTabela17.DataSource = tabelka01;
            gwTabela17.DataBind();
        }



        protected void tworztabelkeHTML3(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                cm.log.Info(tenPlik + ": Brak danych do tworzenia tabeli 16");
                return;
            }

            Label tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<br/><table style='width: 1150px;'>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.AppendLine("<td class='borderAll center col_100' colspan='9' ><br/> SSR " + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString() + " - wyznaczenie pierszej rozprawy (od daty wpływu do dnia, w którym odbyła się pierwsza rozprawa) w okresie od " + Date1.Date.ToLongDateString() + " do " + Date2.Date.ToLongDateString());
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine("<td class='borderAll center col_100'>Repertorium</td>");
                builder.AppendLine("<td class='borderAll center col_100'>do 1 miesiąca</td>");
                builder.AppendLine("<td class='borderAll center col_100'>pow. 1 do 2 miesięcy</td>");
                builder.AppendLine("<td class='borderAll center col_100'>pow. 2 do 3 miesięcy</td>");
                builder.AppendLine("<td class='borderAll center col_100'>pow.3 do 4 miesięcy</td>");
                builder.AppendLine("<td class='borderAll center col_100'>pow. 4 do 6 miesięcy	</td>");
                builder.AppendLine("<td class='borderAll center col_100'>pow.6 do 12 miesięcy </td>");
                builder.AppendLine("<td class='borderAll center col_100 '>ponad 12 miesięcy</td>");
                builder.AppendLine("<td class='borderAll center col_100'>RAZEM</td>");
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center col_100"));
                int index = 1;
                int ilKolumn = 8;
                int bierzący = 0;
                try
                {
                    for (int i = index; i < ilKolumn + index; i++)
                    {
                        string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                        builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                        bierzący = i;
                    }
                    builder.AppendLine("</tr>");
                    builder.AppendLine("<tr>");

                    builder.Append(tb.komorkaHTML("NS", 0, 0, "borderAll center col_100"));
                    index = bierzący + 1;
                    for (int i = index; i < ilKolumn + index; i++)
                    {
                        string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                        builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                        bierzący = i;
                    }
                    builder.AppendLine("</tr>");
                    builder.AppendLine("<tr>");
                    builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center col_100"));
                    index = bierzący + 1;

                    for (int i = index; i < ilKolumn + index; i++)
                    {
                        string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                        builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                        bierzący = i;
                    }
                    builder.AppendLine("</tr>");
                    builder.AppendLine("<tr>");
                    builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center col_100"));
                    index = bierzący + 1;

                    for (int i = index; i < ilKolumn + index; i++)
                    {
                        string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                        builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                        bierzący = i;
                    }
                    builder.AppendLine("</tr>");
                    builder.AppendLine("<tr>");
                    builder.Append(tb.komorkaHTML("RAZEM", 0, 0, "borderAll center col_100"));
                    index = bierzący + 1;

                    for (int i = index; i < ilKolumn + index; i++)
                    {
                        string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                        builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                    }
                    builder.AppendLine("</tr>");
                    licznik++;
                }
                catch (Exception ex)
                {
                    cm.log.Error("tworztabelkeHTML3: " + ex.Message);
                } // end of try
            }
            builder.Append("</table>");
            cm.log.Info(tenPlik + ": Koniec tworzenia tabeli 16");
            tblControl.Text = builder.ToString();
            tablePlaceHolder.Controls.Add(tblControl);
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");

                DataTable dT = tb.naglowek(path, 2);
                tb.makeHeader(dT, gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 5);
                // tb.makeHeader(sn, dT, gwTabela5);
            }
        }

        protected void naglowekTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 6);
                //  tb.makeHeader( dT, gwTabela6);
            }
        }

        protected void naglowekTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 7);
                tb.makeHeader(dT, gwTabela7);
            }
        }

        protected void naglowekTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 8);
                tb.makeHeader(dT, gwTabela8);
            }
        }

        protected void naglowekTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                //      DataTable dT = tb.naglowek(path, 10);
                //      tb.makeHeader(sn, dT, gwTabela10);
            }
        }

        protected void naglowekTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 11);
                tb.makeHeader(dT, gwTabela11);
            }
        }

        protected void naglowekTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 12);
                tb.makeHeader(dT, gwTabela12);
            }
        }


        protected void naglowekTabeli_gwTabela16(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 8);
                tb.makeHeader(dT, gwTabela16);
            }
        }
        protected void naglowekTabeli_gwTabela17(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = tb.naglowek(path, 8);
                tb.makeHeader(dT, gwTabela17);
            }

        }

        protected void stopkaTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 14");
                DataTable table = (DataTable)Session["tabelka014"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 13
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 13");
                DataTable table = (DataTable)Session["tabelka013"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 12");
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 11");
                DataTable table = (DataTable)Session["tabelka011"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 10");
                DataTable table = (DataTable)Session["tabelka010"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 8");
                DataTable table = (DataTable)Session["tabelka008"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 7");
                tb.makeSumRow((DataTable)Session["tabelka007"], e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 6");
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 5");
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 4");
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 3");
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 2");
                tb.makeSumRow((DataTable)Session["tabelka002"], e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 1");
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        {
                        }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void pisztb(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch { }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        private DataTable makeheader02()
        {
            #region tabela  2 ()

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));

            dT_01.Clear();

            for (int i = 1; i < 11; i++)
            {
                dT_01.Rows.Add(new Object[] { i.ToString(), "zaw", "1", "1", "h", "60" });//
            }
            dT_01.Rows.Add(new Object[] { "1-14 dni", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "15-30 dni", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "pow. 1 do 3 mies.", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "ponad 3 mies.", "", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "w tym nieusprawiedliwione", "zaw", "1", "1", "h", "60" });//

            dT_01.Rows.Add(new Object[] { "3", "Razem", "2", "1", "h" });//
            dT_01.Rows.Add(new Object[] { "3", "w terminie ustawowym", "2", "1", "h" });//
            dT_01.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "1", "8", "h", "120" });//

            dT_01.Rows.Add(new Object[] { "4", "L.p.", "1", "3", "h", "10" });//
            dT_01.Rows.Add(new Object[] { "4", "Sędzia", "1", "3", "h", "130" });
            dT_01.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "9", "1", "h", "60" });//

            return dT_01;

            #endregion tabela  2 ()
        }

        private DataTable header_15()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Clear();
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Sędziowie ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "do 1 miesiąca", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pow. 1 do 2 miesięcy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pow. 2 do 3 miesięcy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pow.3 do 4 miesięcy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pow. 4 do 6 miesięcy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pow.6 do 12 miesięcy ", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 12 miesięcy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "RAZEM", "1", "1" });

            return tabelaNaglowkowa;
        }

        protected void makeHeader()
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

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

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));
            dT_05.Columns.Add("Column6", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Pow. 1 do 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ponad 3 mies.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "W terminie ustawowym", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", " Po upływie terminu ustawowego (czyli 14dni +)", "8", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Sędzia", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Okres", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Liczba sporządzonych uzasadnień", "10", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Uzasadniania po terminie  z podaniem  liczby przedłużeń  przez Prezesa ( ile przedłużeń w danej sprawie)", "1", "3" });
            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "RC", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNc", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RCo", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h", "120" });//;

            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "", "2", "1", "h", "120" });//;

            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "22", "1", "h", "45" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });

            dT_03.Rows.Add(new Object[] { "2", "Rozpraw", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Posiedzeń", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na roz-prawach", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na posie-dzeniach", "1", "2", "h" });

            //RC		RNs		Nsm		Rco		Nmo		RCps		Nkd

            dT_03.Rows.Add(new Object[] { "2", "Rc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Rco", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RCps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na początek okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesieczny wpływ ( w faktycznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Efektywny czas pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Ilość sesji", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość wyznaczonych spraw", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw odrocznych z rozpraw (bez publikacji!!!)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wskaźnik odroczeń", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Razem", "2", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Średnio miesięcznie załatwienia w efektywnym czasie pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na koniec okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wielkrotna", "1", "3", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();
            //Alk	Op	Opm	Nw

            dT_04.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            dT_04.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            Session["header_04"] = dT_04;

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Wp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Wp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Efektywny okres oczekiwania", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wyznaczonych ", "3", "1", "H" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość przewr ", "2", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Załatwienia ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie K", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Stan referatów ", "8", "1", "H" });

            Session["header_05"] = dT_05;

            #endregion tabela  5 ()
        }

        protected void naglowekTabeli_gwTabela15(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_15(), gwTabela15);
            }
        }

        protected void stopkaTabeli_gwTabela15(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 15");
                DataTable table = (DataTable)Session["tabelka015"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela16(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 15");
                DataTable table = (DataTable)Session["tabelka017"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela17(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia stopki tabeli 15");
                DataTable table = (DataTable)Session["tabelka018"];
                tb.makeSumRow(table, e, 0);
            }
        }

       
    }
}