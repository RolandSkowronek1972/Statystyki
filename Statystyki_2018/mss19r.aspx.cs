using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss19r : System.Web.UI.Page
    {
        public static string tenPlik = "mss19r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
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
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
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
            if (Session["ustawDate19r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate19r"] = "X";
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date1.Date.ToShortDateString();
            odswierz();
            makeLabels();
        }// end of Page_Load

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
                Label27.Text = id_dzialu.Text;
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

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswierz();
        }

        protected void odswierz()
        {
            try
            {
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                }
                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
            }
            catch
            { }
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty;
            string path = Server.MapPath("XMLHeaders") + "\\" + "MSS19r.xml";
            try
            {
                tablePlaceHolder01.Controls.Clear();
                PlaceHolder1.Controls.Clear();
                
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 40);
                string[] numeryTabel00 = new string[] { "1", "1.1", "1.2", "1.1.a", "1.1.b", "1.1.c", "1.1.d","1.1.e", "1.1.f" };
                string[] numeryTabel01 = new string[] { "6.3" };

                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, PlaceHolder1, path, tabelaDanych, idWydzialuNumerycznie, tenPlik);


                StringBuilder tabelaGlowna = new StringBuilder();
               
             
                //czesc po mediacjach
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.2.a", naglowekTabeliDzialu_1_1_2_a(), tabelaBocznaDzialu_1_1_2_a(), tabelaDanych, 3, 29, 3, 8, idWydzialuNumerycznie, true, "Struktura wpływu spraw", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.2.b", naglowekTabeliDzialu_1_1_2_b(), tabelaBocznaDzialu_1_1_2_b(), tabelaDanych, 3, 31, 3, 8, idWydzialuNumerycznie, true, "Struktura załatwień spraw", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.2.1", naglowekTabeliDzialu_1_2_1(), tabelaBocznaDzialu_1_2_1(), tabelaDanych, 3, 9, 1, 28, idWydzialuNumerycznie, true, "Liczba sesji i wyznaczonych spraw ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.2.2", naglowekTabeliDzialu_1_2_2(), tabelaBocznaDzialu_1_2_2(), tabelaDanych, 3, 31, 3, 28, idWydzialuNumerycznie, true, "Liczba odbytych sesji i załatwionych spraw", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.3.1", naglowekTabeliDzialu_1_3_1(), tabelaBocznaDzialu_1_3_1(), tabelaDanych, 2, 10, 1, 6, idWydzialuNumerycznie, true, "Załatwienie spraw i przez referendarzy", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.4", naglowekTabeliDzialu_1_4(), tabelaBocznaDzialu_1_4(), tabelaDanych, 3, 4, 1, 14, idWydzialuNumerycznie, true, "Terminowość sporządzania uzasadnień", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1", naglowekTabeliDzialu_2_1_1(), tabelaBocznaDzialu_2_1_1(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Sprawy od dnia pierwotnego wpisu do repertorium (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.1", naglowekTabeliDzialu_2_1_1_1(), tabelaBocznaDzialu_2_1_1_1(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Sprawy od dnia pierwotnego wpisu do repertorium (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.a", naglowekTabeliDzialu_2_1_1_a(), tabelaBocznaDzialu_2_1_1_a(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.a.1", naglowekTabeliDzialu_2_1_1_a_1(), tabelaBocznaDzialu_2_1_1_a_1(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.2", naglowekTabeliDzialu_2_1_2(), tabelaBocznaDzialu_2_1_2(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania(łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.2.1", naglowekTabeliDzialu_2_1_2_1(), tabelaBocznaDzialu_2_1_2_1(), tabelaDanych, 3, 5, 3, 11, idWydzialuNumerycznie, true, "Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.2", naglowekTabeliDzialu_2_2(), tabelaBocznaDzialu_2_2(), tabelaDanych, 1, 4, 1, 9, idWydzialuNumerycznie, true, "Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (łącznie z czasem trwania mediacji)", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.2.a", naglowekTabeliDzialu_2_2_a(), tabelaBocznaDzialu_2_2_a(), tabelaDanych, 1, 4, 1, 9, idWydzialuNumerycznie, true, "Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji)", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.2.1", naglowekTabeliDzialu_2_2_a(), tabelaBocznaDzialu_2_2_a(), tabelaDanych, 1, 4, 1, 9, idWydzialuNumerycznie, true, "Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.2.1.a", naglowekTabeliDzialu_2_2_a(), tabelaBocznaDzialu_2_2_a(), tabelaDanych, 1, 4, 1, 9, idWydzialuNumerycznie, true, "Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.3", naglowekTabeliDzialu_2_3(), tabelaBocznaDzialu_2_3(), tabelaDanych, 1, 2, 1, 7, idWydzialuNumerycznie, true, "Czas trwania wszystkich mediacji w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do dnia zakończenia mediacji ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.3.1", naglowekTabeliDzialu_2_3_1(), tabelaBocznaDzialu_2_3_1(), tabelaDanych, 1, 2, 1, 7, idWydzialuNumerycznie, true, "Czas trwania mediacji niezakończonych w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do ostatniego dnia okresu sprawozdawczego", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("3", naglowekTabeliDzialu_3(), tabelaBocznaDzialu_3(), tabelaDanych, 2, 4, 1, 8, idWydzialuNumerycznie, true, "Wyznaczenie pierwszej rozprawy/posiedzenia spraw", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("4.1", naglowekTabeliDzialu_4_1(), tabelaBocznaDzialu_4_1(), tabelaDanych, 2, 2, 1, 7, idWydzialuNumerycznie, true, "Terminowość postępowania międzyinstancyjnego  w pierwszej instancji", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("4.2", naglowekTabeliDzialu_4_2(), tabelaBocznaDzialu_4_2(), tabelaDanych, 2, 1, 1, 7, idWydzialuNumerycznie, true, "Kontrolka skarg (w wydziale, którego sprawy skarga dotyczy) (§ 4485 ust. 1 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej(Dz.Urz.Min.Sprawiedl.Nr 5, poz. 22, z późn.zm.);                ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("5", naglowekTabeliDzialu_5(), tabelaBocznaDzialu_5(), tabelaDanych, 2, 10, 3, 7, idWydzialuNumerycznie, true, "Sprawy gospodarcze wielotomowe ", tenPlik));

                tabelaGlowna.AppendLine(ms.tworztabeleMSS("5.1", naglowekTabeliDzialu_5_1(), tabelaBocznaDzialu_5_1(), tabelaDanych, 1, 2, 1, 32, idWydzialuNumerycznie, true, "Limity etatów i obsada Sądu (Wydziału)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("5.2", naglowekTabeliDzialu_5_2(), tabelaBocznaDzialu_5_2(), tabelaDanych, 1, 4, 2, 7, idWydzialuNumerycznie, true, "Obsada Sądu (Wydziału)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("6.1", naglowekTabeliDzialu_6_1(), tabelaBocznaDzialu_6_1(), tabelaDanych, 2, 3, 3, 4, idWydzialuNumerycznie, true, "Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("6.2", naglowekTabeliDzialu_6_2(), tabelaBocznaDzialu_6_2(), tabelaDanych, 3, 3, 3, 8, idWydzialuNumerycznie, true, "Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych)", tenPlik));
                //          tabelaGlowna.AppendLine(ms.tworztabeleMSS("6.3", naglowekTabeliDzialu_6_3(), tabelaBocznaDzialu_6_3(), tabelaDanych, 2, 3, 3, 12, idWydzialuNumerycznie, true, "Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo (z wył. tłumaczy przysięgłych)", tenPlik));
           
                #region "7.2";
                pisz("tab_7_1_", 1, 3, tabelaDanych, "'7.1'", idWydzialu);
                pisz("tab_7_2_", 1, 8, tabelaDanych, "'7.2'", idWydzialu);
                pisz("tab_111_", 30, 3, tabelaDanych, "'1.1.1'", idWydzialu);
                //tab_111_w01_c01
                #endregion "7.2";

                #region "7.3";

                pisz("tab_7_3_", 1, 12, tabelaDanych, "'7.3'", idWydzialu);

                #endregion "7.3";

                Label tblControl1 = new Label { ID = "kod02x" };
                tblControl1.Text = tabelaGlowna.ToString();
                tablePlaceHolder1.Controls.Add(tblControl1);


               
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 11o Error: " + ex.Message);
            }
        }

      

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

        #region dzial 1.1.a

        private DataTable naglowekTabeliDzialu_1_1_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Liczby spraw" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_120", "GC" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "GNc" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 3, "wciecie borderAll", "Wydano nakaz zapłaty" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "wciecie borderAll", "w postępowaniu nakazowym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "w postępowaniu upominawczym" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "w europejskim postępowaniu nakazowym" });

            return dT;
        }

        #endregion dzial 1.1.a

        #region dzial 1.1.b

        private DataTable naglowekTabeliDzialu_1_1_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "Liczby spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Wpłynęło" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Załatwiono" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Pozostało na okres następny" });

            return dT;
        }

        #endregion dzial 1.1.b

        #region dzial 1.1.c

        private DataTable naglowekTabeliDzialu_1_1_c()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Sprawy" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center", "Liczby spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_c()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazane Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem prawomocnego orzeczenia" });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłane z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 5, "wciecie borderAll", "w których Sąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "odmówił przyjęcia skargi do rozpoznania (art.424<sup>9</sup> kpc)" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "odrzucił skargę  (art.424<sup>8</sup> kpc)" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "oddalił skargę  (art.424<sup>11</sup> §1 kpc)" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "uwzględnił skargę  (art.424<sup>11</sup> §2 kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie borderAll", "załatwił w inny sposób" });

            return dT;
        }

        #endregion dzial 1.1.c

        #region dzial 1.1.d

        private DataTable naglowekTabeliDzialu_1_1_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Repertorium lub wykaz" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "Liczba spraw, w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat)" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center", "Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center", "W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika (od I 2012)" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "GNs" });

            return dT;
        }

        #endregion dzial 1.1.d

        #region dzial 1.1.e

        private DataTable naglowekTabeliDzialu_1_1_e()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "Liczby spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_e()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Wpłynęło " });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Załatwiono" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "uwzględniono w całości lub w części" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "oddalono" });
            dT.Rows.Add(new Object[] { 5, 1, 2, 1, "wciecie borderAll", "Pozostało" });

            return dT;
        }

        #endregion dzial 1.1.e

        #region dzial 1.1.2.a

        private DataTable naglowekTabeliDzialu_1_1_2_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 3, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 8, 1, "center", "Repertorium/wykaz" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 2, "center", "Ogółem" });
            dT.Rows.Add(new Object[] { 2, 4, 7, 1, "center", "w tym" });

            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "center col_81", "GC " });
            dT.Rows.Add(new Object[] { 3, 5, 1, 1, "center col_81", "GNs" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_81", "GNc" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, "center col_81", "GCo" });
            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_81", "GCps" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_81", "Gz" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_81", "WSC" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_2_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Pozostało z ubiegłego roku (w.01 = dz.1.1. kol. 1 odpowiednie wiersze) " });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "Wpłynęło ogółem  (w.02 = dz.1.1. kol. 2 odpowiednie wiersze = w.03+29)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 26, "wciecie borderAll", "W tym ponownie wpisane" });

            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "uwzględniono w całości lub w części" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "razem(w.03 = w.04 do 14 i 16 do 28) ponownie wpisane" });
            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "zwrot pozwu/wniosku/skargi" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "przekazanie z innych jednostek na podstawie art. 200 kpc (z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "wyłączenie sprawy do odrębnego rozpoznania – poprzednio połączonej na podstawie art. 219" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "wyłączenie roszczenia do odrębnego rozpoznania (z wyłączeniem wiersza 06)" });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "sprawy zawieszone zakreślone, które podjęto" });

            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 480<sup>1</sup>§2 kpc" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 495§1 kpc" });
            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 505§1 kpc" });
            dT.Rows.Add(new Object[] { 12, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 13, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
            dT.Rows.Add(new Object[] { 14, 2, 2, 1, "wciecie borderAll", "przekazane przez SR Lublin-Zachód (e-sąd)" });
            dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie borderAll", "     w tym przekazane na podstawie art. 505<sup>33</sup> §1" });
            dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania" });
            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "wpisane w wyniku przywrócenia terminu do wniesienia środka zaskarżenia" });
            dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });

            dT.Rows.Add(new Object[] { 19, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 19, 3, 1, 1, "wciecie borderAll", "wydziału (ów) /sekcji" });
            dT.Rows.Add(new Object[] { 20, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 21, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 21, 3, 1, 1, "wciecie borderAll", "wydziału (ów)" });
            dT.Rows.Add(new Object[] { 22, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "dokonano omyłkowego wpisu" });

            dT.Rows.Add(new Object[] { 25, 2, 1, 2, "wciecie borderAll", "wpływ spraw" });
            dT.Rows.Add(new Object[] { 25, 3, 1, 1, "wciecie borderAll", "w związku z funkcjonowaniem § 43 Regulaminu" });
            dT.Rows.Add(new Object[] { 26, 3, 1, 1, "wciecie borderAll", "w związku ze wspólnym wpływem § 54 ust.2 Regulaminu" });
            dT.Rows.Add(new Object[] { 27, 2, 2, 1, "wciecie borderAll", "w wyniku uchylonych nakazów zapłaty na podstawie art. 4802 § 5 kpc (art. 5021 kpc, art. 492<sup>1</sup> kpc)" });
            dT.Rows.Add(new Object[] { 28, 2, 2, 1, "wciecie borderAll", "inne ponownie wpisane" });
            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "Wpływ pozostałych spraw" });

            return dT;
        }

        #endregion dzial 1.1.2.a

        #region dzial 1.1.2.b

        private DataTable naglowekTabeliDzialu_1_1_2_b()
        {
            return naglowekTabeliDzialu_1_1_2_a();
        }

        private DataTable tabelaBocznaDzialu_1_1_2_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Załatwiono ogółem (w.01 = dz.1.1.  kol. 3  odpowiednie wiersze = w.02+30)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 27, "wciecie borderAll", "W tym szczególne  rodzaje załatwień" });
            dT.Rows.Add(new Object[] { 2, 2, 2, 1, "wciecie borderAll", "razem (w.02 = w.03 do 29)" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "zwrot pozwu/wniosku/skargi" });
            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "przekazanie do innych jednostek na podstawie art. 200 §1 kpc (z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 340 kpc" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 i 341 kpc" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 480<sup>1</sup>§2 kpc " });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 186<sup>1</sup>  kpc" });
            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 191<sup>1</sup>§ 3  kpc" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });
            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 12, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
            dT.Rows.Add(new Object[] { 13, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, "wciecie borderAll", "wydziału (ów) /sekcji" });
            dT.Rows.Add(new Object[] { 14, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 15, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 15, 3, 1, 1, "wciecie borderAll", "wydziału (ów)" });
            dT.Rows.Add(new Object[] { 16, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "połączono do łącznego rozpoznania na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 19, 2, 2, 1, "wciecie borderAll", " zakreślono na podstawie art. 174 §1 pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 20, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 4 kpc" });
            dT.Rows.Add(new Object[] { 21, 2, 2, 1, "wciecie borderAll", "zakreślenie omyłkowych wpisów" });

            dT.Rows.Add(new Object[] { 22, 2, 2, 1, "wciecie borderAll", "odrzucono pozew / wniosek / skargę" });
            dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "umorzenie na skutek cofnięcia pozwu, wniosku, skargi" });
            dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "umorzenie na podstawie art. 505<sup>37<sup> §1, kpc" });
            dT.Rows.Add(new Object[] { 25, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art.148<sup>1</sup> §1 kpc " });
            dT.Rows.Add(new Object[] { 26, 2, 2, 1, "wciecie borderAll", "wydano nakaz zapłaty" });

            dT.Rows.Add(new Object[] { 27, 2, 1, 2, "wciecie borderAll", "zakreślenie spraw" });
            dT.Rows.Add(new Object[] { 27, 3, 1, 1, "wciecie borderAll", "w związku z funkcjonowaniem § 43 Regulaminu" });
            dT.Rows.Add(new Object[] { 28, 3, 1, 1, "wciecie borderAll", "w związku ze wspólnym wpływem § 54 ust.2 Regulaminu" });

            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "inne nie wymienione wyżej szczególne rodzaje załatwień" });

            dT.Rows.Add(new Object[] { 30, 1, 3, 1, "wciecie borderAll", "Załatwienie pozostałych spraw" });
            dT.Rows.Add(new Object[] { 31, 1, 3, 1, "wciecie borderAll", "Pozostało na okres następny (w.31 = dz.1.1. kol. 15 odpowiednie wiersze)" });

            return dT;
        }

        #endregion dzial 1.1.2.b

        #region dzial 1.2.1

        private DataTable naglowekTabeliDzialu_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 3, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 3, "center", "Liczba sesji (rozprawy i posiedzenia) - wokandy" });

            dT.Rows.Add(new Object[] { 1, 3, 1, 3, "center", "Suma wyznaczonych spraw" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 3, "center", "Łączna liczba dni na które wyznaczono  sesje -wokandy" });

            dT.Rows.Add(new Object[] { 1, 5, 12, 1, "center col_81", "Liczba wyznaczonych spraw na rozprawę, dotyczy: " });
            dT.Rows.Add(new Object[] { 1, 6, 13, 1, "center col_81", "Liczba wyznaczonych spraw na posiedzenia, dotyczy:" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 2, "center col_81", "Razem wyznaczonych spraw na rozprawę" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 2, "center col_81", "sędziów / SR z wyłączeniem sędziów funkcyjnych" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 2, "center col_81", "sędziów  funkcyjnych SR (suma kol. od 7 do 13)" });
            dT.Rows.Add(new Object[] { 2, 7, 7, 1, "center col_81", "z tego" });

            dT.Rows.Add(new Object[] { 2, 15, 1, 2, "center col_81", "inni sędziowie SR" });

            dT.Rows.Add(new Object[] { 2, 16, 1, 2, "center col_81", "Inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 17, 1, 2, "center col_81", "Razem wyznaczonych spraw na posiedzenie" });
            dT.Rows.Add(new Object[] { 2, 18, 1, 2, "center col_81", "sędziów SR z wyłączeniem sędziów funkcyjnych" });
            dT.Rows.Add(new Object[] { 2, 19, 1, 2, "center col_81", "sędziów / funkcyjnych SR (suma kol. od 19 do 25)" });
            dT.Rows.Add(new Object[] { 2, 20, 7, 1, "center col_81", "z tego" });
            dT.Rows.Add(new Object[] { 2, 27, 1, 2, "center col_81", "inni sędziowie SR" });

            dT.Rows.Add(new Object[] { 2, 28, 1, 2, "center col_81", "Inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 29, 1, 2, "center col_81", "referendarzy" });

            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_81", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_81", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_81", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 1, "center col_81", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 12, 1, 1, "center col_81", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 13, 1, 1, "center col_81", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 14, 1, 1, "center col_81", "innych funkcyjnych tego sądu z innych pionów" });

            dT.Rows.Add(new Object[] { 3, 20, 1, 1, "center col_81", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 21, 1, 1, "center col_81", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 22, 1, 1, "center col_81", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 23, 1, 1, "center col_81", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 24, 1, 1, "center col_81", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 25, 1, 1, "center col_81", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 26, 1, 1, "center col_81", "innych funkcyjnych tego sądu z innych pionów" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Ogółem sprawy gospodarcze (wiersze od 02 do 09)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "GNs" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "GNc" });
            dT.Rows.Add(new Object[] { 5, 1, 1, 1, "wciecie borderAll", "GCo" });
            dT.Rows.Add(new Object[] { 6, 1, 1, 1, "wciecie borderAll", "GCps" });
            dT.Rows.Add(new Object[] { 7, 1, 1, 1, "wciecie borderAll", "Gz" });
            dT.Rows.Add(new Object[] { 8, 1, 1, 1, "wciecie borderAll", "WSC (skarga o stwierdzenie niezgodności z prawem)" });
            dT.Rows.Add(new Object[] { 9, 1, 1, 1, "wciecie borderAll", "WSNc (skarga nadzwyczajna)" });
            /*  dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "wyłączenie roszczenia do odrębnego rozpoznania (z wyłączeniem wiersza 06)" });
              dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 486 kpc i art. 498§2 kpc" });
              dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 495§1 kpc" });
              dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 505§1 kpc" });
              dT.Rows.Add(new Object[] { 12, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
              dT.Rows.Add(new Object[] { 13, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
              dT.Rows.Add(new Object[] { 14, 2, 2, 1, "wciecie borderAll", "przekazane przez SR Lublin-Zachód (e-sąd)" });
              dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie borderAll", "     w tym przekazane na podstawie art. 505<sup>33</sup> §1" });
              dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania" });
              dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "wpisane w wyniku przywrócenia terminu do wniesienia środka zaskarżenia" });
              dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });

              dT.Rows.Add(new Object[] { 19, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
              dT.Rows.Add(new Object[] { 19, 3, 1, 1, "wciecie borderAll", "wydziału (ów) /sekcji" });
              dT.Rows.Add(new Object[] { 20, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

              dT.Rows.Add(new Object[] { 21, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
              dT.Rows.Add(new Object[] { 21, 3, 1, 1, "wciecie borderAll", "wydziału (ów)" });
              dT.Rows.Add(new Object[] { 22, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

              dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
              dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "dokonano omyłkowego wpisu" });

              dT.Rows.Add(new Object[] { 25, 2, 1, 2, "wciecie borderAll", "wpływ spraw" });
              dT.Rows.Add(new Object[] { 25, 3, 1, 1, "wciecie borderAll", "w związku z funkcjonowaniem § 43 Regulaminu" });
              dT.Rows.Add(new Object[] { 26, 3, 1, 1, "wciecie borderAll", "w związku ze wspólnym wpływem § 54 ust.2 Regulaminu" });
              dT.Rows.Add(new Object[] { 27, 2, 2, 1, "wciecie borderAll", "w wyniku uchylonych nakazów zapłaty na podstawie art. 5021 kpc, art. 492<sup>1<sup> kpc" });
              dT.Rows.Add(new Object[] { 28, 2, 2, 1, "wciecie borderAll", "inne ponownie wpisane" });
              dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "Wpływ pozostałych spraw" });    */

            return dT;
        }

        #endregion dzial 1.2.1

        #region dzial 1.2.2

        private DataTable naglowekTabeliDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 3, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 3, "center", "Liczba odbytych sesji (rozprawy i posiedzenia)- wokandy" });

            dT.Rows.Add(new Object[] { 1, 5, 1, 3, "center", "Liczba dni w których odbyto sesje -wokandy" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 3, "center", "Załatwienie<sup>1)</sup> ogółem (kol. 4, 16)" });

            dT.Rows.Add(new Object[] { 1, 7, 12, 1, "center col_81", "Liczba załatwionych spraw na rozprawę, dotyczy: " });
            dT.Rows.Add(new Object[] { 1, 8, 13, 1, "center col_81", "Liczba załatwionych spraw na posiedzenia, dotyczy:" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 2, "center col_81", "Załatwienie  razem (kol. 5, 6, 14, 15)" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 2, "center col_81", "sędziów  SR z wyłączeniem sędziów funkcyjnych " });
            dT.Rows.Add(new Object[] { 2, 6, 1, 2, "center col_81", "sędziów  funkcyjnych SR (suma kol. od 7 do 13)" });
            dT.Rows.Add(new Object[] { 2, 7, 7, 1, "center col_81", "z tego" });

            dT.Rows.Add(new Object[] { 2, 15, 1, 2, "center col_81", "inni sędziowie SR" });

            dT.Rows.Add(new Object[] { 2, 16, 1, 2, "center col_81", "Inni sędziowie" });

            dT.Rows.Add(new Object[] { 2, 17, 1, 2, "center col_81", "Załatwienie razem (kol. 17, 18, 26 do 28)" });
            dT.Rows.Add(new Object[] { 2, 18, 1, 2, "center col_81", "sędziów SR z wyłączeniem sędziów funkcyjnych" });
            dT.Rows.Add(new Object[] { 2, 19, 1, 2, "center col_81", "sędziów / funkcyjnych SR (suma kol. od 19 do 25)" });
            dT.Rows.Add(new Object[] { 2, 20, 7, 1, "center col_81", "z tego" });
            dT.Rows.Add(new Object[] { 2, 27, 1, 2, "center col_81", "inni sędziowie SR" });

            dT.Rows.Add(new Object[] { 2, 28, 1, 2, "center col_81", "Inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 29, 1, 2, "center col_81", "referendarzy" });

            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_81", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_81", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_81", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 1, "center col_81", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 12, 1, 1, "center col_81", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 13, 1, 1, "center col_81", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 14, 1, 1, "center col_81", "innych funkcyjnych tego sądu z innych pionów" });

            dT.Rows.Add(new Object[] { 3, 20, 1, 1, "center col_81", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 21, 1, 1, "center col_81", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 22, 1, 1, "center col_81", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 23, 1, 1, "center col_81", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 24, 1, 1, "center col_81", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 25, 1, 1, "center col_81", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 26, 1, 1, "center col_81", "innych funkcyjnych tego sądu z innych pionów" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Ogółem sprawy gospodarcze (wiersze od 02,25 do 31)" });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 22, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "zwrot pozwu" });

            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "przekazanie do innych jednostek na podstawie art. 200§1 kpc ( z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 479<sup>17</sup> kpc" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 479<sup>18</sup> kpc" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 kpc " });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 341 kpc" });
            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });

            dT.Rows.Add(new Object[] { 12, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 12, 3, 1, 1, "wciecie borderAll", "wydziału (ów) /sekcji" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 14, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 14, 3, 1, 1, "wciecie borderAll", "wydziału (ów)" });
            dT.Rows.Add(new Object[] { 15, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "połączono do łącznego rozpoznania na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });

            dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 19, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 4 kpc" });
            dT.Rows.Add(new Object[] { 20, 2, 2, 1, "wciecie borderAll", "zakreślenie omyłkowych wpisów" });

            dT.Rows.Add(new Object[] { 21, 2, 2, 1, "wciecie borderAll", "umorzono na podstawie art. 505<sup>37</sup>§1 kpc" });
            dT.Rows.Add(new Object[] { 22, 2, 2, 1, "wciecie borderAll", "odrzucono pozew" });
            dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "wydano nakaz zapłaty" });
            dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "inne" });

            dT.Rows.Add(new Object[] { 25, 1, 3, 1, "wciecie borderAll", "GNs" });
            dT.Rows.Add(new Object[] { 26, 1, 3, 1, "wciecie borderAll", "GNc" });
            dT.Rows.Add(new Object[] { 27, 1, 3, 1, "wciecie borderAll", "Gco" });
            dT.Rows.Add(new Object[] { 28, 1, 3, 1, "wciecie borderAll", "GCps" });
            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "Gz" });
            dT.Rows.Add(new Object[] { 30, 1, 3, 1, "wciecie borderAll", "WSC (skarga o stwierdzenie niezgodności z prawem)" });
            dT.Rows.Add(new Object[] { 31, 1, 3, 1, "wciecie borderAll", "WSC (skarga nadzwyczajna)" });

            return dT;
        }

        #endregion dzial 1.2.2

        #region dzial 1.3.1

        private DataTable naglowekTabeliDzialu_1_3_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 2, 6, 1, "center", "Liczba spraw załatwionych przez referendarzy" });

            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "center col_81", "Ogółem (kol. od 2 do 6)" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_81", "Rep. GC" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_81", "Rep. GNc" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_81", "Rep GNs" });

            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_81", "Rep GCo" });

            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_81", "Inne" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_3_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "W przedmiocie zwolnienia od kosztów sądowych i/lub ustanowienia adwokata lub radcy prawnego" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Zwrot pism po bezskutecznym upływie terminu do ich uzupełnienia i opłacenia " });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Wydawanie nakazów zapłaty w postępowaniu upominawczym" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Wydawanie nakazów zapłaty w postępowaniu nakazowym " });
            dT.Rows.Add(new Object[] { 5, 1, 1, 1, "wciecie borderAll", "O nadanie klauzuli wykonalności" });
            dT.Rows.Add(new Object[] { 6, 1, 1, 1, "wciecie borderAll", "Umorzenie postepowania upominawczego" });
            dT.Rows.Add(new Object[] { 7, 1, 1, 1, "wciecie borderAll", "Zawieszenie postępowania upominawczego w oparciu o art.174§1 pkt 1 i 4 kpc" });
            dT.Rows.Add(new Object[] { 8, 1, 1, 1, "wciecie borderAll", "Prawomocne postanowienia w postępowaniu upominawczym o przekazaniu sprawy sądowi równorzędnemu lub niższego rzędu" });
            dT.Rows.Add(new Object[] { 9, 1, 1, 1, "wciecie borderAll", "Postanowienia w sprawach o zezwolenie na złożenie świadczenia do depozytu sadowego, zwrot depozytu i wydanie depozytu" });
            dT.Rows.Add(new Object[] { 10, 1, 1, 1, "wciecie borderAll", "Inne" });

            return dT;
        }

        #endregion dzial 1.3.1

        #region dzial 1.4

        private DataTable naglowekTabeliDzialu_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 3, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 2, 10, 1, "center", "Terminowość sporządzania uzasadnień" });
            dT.Rows.Add(new Object[] { 1, 12, 1, 3, "center", "Uzasadnienia wygłoszone (art.328 § 11 kpc)" });
            dT.Rows.Add(new Object[] { 1, 13, 1, 3, "center", "Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnień wygłoszonych w trybie art.art.3311 kpc" });
            dT.Rows.Add(new Object[] { 1, 14, 2, 1, "center", "Uzasadnienia wygłoszone (art.328 § 11 kpc)" });

            dT.Rows.Add(new Object[] { 2, 2, 1, 2, "center col_81", "razem (kol. 2+3+5+7+9)" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 2, "center col_81", "w terminie  ustawowym" });
            dT.Rows.Add(new Object[] { 2, 4, 8, 1, "center col_81", "po upływie terminu ustawowego 1)" });

            dT.Rows.Add(new Object[] { 2, 14, 1, 2, "center col_81", "Rep GCo" });
            dT.Rows.Add(new Object[] { 2, 15, 1, 2, "center col_81", "w tym, w których projekt został zaakceptowany przez sędziego" });

            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "center col_81", "1-14 dni" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 1, "center col_81", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_81", "15-30 dni" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, "center col_81", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_81", "pow. 1 do 3 mies" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_81", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_81", "ponad 3 mies." });
            dT.Rows.Add(new Object[] { 3, 11, 1, 1, "center col_81", "w tym nieuspra-wiedliwione" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Razem (wiersze od 02 do 04)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "GNs" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Gz" });
            return dT;
        }

        #endregion dzial 1.4

        #region dzial 2.1.1.

        private DataTable naglowekTabeliDzialu_2_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "SPRAWY wg repertoriów" });
            dT.Rows.Add(new Object[] { 1, 3, 11, 1, "center", "Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_81", "razem (kol.2+3)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_81", "do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_81", "suma powyżej 3 miesięcy (kol. od 4 do 6)" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_81", "powyżej 3 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_81", "powyżej 6 do 12 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_81", "suma powyżej 12 miesięcy (kol. od 7 do 11)" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_81", "powyżej 12 miesięcy  do 2 lat" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_81", "powyżej 2 do 3 lat" });
            dT.Rows.Add(new Object[] { 2, 11, 1, 1, "center col_81", "powyżej 3 do 5 lat" });
            dT.Rows.Add(new Object[] { 2, 12, 1, 1, "center col_81", "powyżej 5 do 8 lat  " });
            dT.Rows.Add(new Object[] { 2, 13, 1, 1, "center col_81", "ponad 8 lat" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_2_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Ogółem" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 4, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "GNs" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "GNc" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "Gz" });
            return dT;
        }

        #endregion dzial 2.1.1.

        #region dzial 2.1.1.1

        private DataTable naglowekTabeliDzialu_2_1_1_1()
        {
            return naglowekTabeliDzialu_2_1_1();
        }

        private DataTable tabelaBocznaDzialu_2_1_1_1()
        {
            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.1.1

        #region dzial 2.1.1.a

        private DataTable naglowekTabeliDzialu_2_1_1_a()
        {
            return naglowekTabeliDzialu_2_1_1();
        }

        private DataTable tabelaBocznaDzialu_2_1_1_a()
        {
            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.1.a

        #region dzial 2.1.1.a.1

        private DataTable naglowekTabeliDzialu_2_1_1_a_1()
        {
            return naglowekTabeliDzialu_2_1_1();
        }

        private DataTable tabelaBocznaDzialu_2_1_1_a_1()
        {
            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.1.a.1

        #region dzial 2.1.2

        private DataTable naglowekTabeliDzialu_2_1_2()
        {
            return naglowekTabeliDzialu_2_1_1();
        }

        private DataTable tabelaBocznaDzialu_2_1_2()
        {
            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.2

        #region dzial 2.1.2.1

        private DataTable naglowekTabeliDzialu_2_1_2_1()
        {
            return naglowekTabeliDzialu_2_1_1();
        }

        private DataTable tabelaBocznaDzialu_2_1_2_1()
        {
            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.2.1

        #region dzial 2.2

        private DataTable naglowekTabeliDzialu_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "SPRAWY wg repertoriów" });

            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center col_81", "razem (kol.2+9)" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_81", "do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_81", "Powyżej 3 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_81", "powyżej 6 do 12 miesięcy" });

            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center col_81", "powyżej 12 miesięcy  do 2 lat" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center col_81", "powyżej 2 do 3 lat" });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center col_81", "powyżej 3 do 5 lat" });
            dT.Rows.Add(new Object[] { 1, 9, 1, 1, "center col_81", "powyżej 5 do 8 lat  " });
            dT.Rows.Add(new Object[] { 1, 10, 1, 1, "center col_81", "ponad 8 lat" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "GNs" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "GNc" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Gz" });
            return dT;
        }

        #endregion dzial 2.2

        #region dzial 2.2

        private DataTable naglowekTabeliDzialu_2_2_a()
        {
            return naglowekTabeliDzialu_2_2();
        }

        private DataTable tabelaBocznaDzialu_2_2_a()
        {
            return tabelaBocznaDzialu_2_2();
        }

        #endregion dzial 2.2

        #region dzial 2.3

        private DataTable naglowekTabeliDzialu_2_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "SPRAWY wg repertoriów" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center col_120", "razem (kol.2+7)" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_120", "Do 1 miesiąca" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_120", "Powyżej 1 do 2 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_120", "Powyżej 2 do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center col_120", "Powyżej 3 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center col_120", "Powyżej 6 do 9 miesięcy" });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center col_120", "Ponad 9 miesięcy" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_2_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "GNs" });

            return dT;
        }

        #endregion dzial 2.3

        #region dzial 2.3.1

        private DataTable naglowekTabeliDzialu_2_3_1()
        {
            return naglowekTabeliDzialu_2_3();
        }

        private DataTable tabelaBocznaDzialu_2_3_1()
        {
            return tabelaBocznaDzialu_2_3();
        }

        #endregion dzial 2.3.1

        #region dzial 3

        private DataTable naglowekTabeliDzialu_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "SPRAWY wg repertoriów" });

            dT.Rows.Add(new Object[] { 1, 2, 8, 1, "center", "Od daty wpływu sprawy w danym lub poprzednim okresie sprawozdawczym do pierwszej rozprawy/posiedzenia w okresie sprawozdawczym upłynął okres" });

            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "center col_100", "razem (kol.2 do 8)" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "Do 1 miesiąca" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "Powyżej 1 do 2 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_100", "Powyżej 2 do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_100", "Powyżej 3 do 4 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_100", "Powyżej 4 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_100", "Powyżej 6 do 12 miesięcy" });

            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_100", "Ponad 12 miesięcy" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_3()
        {
            return tabelaBocznaDzialu_2_2_a();
        }

        #endregion dzial 3

        #region dzial 4.1

        private DataTable naglowekTabeliDzialu_4_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Środki odwoławcze, które zostały przekazane  do rozpoznania sądowi II instancji" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 2, "center col_120", "Ogółem(kol. 2 do 7)" });

            dT.Rows.Add(new Object[] { 1, 4, 6, 1, "center", "Z tego od daty orzeczenia sądu okręgowego do daty przekazania do sądu II instancji upłynął okres" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "do 2 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "pow. 2 do 3 mies." });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "pow. 3 do 6 mies." });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "pow.6 do 12 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "pow. 12 mies. do 2 lat" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120", "ponad 2 lata" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_4_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Apelacje" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Zażalenia" });
            return dT;
        }

        #endregion dzial 4.1

        #region dzial 4.2

        private DataTable naglowekTabeliDzialu_4_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 2, "center col_120", "Wpłynęło" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 2, "center col_120", "Przesłano do sądu właściwego" });
            dT.Rows.Add(new Object[] { 1, 5, 3, 1, "center", "Rozpoznanie skargi" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 2, "center col_120", "Zarządzono wypłatę przez Skarb Państwa" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 2, "center col_120", "Kwota (w złotych)" });

            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "uwzględniono" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "oddalono" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "inne" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_4_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Skargi na pracę sądu" });

            return dT;
        }

        #endregion dzial 4.2

        #region dzial 5

        private DataTable naglowekTabeliDzialu_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 2, "center", "SPRAWY z rep." });
            dT.Rows.Add(new Object[] { 1, 4, 7, 1, "center col_120", "Sprawy gospodarcze wielotomowe - liczba spraw" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "zbiorczo pow. 5 tomów (kol.2 do 7)" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "pow. 5 do 10 tomów" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "pow. 10 do 20 tomów" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "pow. 20 do 30 tomów" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "pow. 30 do 50 tomów" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120", "pow. 50 do 100 tomów" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_120", "powyżej 100 tomów " });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 10, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 1, 2, 2, 1, "wciecie borderAll", "Pozostało z poprzedniego okresu" });
            dT.Rows.Add(new Object[] { 2, 2, 2, 1, "wciecie borderAll", "Wpływ w okresie sprawozdawczym" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 3, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 3, 3, 1, 1, "wciecie borderAll", "wpływ w wyniku przekazania z innej jednostki" });
            dT.Rows.Add(new Object[] { 4, 3, 1, 1, "wciecie borderAll", "w wyniku zwrotu pozwu" });
            dT.Rows.Add(new Object[] { 5, 3, 1, 1, "wciecie borderAll", "wyłączenie sprawy (roszczenia) do odrębnego postępowania" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "Załatwienie w okresie sprawozdawczym" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 3, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 7, 3, 1, 1, "wciecie borderAll", "załatwienie w wyniku przekazania do innej jednostki" });
            dT.Rows.Add(new Object[] { 8, 3, 1, 1, "wciecie borderAll", "w wyniku zwrotu pozwu" });
            dT.Rows.Add(new Object[] { 9, 3, 1, 1, "wciecie borderAll", "w wyniku połączenia do wspólnego rozpoznania" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "Pozostało na następny okres sprawozdawczy" });

            return dT;
        }

        #endregion dzial 5

        #region dzial 5.1

        private DataTable naglowekTabeliDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center ", "Sprawy z zakresu ubezpieczeń społecznych wielotomowe Liczba spraw" });

            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center ", "Liczba sędziów SR i wakujących stanowisk sędziowskich w ramach limitu (na ostatni dzień okresu statystycznego)" });

            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center ", "Liczba sędziów SR i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center ", "Obsada średnio-okresowa (sędziowie SO) z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP oraz sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym lub niepełnym wymiarze w SA czy też wykonujących czynności orzecznicze na mocy ustawy i delegowanych do pełnienia czynności orzeczniczych w pełnym  lub niepełnym wymiarze w innym SR czy SR" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center ", "Liczba sędziów SR z wyłączeniem sędziów funkcyjnych, delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości , KSSiP oraz sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym lub niepełnym wymiarze w SA czy też wykonujących czynności orzecznicze na mocy ustawy i delegowanych do pełnienia czynności orzeczniczych w pełnym  lub niepełnym wymiarze w innym SR czy SR" });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center ", "Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA" });
            dT.Rows.Add(new Object[] { 1, 9, 1, 1, "center ", "Liczba  sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SA" });
            dT.Rows.Add(new Object[] { 1, 10, 1, 1, "center ", "Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w SA" });
            dT.Rows.Add(new Object[] { 1, 11, 1, 1, "center ", "Liczba  sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze  czy też wykonujących czynności orzecznicze na mocy ustawy w SA" });
            dT.Rows.Add(new Object[] { 1, 12, 1, 1, "center ", "Obsada średniookresowa sędziów SR  w ramach limitu  delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości" });
            dT.Rows.Add(new Object[] { 1, 13, 1, 1, "center ", "Liczba sędziów SR delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości" });
            dT.Rows.Add(new Object[] { 1, 14, 1, 1, "center ", "Obsada średniookresowa sędziów SR  w  ramach limitu delegowanych do pełnienia czynności w Krajowej Szkole Sądownictwa i Prokuratury" });
            dT.Rows.Add(new Object[] { 1, 15, 1, 1, "center ", "Liczba sędziów SR delegowanych do pełnienia czynności w Krajowej Szkole Sądownictwa i Prokuratury" });
            dT.Rows.Add(new Object[] { 1, 16, 1, 1, "center ", "Obsada sędziów SA delegowanych do pełnienia  czynności orzeczniczych w pełnym  lub niepełnym wymiarze w SO" });
            dT.Rows.Add(new Object[] { 1, 17, 1, 1, "center ", "Liczba sędziów SA delegowanych do pełnienia   czynności orzeczniczych w pełnym  lub niepełnym wymiarze w   SO" });
            dT.Rows.Add(new Object[] { 1, 18, 1, 1, "center ", "Obsada sędziów  SR delegowanych do pełnienia  czynności orzeczniczych w pełnym wymiarze w SR" });
            dT.Rows.Add(new Object[] { 1, 19, 1, 1, "center ", "Liczba sędziów SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w  SR" });
            dT.Rows.Add(new Object[] { 1, 20, 1, 1, "center ", "Obsada sędziów  SR delegowanych do pełnienia  czynności orzeczniczych w niepełnym wymiarze  czy też wykonujących czynności orzecznicze na mocy ustawy w SR" });
            dT.Rows.Add(new Object[] { 1, 21, 1, 1, "center ", "Liczba sędziów SR delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w  SR" });
            dT.Rows.Add(new Object[] { 1, 22, 1, 1, "center ", "Obsada sędziów danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO" });
            dT.Rows.Add(new Object[] { 1, 23, 1, 1, "center ", "Liczba sędziów  danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SO" });
            dT.Rows.Add(new Object[] { 1, 24, 1, 1, "center ", "Obsada sędziów danego SR delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO" });
            dT.Rows.Add(new Object[] { 1, 25, 1, 1, "center ", "Liczba sędziów  danego SR delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w innym SO" });
            dT.Rows.Add(new Object[] { 1, 26, 1, 1, "center ", "Obsada sędziów innego SR delegowanych do pełnienia  czynności orzeczniczych w pełnym  lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO" });
            dT.Rows.Add(new Object[] { 1, 27, 1, 1, "center ", "Liczba sędziów innego SR delegowanych do pełnienia   czynności orzeczniczych w  pełnym  lun niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy w danym SO" });
            dT.Rows.Add(new Object[] { 1, 28, 1, 1, "center ", "Obsada średnio-okresowa (sędziowie funkcyjni SO) I wersja" });
            dT.Rows.Add(new Object[] { 1, 29, 1, 1, "center ", "Obsada średniookresowa (sędziowie funkcyjni SO) II wersja" });
            dT.Rows.Add(new Object[] { 1, 30, 1, 1, "center ", "Liczba sędziów SO- funkcyjnych  tego sądu w ramach limitu na ostatni dzień okresu statystycznego" });
            dT.Rows.Add(new Object[] { 1, 31, 1, 1, "center ", "Liczba sędziów SO- funkcyjnych  tego sądu w ramach limitu w okresie statystycznym" });
            dT.Rows.Add(new Object[] { 1, 32, 1, 1, "center ", "Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze) " });
            dT.Rows.Add(new Object[] { 1, 33, 1, 1, "center ", "Liczba  sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze" });
            dT.Rows.Add(new Object[] { 1, 34, 1, 1, "center ", "Obsada średniookresowa (sędziowie SR delegowani w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w  niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy) " });
            dT.Rows.Add(new Object[] { 1, 35, 1, 1, "center ", "Liczba  sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w  niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy" });
            dT.Rows.Add(new Object[] { 1, 36, 1, 1, "center ", "Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp" });
            dT.Rows.Add(new Object[] { 1, 37, 1, 1, "center ", "Liczba sędziów SR delegowanych w trybie art. 77 § 8 i 9 usp" });
            dT.Rows.Add(new Object[] { 1, 38, 1, 1, "center ", "Łączna liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) sędziów SR z wyłączeniem sędziów funkcyjnych  sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze, czy też wykonujących czynności orzecznicze na mocy ustawy sędziów SR delegowanych do pełnienia  czynności orzeczniczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP" });
            dT.Rows.Add(new Object[] { 1, 39, 1, 1, "center ", "Średniookresowa liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) jednego sędziego SR z wyłączeniem sędziów funkcyjnych  sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze na mocy ustawy,  sędziów SR delegowanych do pełnienia  czynności orzeczniczych do innego i z innego sądu okręgowego lub do SR czy też delegowanych w trybie art. 77 § 9 usp i i sędziów delegowanych do MS, KSSiP" });
            dT.Rows.Add(new Object[] { 1, 40, 1, 1, "center ", "Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego)" });
            dT.Rows.Add(new Object[] { 1, 41, 1, 1, "center ", "Liczba obsadzonych etatów (w okresie statystycznym)" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Sędziowie z wydziałów gospodarczych (z wyłączeniem wydziałów dla spraw upadłościowych i naprawczych" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "    w tym  sędziowie orzekający w sprawach upadłościowych i restrukturyzacyjnych   w ramach wydziału gospodarczego" });

            return dT;
        }

        #endregion dzial 5.1

        #region dzial 5.2

        private DataTable naglowekTabeliDzialu_5_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Treść" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center ", "Liczba według limitu etatów na ostatni dzień okresu statystycznego" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center ", "w tym liczba według limitu etatów świadczących usługi na rzecz e-sądu" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center ", "Liczba według limitu etatów w okresie statystycznym" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center ", "Obsada średniookresowa" });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center ", "W tym obsada osób świadczących usługi na rzecz e-sądu" });
            dT.Rows.Add(new Object[] { 1, 9, 1, 1, "center ", "Liczba obsadzonych etatów na ostatni dzień okresu statystycznego" });
            dT.Rows.Add(new Object[] { 1, 10, 1, 1, "center ", "Liczba obsadzonych etatów w okresie statystycznym)" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Referendarze" });

            dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "pracownicy administracyjni" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "urzędnicy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "asystenci sędziów" });
            dT.Rows.Add(new Object[] { 4, 1, 2, 1, "wciecie borderAll", "Inni pracownicy" });

            return dT;
        }

        #endregion dzial 5.2

        #region dzial 6.1

        private DataTable naglowekTabeliDzialu_6_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Sprawy wg repertoriów" });
            dT.Rows.Add(new Object[] { 1, 3, 4, 1, "center ", "Liczba powołanych biegłych" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center ", "Razem (kol. 2-4)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center ", "biegli sądowi" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center ", "biegli spoza listy" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center ", "inne  podmioty" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_6_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Ogółem " });

            dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "GC" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "GNs" });

            return dT;
        }

        #endregion dzial 6.1

        #region dzial 6.2

        private DataTable naglowekTabeliDzialu_6_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 3, "center", "Sprawy wg repertoriów" });
            dT.Rows.Add(new Object[] { 1, 3, 8, 1, "center ", "Liczba sporządzonych opinii" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 2, "center col_120", "razem (kol.1= 2 do 5 = 6 do 8)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 2, "center col_120", "w ustalonym terminie" });
            dT.Rows.Add(new Object[] { 2, 5, 3, 1, "center col_120 ", "po ustalonym terminie" });
            dT.Rows.Add(new Object[] { 2, 9, 3, 1, "center col_120", "wg czasu wydania opinii" });

            dT.Rows.Add(new Object[] { 3, 5, 1, 1, "center col_120", "do 30 dni" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_120", "pow. 1 do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, "center col_120", "pow. 3 miesięcy" });
            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_120", "do 30 dni" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_120", "pow. 1 do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_120", "pow. 3 miesięcy" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_6_2()
        {
            return tabelaBocznaDzialu_6_1();
        }

        #endregion dzial 6.2

        #region dzial 6.3

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        private DataTable naglowekTabeliDzialu_6_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Sprawy wg repertoriów" });
            dT.Rows.Add(new Object[] { 1, 3, 4, 1, "center ", "Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku" });
            dT.Rows.Add(new Object[] { 1, 8, 4, 1, "center ", "Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_120", "razem (kol.2-4)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "do 14 dni" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120 ", "pow. 14 do 30 dni" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "razem powyżej miesiąca (kol. 9-12)" });

            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "pow. 1 do 2 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "pow. 2 do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120 ", "pow. 3 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_120", "pow. 6 miesięcy" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_6_3()
        {
            return tabelaBocznaDzialu_6_1();
        }

        #endregion dzial 6.3
    }
}