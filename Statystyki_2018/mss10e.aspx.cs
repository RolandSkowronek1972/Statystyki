using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss10e : System.Web.UI.Page
    {
        public static string tenPlik = "mss10e.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();
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
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            // odswierz();
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
                //wypełnianie lebeli

                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();

                tabelaGlowna.AppendLine(ms.tworztabeleMSS10e("5.1", naglowekTabeliDzialu_5_1(), tabelaBocznaDzialu_5_1(), tabelaDanych, 4, 2, 1, 15, idWydzialuNumerycznie, false, "Wnioski o udzielenie zezwolenia na odbycie przez skazanego kary pozbawienia wolności w systemie dozoru elektronicznego", 1, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS10e("5.2", naglowekTabeliDzialu_5_2(), tabelaBocznaDzialu_5_2(), tabelaDanych, 1, 2, 1, 6, idWydzialuNumerycznie, true, "Podmioty, które złożyły wnioski o udzielenie zezwolenia na odbycie przez skazanego kary pozbawienia wolności w systemie dozoru elektronicznego", 2, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS10e("5.3", naglowekTabeliDzialu_5_3(), tabelaBocznaDzialu_5_3(), tabelaDanych, 2, 2, 2, 3, idWydzialuNumerycznie, true, "Liczba osób odbywających karę pozbawienia wolności w systemie dozoru elektronicznego", 3, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS10e("5.4", naglowekTabeliDzialu_5_4(), tabelaBocznaDzialu_5_4(), tabelaDanych, 2, 1, 1, 4, idWydzialuNumerycznie, false, "Środek karny zakazu wstępu na imprezę masową z obowiązkiem przebywania skazanego w określonych miejscach stałego pobytu kontrolowany w sposób określony w przepisach o wykonywaniu kary pozbawienia wolności w systemie dozoru elektronicznego", 4, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS10e("5.5", naglowekTabeliDzialu_5_5(), tabelaBocznaDzialu_5_5(), tabelaDanych, 2, 6, 2, 3, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu prawa pracy –ogółem oraz I instancja", 5, tenPlik));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 11o Error: " + ex.Message);
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswierz();
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
                    DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss10e(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 60);
                    //    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21, tenPlik); //dane
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
            catch
            { }
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

        #region dane do tabeli

        private DataTable schematTabeli()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("nrWiersza", typeof(int));
            dT.Columns.Add("nrKolumny", typeof(int));
            dT.Columns.Add("colspan", typeof(int));
            dT.Columns.Add("rowspan", typeof(int));
            dT.Columns.Add("style", typeof(string));
            dT.Columns.Add("text", typeof(string));

            //   var List<tabeleDoMSS> lista = new List <tabeleDoMSS>;
            return dT;
        }

        #region Dzial 5.1

        private DataTable naglowekTabeliDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 4, "center", "Wyszczególnienie " });
            dT.Rows.Add(new Object[] { 1, 2, 1, 4, "center col_60", "Pozostałość (wnioski nie rozpatrzone)" });
            dT.Rows.Add(new Object[] { 1, 3, 3, 1, "center", "WPŁYW" });
            dT.Rows.Add(new Object[] { 1, 5, 10, 1, "center", "ROZPATRZONO" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 4, "center col_60", "Pozostałość" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 3, "center col_60", "razem" });
            dT.Rows.Add(new Object[] { 2, 4, 2, 1, "center", "w tym  (z rubr. 2)" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 3, "center col_60", "razem (rubr. 6 do 10 + 13 + 14)" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 3, "center col_60", "uwzględniono" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 3, "center col_60", "nie uwzględniono" });
            dT.Rows.Add(new Object[] { 2, 9, 2, 1, "center", "pozostawiono bez rozpoznania z uwagi na" });
            dT.Rows.Add(new Object[] { 2, 11, 3, 1, "center", "umorzono postępowanie" });
            dT.Rows.Add(new Object[] { 2, 13, 1, 3, "center col_60", "w inny sposób" });
            dT.Rows.Add(new Object[] { 2, 14, 1, 3, "center col_60", "przekazano innemu sądowi" });

            dT.Rows.Add(new Object[] { 3, 4, 1, 2, "center", "przekazane z innych sądów" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 2, "center", "dotyczące zastępczej kary pozbawienia wolności" });

            dT.Rows.Add(new Object[] { 3, 9, 1, 2, "center", "brak warunków technicznych" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 2, "center", "nieuzupełnie-nie braku formalnego w terminie" });
            dT.Rows.Add(new Object[] { 3, 13, 1, 2, "center", "razem" });
            dT.Rows.Add(new Object[] { 3, 14, 2, 1, "center col_60", "z powodu" });

            dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center col_60", "cofnięcia wniosku" });
            dT.Rows.Add(new Object[] { 4, 14, 1, 1, "center col_60", "innego" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "W okresie miesięcznym" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Narastająco od 1 stycznia do ostatniego dnia okresu sprawozdawczego" });

            return dT;
        }

        #endregion Dzial 5.1

        #region dzial 5.2

        private DataTable naglowekTabeliDzialu_5_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center col_200", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_150", "Razem (rubr. 2 do 6)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_150", "Skazany lub jego obrońca " });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_150", "Prokurator" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center col_150", "Sądowy kurator zawodowy" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center col_150", "Dyrektor zakładu karnego " });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center col_150", "Inne" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_2()
        {
            return tabelaBocznaDzialu_5_1();
        }

        #endregion dzial 5.2

        #region dzial 5.3

        private DataTable naglowekTabeliDzialu_5_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 2, "center", "Ogółem" });
            dT.Rows.Add(new Object[] { 1, 4, 2, 1, "center", "w tym (rubr. 1)" });

            //wiersz 2
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center", "wobec których wykonuje się orzeczenie dotyczące zakazu zbliżania się do określonej osoby " });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center", "wobec których wykonuje się orzeczenie dotyczące obowiązku powstrzymywania się od przebywania w określonych miejscach " });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "wciecie borderAll", "Liczba osób" });

            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "wciecie borderAll", "w okresie sprawozdawczym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "center borderAll", "stan na ostatni dzień okresu sprawozdawczego" });

            return dT;
        }

        #endregion dzial 5.3

        #region dzial 5.4

        private DataTable naglowekTabeliDzialu_5_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Orzeczenia w przedmiocie zastosowania środka karnego zakazu wstępu na imprezę masową z obowiązkiem przebywania w miejscach stałego pobytu" });
            dT.Rows.Add(new Object[] { 1, 2, 2, 1, "center ", "Liczba orzeczeń/osób w okresie sprawozdawczym)" });
            dT.Rows.Add(new Object[] { 1, 4, 2, 1, "center", "Wykonywane orzeczenia/osoby (stan w ostatnim dniu okresu sprawozdawczego)" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "orzeczenia" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "osoby" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_100", "orzeczenia" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_100", "osoby" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Ogółem orzeczenia przekazane do sądu penitencjarnego" });

            return dT;
        }

        #endregion dzial 5.4

        #region dzial 5.5

        private DataTable naglowekTabeliDzialu_5_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Orzeczenia o warunkowym przedterminowym zwolnieniu (w okresie miesięcznym) (w okresie miesięcznym) (na podstawie wykazu Kow)" });

            dT.Rows.Add(new Object[] { 1, 3, 3, 1, "center ", "Wnioski/działanie sadu urzędu" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "razem (rubryka 2+3)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "uwzględnione" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_100", "nieuwzględnione" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Ogółem orzeczenia (w. 02 do 06)" });

            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Działania sądu z urzędu" });

            dT.Rows.Add(new Object[] { 3, 1, 1, 4, "wciecie borderAll", "Wnioski złożone przez" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "skazanego lub obrońcy" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "dyrektora zakładu karnego" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, " wciecie borderAll", "prokuratora" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, " wciecie borderAll", "kuratora sądowego" });

            return dT;
        }

        #endregion dzial 5.5

        #endregion dane do tabeli
    }
}