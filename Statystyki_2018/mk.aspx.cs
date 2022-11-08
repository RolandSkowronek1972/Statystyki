using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mk : System.Web.UI.Page
    {
        public static string tenPlik = "mk.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();
        private tabele tb = new tabele();

        private DateTime dataPoczatkuOkresu = DateTime.Parse("1900-01-01");
        private DateTime dataKoncaOkresu = DateTime.Parse("1900-01-01");

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
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
            if (!IsPostBack)
            {
                cm.log.Info("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;

            DateTime dTime = DateTime.Now;
            dTime = dTime.AddMonths(-1);
            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            }

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            odswierz();
            makeLabels();
        }// end of Page_Load

        protected void odswierz()
        {
            tablePlaceHolder.Controls.Clear();
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss10e(idWydzialuNumerycznie, Date1.Date, Date2.Date, 60);
                Session["tabelka"] = tabelaDanych;
                //wypełnianie lebeli
                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();

                int iloscWierszy = dr.iloscWierszy(1, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 1=" + iloscWierszy.ToString());
                int iloscKolumn = dr.iloscKolumnMK(1, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc kolumn do tabelki 1=" + iloscKolumn.ToString());
                DataTable nagloweka = dr.generuj_naglowki_nad_tabelaMK(idWydzialuNumerycznie, 1, tenPlik);


                tabelaGlowna.AppendLine(ms.tworztabeleMK("", nagloweka, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 1, tenPlik), 1, false, tenPlik));

                iloscWierszy = dr.iloscWierszy(2, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 2=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumnMK(2, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc kolumn do tabelki 2=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", dr.generuj_naglowki_nad_tabelaMK(idWydzialuNumerycznie, 2, tenPlik), null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 2, tenPlik) , 2, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(3, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 3=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumnMK(3, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc kolumn do tabelki 3=" + iloscKolumn.ToString());
                tabelaGlowna.AppendLine(ms.tworztabeleMK("", dr.generuj_naglowki_nad_tabelaMK(idWydzialuNumerycznie, 3, tenPlik), null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 3, tenPlik), 3, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(4, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 4=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumnMK(4, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc kolumn do tabelki 4=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", dr.generuj_naglowki_nad_tabelaMK(idWydzialuNumerycznie, 4, tenPlik), null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 4, tenPlik), 4, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(5, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 5=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumnMK(5, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc kolumn do tabelki 5=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", dr.generuj_naglowki_nad_tabelaMK(idWydzialuNumerycznie, 5, tenPlik), null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 5, tenPlik), 5, true, tenPlik));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            catch (ThreadAbortException ex)
            {
                cm.log.Error("Mk: ThreadAbortException " + ex.Message);
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswierz();
        }

        protected void makeLabels()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                User_id = (string)Session["user_id"];
                domain = (string)Session["damain"];

                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label27.Text = id_dzialu.Text;
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();

                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch (Exception)
            {
            }
        }

        protected void excelZapisz(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\mk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\mk";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                //  ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];
                int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
                try
                {
                    for (int i = 1; i < 6; i++)
                    {
                        try
                        {
                            cm.log.Info(tenPlik + " excel  Start generowania arkusza excel nr: " + i.ToString());
                            DataTable dane = (DataTable)Session["tabelka"];
                            int iloscKolumn = dr.iloscKolumnMK(i, idWydzialuNumerycznie, tenPlik);
                            int iloscWierszy = dr.iloscWierszy(i, idWydzialuNumerycznie, tenPlik);
                            cm.log.Info(tenPlik + " excel  generowanie arkusza excel nr: " + i.ToString() + " ilosc kolumn: " + iloscKolumn.ToString() + " ilosc wierszy " + iloscWierszy.ToString());
                            tb.tworzArkuszwExcleBezSedziowMK(MyExcel.Workbook.Worksheets[i], dane, iloscWierszy + 1, iloscKolumn + 1, 0, 1, false, idWydzialuNumerycznie, i, tenPlik);
                        }
                        catch (ThreadAbortException ex)
                        {
                            cm.log.Error("Mk: ThreadAbortException " + ex.Message);
                        }
                    }
                }
                catch (ThreadAbortException ex)
                {
                    cm.log.Error("Mk: ThreadAbortException " + ex.Message);
                }

                cm.log.Info("Mk: koniec generowania tabel " );
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
    }
}