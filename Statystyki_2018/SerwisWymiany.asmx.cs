using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.Services;

namespace Statystyki_2018
{
    /// <summary>
    /// Summary
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
    [System.Web.Script.Services.ScriptService]
    public class SerwisWymiany : System.Web.Services.WebService
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        public class Zapytanie
        {
            public String nrWydzialu;
            public String repertorium;
            public int NumerSprawy;
            public int RokSprawy;
            public String RodzajSprawy;
            public String connection;
            public String kwerenda;
            public String DataZapytania;
        }

        public class Odpowiedz
        {
            public String nrWydzialu;
            public String repertorium;
            public int NumerSprawy;
            public int RokSprawy;
            public String dataOrzeczenia;
            public byte[] msword;
            public String Rodzaj;
        }

        [WebMethod]
        public DataTable DaneWXml(string NrWydzialu, string repertorium, int nrSprawy, string rodzaj, string connection, int rok, string kwerendaZapytujaca)
        {
            // zapis zapytania
            Zapytanie zapytanie = new Zapytanie();
            zapytanie.nrWydzialu = NrWydzialu;
            zapytanie.repertorium = repertorium;
            zapytanie.NumerSprawy = nrSprawy;
            zapytanie.RodzajSprawy = rodzaj;
            zapytanie.connection = connection;
            zapytanie.kwerenda = kwerendaZapytujaca;
            zapytanie.DataZapytania = DateTime.Now.ToString();
            System.Xml.Serialization.XmlSerializer writer =
                new System.Xml.Serialization.XmlSerializer(typeof(Zapytanie));

            string path = Server.MapPath("Wymiana\\Temp\\zapytanie") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";

            System.IO.FileStream file = System.IO.File.Create(path);

            writer.Serialize(file, zapytanie);
            file.Close();

            DataTable parametry2 = cm.makeParameterTable();
            //@wydzial, @rep, @numer, @rok
            parametry2.Rows.Add("@wydzial", NrWydzialu);
            parametry2.Rows.Add("@rep", repertorium);
            parametry2.Rows.Add("@numer", nrSprawy);
            parametry2.Rows.Add("@rok", rok);
            DataTable odpowiedz = cm.getDataTable(kwerendaZapytujaca, connection, parametry2, "wymiana serwer");

            if (odpowiedz == null)
            {
                cm.log.Error("Wymiana serwer: Brak wyników kwerendy zapytania");
                //  return "Wymiana serwer: Brak wyników kwerendy zapytania";
            }
            cm.log.Info("Wymiana serwer: Ilość rekodrów odczytanych: " + odpowiedz.Rows.Count.ToString());

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.AppendLine("<Odpowiedz>");
            foreach (DataRow item in odpowiedz.Rows)
            {
                var cos2 = (Byte[])item[5];

                StringBuilder cos4 = new StringBuilder();
                foreach (var bajt in cos2)
                {
                    var cos5 = bajt.ToString("X");
                    cos4.Append(cos5);
                }

                //File.ReadAllBytes
                stringBuilder.AppendLine("<wiersz>");
                stringBuilder.AppendLine("<wydzial>" + item[0] + "</wydzial>");
                stringBuilder.AppendLine("<repertorium>" + item[1] + "</repertorium>");

                stringBuilder.AppendLine("<numer>" + item[2] + " </numer>");
                stringBuilder.AppendLine("<rok> " + item[3] + " </rok>");
                stringBuilder.AppendLine("<dataOrzeczenia> " + item[4] + " </dataOrzeczenia>");
                stringBuilder.AppendLine("<msword> " + cos4 + " </msword>");
                stringBuilder.AppendLine("<rodzaj> " + item[6] + " </rodzaj>");

                stringBuilder.AppendLine("</wiersz>");
            }
            stringBuilder.AppendLine("</Odpowiedz>");
            string pathODP = Server.MapPath("Wymiana\\Temp\\odpowiedz_") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";
            System.IO.File.WriteAllText(pathODP, stringBuilder.ToString());
            return odpowiedz;
        }

