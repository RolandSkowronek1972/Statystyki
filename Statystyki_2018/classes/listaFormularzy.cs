using System.Data;

namespace Statystyki_2018
{
    public class listaFormularzy : common
    {
        public DataTable listaFormularze()
        {
            DataTable result = new DataTable();
            DataColumn ident = new DataColumn("ident", typeof(int));
            DataColumn nazwa = new DataColumn("nazwa", typeof(string));
            DataColumn rodzaj = new DataColumn("rodzaj", typeof(int));
            result.Columns.Add(ident);
            result.Columns.Add(nazwa);
            result.Columns.Add(rodzaj);

            return  getDataTable("SELECT  [ident]  ,[nazwa], '1' as rodzaj FROM wydzialy UNION ALL SELECT ident, opis as nazwa, '2' AS rodzaj FROM  konfig WHERE(klucz = 'kontrolka') UNION ALL SELECT[ident],[nazwa], '3' as rodzaj FROM wydzialy_mss UNION ALL  SELECT ident, opis, '4' AS rodzaj FROM  konfig  WHERE(klucz = 'kof') UNION ALL SELECT ident, opis as nazwa, '5' AS rodzaj FROM  konfig WHERE(klucz = 'wyszukiwarka') UNION ALL SELECT ident, opis as nazwa, '6' AS rodzaj FROM  konfig WHERE(klucz = 'pracownik') ", con_str,"");
            /*
            if (miesieczne != null)
            {
                foreach (DataRow dRow in miesieczne.Rows)
                {
                    DataRow resultRow = result.NewRow();
                    resultRow["ident"] = dRow[0];
                    resultRow["nazwa"] = dRow["nazwa"];
                    resultRow["rodzaj"] = dRow["rodzaj"];
                    result.Rows.Add(resultRow);
                }
            }
            //mms
            DataTable mss = getDataTable("SELECT  [ident]  ,[nazwa], '2' as rodzaj FROM [wydzialy_mss]", con_str);
            if (mss != null)
            {
                foreach (DataRow dRow in mss.Rows)
                {
                    DataRow resultRow = result.NewRow();
                    resultRow["ident"] = dRow[0];
                    resultRow["nazwa"] = dRow["nazwa"];
                    resultRow["rodzaj"] = dRow["rodzaj"];
                    result.Rows.Add(resultRow);
                }
            }
            */
            
        }
    }
}