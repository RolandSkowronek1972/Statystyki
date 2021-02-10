using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss5o : System.Web.UI.Page
    {
        public static string tenPlik = "mss5o.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();
        private DateTime dataPoczatkuOkresu = DateTime.Parse("1900-01-01");
        private DateTime dataKoncaOkresu = DateTime.Parse("1900-01-01");

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (Session["ustawDate15o"] == null)
            {
                Session["ustawDate5o"] = null;
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate15o"] = "X";
            }
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            odswiez();
            makeLabels();
        }// end of Page_Load

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            if (dane == null)
            {
                cm.log.Error("MSSo brak danych do wyświetlenia");
            }
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                   
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        //string wartosc= dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void odswiez()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;

            try

            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli
                try
                {
                    string path = Server.MapPath("XMLHeaders") + "\\" + "MSS5o.xml";
                    Label tblControl = new Label { ID = "kod01" };
                    tblControl.Width = 1150;
                    Label tblControl2 = new Label { ID = "kod02" };
                    tblControl2.Width = 1150;
                    Label tblControl3 = new Label { ID = "kod03" };
                    tblControl3.Width = 1150;
                    StringBuilder tabelaGlowna = new StringBuilder();
                    tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1", tabelaDanych, tenPlik));
                    tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.a", tabelaDanych, tenPlik, false));
                    tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.b", tabelaDanych, tenPlik));
                    tblControl.Text = tabelaGlowna.ToString();
                    tablePlaceHolder.Controls.Clear();
                    tablePlaceHolder.Controls.Add(tblControl);

                    tabelaGlowna.Clear();
                    tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "15.3", tabelaDanych, tenPlik));
                    tblControl2.Text = tabelaGlowna.ToString();
                    tablePlaceHolder2.Controls.Clear();
                    tablePlaceHolder2.Controls.Add(tblControl2);
                    tabelaGlowna.Clear();

                    

                    tablePlaceHolder6.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.1.a", tabelaDanych, tenPlik), Width = 1150, ID = "extraCode01" });

                    TablePlaceHolder7.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "13.1", tabelaDanych, tenPlik), Width = 1150, ID = "extraCode1" });

                    TablePlaceHolder8.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "13.2", tabelaDanych, tenPlik), Width = 1150, ID = "extraCode2" });
                    TablePlaceHolder9.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "14.2", tabelaDanych, tenPlik) + ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "15.1", tabelaDanych, tenPlik), Width = 1150, ID = "extraCode3" });
                }
                catch (Exception ex)

                {
                    cm.log.Error("MSS5o bład w wyświetlaniu tabel generowanych dynamicznie " + ex.Message);
                }

                #region "1.1.1";

                pisz("tab_111_", 36, 9, tabelaDanych, "'1.1.1'", idWydzialu);

                #endregion "1.1.1";

                #region "1.1.2";

                pisz("tab_112_", 29, 9, tabelaDanych, "'1.1.2'", idWydzialu);

                #endregion "1.1.2";

                #region "1.1.2.c";

                pisz("tab_112c_", 4, 8, tabelaDanych, "'1.1.2.c'", idWydzialu);

                #endregion "1.1.2.c";

                #region "1.1.2.d";

                pisz("tab_112d_", 2, 6, tabelaDanych, "'1.1.2.d'", idWydzialu);

                #endregion "1.1.2.d";

                #region "1.1.2.d.a";

                pisz("tab_112da_", 2, 1, tabelaDanych, "'1.1.2.d.a'", idWydzialu);

                #endregion "1.1.2.d.a";

                #region "1.1.2.e";

                pisz("tab_112e_", 5, 5, tabelaDanych, "'1.1.2.e'", idWydzialu);

                #endregion "1.1.2.e";

                #region "1.1.2.e.a";

                pisz("tab_112ea_", 6, 1, tabelaDanych, "'1.1.2.e.a'", idWydzialu);

                #endregion "1.1.2.e.a";

                #region "1.1.2.f";

                pisz("tab_112f_", 1, 1, tabelaDanych, "'1.1.2.f'", idWydzialu);

                #endregion "1.1.2.f";

                #region "1.1.2.g";

                pisz("tab_112g_", 8, 1, tabelaDanych, "'1.1.2.g'", idWydzialu);

                #endregion "1.1.2.g";

                #region "1.1.2.h";

                pisz("tab_112h_", 5, 1, tabelaDanych, "'1.1.2.h'", idWydzialu);

                #endregion "1.1.2.h";

                #region "1.1.3.a";

                pisz("tab_113a_", 6, 11, tabelaDanych, "'1.1.3.a'", idWydzialu);

                #endregion "1.1.3.a";

                #region "1.1.3.b";

                pisz("tab_113b_", 1, 1, tabelaDanych, "'1.1.3.b'", idWydzialu);

                #endregion "1.1.3.b";

                #region "1.1.2.i";

                pisz("tab_112i_", 1, 1, tabelaDanych, "'1.1.2.i'", idWydzialu);

                #endregion "1.1.2.i";

                #region "1.1.4";

                pisz("tab_114_", 5, 1, tabelaDanych, "'1.1.4'", idWydzialu);

                #endregion "1.1.4";

                #region "1.2.1";

                pisz("tab_121_", 3, 1, tabelaDanych, "'1.2.1'", idWydzialu);

                #endregion "1.2.1";

                #region "1.2.2";

                pisz("tab_122_", 1, 8, tabelaDanych, "'1.2.2'", idWydzialu);

                #endregion "1.2.2";

                #region "1.3.1";

                pisz("tab_131_", 17, 40, tabelaDanych, "'1.3.1'", idWydzialu);

                #endregion "1.3.1";

                #region "1.3.2";

                pisz("tab_132_", 45, 50, tabelaDanych, "'1.3.2'", idWydzialu);

                #endregion "1.3.2";

                #region "1.4";

                pisz("tab_14_", 19, 14, tabelaDanych, "'1.4'", idWydzialu);

                #endregion "1.4";

                #region "2.1.1";

                pisz("tab_211_", 17, 11, tabelaDanych, "'2.1.1'", idWydzialu);

                #endregion "2.1.1";

                #region "2.1.1.a";

                pisz("tab_211a_", 17, 11, tabelaDanych, "'2.1.1.a'", idWydzialu);

                #endregion "2.1.1.a";

                #region "2.1.2";

                pisz("tab_212_", 17, 11, tabelaDanych, "'2.1.2'", idWydzialu);

                #endregion "2.1.2";

                #region "2.2";

                pisz("tab_22_", 31, 9, tabelaDanych, "'2.2'", idWydzialu);

                #endregion "2.2";

                #region "2.2.a";

                pisz("tab_22a_", 31, 9, tabelaDanych, "'2.2.a'", idWydzialu);

                #endregion "2.2.a";

                #region "2.3";

                pisz("tab_23_", 8, 8, tabelaDanych, "'2.3'", idWydzialu);

                #endregion "2.3";

                #region "3.1.a";

                pisz("tab_31a_", 3, 6, tabelaDanych, "'3.1.a'", idWydzialu);

                #endregion "3.1.a";

                #region "3.1.b";

                pisz("tab_31b_", 5, 6, tabelaDanych, "'3.1.b'", idWydzialu);

                #endregion "3.1.b";

                #region "3.2";

                pisz("tab_32_", 7, 6, tabelaDanych, "'3.2'", idWydzialu);

                #endregion "3.2";

                #region "4";

                pisz("tab_4_", 7, 1, tabelaDanych, "'4'", idWydzialu);

                #endregion "4";

                #region "5";

                pisz("tab_5_", 14, 4, tabelaDanych, "'5'", idWydzialu);

                #endregion "5";

                #region "6.1";

                pisz("tab_61_", 4, 1, tabelaDanych, "'6.1'", idWydzialu);

                #endregion "6.1";

                #region "6.2.1";

                pisz("tab_621_", 2, 1, tabelaDanych, "'6.2.1'", idWydzialu);

                #endregion "6.2.1";

                #region "7";

                pisz("tab_7_", 6, 1, tabelaDanych, "'7'", idWydzialu);

                #endregion "7";

                #region "8";

                pisz("tab_8_", 28, 1, tabelaDanych, "'8'", idWydzialu);

                #endregion "8";

                #region "9.1.1.";

                pisz("tab_911_", 4, 5, tabelaDanych, "'9.1.1'", idWydzialu);

                #endregion "9.1.1.";

                #region "9.1.2";

                pisz("tab_912_", 28, 5, tabelaDanych, "'9.1.2'", idWydzialu);

                #endregion "9.1.2";

                #region "9.2";

                pisz("tab_92_", 28, 7, tabelaDanych, "'9.2'", idWydzialu);

                #endregion "9.2";

                #region "10.1";

                pisz("tab_101_", 19, 13, tabelaDanych, "'10.1'", idWydzialu);

                #endregion "10.1";

                #region "10.2";

                pisz("tab_102_", 1, 7, tabelaDanych, "'10.2'", idWydzialu);

                #endregion "10.2";

                #region "11";

                pisz("tab_11_", 12, 10, tabelaDanych, "'11'", idWydzialu);

                #endregion "11";

                #region "11.a";

                pisz("tab_11a_", 2, 4, tabelaDanych, "'11.a'", idWydzialu);

                #endregion "11.a";

                #region "12";

                pisz("tab_12_", 25, 1, tabelaDanych, "'12'", idWydzialu);

                #endregion "12";

                #region "13.1.a";

                pisz("tab_13_1_a_", 2, 2, tabelaDanych, "'13.1.a'", idWydzialu);

                #endregion "13.1.a";

                #region "13.1.b";

                pisz("tab_13_1_b_", 2, 2, tabelaDanych, "'13.1.b'", idWydzialu);

                #endregion "13.1.b";

                #region "13.1.c";

                pisz("tab_13_1_c_", 1, 1, tabelaDanych, "'13.1.c'", idWydzialu);

                #endregion "13.1.c";

                #region "14.1";

                pisz("tab_14_1_", 4, 38, tabelaDanych, "'14.1'", idWydzialu);

                #endregion "14.1";

                #region "15.1";

                pisz("tab_15_1_", 4, 4, tabelaDanych, "'15.1'", idWydzialu);

                #endregion "15.1";

                #region "15.2";

                pisz("tab_15_2_", 4, 13, tabelaDanych, "'15.2'", idWydzialu);

                #endregion "15.2";

                #region "15.3";

                pisz("tab_15_3_", 4, 13, tabelaDanych, "'15.3'", idWydzialu);

                #endregion "15.3";

                #region "16.1";

                pisz("tab_16_1_", 1, 1, tabelaDanych, "'16.1'", idWydzialu);

                #endregion "16.1";

                #region "16.2";

                pisz("tab_162_", 1, 13, tabelaDanych, "'16.2'", idWydzialu);

                #endregion "16.2";

                #region "16.3";

                pisz("tab_163_", 1, 13, tabelaDanych, "'16.3'", idWydzialu);

                #endregion "16.3";

                #region "17";

                pisz("tab_17_", 2, 1, tabelaDanych, "'17'", idWydzialu);

                #endregion "17";
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS5o bład w całej procedurze wyświetlania " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            Label11.Visible = false;
            try
            {
                Label11.Visible = cl.debug(int.Parse(idWydzialu));
            }
            catch
            { }

            Label11.Text = txt;
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

                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                //Label29.Text = DateTime.Now.ToLongDateString();
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
                    //       tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //     tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    //   tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    // tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    //       tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za okres od " + Date1.Text + " do  " + Date2.Text;
                    //     tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    //   tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;

                    // tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;
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
                    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
                    var distinctRows = (from DataRow dRow in tabela2.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
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

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);

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
            catch
            { }
        }
    }
}