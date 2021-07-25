using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Statystyki_2018
{
    public partial class mss1r : System.Web.UI.Page
    {
        public static string tenPlik = "mss1r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
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
                    rysuj(ms.PustaTabelaDanychMSS());
                }
                catch

                {
                    Session["ustawDate1r"] = null;
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate1r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate1r"] = "X";
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
        
            makeLabels();
        }// end of Page_Load

        protected void rysuj(DataTable tabelaDanych)
        {
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
               
                // tablePlaceHolder01 = new PlaceHolder();
                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                tablePlaceHolder03.Controls.Clear();
                tablePlaceHolder04.Controls.Clear();
                tablePlaceHolder05.Controls.Clear();
                tablePlaceHolder06.Controls.Clear();
                tablePlaceHolder07.Controls.Clear();
                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();
                tablePlaceHolder04.Dispose();
                tablePlaceHolder05.Dispose();
                tablePlaceHolder06.Dispose();
                tablePlaceHolder07.Dispose();
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS1r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1", "1.2" };
                string[] numeryTabel01 = new string[] { "1.1.b", "1.1.c", "1.1.d", "1.1.e" };
                string[] numeryTabel02 = new string[] { "1.1.h", "1.1.i", "1.1.j", "1.1.k", "1.1.k.a" };
                string[] numeryTabel03 = new string[] { "1.1.2.a", "1.1.2.b", "1.2.1", "1.2.2", "1.3.a", "1.3.b","1.3.1", "1.4.1", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3", "4.1", "4.2", "5", "5.1", "5.1.a", "5.2", "6" };
                string[] numeryTabel05 = new string[] { "7.3" };
                string[] numeryTabel06 = new string[] { "9" };
                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder04, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel05, tablePlaceHolder06, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel06, tablePlaceHolder07, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void odswiez()
        {
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 30);
                rysuj(tabelaDanych);
              
         
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
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
                Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);

                id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    tabela4Label.Text = "<b>Dział 7.1.</b> Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela5Label.Text = "<b>Dział 7.2.</b> Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela7Label.Text = "<b>Dział 8.2</b> Terminowość sporządzania tłumaczeń pisemnych za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela8Label.Text = "<b>Dział 8.3</b> Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela4Label.Text = "<b>Dział 7.1.</b> Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych) za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela5Label.Text = "<b>Dział 7.2.</b> Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych) za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela7Label.Text = "<b>Dział 8.2</b> Terminowość sporządzania tłumaczeń pisemnych za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela8Label.Text = "<b>Dział 8.3</b> Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo za okres od  " + Date1.Text + " do " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                DataRow dr = foundRows[0];
                result = dr[4].ToString();
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            { }
            return result;
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv
            try
            {
                string idSadu = idSad.Text.Trim();
                string idWydzialu = (string)Session["id_dzialu"];
                try
                {
                    int idWydzialN = int.Parse(idWydzialu);
                    idWydzialu = idWydzialN.ToString("D2");
                }
                catch (Exception)
                {
                    idWydzialu = string.Empty;
                }
                if (!string.IsNullOrEmpty(idWydzialu))
                {
                    DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21); //dane
                    var distinctRows = (from DataRow dRow in tabelaDanych.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
                    DataTable listaTabelek = new DataTable();
                    listaTabelek.Columns.Add("tabela", typeof(string));
                    DataRow rowik = listaTabelek.NewRow();

                    foreach (var tabela in distinctRows)
                    {
                        rowik = listaTabelek.NewRow();
                        rowik[0] = tabela.ToString().Trim();
                        listaTabelek.Rows.Add(rowik);
                    }
                    var output = new StringBuilder();
                    //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

                    output = ms.raportTXT(listaTabelek, tabelaDanych, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    //  Response.WriteFile(idRaportu + ".csv");
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception)
            {
            }
        }
    }
}