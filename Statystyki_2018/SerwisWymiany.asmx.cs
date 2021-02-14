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

        [WebMethod]
        public string DaneWXml(string NrWydzialu, string repertorium, int nrSprawy, string rodzaj, string connection, int rok, string kwerendaZapytujaca)
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
                return "Wymiana serwer: Brak wyników kwerendy zapytania";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.AppendLine("<Odpowiedz>");
            foreach (DataRow item in odpowiedz.Rows)
            {
                stringBuilder.AppendLine("<row>");
                stringBuilder.AppendLine("<wydzial>" + item[0] + "</wydzial>");
                stringBuilder.AppendLine("<repertorium>" + item[1] + "</repertorium>");

                stringBuilder.AppendLine("<numer>" + item[2] + " </numer>");
                stringBuilder.AppendLine("<rok> " + item[3] + " </rok>");
                stringBuilder.AppendLine("<dataOrzeczenia> " + item[4] + " </dataOrzeczenia>");
                stringBuilder.AppendLine("<msword> " + item[5] + " </msword>");
                stringBuilder.AppendLine("<rodzaj> " + item[6] + " </rodzaj>");

                stringBuilder.AppendLine("</row>");
            }
            stringBuilder.AppendLine("</Odpowiedz>");

            return stringBuilder.ToString();
        }
    }
}