        [WebMethod]
        public string Wymiana2XML(string NrWydzialu, string repertorium, string nrSprawy, string rodzaj, string rok, string zestawZapytujacy)
        {
            cm.log.Info("Wymiana 2 serwer: Wywołanie procedury odczytu danych  ");

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = rok.Split(stringSeparators, StringSplitOptions.None);

            NrWydzialu = stTab[0];
            repertorium = stTab[1];
            nrSprawy = stTab[2];
            rok = stTab[3];

            string[] stringSeparatorsKW = new string[] { "#" };
            string[] stTabKW = null;
            string ZestaKW_SC_00 = string.Empty;
            string ZestaKW_SC_01 = string.Empty;
            string ZestaKW_SC_02 = string.Empty;
            string ZestaKW_SC_03 = string.Empty;
            string ZestaKW_SC_04 = string.Empty;
            string ZestaKW_SC_05 = string.Empty;
            string ZestaKW_SC_06 = string.Empty;
            string ZestaKW_SC_07 = string.Empty;
            string ZestaKW_SC_08 = string.Empty;

            stTabKW = zestawZapytujacy.Split(stringSeparatorsKW, StringSplitOptions.None);
            StringBuilder Zapytania = new StringBuilder();
            Zapytania.AppendLine("  <?xml version='1.0' encoding='utf-8'?> ");
            Zapytania.AppendLine("<!—nagłówek XML-- > ");
            Zapytania.AppendLine("<Zapytania version='1' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>");
            try
            {
                ZestaKW_SC_00 = stTabKW[0];
                ZestaKW_SC_01 = stTabKW[1];
                ZestaKW_SC_02 = stTabKW[2];
                ZestaKW_SC_03 = stTabKW[3];
                ZestaKW_SC_04 = stTabKW[4];
                ZestaKW_SC_05 = stTabKW[5];
                ZestaKW_SC_06 = stTabKW[6];
                ZestaKW_SC_07 = stTabKW[7];
                ZestaKW_SC_08 = stTabKW[8];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return string.Empty;
            }

            for (int i = 0; i < 9; i++)
            {
                Zapytania.AppendLine("<zapytanie> ");
                string[] daneZapytan = wyciagnijDane(stTabKW[i]);
                try
                {
                    Zapytania.AppendLine("<id> " + daneZapytan[0] + "</id >");
                    Zapytania.AppendLine("<kwerenda> " + daneZapytan[1] + "</kwerenda >");
                    Zapytania.AppendLine("<connectionString> " + daneZapytan[2] + "</connectionString >");
                }
                catch (Exception ex)
                {
                    cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                    return null;
                }
                Zapytania.AppendLine("</zapytanie> ");
            }
            Zapytania.AppendLine("</Zapytania> ");
            string pathZDP = Server.MapPath("Wymiana2\\Zapytania\\Zapytanie_server2_") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";
            System.IO.File.WriteAllText(pathZDP, Zapytania.ToString());

            //sprawy
            DataTable dTsprawy = new DataTable();
            if (!string.IsNullOrEmpty(ZestaKW_SC_00))
            {
                dTsprawy = Sprawy(NrWydzialu, repertorium, rodzaj, int.Parse(nrSprawy), int.Parse(rok), ZestaKW_SC_00);
            }

            if (dTsprawy == null)
            {
                return string.Empty;
            }
            DataSet dSetStronyZeSprawy = new DataSet();
            List<int> id_sprawy = new List<int>();
            StringBuilder plikXML = new StringBuilder();
            plikXML.AppendLine("<?xml version='1.0' encoding='utf-8'?> ");
            plikXML.AppendLine("<!—nagłówek XML-- > ");
            plikXML.AppendLine("<Sprawy version='1' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>");

            foreach (DataRow wierszZdanymiSpraw in dTsprawy.Rows)
            {
                plikXML.AppendLine("<Sprawa> ");

                int idSprawy = int.Parse(wierszZdanymiSpraw[0].ToString());
                string SprawaRepertorium = (wierszZdanymiSpraw[1].ToString()); // repertorium
                string SprawaNumer = (wierszZdanymiSpraw[2].ToString()); // numer
                string SprawaData_wpl1 = (wierszZdanymiSpraw[3].ToString()); // data_wpl1
                string SprawaData_wpl2 = (wierszZdanymiSpraw[4].ToString()); // data_wpl2
                string SprawaRok = (wierszZdanymiSpraw[5].ToString()); // rok
                string SprawaData_zakrk = (wierszZdanymiSpraw[6].ToString()); // data_zakr
                string SprawaSymbol = (wierszZdanymiSpraw[7].ToString()); // symbol
                string SprawaNr_prok = (wierszZdanymiSpraw[8].ToString()); // nr_prok
                string SprawaRozstrzygniecie = (wierszZdanymiSpraw[9].ToString()); // rozstrzygniecie
                string SprawaOpis = (wierszZdanymiSpraw[10].ToString()); // Opis
                string SprawaSygnatura = (wierszZdanymiSpraw[11].ToString()); // Sygnatura
                string SprawaNrProkuratury = (wierszZdanymiSpraw[12].ToString()); // Sygnatura

                plikXML.AppendLine("<Sprawa_ident>" + idSprawy + "</Sprawa_ident>");
                plikXML.AppendLine("<repertorium>" + SprawaRepertorium + "</repertorium>");
                plikXML.AppendLine("<numer>" + SprawaNumer + "</numer>");
                plikXML.AppendLine("<data_wpl1>" + SprawaData_wpl1 + "</data_wpl1>");
                plikXML.AppendLine("<data_wpl2>" + SprawaData_wpl2 + "</data_wpl2>");
                plikXML.AppendLine("<rok>" + SprawaRok + "</rok>");
                plikXML.AppendLine("<data_zakr>" + SprawaData_zakrk + "</data_zakr>");
                plikXML.AppendLine("<rozstrzygniecie>" + SprawaRozstrzygniecie + "</rozstrzygniecie>");
                plikXML.AppendLine("<Opis>" + SprawaOpis + "</Opis>");
                plikXML.AppendLine("<symbol>" + SprawaSymbol + "</symbol>");
                plikXML.AppendLine("<Sygnatura>" + SprawaSygnatura + "</Sygnatura>");
                plikXML.AppendLine("<NrProkuratury>" + SprawaNrProkuratury + "</NrProkuratury>");

                /*============================ Strony =====================================*/
                plikXML.AppendLine("<Strony>");

                DataTable dTSprawyStrony = SprawyStrony(idSprawy, ZestaKW_SC_01);
                if (dTSprawyStrony != null)
                {
                    foreach (DataRow SprawyStronyWierszDanych in dTSprawyStrony.Rows)
                    {
                        plikXML.AppendLine("<Strona>");

                        string StronyIdent = SprawyStronyWierszDanych[1].ToString();
                        string StronySprawyStatus = SprawyStronyWierszDanych[1].ToString();
                        string StronySprawyOsobaFizyczna = SprawyStronyWierszDanych[2].ToString();
                        string StronyImie = SprawyStronyWierszDanych[3].ToString();
                        string StronyNazwisko = SprawyStronyWierszDanych[4].ToString();
                        string StronyKwalifikacja = SprawyStronyWierszDanych[5].ToString();
                        string StronyPlec = SprawyStronyWierszDanych[5].ToString();
                        string StronyAdres = SprawyStronyWierszDanych[6].ToString();//pociac na tagi
                        string StronyInstytucja = SprawyStronyWierszDanych[7].ToString();
                        string StronyNazwiskoDopelniacz = SprawyStronyWierszDanych[8].ToString();
                        string StronyImieDopelniacz = SprawyStronyWierszDanych[9].ToString();
                        string StronyPESEL = SprawyStronyWierszDanych[10].ToString();
                        string StronyImieOjca = SprawyStronyWierszDanych[11].ToString();
                        string StronyImieMatki = SprawyStronyWierszDanych[12].ToString();
                        string StronyNazwiskoRodoweMatki = SprawyStronyWierszDanych[13].ToString();
                        string StronyDataUrodzenia = SprawyStronyWierszDanych[14].ToString();
                        string StronyMiejsceUrodzenia = SprawyStronyWierszDanych[15].ToString();
                        string StronyNieletni = SprawyStronyWierszDanych[16].ToString();
                        string StronyZawodWyuczony = SprawyStronyWierszDanych[17].ToString();
                        string StronyCudzoziemiec = SprawyStronyWierszDanych[18].ToString();
                        string StronyCzyZakreslono = SprawyStronyWierszDanych[19].ToString();

                        plikXML.AppendLine("<ident>" + StronyIdent + "</ident>");
                        plikXML.AppendLine("<Status>" + StronySprawyStatus + "</Status>");
                        plikXML.AppendLine("<OsobaFizyczna>" + StronySprawyOsobaFizyczna + "</OsobaFizyczna>");
                        plikXML.AppendLine("<Imie>" + StronyImie + "</Imie>");
                        plikXML.AppendLine("<Nazwisko>" + StronyNazwisko + "</Nazwisko>");
                        plikXML.AppendLine("<Kwalifikacja>" + StronyKwalifikacja + "</Kwalifikacja>");
                        plikXML.AppendLine("<Plec>" + StronyPlec + "</Plec>");
                        plikXML.AppendLine("<Adres>" + StronyAdres + "</Adres>");
                        plikXML.AppendLine("<Instytucja>" + StronyInstytucja + "</Instytucja>");
                        plikXML.AppendLine("<NazwiskoDopelniacz>" + StronyNazwiskoDopelniacz + "</NazwiskoDopelniacz>");
                        plikXML.AppendLine("<ImieDopelniacz>" + StronyImieDopelniacz + "</ImieDopelniacz>");
                        plikXML.AppendLine("<PESEL>" + StronyPESEL + "</PESEL>");
                        plikXML.AppendLine("<ImieOjca>" + StronyImieOjca + "</ImieOjca>");
                        plikXML.AppendLine("<ImieMatki>" + StronyImieMatki + "</ImieMatki>");
                        plikXML.AppendLine("<NazwiskoRodoweMatki>" + StronyNazwiskoRodoweMatki + "</NazwiskoRodoweMatki>");
                        plikXML.AppendLine("<DataUrodzenia>" + StronyDataUrodzenia + "</DataUrodzenia>");
                        plikXML.AppendLine("<MiejsceUrodzenia>" + StronyMiejsceUrodzenia + "</MiejsceUrodzenia>");
                        plikXML.AppendLine("<Nieletni>" + StronyNieletni + "</Nieletni>");
                        plikXML.AppendLine("<ZawodWyuczony>" + StronyZawodWyuczony + "</ZawodWyuczony>");
                        plikXML.AppendLine("<Cudzoziemiec>" + StronyCudzoziemiec + "</Cudzoziemiec>");
                        plikXML.AppendLine("<CzyZakreslono>" + StronyIdent + "</CzyZakreslono>");
                        plikXML.AppendLine("</Strona>");
                    }
                }

                id_sprawy.Add(idSprawy);
                plikXML.AppendLine("</Strony>");
                /*============================ eof Strony =====================================*/
                /*============================ inne Strony =====================================*/
                plikXML.AppendLine("<InneStrony>");

                DataTable dTSprawyInneStrony = InneStronyZeSprawy(idSprawy, ZestaKW_SC_05);
                if (dTSprawyInneStrony != null)
                {
                    foreach (DataRow SprawyInneStronyWierszDanych in dTSprawyInneStrony.Rows)
                    {
                        plikXML.AppendLine("<InnaStrona>");

                        string StronyInneIdent = SprawyInneStronyWierszDanych[0].ToString();
                        string StronySprawyInneStatus = SprawyInneStronyWierszDanych[1].ToString();

                        string StronyInneSprawyOsobaFizyczna = SprawyInneStronyWierszDanych[2].ToString();
                        string StronyInneImie = SprawyInneStronyWierszDanych[3].ToString();
                        string StronyInneNazwisko = SprawyInneStronyWierszDanych[4].ToString();
                        string StronyInnePlec = SprawyInneStronyWierszDanych[5].ToString();
                        string StronyInneAdres = SprawyInneStronyWierszDanych[6].ToString();//pociac na tagi
                        string StronyInneInstytucja = SprawyInneStronyWierszDanych[7].ToString();
                        string StronyInneNazwiskoDopelniacz = SprawyInneStronyWierszDanych[8].ToString();
                        string StronyInneImieDopelniacz = SprawyInneStronyWierszDanych[9].ToString();
                        string StronyInnePESEL = SprawyInneStronyWierszDanych[10].ToString();
                        string StronyCzyZakreslono = SprawyInneStronyWierszDanych[19].ToString();

                        plikXML.AppendLine("<ident>" + StronyInneIdent + "</ident>");
                        plikXML.AppendLine("<Status>" + StronySprawyInneStatus + "</Status>");
                        plikXML.AppendLine("<OsobaFizyczna>" + StronyInneSprawyOsobaFizyczna + "</OsobaFizyczna>");
                        plikXML.AppendLine("<Imie>" + StronyInneImie + "</Imie>");
                        plikXML.AppendLine("<Nazwisko>" + StronyInneNazwisko + "</Nazwisko>");
                        plikXML.AppendLine("<Plec>" + StronyInnePlec + "</Plec>");
                        plikXML.AppendLine("<Adres>" + StronyInneAdres + "</Adres>");
                        plikXML.AppendLine("<Instytucja>" + StronyInneInstytucja + "</Instytucja>");
                        plikXML.AppendLine("<NazwiskoDopelniacz>" + StronyInneNazwiskoDopelniacz + "</NazwiskoDopelniacz>");
                        plikXML.AppendLine("<ImieDopelniacz>" + StronyInneImieDopelniacz + "</ImieDopelniacz>");

                        plikXML.AppendLine("<PESEL>" + StronyInnePESEL + "</PESEL>");
                        plikXML.AppendLine("<CzyZakreslono>" + StronyCzyZakreslono + "</CzyZakreslono>");
                        plikXML.AppendLine("</InnaStrona>");
                    }
                }
                plikXML.AppendLine("</InneStrony>");
                /*============================ eof inne Strony =====================================*/

                /*============================ Sąd =====================================*/
                plikXML.AppendLine("<Sady>");
                DataTable dTSprawySad = SprawySad(idSprawy, ZestaKW_SC_02);
                if (dTSprawySad != null)
                {
                    foreach (DataRow SprawySad in dTSprawySad.Rows)
                    {
                        plikXML.AppendLine("<Sad>");

                        string SadNazwa = SprawySad[0].ToString();
                        string NrSadu = SprawySad[1].ToString();

                        string NrWydzialuSadu = SprawySad[2].ToString();
                        string NazwaWydzialu = SprawySad[3].ToString();
                        string NazwaSerweraSadu = SprawySad[4].ToString();

                        plikXML.AppendLine("<Nazwa>" + SadNazwa + "</Nazwa>");
                        plikXML.AppendLine("<NrSadu>" + NrSadu + "</NrSadu>");
                        plikXML.AppendLine("<NrWydzialu>" + NrWydzialuSadu + "</NrWydzialu>");
                        plikXML.AppendLine("<NazwaWydzialu>" + NazwaWydzialu + "</NazwaWydzialu>");
                        plikXML.AppendLine("<NazwaSerwera>" + NazwaSerweraSadu + "</NazwaSerwera>");

                        plikXML.AppendLine("</Sad>");
                    }
                }
                plikXML.AppendLine("</Sady>");
                /*============================ eof Sąd =====================================*/

                /*============================ referent =====================================*/

                plikXML.AppendLine("<Referenci>");

                DataTable dTSprawyReferent = SprawyReferent(idSprawy, ZestaKW_SC_03);
                if (dTSprawyReferent != null)
                {
                    foreach (DataRow referent in dTSprawyReferent.Rows)
                    {
                        plikXML.AppendLine("<referent>");

                        string Referent_Ident = referent[0].ToString();
                        string Tytul = referent[1].ToString();

                        string Imie = referent[2].ToString();
                        string Nazwisko = referent[3].ToString();
                        string Stanowisko = referent[4].ToString();
                        string Funkcja = referent[5].ToString();

                        plikXML.AppendLine("<Referent_Ident>" + Referent_Ident + "</Referent_Ident>");
                        plikXML.AppendLine("<Tytul>" + Tytul + "</Tytul>");
                        plikXML.AppendLine("<Imie>" + Imie + "</Imie>");
                        plikXML.AppendLine("<Nazwisko>" + Nazwisko + "</Nazwisko>");
                        plikXML.AppendLine("<Funkcja>" + Funkcja + "</Funkcja>");

                        plikXML.AppendLine("</referent>");
                    }
                }
                plikXML.AppendLine("</Referenci>");

                /*============================ eof referent =====================================*/
                /*============================ eof Orzeczenia =====================================*/
                /*============================ eof Wyrok =====================================*/
                plikXML.AppendLine("<Orzeczenia>");

                DataTable dTSprawyWyrok = Wyrok(idSprawy, ZestaKW_SC_07);
                plikXML.AppendLine("<OrzeczeniaWyrok>");
                if (dTSprawyWyrok != null)
                {
                    foreach (DataRow wyrok in dTSprawyWyrok.Rows)
                    {
                        plikXML.AppendLine("<wyrok>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<Rodzaj>" + rodzajOrzeczenia + "</Rodzaj>");
                        plikXML.AppendLine("<Data>" + Data + "</Data>");
                        plikXML.AppendLine("<Nazwa>" + Nazwa + "</Nazwa>");
                        plikXML.AppendLine("<TrescSentencji>" + TrescSentencji + "</TrescSentencji>");

                        plikXML.AppendLine("</wyrok>");
                    }
                }
                plikXML.AppendLine("</OrzeczeniaWyrok>");
                DataTable dTSprawyPostanowienie = Postanowienie(idSprawy, ZestaKW_SC_08);
                plikXML.AppendLine("<OrzeczeniaPostanowienie>");
                if (dTSprawyPostanowienie != null)
                {
                    foreach (DataRow wyrok in dTSprawyPostanowienie.Rows)
                    {
                        plikXML.AppendLine("<Postanowienie>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<Rodzaj>" + rodzajOrzeczenia + "</Rodzaj>");
                        plikXML.AppendLine("<Data>" + Data + "</Data>");
                        plikXML.AppendLine("<Nazwa>" + Nazwa + "</Nazwa>");
                        plikXML.AppendLine("<TrescSentencji>" + TrescSentencji + "</TrescSentencji>");

                        plikXML.AppendLine("</Postanowienie>");
                    }
                }
                plikXML.AppendLine("</OrzeczeniaPostanowienie>");
                DataTable dTSprawyProtokol = Protokol(idSprawy, ZestaKW_SC_08);
                plikXML.AppendLine("<OrzeczeniaProtokol>");
                if (dTSprawyProtokol != null)
                {
                    foreach (DataRow wyrok in dTSprawyProtokol.Rows)
                    {
                        plikXML.AppendLine("<Protokol>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<Rodzaj>" + rodzajOrzeczenia + "</Rodzaj>");
                        plikXML.AppendLine("<Data>" + Data + "</Data>");
                        plikXML.AppendLine("<Nazwa>" + Nazwa + "</Nazwa>");
                        plikXML.AppendLine("<TrescSentencji>" + TrescSentencji + "</TrescSentencji>");

                        plikXML.AppendLine("</Protokol>");
                    }
                }
                plikXML.AppendLine("</OrzeczeniaProtokol>");
                plikXML.AppendLine("</Orzeczenia>");
            }

           
            plikXML.AppendLine("</Sprawy>");
           
            try
            {
                string pathODP = Server.MapPath("Wymiana2\\Odpowiedzi\\odpowiedz_") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";
                System.IO.File.WriteAllText(pathODP, plikXML.ToString());
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana odczyt danych: " + ex.Message);
              
            }
            return plikXML.ToString();
        }

