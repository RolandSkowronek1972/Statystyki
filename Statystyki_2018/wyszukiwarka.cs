using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Statystyki_2018
{
    public class wyszukiwarka
    {

        public common cm = new common();
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;



        public string PobierzDana(string klucz)
        {
            string result = string.Empty;
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = new DataTable();

            SqlCommand sqlCmd;
            var conn = new SqlConnection(con_str);
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand(kwerenda, conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@klucz", klucz);

                    result = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();

                }
                catch (Exception ex)
                {
                    cm.log.Error( "Wyszukiwarka  " + ex.Message);
                    conn.Close();
                }
            } // end of using

            return result;
        }

        public string PobierzDana(string klucz, int ident)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            parameters.Rows.Add("@ident", ident);
            return cm.getQuerryValue("SELECT [wartosc]  FROM [konfig] where klucz=@klucz and ident=@ident", con_str, parameters);
        }
        
        public string PobierzDana2(string klucz)
        {
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@klucz", klucz);
            return cm.getQuerryValue("SELECT [wartosc]  FROM [konfig] where rtrim(opis)=@klucz ", con_str, parametry);
        }
        
        public string PobierzConnectionString(string klucz,string tenPlik)
        {
            string result = string.Empty;
            string kwerenda = "SELECT [ConnectionString]  FROM [konfig] where rtrim(opis) =@klucz ";
            DataTable parameters = new DataTable();

            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@klucz", klucz);
            return cm.getQuerryValue(kwerenda, con_str, parametry);
        }
        public DataTable PobierzKwerendy(string connStr,string tenPlik)
        {
            return cm.getDataTable("SELECT distinct   [idKolumny]      ,[kwerenda]       ,[kewrendaPodgladu]  FROM [tbl_ocenaPracownikaKwerendy]", con_str, cm.makeParameterTable(), tenPlik);
        }

        public string PobierzKwerendePracownika(string kolumna)
        {
            return cm.getQuerryValue("SELECT        kwerenda FROM tbl_ocenaPracownikaKwerendy WHERE(idKolumny = 1)", con_str, cm.makeParameterTable());
        }


     /*
        public DataTable PobierzDane(string klucz)
        {
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            return cm.getDataTable(kwerenda, con_str, parameters);
        }
        */
        public DataTable PobierzListePracowników(string kwerenda, string connectionString)
        {
            return cm.getDataTable(kwerenda, connectionString,"");
        }
        /*
        public DataTable listaSpraw(string connectionString)
        {
 
            return  cm.getDataTable("select d.nazwisko, d.imie, st.nazwa, (select symbol from repertorium where numer=s.repertorium) rep, s.numer, s.rok  from sprawa s, strona t, dane_strony d, status st where s.czyus = 0 and t.czyus = 0 and s.ident = t.id_sprawy and t.id_danych = d.ident and t.id_statusu = st.ident ", connectionString);
            
        }
        */
        public DataTable listaDniPracownika(string idPracownika, DateTime data1, DateTime data2, string kwerenda, string connectionString)
        {
           
            DataTable parameters = cm.makeParameterTable();

            parameters.Rows.Add("@idPracownika", idPracownika);
            parameters.Rows.Add("@data1", data1);
            parameters.Rows.Add("@data2", data2);
            return  cm.getDataTable(kwerenda, connectionString, parameters,"Pracownik");

          

        }

        public DataTable PobierzOpisy(string klucz,string tenPlik)
        {
           
            string kwerenda = "SELECT [opis],ident  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);

            return   cm.getDataTable(kwerenda, con_str, parameters, tenPlik);
        }

        public string DaneNaDzien(string kwerenda, string connectionString, string data, string idPracownika)
        {
            
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@idPracownika", idPracownika);
            parameters.Rows.Add("@data", data);

            return cm.getQuerryValue ("insert into tbl_statystyki_tbl_x5 (imie,nazwisko,funkcja,stanowisko,id_sedziego,id_dzialu) values (@imie,@nazwisko,@funkcja,@stanowisko,@id_sedziego,@id_dzialu)", con_str, parameters);
  
        }

    }


}