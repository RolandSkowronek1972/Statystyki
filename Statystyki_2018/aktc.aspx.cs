﻿using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class aktc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public tabele tb = new tabele();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();

        private const string fileId = "aktc";
        private const string tenPlik = "aktc.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            String IdentyfikatorUzytkownika = string.Empty;
            IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


            if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
            {
                Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
            }
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

            Session["data_1"] = Date1.Date.Year.ToString() + "-" + Date1.Date.Month.ToString("D2") + "-" + Date1.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_1"]);
            Session["data_2"] = Date2.Date.Year.ToString() + "-" + Date2.Date.Month.ToString("D2") + "-" + Date2.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_"]);

            try
            {
                string user = (string)Session["userIdNum"];
                string dzial = (string)Session["id_dzialu"];
                bool dost = cm.dostep(dzial, user);
                if (!dost)
                {
                    Server.Transfer("default.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        odswiez();
                    }
                }
            }
            catch
            {
            }
        }// end of Page_Load

        protected void odswiez()
        {
            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                id_dzialu.Text = (string)Session["txt_dzialu"];
                DataTable Tabela1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 30, tenPlik);
                DataTable Tabela2 = cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, idDzialu, 2, 12, 17, tenPlik);
                Session["tabelka001"] = Tabela1;
                Session["tabelka002"] = Tabela2;
                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                string path = Server.MapPath("XMLHeaders") + "\\" + "aktc.xml";
                StringBuilder Tabele = new StringBuilder();
                Tabele.Append(xMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), "1", Tabela1, false, false, false, true, cm.tekstNadTabelą("Statystyka miesięczna Wydział Cywilny Tabela 1 ", Date1.Date, Date2.Date), tenPlik));

                tablePlaceHolder01.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id1" });
                StringBuilder Tabele2 = new StringBuilder();

                Tabele2.Append(xMLHeaders.TabelaWierszyXML(path, int.Parse(idDzialu), "2", Tabela2, false, false, false, true, cm.tekstNadTabelą("Statystyka miesięczna Wydział Cywilny Tabela 2 ", Date1.Date, Date2.Date), tenPlik));
                tablePlaceHolder02.Controls.Add(new Label { Text = Tabele2.ToString(), ID = "id2" });
            }
            catch (Exception ex)
            {
                string exx = ex.Message;
                cm.log.Error(tenPlik + " :Generowanie tabeli danych:  " + ex.Message + " " + tenPlik);
            }

            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            id_dzialu.Text = (string)Session["txt_dzialu"];
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
            LbDataRaportu.Text = DateTime.Now.ToLongDateString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin

            string path = Server.MapPath("Template") + "\\aktc.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\aktc";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 20, 0, 4, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 11, 9, 2, 2, false);
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

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }
    }
}