        private DataTable Sprawy(string wydzial, string repertorium, string rodzaj, int numer, int rok, string kwerendaZapytujacaIConnectionString)
        {
           

            string odpowiedz = string.Empty;
            string SprawyKwerenda = string.Empty;
            string SprawyConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                SprawyKwerenda = stTab[1];
                SprawyConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@id_dzialu", wydzial);
            parametry.Rows.Add("@rok", rok);
            parametry.Rows.Add("@rep", repertorium);
            parametry.Rows.Add("@numer", numer);
            DataTable dT1 = cm.getDataTable(SprawyKwerenda, SprawyConnectionString, parametry, "Wymiana 2 - sprawy");

            return dT1;
        }

        private DataTable SprawyStrony(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - Strony sprawy");

            return dT1;
        }

        private string[] wyciagnijDane(string dane)
        {
            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = dane.Split(stringSeparators, StringSplitOptions.None);
            return stTab;
        }

        private string AdresyStron(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }

        private DataTable InneStronyZeSprawy(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - inne Strony ZeS prawy");

            return dT1;
        }

        private DataTable SprawySad(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - sąd");

            return dT1;
        }

        private DataTable SprawyReferent(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - referent");

            return dT1;
        }

        private DataTable Wyrok(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - referent");

            return dT1;
        }

        private DataTable Postanowienie(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - referent");

            return dT1;
        }

        private DataTable Protokol(int id_sprawy, string kwerendaZapytujacaIConnectionString)
        {
            string Kwerenda = string.Empty;
            string ConnectionString = string.Empty;

            string[] stringSeparators = new string[] { "|" };
            string[] stTab = null;

            stTab = kwerendaZapytujacaIConnectionString.Split(stringSeparators, StringSplitOptions.None);
            try
            {
                Kwerenda = stTab[1];
                ConnectionString = stTab[2];
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami " + ex.Message);
                return null;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", id_sprawy);

            DataTable dT1 = cm.getDataTable(Kwerenda, ConnectionString, parametry, "Wymiana 2 - referent");

            return dT1;
        }
    }
}