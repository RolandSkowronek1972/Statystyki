using System;
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
        public string Wymiana2XML(string wydzial, string rep, int numer, int rok)
        {
            string odpowiedz = string.Empty;
            StringBuilder plikXML = new StringBuilder();

            return odpowiedz;
        }

        private string Sprawy(string wydzial, string rep, int numer, int rok, DataTable kwerendaZapytujacaIConnectionString)
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
            string StronyZeSprawyKwerenda = string.Empty;
            string StronyZeSprawyyConnectionString = string.Empty;
            string AdresyStronKwerenda = string.Empty;
            string AdresyStronConnectionString = string.Empty;
            string InneStronyZeSprawyStronKwerenda = string.Empty;
            string InneStronyZeSprawyStronConnectionString = string.Empty;
            string AdresyInnychStronKwerenda = string.Empty;
            string AdresyInnychStronConnectionString = string.Empty;
            string OrzeczeniaKwerenda = string.Empty;
            string OrzeczeniaConnectionString = string.Empty;

            int pozycja = 0;
            try
            {
                SprawyKwerenda = kwerendaZapytujacaIConnectionString.Rows[SprawyNr]["kwerenda"].ToString();
                SprawyConnectionString = kwerendaZapytujacaIConnectionString.Rows[SprawyNr]["cs"].ToString();
                pozycja = SprawyNr;

                StronyZeSprawyKwerenda = kwerendaZapytujacaIConnectionString.Rows[StronyZeSprawyNr]["kwerenda"].ToString();
                StronyZeSprawyyConnectionString = kwerendaZapytujacaIConnectionString.Rows[StronyZeSprawyNr]["cs"].ToString();
                pozycja = StronyZeSprawyNr;

                AdresyStronKwerenda = kwerendaZapytujacaIConnectionString.Rows[AdresyStronKwerendaNr]["kwerenda"].ToString();
                AdresyStronConnectionString = kwerendaZapytujacaIConnectionString.Rows[AdresyStronKwerendaNr]["cs"].ToString();
                pozycja = AdresyStronKwerendaNr;

                InneStronyZeSprawyStronKwerenda = kwerendaZapytujacaIConnectionString.Rows[InneStronyZeSprawyStron]["kwerenda"].ToString();
                InneStronyZeSprawyStronConnectionString = kwerendaZapytujacaIConnectionString.Rows[InneStronyZeSprawyStron]["cs"].ToString();
                pozycja = InneStronyZeSprawyStron;

                AdresyInnychStronKwerenda = kwerendaZapytujacaIConnectionString.Rows[AdresyInnychStron]["kwerenda"].ToString();
                AdresyInnychStronConnectionString = kwerendaZapytujacaIConnectionString.Rows[AdresyInnychStron]["cs"].ToString();
                pozycja = AdresyInnychStron;

                OrzeczeniaKwerenda = kwerendaZapytujacaIConnectionString.Rows[Orzeczenia]["kwerenda"].ToString();
                OrzeczeniaConnectionString = kwerendaZapytujacaIConnectionString.Rows[Orzeczenia]["cs"].ToString();
                pozycja = Orzeczenia;
            }
            catch (Exception ex)
            {
                cm.log.Error("Wymiana2 serwer: bład odczytu z tabeli kwerend i CS na pozycji " + pozycja.ToString());
            }

            return odpowiedz;
        }

        private string StronyZeSprawy(int[] id_sprawy, DataTable kwerendaZapytujacaIConnectionString)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }

        private string AdresyStron(int[] id_strony, DataTable kwerendaZapytujacaIConnectionString)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }

        private string InneStronyZeSprawy(int[] id_sprawy, DataTable kwerendaZapytujacaIConnectionString)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }

        private string AdresyInnychStron(int[] id_innej, DataTable kwerendaZapytujacaIConnectionString)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }

        private string Orzeczenia(int[] id_sprawy)
        {
            string odpowiedz = string.Empty;
            return odpowiedz;
        }
    }
}