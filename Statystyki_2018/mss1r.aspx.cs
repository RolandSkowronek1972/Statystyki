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
            string IdDzialu = (string)Session["id_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
             
                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                tablePlaceHolder03.Controls.Clear();
                tablePlaceHolder04.Controls.Clear();
                tablePlaceHolder05.Controls.Clear();
            
                tablePlaceHolder01.Dispose();
                tablePlaceHolder02.Dispose();
                tablePlaceHolder03.Dispose();
                tablePlaceHolder04.Dispose();
                tablePlaceHolder05.Dispose();
               
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS1r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1", "1.2" };
                string[] numeryTabel01 = new string[] { "1.1.b", "1.1.c", "1.1.d", "1.1.e" };
                string[] numeryTabel02 = new string[] { "1.1.h", "1.1.i", "1.1.j", "1.1.k", "1.1.k.a" };
                string[] numeryTabel03 = new string[] { "1.1.2.a", "1.1.2.b", "1.2.1", "1.2.2", "1.3.a", "1.3.b", "1.3.1", "1.4.1", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3", "4.1", "4.2", "5", "5.1", "5.1.a", "5.2", "6",  "7.1", "7.2", "7.3", "8.1", "8.2", "8.3", "9" };
             

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder04, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
              
                if (tabelaDanych.Rows.Count > 0)
                {
                    #region "tabel 1.1.a"

                    //wiersz 1
                    string idTabeli = "'1.1.a'";
                    string idWiersza = "'1'";
                    tab_11a_w01_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                    //wiersz 2
                    idWiersza = "'2'";
                    tab_11a_w02_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                    //wiersz 3
                    idWiersza = "'3'";
                    tab_11a_w03_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                    //wiersz 4
                    idWiersza = "'4'";
                    tab_11a_w04_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                    #endregion "tabel 1.1.a"

                    idTabeli = "'1.1.f'";
                    idWiersza = "'1'";
                    tab_11f_w01_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                    idTabeli = "'1.1.g'";
                    idWiersza = "'1'";
                    tab_11g_w01_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                    tab_11g_w01_c02.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");

                    idTabeli = "'1.1.1'";
                    idWiersza = "'1'";
                    tab_111_w01_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");
                    tab_111_w02_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='2' and idkolumny='1'");
                    tab_111_w03_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='3' and idkolumny='1'");
                    tab_111_w04_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='4' and idkolumny='1'");

                    tab_111_w05_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='5' and idkolumny='1'");
                    tab_111_w06_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='6' and idkolumny='1'");
                    tab_111_w07_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='7' and idkolumny='1'");
                    tab_111_w08_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='8' and idkolumny='1'");

                    tab_111_w09_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='9' and idkolumny='1'");
                    tab_111_w10_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='10' and idkolumny='1'");
                    tab_111_w11_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='11' and idkolumny='1'");
                    tab_111_w12_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='12' and idkolumny='1'");

                    tab_111_w13_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='13' and idkolumny='1'");
                    tab_111_w14_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='14' and idkolumny='1'");
                    tab_111_w15_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='15' and idkolumny='1'");
                    tab_111_w16_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='16' and idkolumny='1'");

                    tab_111_w17_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='17' and idkolumny='1'");
                    tab_111_w18_c01.Text = wyciagnijWartosc(tabelaDanych, "idWydzial=" + IdDzialu + " and idTabeli=" + idTabeli + " and idWiersza ='18' and idkolumny='1'");
                }
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
            string IdDzialu = (string)Session["id_dzialu"];
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
                Label11.Visible = cl.debug(int.Parse(IdDzialu));
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