using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Statystyki_2018
{
    public class SsrSso
    {
        public common cm = new common();
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

    
        public DataTable getTabData1(string idWydzial, string idZakladki, string idSekcji, string idWiersza, string connectionString, DateTime dataPoczatku, DateTime dataKonca, int idSedziego)
        {
            DataTable dT = new DataTable();
            //section 1
            string query = "SELECT DISTINCT id_kolumny, kwerenda     FROM kwerendy2 WHERE (  id_zakladki =@id_zakladki) AND(id_sekcji = @id_sekcji) AND (id_wydzial = @id_wydzial) AND(id_wiersza = @id_wiersza) order by id_kolumny";

            DataTable result = new DataTable();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));
            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_zakladki", idZakladki);
            parameters.Rows.Add("@id_sekcji", idSekcji);
            parameters.Rows.Add("@id_wydzial", idWydzial);
            parameters.Rows.Add("@id_wiersza", idWiersza);

            dT = cm.getDataTable(query, con_str, parameters,"ssr");

            result.Columns.Add("columna", typeof(String));
            result.Columns.Add("wartosc", typeof(String));

            result.Columns.Clear();
            result.Columns.Add("idKolumny", typeof(String));
            result.Columns.Add("value", typeof(String));
            foreach (DataRow dR in dT.Rows)
            {
                //wyciaganie danych do kolumn
                parameters = new DataTable();
                parameters.Columns.Add("name", typeof(String));
                parameters.Columns.Add("value", typeof(String));
                parametrRow = parameters.NewRow();
                parameters.Rows.Add("@data1", dataPoczatku);
                parameters.Rows.Add("@data2", dataKonca);
                string kwerenda = dR[1].ToString().Trim();
                parameters.Rows.Add("@id_sedziego", idSedziego);
                DataTable ddT = cm.getDataTable(kwerenda, con_str, parameters,"ssr");
                DataRow ddR = result.NewRow();
                ddR[0] = dR[0].ToString().Trim();
                DataRow dF = ddT.Rows[0];
                ddR[1] = dF[0].ToString();

                result.Rows.Add(ddR);
            }
            return result;
        }
    }
}