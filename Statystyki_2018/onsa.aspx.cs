/*
Last Update:
     - version 1.191108
Creation date: 2019-12-28

*/

using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class onsa : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders XMLHeaders = new XMLHeaders();

        private string path = string.Empty;
        private const string tenPlik = "onsa.aspx";
        public string tenPlikNazwa = "onsa";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =   Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
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
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
            }
            catch
            { }
            odswiez();
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
            int idWydzial = int.Parse((string)Session["id_dzialu"]);

            PlaceHolderTB13.Controls.Clear();

            tabela_1();
            tabela_2();
            makeLabels();
        }

        protected void tabela_1()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 1, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 1!");
                return;
            }
            Session["tabelka01"] = tabelka01;
            tworztabelkeHTMLTabela1("tb13", idDzialu, 1, tabelka01);
        }
        protected void tabela_2()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018( Date1.Date, Date2.Date,idDzialu.ToString () ,2, 10,16, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 2!");
                return;
            }
            Session["tabelka02"] = tabelka01;
            pisz("tab_2_", 10, 14, tabelka01);
        }
        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            //excell
        }

        protected void tab_1_w02_c01_dateInit(object sender, EventArgs e)
        {
            //  tab_1_w05_c01.Value = DateTime.Now;
        }

        protected void tab_2_w01_c01_dateInit(object sender, EventArgs e)
        {
            // tab_2_w01_c01.Value = DateTime.Now;
        }

        protected void tworztabelkeHTMLTabela1(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            string path = Server.MapPath("XMLHeaders") + "\\ansa.xml";
            string Header = XMLHeaders.getHeaderFromXML(path, tenPlik);

            StringBuilder builder = new StringBuilder();
            builder.Clear();
        //    builder.AppendLine("AAA");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.AppendLine("<td colspan=14 class='borderAll wciecie'> Nazwisko i imię sędziego, referendarza :<b> " + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString() + "</b></td>");
                builder.AppendLine("</tr>");
                builder.AppendLine(Header);
                builder.Append(tworzSekcje(1, 15, 120, wierszZtabeli, idtabeli.ToString()));
                licznik++;
            }

            //builder.Append(sumaTabeli(dane, 6, 12, 13));

            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB13.Controls.Add(tblControl);
            PlaceHolderTB13.Dispose();
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

                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }
            }
            catch
            {
            }
        }

        // private metodes
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


        private string sumaTabeli(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli)
        {
            //   List<double> items = new List<double>();
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];
            for (int i = 0; i < dlugoscLinii - 1; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 0;

            for (int i = 0; i < (iloscWierszy * dlugoscLinii); i++)
            {
                dlugosc++;
                try
                {
                    wierszSumujacy[dlugosc] = wierszSumujacy[dlugosc] + double.Parse(suma.Rows[0][i + 1].ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 0;
                }
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML("Razem", 4, 0, "borderAll center col_100 gray"));

            for (int j = 0; j < dlugoscLinii - 1; j++)
            {
                if ((j < 5) ^ (j > 7))
                {
                    builder.Append(tb.komorkaHTML(wierszSumujacy[j].ToString(), 0, 0, "borderAll center col_100 gray"));
                }
                else
                {
                    builder.Append(tb.komorkaHTML("", 0, 0, "borderAll center col_100"));
                }
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string sumaTabeli(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem)
        {
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];
            for (int i = 0; i < dlugoscLinii - 1; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 0;

            for (int i = 0; i < (iloscWierszy * dlugoscLinii); i++)
            {
                dlugosc++;
                try
                {
                    wierszSumujacy[dlugosc] = wierszSumujacy[dlugosc] + double.Parse(suma.Rows[0][i + 1].ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 0;
                }
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));

            for (int j = 0; j < dlugoscLinii - 1; j++)
            {
                builder.Append(tb.komorkaHTML(wierszSumujacy[j + 1].ToString(), 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + (i + indexPoczatkowy).ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string wartosc = wierszZtabeli["d_" + i.ToString("D2")].ToString();
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["d_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcje(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli));
                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }
    }
}