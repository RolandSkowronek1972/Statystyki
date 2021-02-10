/*
Last Update:
    - version 1.191210
Creation date: 2019-12-16

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace Statystyki_2018
{
    public partial class mp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "mp.aspx";
        private const string tenPlikNazwa = "mp";
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
                odswiez();
                debug();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": błąd: " + ex.Message);
            }
        }// end of Page_Load

        protected void TimerTick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }

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
            tabela(1, ASPxGridView1);
            tabela(2, ASPxGridView2);
            tabela(3, ASPxGridView3);
            tabela(4, ASPxGridView4);
            tabela(5, ASPxGridView5);
            tabela(6, ASPxGridView6);

            LabelNazwaSadu.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
            Label1.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 1, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            Label2.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 2, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            Label3.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 3, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            Label4.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 4, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            Label5.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 5, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
            Label6.Text = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 6, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
        }

        protected void tabela(int nrTabeli, ASPxGridView kontrolka)
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli " + nrTabeli.ToString());
            }
            int iloscKolumn = dr.iloscKolumn(nrTabeli, int.Parse(idDzialu), tenPlik);

            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), nrTabeli, Date1.Date, Date2.Date, iloscKolumn, tenPlik)));
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + ": brak danych do tabeli " + nrTabeli.ToString());
                kontrolka.Visible = false;
                return;
            }
         
            kontrolka.Visible = true;
            DataTable naglowki = dr.generuj_naglowki_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), nrTabeli, Date1.Date, Date2.Date, iloscKolumn, tenPlik);
            string numer = "tabelka" + nrTabeli.ToString("D3");
            string numernaglowka = "naglowek" + nrTabeli.ToString("D3");
            Session[numer] = tabelka01;
            string kolumny = numer + "kolumny";
            Session[kolumny] = iloscKolumn;
            Session[numernaglowka] = naglowki;
            kontrolka.DataSource = null;
            kontrolka.DataSourceID = null;
            kontrolka.AutoGenerateColumns = true;
            kontrolka.DataSource = tabelka01;
            kontrolka.DataBind();
            kontrolka.Columns.Clear();

            kontrolka.KeyFieldName = "id_sedziego";
            int szerokoscKolumny = 80;
            kontrolka.Width = Panel1.Width;

            kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", nrTabeli.ToString(), "", true, 36));
            kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", nrTabeli.ToString(), "", true, 250));

            for (int i = 1; i < iloscKolumn + 1; i++)
            {
                kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstNaglowka(naglowki, i), "d_" + i.ToString("D2"), nrTabeli.ToString(), "", false, szerokoscKolumny));
            }

            kontrolka.TotalSummary.Clear();
            kontrolka.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < iloscKolumn +2; i++)
            {
                try
                {
                    kontrolka.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
                }
                catch

                {
                }
            }
        }

        private string tekstNaglowka(DataTable tabela, int kolumna)
        {
            //wyciągnij nagłowki
            string result = string.Empty;
            try
            {
                foreach (DataRow item in tabela.Rows)
                {
                    string kol = item[0].ToString();
                    if (kol == kolumna.ToString())
                    {
                        result = item[1].ToString();
                        continue;
                    }
                }
                if (result == "")
                {
                    result = "-";
                }
            }
            catch
            {
            }

            return result;
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void ASPxGridView3_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void ASPxGridView4_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void ASPxGridView6_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void ASPxGridView5_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }

        protected void makeExcel(object sender, EventArgs e)
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
                try
                {
                    DataTable tabela = (DataTable)Session["tabelka001"];
                    DataTable naglowek = (DataTable)Session["naglowek001"];
                    int IloscKomn = (int)Session["tabelka001kolumny"];
                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, IloscKomn+1, 0, 3, true, true, false, false, false, false, true,true);
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 1, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
                   
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[1], naglowek, naglowek.Rows.Count + 1, 2, 2, text1 );
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 1 " + ex.Message);
                }
                try
                {
                    int IloscKomn = (int)Session["tabelka002kolumny"];
                    DataTable tabela = (DataTable)Session["tabelka002"];
                    DataTable naglowek = (DataTable)Session["naglowek002"];
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 2, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();

                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], tabela, IloscKomn + 1, 0, 3, true, true, false, false, false, false, true,true);
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[2], naglowek, naglowek.Rows.Count + 1, 2, 2, text1);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 2 " + ex.Message);
                }
                try
                {
                    int IloscKomn = (int)Session["tabelka003kolumny"];
                    DataTable tabela = (DataTable)Session["tabelka003"];
                    DataTable naglowek = (DataTable)Session["naglowek003"];
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 3, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
                    int iloscWierszy = naglowek == null ? 0 : naglowek.Rows.Count + 1;
                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], tabela, IloscKomn + 1, 0, 3, true, true, false, false, false, false, true,true);
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[3], naglowek, iloscWierszy, 2, 2, text1);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 3 " + ex.Message);
                }
                try
                {
                    int IloscKomn = (int)Session["tabelka004kolumny"];
                    DataTable tabela = (DataTable)Session["tabelka004"];
                    DataTable naglowek = (DataTable)Session["naglowek004"];
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 4, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
                    int iloscWierszy = naglowek == null ? 0 : naglowek.Rows.Count + 1;

                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], tabela, IloscKomn + 1, 0, 3, true, true, false, false, false, false, true,true);
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[4], naglowek, iloscWierszy, 2, 2, text1);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 4 " + ex.Message);
                }
                try
                {
                    int IloscKomn = (int)Session["tabelka005kolumny"];
                    DataTable tabela = (DataTable)Session["tabelka005"];
                    DataTable naglowek = (DataTable)Session["naglowek005"];
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 5, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();
                    int iloscWierszy = naglowek == null ? 0 : naglowek.Rows.Count + 1;

                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], tabela, IloscKomn + 1, 0, 3, true, true, false, false, false, false, true,true);
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[5], naglowek, iloscWierszy, 2, 2, text1);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 5 " + ex.Message);
                }

                try
                {
                    int IloscKomn = (int)Session["tabelka006kolumny"];
                    DataTable tabela = (DataTable)Session["tabelka006"];
                    DataTable naglowek = (DataTable)Session["naglowek006"];
                    int iloscWierszy = naglowek == null ? 0 : naglowek.Rows.Count + 1;
                    string text1 = dr.generuj_naglowki_nad_tabela(int.Parse((string)(Session["id_dzialu"])), 6, tenPlik) + " za okres od " + Date1.Date.ToShortDateString() + " do " + Date2.Date.ToShortDateString();

                    MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], tabela, IloscKomn + 1, 0, 3, true, true, false, false, false, false, true,true);
                    MyWorksheet1 = tb.tworznaglowki(MyExcel.Workbook.Worksheets[6], naglowek, iloscWierszy, 2, 2, text1);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " tworzenie arkusza do tabeli 6 " + ex.Message);
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
    }
}