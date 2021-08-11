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
            Zapytania.AppendLine("<ms:Zapytania version='1' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>");
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
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami");
                return string.Empty;
            }

            for (int i = 0; i < 9; i++)
            {
                Zapytania.AppendLine("<ms:zapytanie> ");
                string[] daneZapytan = wyciagnijDane(stTabKW[i]);
                try
                {
                    Zapytania.AppendLine("<ms:id> " + daneZapytan[0] + "</ms:id >");
                    Zapytania.AppendLine("<ms:kwerenda> " + daneZapytan[1] + "</ms:kwerenda >");
                    Zapytania.AppendLine("<ms:connectionString> " + daneZapytan[2] + "</ms:connectionString >");
                }
                catch (Exception ex)
                {
                    cm.log.Error("Wymiana  serwer 1: Bład kwerend z zapytaniami");
                    return null;
                }
                Zapytania.AppendLine("</ms:zapytanie> ");
            }
            Zapytania.AppendLine("</ms:Zapytania> ");
            string pathZDP = Server.MapPath("Wymiana2\\Zapytania\\Zapytanie_") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";
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
            plikXML.AppendLine("<ms:Sprawy version='1' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>");

            foreach (DataRow wierszZdanymiSpraw in dTsprawy.Rows)
            {
                plikXML.AppendLine("<ms:Sprawa> ");

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

                plikXML.AppendLine("<ms:Sprawa_ident>" + idSprawy + "</ms:Sprawa_ident>");
                plikXML.AppendLine("<ms:repertorium>" + SprawaRepertorium + "</ms:repertorium>");
                plikXML.AppendLine("<ms:numer>" + SprawaNumer + "</ms:numer>");
                plikXML.AppendLine("<ms:data_wpl1>" + SprawaData_wpl1 + "</ms:data_wpl1>");
                plikXML.AppendLine("<ms:data_wpl2>" + SprawaData_wpl2 + "</ms:data_wpl2>");
                plikXML.AppendLine("<ms:rok>" + SprawaRok + "</ms:rok>");
                plikXML.AppendLine("<ms:data_zakr>" + SprawaData_zakrk + "</ms:data_zakr>");
                plikXML.AppendLine("<ms:rozstrzygniecie>" + SprawaRozstrzygniecie + "</ms:rozstrzygniecie>");
                plikXML.AppendLine("<ms:Opis>" + SprawaOpis + "</ms:Opis>");
                plikXML.AppendLine("<ms:symbol>" + SprawaSymbol + "</ms:symbol>");
                plikXML.AppendLine("<ms:Sygnatura>" + SprawaSygnatura + "</ms:Sygnatura>");
                plikXML.AppendLine("<ms:NrProkuratury>" + SprawaNrProkuratury + "</ms:NrProkuratury>");

                /*============================ Strony =====================================*/
                plikXML.AppendLine("<ms:Strony>");

                DataTable dTSprawyStrony = SprawyStrony(idSprawy, ZestaKW_SC_01);
                if (dTSprawyStrony != null)
                {
                    foreach (DataRow SprawyStronyWierszDanych in dTSprawyStrony.Rows)
                    {
                        plikXML.AppendLine("<ms:Strona>");

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

                        plikXML.AppendLine("<ms:ident>" + StronyIdent + "</ms:ident>");
                        plikXML.AppendLine("<ms:Status>" + StronySprawyStatus + "</ms:Status>");
                        plikXML.AppendLine("<ms:OsobaFizyczna>" + StronySprawyOsobaFizyczna + "</ms:OsobaFizyczna>");
                        plikXML.AppendLine("<ms:Imie>" + StronyImie + "</ms:Imie>");
                        plikXML.AppendLine("<ms:Nazwisko>" + StronyNazwisko + "</ms:Nazwisko>");
                        plikXML.AppendLine("<ms:Kwalifikacja>" + StronyKwalifikacja + "</ms:Kwalifikacja>");
                        plikXML.AppendLine("<ms:Plec>" + StronyPlec + "</ms:Plec>");
                        plikXML.AppendLine("<ms:Adres>" + StronyAdres + "</ms:Adres>");
                        plikXML.AppendLine("<ms:Instytucja>" + StronyInstytucja + "</ms:Instytucja>");
                        plikXML.AppendLine("<ms:NazwiskoDopelniacz>" + StronyNazwiskoDopelniacz + "</ms:NazwiskoDopelniacz>");
                        plikXML.AppendLine("<ms:ImieDopelniacz>" + StronyImieDopelniacz + "</ms:ImieDopelniacz>");
                        plikXML.AppendLine("<ms:PESEL>" + StronyPESEL + "</ms:PESEL>");
                        plikXML.AppendLine("<ms:ImieOjca>" + StronyImieOjca + "</ms:ImieOjca>");
                        plikXML.AppendLine("<ms:ImieMatki>" + StronyImieMatki + "</ms:ImieMatki>");
                        plikXML.AppendLine("<ms:NazwiskoRodoweMatki>" + StronyNazwiskoRodoweMatki + "</ms:NazwiskoRodoweMatki>");
                        plikXML.AppendLine("<ms:DataUrodzenia>" + StronyDataUrodzenia + "</ms:DataUrodzenia>");
                        plikXML.AppendLine("<ms:MiejsceUrodzenia>" + StronyMiejsceUrodzenia + "</ms:MiejsceUrodzenia>");
                        plikXML.AppendLine("<ms:Nieletni>" + StronyNieletni + "</ms:Nieletni>");
                        plikXML.AppendLine("<ms:ZawodWyuczony>" + StronyZawodWyuczony + "</ms:ZawodWyuczony>");
                        plikXML.AppendLine("<ms:Cudzoziemiec>" + StronyCudzoziemiec + "</ms:Cudzoziemiec>");
                        plikXML.AppendLine("<ms:CzyZakreslono>" + StronyIdent + "</ms:CzyZakreslono>");
                        plikXML.AppendLine("</ms:Strona>");
                    }
                }

                id_sprawy.Add(idSprawy);
                plikXML.AppendLine("</ms:Strony>");
                /*============================ eof Strony =====================================*/
                /*============================ inne Strony =====================================*/
                plikXML.AppendLine("<ms:InneStrony>");

                DataTable dTSprawyInneStrony = InneStronyZeSprawy(idSprawy, ZestaKW_SC_05);
                if (dTSprawyInneStrony != null)
                {
                    foreach (DataRow SprawyInneStronyWierszDanych in dTSprawyInneStrony.Rows)
                    {
                        plikXML.AppendLine("<ms:InnaStrona>");

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

                        plikXML.AppendLine("<ms:ident>" + StronyInneIdent + "</ms:ident>");
                        plikXML.AppendLine("<ms:Status>" + StronySprawyInneStatus + "</ms:Status>");
                        plikXML.AppendLine("<ms:OsobaFizyczna>" + StronyInneSprawyOsobaFizyczna + "</ms:OsobaFizyczna>");
                        plikXML.AppendLine("<ms:Imie>" + StronyInneImie + "</ms:Imie>");
                        plikXML.AppendLine("<ms:Nazwisko>" + StronyInneNazwisko + "</ms:Nazwisko>");
                        plikXML.AppendLine("<ms:Plec>" + StronyInnePlec + "</ms:Plec>");
                        plikXML.AppendLine("<ms:Adres>" + StronyInneAdres + "</ms:Adres>");
                        plikXML.AppendLine("<ms:Instytucja>" + StronyInneInstytucja + "</ms:Instytucja>");
                        plikXML.AppendLine("<ms:NazwiskoDopelniacz>" + StronyInneNazwiskoDopelniacz + "</ms:NazwiskoDopelniacz>");
                        plikXML.AppendLine("<ms:ImieDopelniacz>" + StronyInneImieDopelniacz + "</ms:ImieDopelniacz>");

                        plikXML.AppendLine("<ms:PESEL>" + StronyInnePESEL + "</ms:PESEL>");
                        plikXML.AppendLine("<ms:CzyZakreslono>" + StronyCzyZakreslono + "</ms:CzyZakreslono>");
                        plikXML.AppendLine("</ms:InnaStrona>");
                    }
                }
                plikXML.AppendLine("</ms:InneStrony>");
                /*============================ eof inne Strony =====================================*/

                /*============================ Sąd =====================================*/
                plikXML.AppendLine("<ms:Sady>");
                DataTable dTSprawySad = SprawySad(idSprawy, ZestaKW_SC_02);
                if (dTSprawySad != null)
                {
                    foreach (DataRow SprawySad in dTSprawySad.Rows)
                    {
                        plikXML.AppendLine("<ms:Sad>");

                        string SadNazwa = SprawySad[0].ToString();
                        string NrSadu = SprawySad[1].ToString();

                        string NrWydzialuSadu = SprawySad[2].ToString();
                        string NazwaWydzialu = SprawySad[3].ToString();
                        string NazwaSerweraSadu = SprawySad[4].ToString();

                        plikXML.AppendLine("<ms:Nazwa>" + SadNazwa + "</ms:Nazwa>");
                        plikXML.AppendLine("<ms:NrSadu>" + NrSadu + "</ms:NrSadu>");
                        plikXML.AppendLine("<ms:NrWydzialu>" + NrWydzialuSadu + "</ms:NrWydzialu>");
                        plikXML.AppendLine("<ms:NazwaWydzialu>" + NazwaWydzialu + "</ms:NazwaWydzialu>");
                        plikXML.AppendLine("<ms:NazwaSerwera>" + NazwaSerweraSadu + "</ms:NazwaSerwera>");

                        plikXML.AppendLine("</ms:Sad>");
                    }
                }
                plikXML.AppendLine("</ms:Sady>");
                /*============================ eof Sąd =====================================*/

                /*============================ referent =====================================*/

                plikXML.AppendLine("<ms:Referenci>");

                DataTable dTSprawyReferent = SprawyReferent(idSprawy, ZestaKW_SC_03);
                if (dTSprawyReferent != null)
                {
                    foreach (DataRow referent in dTSprawyReferent.Rows)
                    {
                        plikXML.AppendLine("<ms:referent>");

                        string Referent_Ident = referent[0].ToString();
                        string Tytul = referent[1].ToString();

                        string Imie = referent[2].ToString();
                        string Nazwisko = referent[3].ToString();
                        string Stanowisko = referent[4].ToString();
                        string Funkcja = referent[5].ToString();

                        plikXML.AppendLine("<ms:Referent_Ident>" + Referent_Ident + "</ms:Referent_Ident>");
                        plikXML.AppendLine("<ms:Tytul>" + Tytul + "</ms:Tytul>");
                        plikXML.AppendLine("<ms:Imie>" + Imie + "</ms:Imie>");
                        plikXML.AppendLine("<ms:Nazwisko>" + Nazwisko + "</ms:Nazwisko>");
                        plikXML.AppendLine("<ms:Funkcja>" + Funkcja + "</ms:Funkcja>");

                        plikXML.AppendLine("</ms:referent>");
                    }
                }
                plikXML.AppendLine("</ms:Referenci>");

                /*============================ eof referent =====================================*/
                /*============================ eof Orzeczenia =====================================*/
                /*============================ eof Wyrok =====================================*/
                plikXML.AppendLine("<ms:Orzeczenia>");

                DataTable dTSprawyWyrok = Wyrok(idSprawy, ZestaKW_SC_07);
                plikXML.AppendLine("<ms:OrzeczeniaWyrok>");
                if (dTSprawyWyrok != null)
                {
                    foreach (DataRow wyrok in dTSprawyWyrok.Rows)
                    {
                        plikXML.AppendLine("<ms:wyrok>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<ms:Rodzaj>" + rodzajOrzeczenia + "</ms:Rodzaj>");
                        plikXML.AppendLine("<ms:Data>" + Data + "</ms:Data>");
                        plikXML.AppendLine("<ms:Nazwa>" + Nazwa + "</ms:Nazwa>");
                        plikXML.AppendLine("<ms:TrescSentencji>" + TrescSentencji + "</ms:TrescSentencji>");

                        plikXML.AppendLine("</ms:wyrok>");
                    }
                }
                plikXML.AppendLine("</ms:OrzeczeniaWyrok>");
                DataTable dTSprawyPostanowienie = Postanowienie(idSprawy, ZestaKW_SC_08);
                plikXML.AppendLine("<ms:OrzeczeniaPostanowienie>");
                if (dTSprawyPostanowienie != null)
                {
                    foreach (DataRow wyrok in dTSprawyPostanowienie.Rows)
                    {
                        plikXML.AppendLine("<ms:Postanowienie>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<ms:Rodzaj>" + rodzajOrzeczenia + "</ms:Rodzaj>");
                        plikXML.AppendLine("<ms:Data>" + Data + "</ms:Data>");
                        plikXML.AppendLine("<ms:Nazwa>" + Nazwa + "</ms:Nazwa>");
                        plikXML.AppendLine("<ms:TrescSentencji>" + TrescSentencji + "</ms:TrescSentencji>");

                        plikXML.AppendLine("</ms:Postanowienie>");
                    }
                }
                plikXML.AppendLine("</ms:OrzeczeniaPostanowienie>");
                DataTable dTSprawyProtokol = Protokol(idSprawy, ZestaKW_SC_08);
                plikXML.AppendLine("<ms:OrzeczeniaProtokol>");
                if (dTSprawyProtokol != null)
                {
                    foreach (DataRow wyrok in dTSprawyProtokol.Rows)
                    {
                        plikXML.AppendLine("<ms:Protokol>");

                        string rodzajOrzeczenia = wyrok[0].ToString();
                        string Data = wyrok[1].ToString();

                        string Nazwa = wyrok[2].ToString();
                        string TrescSentencji = wyrok[3].ToString();

                        plikXML.AppendLine("<ms:Rodzaj>" + rodzajOrzeczenia + "</ms:Rodzaj>");
                        plikXML.AppendLine("<ms:Data>" + Data + "</ms:Data>");
                        plikXML.AppendLine("<ms:Nazwa>" + Nazwa + "</ms:Nazwa>");
                        plikXML.AppendLine("<ms:TrescSentencji>" + TrescSentencji + "</ms:TrescSentencji>");

                        plikXML.AppendLine("</ms:Protokol>");
                    }
                }
                plikXML.AppendLine("</ms:OrzeczeniaProtokol>");
                plikXML.AppendLine("</ms:Orzeczenia>");
            }

            plikXML.AppendLine("</ms:Sprawy>");
            string pathODP = Server.MapPath("Wymiana2\\Odpowiedzi\\odpowiedz_") + DateTime.Now.ToString().Replace(" ", "_").Replace(".", "_").Replace(":", "_") + ".xml";
            System.IO.File.WriteAllText(pathODP, plikXML.ToString());
            return plikXML.ToString();
        }

        private DataTable Sprawy(string wydzial, string repertorium, string rodzaj, int numer, int rok, string kwerendaZapytujacaIConnectionString)
        {
            int SprawyNr = 0;
            int StronyZeSprawyNr = 1;
            int AdresyStronKwerendaNr = 2;
            int InneStronyZeSprawyStron = 3;
            int AdresyInnychStron = 4;
            int Orzeczenia = 5;

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
                cm.log.Error("Wymiana 2 serwer: Brak kwerend z zapytaniami");
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