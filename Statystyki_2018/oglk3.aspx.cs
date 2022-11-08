/*
Last Update:
    - version 1.210228
Creation date: 2018-12-11

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oglk3 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "oglk3.aspx";
        private const string tenPlikNazwa = "oglk3";
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
                LabelNazwaSadu.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));

                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel6.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel7.Visible = cl.debug(int.Parse(idDzialu));

                infoLabel8.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel9.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel10.Visible = cl.debug(int.Parse(idDzialu));
                //infoLabel11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel13.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel14.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel15.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel1.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;

                infoLabel6.Visible = false;
                infoLabel8.Visible = false;
                infoLabel7.Visible = false;
                infoLabel9.Visible = false;
                infoLabel10.Visible = false;
                //infoLabel11.Visible = false;
                infoLabel12.Visible = false;
                infoLabel13.Visible = false;
                infoLabel14.Visible = false;
                infoLabel15.Visible = false;
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
            makeHeader();
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 13, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 13, 0, 5, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 14, 0, 4, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 5, 0, 3, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 5, 0, 3, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 7, 0, 3, false, true, false, false, false);

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka008"], 4, 2, 1, 3, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka009"], 1, 11, 0, 6, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka010"], 1, 11, 0, 6, false);

                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka011"], 5, 4, 1, 4, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka012"], 8, 0, 4, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[13], (DataTable)Session["tabelka013"], 6, 0, 4, false, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[14], (DataTable)Session["tabelka014"], 7, 0, 4, false, true, false, false, false);
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
            Session["tabelka001"] = dr.tworzTabele(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 35, gwTabela1, tenPlik);
            gwTabela1.DataBind();
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            Session["tabelka002"] = dr.tworzTabele(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 35, gwTabela2, tenPlik);
            gwTabela2.DataBind();
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            Session["tabelka003"] = dr.tworzTabele(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 35, gwTabela3, tenPlik);
            gwTabela3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            Session["tabelka004"] = dr.tworzTabele(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 35, gwTabela4, tenPlik);
            gwTabela4.DataBind();
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            Session["tabelka005"] = dr.tworzTabele(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 35, gwTabela5, tenPlik);
            gwTabela5.DataBind();
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            Session["tabelka006"] = dr.tworzTabele(int.Parse(idDzialu), 6, Date1.Date, Date2.Date, 23, gwTabela6, tenPlik);
            gwTabela6.DataBind();
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            Session["tabelka007"] = dr.tworzTabele(int.Parse(idDzialu), 7, Date1.Date, Date2.Date, 23, gwTabela7, tenPlik);
            gwTabela7.DataBind();
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 8, 4, 2, false, tenPlik);
            Session["tabelka008"] = tabelka01;
            pisztb("tab_8_", 4, 2, tabelka01);
        }

        protected void tabela_9()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 9, 1, 12, false, tenPlik);
            Session["tabelka009"] = tabelka01;
            pisz("tab_9_", 1, 12, tabelka01);
        }

        protected void tabela_10()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu, 10, 1, 11, false, tenPlik);
            Session["tabelka010"] = tabelka01;
            pisz("tab_10_", 1, 11, tabelka01);
        }

        protected void tabela_11()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu, 11, 4, 4, false, tenPlik);
            Session["tabelka011"] = tabelka01;
            pisz("tab_12_", 4, 4, tabelka01);
        }

        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            Session["tabelka012"] = dr.tworzTabele(int.Parse(idDzialu), 12, Date1.Date, Date2.Date, 23, gwTabela13, tenPlik);
            gwTabela13.DataBind();
        }

        protected void tabela_13()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            Session["tabelka013"] = dr.tworzTabele(int.Parse(idDzialu), 13, Date1.Date, Date2.Date, 23, gwTabela14, tenPlik);
            gwTabela4.DataBind();
        }

        protected void tabela_14()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 14");
            }
            Session["tabelka014"] = dr.tworzTabele(int.Parse(idDzialu), 14, Date1.Date, Date2.Date, 23, gwTabela15, tenPlik);
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_01(), gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_01(), gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_04(), gwTabela4);
            }
        }

        protected void naglowekTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_05(), gwTabela5);
            }
        }

        protected void naglowekTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_05(), gwTabela6);
            }
        }

        protected void naglowekTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_07(), gwTabela7);
            }
        }

        protected void naglowekTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_10(), gwTabela13);
            }
        }

        protected void naglowekTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_11(), gwTabela14);
            }
        }

        protected void naglowekTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_12(), gwTabela15);
            }
        }

        protected void naglowekTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_12(), gwTabela13);
            }
        }

        protected void naglowekTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_13(), gwTabela14);
            }
        }

        protected void naglowekTabeli_gwTabela15(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_14(), gwTabela15);
            }
        }

        protected void stopkaTabeli_gwTabela15(object sender, GridViewRowEventArgs e)
        {
          
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka014"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
         
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka013"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
          
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka011"];
                tb.makeSumRow(table, e, 0);
            }
        }

       
        protected void stopkaTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka008"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka007"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
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
                    }
                }
            }
        }// end of pisz

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

            //  makeHeader6(sn, dT_05);

            #endregion tabela  5 ()
        }

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Clear();
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Pow. 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W tym nieusprawiedliwione", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W terminie ustawowym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", " Po upływie terminu ustawowego (czyli 14dni +)", "8", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Sędzia", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Okres", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba sporządzonych uzasadnień", "10", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Uzasadniania po terminie  z podaniem  liczby przedłużeń  przez Prezesa ( ile przedłużeń w danej sprawie)", "1", "3" });

            return tabelaNaglowkowa;
        }

        private DataTable header_04()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Rozpraw", "1", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "posiedzeń", "1", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "razem", "1", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "K", "1", "1", "h", "60" });//

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h", "60" });//
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h", "60" });//
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h", "60" });//
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W", "1", "1", "h", "60" });//

            //  tabelaNaglowkowa.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Nazwisko i imię Sędziego", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Efektywny okres orzekania", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ilość sesji", "3", "1", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Załatwienia", "5", "1", "h", "120" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Średnio miesięcznie", "1", "2", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Średnio miesięcznie K", "1", "2", "h", "60" });

            return tabelaNaglowkowa;
        }

        private DataTable header_04x()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_05()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ilość spraw wyznaczonych", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ilość spraw odroczonych", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ilość spraw przerwanych", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_05v()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_06()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_07()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
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

        private DataTable header_13()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono ", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "skierowano do wykonania ", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "inny sposób", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Załatwienia", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pozostało", "1", "2" });

            return tabelaNaglowkowa;
        }

        private DataTable header_14()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "utrzymano  w mocy ", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono ", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "zmieniono", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "częściowo uchylono", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pozostawiono bez rozpoznania ", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Rodzaje orzeczeń ", "5", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            return tabelaNaglowkowa;
        }

        protected void gwTabela2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gwTabela7_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gwTabela15_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}