using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web.UI.WebControls;
using System.Xml;

namespace Statystyki_2018
{
    public class mss : common
    {
        public dataReaders dr = new dataReaders();

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

        public string kofUpdate(string id, string nr)
        {
            string result = string.Empty;

            string kwerendaKOF = PobierzDana("kof");
            // string ConnectionString = PobierzCS("kof");

            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@nr", nr.Trim());
            parameters.Rows.Add("@id", id);
            // SqlConnection conn = new SqlConnection(ConnectionString+ " Connection Timeout=30");

            runQuerryKOF("update kof set numer_of = @nr where ident = @id", PobierzCS("kof"), parameters);
            return result;
        }

        public string PobierzDana(string klucz)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz";
            return getQuerryValue(kwerenda, con_str, parameters);
        }

        public string czyIstniejeWpiswKOF(string idSprawy)
        {
            string result = string.Empty;
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@idSprawy", idSprawy);
            string kwerenda = "SELECT count (*) FROM kof where id_sprawy=@idSprawy";
            result = getQuerryValue(kwerenda, con_str, parameters);
            return result;
        }

        public string PobierzCS(string klucz)
        {
            string result = string.Empty;
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            string kwerenda = "SELECT [ConnectionString]  FROM [konfig] where klucz=@klucz";
            result = getQuerryValue(kwerenda, con_str, parameters);
            return result;
        }

        public string uzupelnijDaneDoKOF()
        {
            //wczytanie całej tablicy z kof
            //log.Info("KOF: start kasowania rekordów bez przypisanej sprawy z tabeli KOF: " + DateTime.Now.ToString());
            runQuerry("delete from kof where numer_of is null", con_str);

            //log.Info("KOF: start odczytu danych z tabeli KOF: " + DateTime.Now.ToString());
            DataTable kofGlowny = getDataTable("select id_sprawy from kof", con_str, "KOF");
            //log.Info("KOF: Koniec odczytu danych z tabeli KOF: " + DateTime.Now.ToString());

            //log.Info("KOF: " + "start odczytu danych do KOF ");
            DataTable result = new DataTable();
            result.Columns.Add("kwerenda", typeof(string));
            result.Columns.Add("connectionString", typeof(string));
            string kwerenda = "SELECT  distinct      wartosc, ConnectionString FROM            konfig  WHERE        (klucz = 'kof')";

            DataTable parameters = makeParameterTable();

            DataTable KwerendyDoKOF = getDataTable(kwerenda, con_str, parameters, "KOF");
            log.Info("KOF: odczytano " + KwerendyDoKOF.Rows.Count.ToString() + " kwerend z tabeli konfig z kluczem kof.");

            foreach (DataRow dRow in KwerendyDoKOF.Rows)
            {
                //log.Info("KOF: kwerenda z tabeli konfig z kluczem KOF: " + dRow[0].ToString().Trim() + " Connectionstring z tabeli konfig z kluczem KOF: " + dRow[1].ToString().Trim());
                DataTable dane = getDataTable(dRow[0].ToString().Trim(), dRow[1].ToString().Trim(), "KOF");
                if (dane.Rows.Count == 0)
                {
                    log.Info("KOF: Brak danych w imporcie danych : " + DateTime.Now.ToString());
                    continue;
                }
                log.Info("KOF: Usunięcie duplikatów między bazą kof a nowo zaimpoertowanymi danymi : " + DateTime.Now.ToString());
                int licznik = 0;
                foreach (DataRow drow2 in from DataRow dRow1 in kofGlowny.Rows from DataRow drow2 in dane.Rows where dRow1[0] == drow2[0] select drow2)
                {
                    dane.Rows.Remove(drow2);
                    licznik++;
                }

                log.Info("KOF: Zakończono usuwanie duplikatów " + licznik.ToString() + " między bazą kof a nowo zaimportowanymi danymi : " + DateTime.Now.ToString());

                // mapowanie tabeli id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko, numer_of

                DataColumn ident = new DataColumn("ident", typeof(Int32));
                DataColumn id_sprawy = new DataColumn("id_sprawy", typeof(Int32));
                DataColumn wydzial = new DataColumn("wydzial", typeof(string));
                DataColumn sygnatura = new DataColumn("sygnatura", typeof(string));
                DataColumn strona = new DataColumn("strona", typeof(string));
                DataColumn pelnomocnik = new DataColumn("pelnomocnik", typeof(string));
                DataColumn przeciwko = new DataColumn("przeciwko", typeof(string));
                DataColumn numer_of = new DataColumn("numer_of", typeof(string));
                DataTable danenaSerwer = new DataTable();
                danenaSerwer.Columns.Add(ident);
                danenaSerwer.Columns.Add(id_sprawy);
                danenaSerwer.Columns.Add(wydzial);
                danenaSerwer.Columns.Add(sygnatura);
                danenaSerwer.Columns.Add(strona);
                danenaSerwer.Columns.Add(pelnomocnik);
                danenaSerwer.Columns.Add(przeciwko);
                danenaSerwer.Columns.Add(numer_of);
                log.Info("KOF: Do zaimportowania jest :" + dane.Rows.Count.ToString() + " wierszy.");

                foreach (DataRow dRowN in dane.Rows)
                {
                    DataRow rowNaSerwer = danenaSerwer.NewRow();
                    rowNaSerwer[0] = 0;
                    rowNaSerwer[1] = dRowN[0];
                    rowNaSerwer[2] = dRowN[1];
                    rowNaSerwer[3] = dRowN[2];
                    rowNaSerwer[4] = dRowN[3];
                    rowNaSerwer[5] = dRowN[4];
                    rowNaSerwer[6] = dRowN[5];
                    rowNaSerwer[7] = dRowN[6];

                    danenaSerwer.Rows.Add(rowNaSerwer);
                }
                // Open the destination connection. In the real world you would
                // not use SqlBulkCopy to move data from one table to the other
                // in the same database. This is for demonstration purposes only.
                using (SqlConnection destinationConnection =
                           new SqlConnection(con_str))
                {
                    destinationConnection.Open();

                    // Set up the bulk copy object.
                    // Note that the column positions in the source
                    // data reader match the column positions in
                    // the destination table so there is no need to
                    // map columns.
                    using (SqlBulkCopy bulkCopy =
                               new SqlBulkCopy(destinationConnection))
                    {
                        bulkCopy.DestinationTableName = "kof";

                        try
                        {
                            log.Info("KOF: Start zapisu z użyciem metody SQLBulkCopy:  " + DateTime.Now.ToString());

                            // Write from the source to the destination.
                            bulkCopy.WriteToServer(danenaSerwer);
                        }
                        catch (Exception ex)
                        {
                            log.Error("KOF: " + ex.Message);
                        }
                    }
                }
            }
            return "";
        }

        public DataTable generuj_dane_do_tabeli_mss2(int id_dzialu, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            //log.Info("mss: rozpoczęcie popmpowania danych");
            var conn = new SqlConnection(con_str);
            string cs = PobierzConnectionStringMSS(id_dzialu);

            string kwerenda = string.Empty;

            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            DataTable dT1 = getDataTable("SELECT [id_wydzial] ,[id_tabeli] ,[id_kolumny],[id_wiersza] ,[kwerenda]  FROM kwerenda_mss where  id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters, "");
            //log.Info("mss: pobrano "+ dT1.Rows.Count + " kwerend odczytujących dane");

            if (dT1.Rows.Count == 0)
            {
                return null;
            }
            // zaladowanie do tabeli
            DataTable dTResult = new DataTable();
            dTResult.Columns.Add("idWydzial", typeof(string));
            dTResult.Columns.Add("idTabeli", typeof(string));
            dTResult.Columns.Add("idWiersza", typeof(string));
            dTResult.Columns.Add("idKolumny", typeof(string));
            dTResult.Columns.Add("wartosc", typeof(string));

            foreach (DataRow dRow in dT1.Rows)
            {
                DataRow resultRow = dTResult.NewRow();
                //wyciagnij zmienne daną
                string idWydzial = dRow[0].ToString().Trim();
                string idTabeli = dRow[1].ToString().Trim();
                string idKolumny = dRow[2].ToString().Trim();
                string idWiersza = dRow[3].ToString().Trim();
                string kwerendaN = dRow[4].ToString().Trim();
                parameters = makeParameterTable();
                parameters.Rows.Add("@id_dzialu", id_dzialu);
                parameters.Rows.Add("@data_1", dr.KonwertujDate(poczatek));
                parameters.Rows.Add("@data_2", dr.KonwertujDate(koniec));
                string wartosc = getQuerryValue(kwerendaN, cs, parameters);

                resultRow[0] = idWydzial.Trim();
                resultRow[1] = idTabeli.Trim();
                resultRow[2] = idWiersza.Trim();
                resultRow[3] = idKolumny.Trim();
                resultRow[4] = wartosc;
                dTResult.Rows.Add(resultRow);
            }

            return dTResult;
        }// end of generuj_dane_do_tabeli_mss

        public DataTable generuj_dane_do_tabeli_mss10e(int id_dzialu, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            //log.Info("mss: rozpoczęcie popmpowania danych");
            var conn = new SqlConnection(con_str);
            string cs = PobierzConnectionStringMSS10e(id_dzialu);

            string kwerenda = string.Empty;

            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            DataTable dT1 = getDataTable("SELECT [id_wydzial] ,[id_tabeli] ,[id_kolumny],[id_wiersza] ,[kwerenda]  FROM kwerendy where  id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters, "");
            //log.Info("mss: pobrano "+ dT1.Rows.Count + " kwerend odczytujących dane");

            if (dT1.Rows.Count == 0)
            {
                return null;
            }
            // zaladowanie do tabeli
            DataTable dTResult = new DataTable();
            dTResult.Columns.Add("idWydzial", typeof(string));
            dTResult.Columns.Add("idTabeli", typeof(string));
            dTResult.Columns.Add("idWiersza", typeof(string));
            dTResult.Columns.Add("idKolumny", typeof(string));
            dTResult.Columns.Add("wartosc", typeof(string));

            foreach (DataRow dRow in dT1.Rows)
            {
                DataRow resultRow = dTResult.NewRow();
                //wyciagnij zmienne daną
                string idWydzial = dRow[0].ToString().Trim();
                string idTabeli = dRow[1].ToString().Trim();
                string idKolumny = dRow[2].ToString().Trim();
                string idWiersza = dRow[3].ToString().Trim();
                string kwerendaN = dRow[4].ToString().Trim();
                parameters = makeParameterTable();
                parameters.Rows.Add("@id_dzialu", id_dzialu);
                parameters.Rows.Add("@data_1", dr.KonwertujDate(poczatek));
                parameters.Rows.Add("@data_2", dr.KonwertujDate(koniec));
                string wartosc = getQuerryValue(kwerendaN, cs, parameters);

                resultRow[0] = idWydzial.Trim();
                resultRow[1] = idTabeli.Trim();
                resultRow[2] = idWiersza.Trim();
                resultRow[3] = idKolumny.Trim();
                resultRow[4] = wartosc;
                dTResult.Rows.Add(resultRow);
            }

            return dTResult;
        }// end of generuj_dane_do_tabeli_mss

        public string PobierzConnectionStringMSS(int id_dzialu)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@ident", id_dzialu);
            return getQuerryValue("SELECT cs  FROM wydzialy_mss where ident=@ident ", con_str, parameters);
        }

        public string PobierzConnectionStringMSS10e(int id_dzialu)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@ident", id_dzialu);
            return getQuerryValue("SELECT cs  FROM wydzialy where ident=@ident ", con_str, parameters);
        }

        public string nazwaSadu(string id_sadu)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@ident", id_sadu);
            return getQuerryValue("SELECT sad  FROM wydzialy_mss where ident=@ident ", con_str, parameters);
        }// end of nazwaSadu

        public string podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny, string id_tabeli)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_kolumny", id_kolumny);
            parameters.Rows.Add("@id_wiersza", id_wiersza);

            return getQuerryValue("SELECT distinct podglad FROM kwerenda_mss where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", con_str, parameters);
        }

        public DataTable pod_tabela(string cs, string kwerenda, string poczatek, string koniec, string id_sedziego)
        {
            DataTable parameters = makeParameterTable();

            parameters.Rows.Add("@data_1", poczatek);
            parameters.Rows.Add("@data_2", koniec);
            parameters.Rows.Add("@id_sedziego", id_sedziego);

            DataTable dT1 = getDataTable(kwerenda, cs, parameters, "popup");
            return dT1;
        }

        public StringBuilder raportTXT(DataTable listaTabelek, DataTable tabela2, string idRaportu, string idSad)
        {
            StringBuilder result = new StringBuilder();
            //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

            string idsadu = string.Empty;
            string idWydzialu = idSad;

            try
            {
                foreach (DataRow dRR in listaTabelek.Rows)
                {
                    foreach (DataRow dDR in tabela2.Rows)

                    {
                        string t1 = dDR[1].ToString().Trim();
                        string t2 = dRR[0].ToString().Trim();
                        if ((t1 == t2) && (dDR[4].ToString().Trim() != "0"))
                        {
                            string druga = string.Empty;
                            try
                            {
                                druga = idRaportu.Substring(idRaportu.Length - 5, 5);
                            }
                            catch
                            { }
                            string czwarta = string.Empty;
                            try
                            {
                                czwarta = idSad.Substring(idSad.Length - 2, 2);
                            }
#pragma warning disable CS0168 // The variable 'ecc' is declared but never used
                            catch (Exception ecc)
#pragma warning restore CS0168 // The variable 'ecc' is declared but never used
                            { }
                            idsadu = idSad.Substring(0, 6);
                            string idTabeli = t1;
                            string idWiersza = dDR[2].ToString();
                            string idKolumny = dDR[3].ToString();
                            string wartosc = dDR[4].ToString();
                            string line = string.Empty;
                            //output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");
                            //   string line = idRaportu.Text  + ";" + Date1.Date.ToShortDateString().Year.ToString() + Date1.Date.Month.ToString("D2") + ";" + idSad.Text.Trim() + ";" + idSad.Text.Trim() + (string)Session["id_dzialu"] + ";" + idTabeli + ";" + idWiersza + ";" + idKolumny + ";" + wartosc ;
                            try
                            {
                                if (int.Parse(wartosc) != 0)
                                {
                                    line = idRaportu + ";" + druga + ";" + idsadu + ";" + idWydzialu + ";" + idTabeli + ";" + idWiersza + ";" + idKolumny + ";" + wartosc;
                                }
                            }
                            catch
                            { }

                            if (string.IsNullOrEmpty(line) == false)
                            {
                                result.AppendLine(line);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.AppendLine(ex.Message);
            }
            return result;
        } //end of raportTXT

        public string wyciagnij_tytulMSS(string tabela, string kolumna, string id_dzialu, string id_wiersza)
        {
            var conn = new SqlConnection(con_str);

            SqlCommand sqlCmd;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT  opis FROM  kwerenda_mss where id_tabeli=@tabela and id_kolumny=@kolumna and id_wydzial=@dzial and id_wiersza=@id_wiersza", conn);

                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@kolumna", kolumna.Trim());
                    sqlCmd.Parameters.AddWithValue("@tabela", tabela.Trim());
                    sqlCmd.Parameters.AddWithValue("@dzial", id_dzialu.Trim());
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza.Trim());
                    string odp = sqlCmd.ExecuteScalar().ToString();

                    conn.Close();
                    return odp;
                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    conn.Close();
                    return "";
                }
            }
        }// end of wyciagnij_kwerende

        //----------------------------------------------------------------
        //-------------- nowy schemat ------------------------------------
        public string tworztabeleMSS10e(string idTabeli, DataTable naglowek, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPrzedIteracja, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela, int idTabeliNum, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<div class='page-break'>");
            kodStony.AppendLine("<P><b>" + idTabeli + "</b> " + tekstNadTabela + " </P>");
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek
            //   DataTable header = naglowek;

            for (int i = 1; i < iloscWierszyNaglowka + 1; i++)
            {
                kodStony.AppendLine("<tr>");
                //pierwsza kolumna nagłówka
                try
                {
                    DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='1'", tenPlik);
                    log.Info("tabela : " + idTabeliNum.ToString() + " nrWiersza ='" + i.ToString() + "' and nrKolumny='1'");
                    if (wiersz != null)
                    {
                        int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                        string style = wiersz["style"].ToString().Trim();
                        string tekst = wiersz["text"].ToString().Trim();

                        string sekcjaColspan = string.Empty;
                        string sekcjaStyle = string.Empty;
                        if (colspan > 0)
                        {
                            sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                        }

                        if (!string.IsNullOrEmpty(style))
                        {
                            sekcjaStyle = " " + style + " ";
                        }
                        if (lp)
                        {
                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + rowSpanPart(int.Parse(wiersz["rowspan"].ToString().Trim())) + ">" + tekst + "</td>");
                            kodStony.AppendLine("<td  class ='borderAll center col_26' " + "rowspan ='" + ((int.Parse(wiersz["rowspan"].ToString().Trim())) + 1).ToString() + "' " + ">L.p.</td>");
                        }
                        else
                        {
                            sekcjaColspan = "colspan ='" + (colspan + 1).ToString() + "' ";
                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + rowSpanPart(int.Parse(wiersz["rowspan"].ToString().Trim())) + ">" + tekst + "</td>");
                        }
                    }
                }
                catch
                { }

                for (int j = 2; j <= iloscKolumnPrzedIteracja + iloscKolumnPoIteracji + 1; j++)
                {
                    try
                    {
                        log.Info(" nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'");
                        DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'", tenPlik);
                        if (wiersz != null)
                        {
                            int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                            int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                            string style = wiersz["style"].ToString().Trim();
                            string tekst = wiersz["text"].ToString().Trim();
                            string sekcjaRowspan = string.Empty;
                            string sekcjaColspan = string.Empty;
                            string sekcjaStyle = string.Empty;

                            if (colspan > 0)
                            {
                                sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                            }
                            if (rowspan > 0)
                            {
                                sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                            }
                            if (!string.IsNullOrEmpty(style))
                            {
                                sekcjaStyle = " " + style + " ";
                            }

                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                        }
                        else
                        {
                            log.Error("MSS 11o LinqError: wiersz=null");
                        }
                    }
                    catch (Exception ex)
                    {
                        log.Error("MSS 11o LinqError: " + ex.Message);
                    }
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("<tr>");

            //rozdzielenie
            string txt_1 = "<td  class='borderAll center' colspan='" + (iloscKolumnPrzedIteracja) + "'>0</td>";
            string txt_2 = "<td  class='borderAll center' colspan='" + (iloscKolumnPrzedIteracja + 1) + "'>0</td>";
            string classify = (lp) ? txt_1 : txt_2;
            kodStony.AppendLine(classify);

            for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
            {
                kodStony.AppendLine("<td  class='borderAll center'>" + j.ToString() + "</td>");
            }

            //tabela główna
            for (int i = 1; i < iloscWierszyTabeli + 1; i++)
            {
                kodStony.AppendLine("<tr>");

                for (int j = 1; j < iloscKolumnPrzedIteracja + 1; j++)
                {
                    try
                    {
                        DataRow wiersz = wyciagnijWartosc(tabelaPrzedIteracja, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'", tenPlik);
                        if (wiersz != null)
                        {
                            int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                            int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                            string style = wiersz["style"].ToString().Trim();
                            string tekst = wiersz["text"].ToString().Trim();
                            string sekcjaRowspan = string.Empty;
                            string sekcjaColspan = string.Empty;
                            string sekcjaStyle = string.Empty;

                            if (colspan > 0)
                            {
                                sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                            }
                            if (rowspan > 0)
                            {
                                sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                            }
                            if (!string.IsNullOrEmpty(style))
                            {
                                sekcjaStyle = " " + style + " ";
                            }
                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                        }
                    }
                    catch (Exception ex)
                    {
                        log.Error("MSS 11o LinqError: " + ex.Message);
                    }
                }
                kodStony.AppendLine("<td class='center borderAll col_26'>" + i.ToString() + "</td>");
                for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                {
                    string txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeliNum.ToString() + "' and idWiersza ='" + i.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                    string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + i.ToString().ToString() + "!" + idTabeliNum.ToString() + "!" + j.ToString() + "!1')\">" + txt + " </a>";
                    kodStony.AppendLine("<td class='center borderAll'>" + txt2 + "</td>");
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("</table>");
            kodStony.AppendLine("</div>");
            kodStony.AppendLine("<br/>");
            return kodStony.ToString();
        }

        public string tworztabeleMK(string idTabeli, DataTable naglowek, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPrzedIteracja, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela, int idTabeliNum, bool pageBreak, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            try
            {
                string ciagWyjsciowy = string.Empty;
                if (pageBreak)
                {
                    kodStony.AppendLine("<div class='page-break'>");
                }
                else
                {
                    kodStony.AppendLine("<div>");
                }

                kodStony.AppendLine("<P><b>" + idTabeli + "</b> " + tekstNadTabela + " </P>");
                kodStony.AppendLine("<table style='width:95%'>");
                //naglowek

                try
                {
                    for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                    {
                        string txt1 = dr.wyciagnijWartoscMK(naglowek, "id_kolumny=" + j.ToString(), tenPlik);
                        kodStony.AppendLine("<td class='center borderAll'>" + txt1 + "</td>");
                    }
                }
                catch
                { }

                for (int i = 1; i < iloscWierszyTabeli + 1; i++)
                {
                    try
                    {
                        kodStony.AppendLine("<tr>");

                        for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                        {
                            string txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeliNum.ToString() + "' and idWiersza ='" + i.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                            string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + i.ToString().ToString() + "!" + idTabeliNum.ToString() + "!" + j.ToString() + "!1')\">" + txt + " </a>";
                            kodStony.AppendLine("<td class='center borderAll'>" + txt2 + "</td>");
                        }
                        kodStony.AppendLine("</tr>");
                    }
                    catch (Exception ex)
                    {
                        log.Error(tenPlik + " tworztabeleMK " + ex);
                    }
                }
                //tabela główna

                kodStony.AppendLine("</tr>");

                kodStony.AppendLine("</table>");
                kodStony.AppendLine("</div>");
                kodStony.AppendLine("<br/>");
            }
            catch (Exception ex)
            {
                log.Error("MK :" + ex.Message);
            }
            return kodStony.ToString();
        }

        public string tworztabeleMSS(string idTabeli, DataTable naglowek, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPrzedIteracja, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<div class='page-break'>");
            kodStony.AppendLine("<P><b>Dział " + idTabeli + "</b> " + tekstNadTabela + " </P>");
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek

            log.Info(tenPlik = " start generowania naglowka do tabeli  MSS : " + idTabeli);
            for (int i = 1; i < iloscWierszyNaglowka + 1; i++)

            {
                kodStony.AppendLine("<tr>");
                //pierwsza kolumna nagłówka
                try
                {
                    DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='1'", tenPlik);
                    log.Info(tenPlik + " tabela : " + idTabeli + " NAGLÓWEK - nrWiersza ='" + i.ToString() + "' and nrKolumny='1'");
                    if (wiersz != null)
                    {
                        int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                        string style = wiersz["style"].ToString().Trim();
                        string tekst = "";
                        try
                        {
                            tekst = wiersz["text"].ToString().Trim();
                        }
                        catch (Exception ex)
                        {
                            log.Error(tenPlik + " naglowek Error: " + ex.Message);
                        }
                        string sekcjaColspan = string.Empty;
                        string sekcjaStyle = string.Empty;
                        if (colspan > 0)
                        {
                            sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                        }

                        if (!string.IsNullOrEmpty(style))
                        {
                            sekcjaStyle = " " + style + " ";
                        }
                        if (iloscKolumnPrzedIteracja > 0)
                        {
                            if (lp)
                            {
                                kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + rowSpanPart(int.Parse(wiersz["rowspan"].ToString().Trim())) + ">" + tekst + "</td>");
                                kodStony.AppendLine("<td  class ='borderAll center col_26' " + "rowspan ='" + ((int.Parse(wiersz["rowspan"].ToString().Trim())) + 1).ToString() + "' " + ">L.p.</td>");
                            }
                            else
                            {
                                sekcjaColspan = "colspan ='" + (colspan + 1).ToString() + "' ";
                                kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + rowSpanPart(int.Parse(wiersz["rowspan"].ToString().Trim())) + ">" + tekst + "</td>");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    log.Error(tenPlik + " naglowek LinqError: " + ex.Message);
                }

                for (int j = 2; j <= iloscKolumnPrzedIteracja + iloscKolumnPoIteracji + 1; j++)
                {
                    try
                    {
                        log.Info(tenPlik + " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'");
                        DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'", tenPlik);
                        if (wiersz != null)
                        {
                            int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                            int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                            string style = wiersz["style"].ToString().Trim();
                            string tekst = "";
                            try
                            {
                                tekst = wiersz["text"].ToString().Trim();
                            }
                            catch (Exception ex)
                            {
                                log.Error(tenPlik + " naglowek LinqError: " + ex.Message);
                            }

                            string sekcjaRowspan = string.Empty;
                            string sekcjaColspan = string.Empty;
                            string sekcjaStyle = string.Empty;

                            if (colspan > 0)
                            {
                                sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                            }
                            if (rowspan > 0)
                            {
                                sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                            }
                            if (!string.IsNullOrEmpty(style))
                            {
                                sekcjaStyle = " " + style + " ";
                            }

                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                        }
                        else
                        {
                            log.Error(tenPlik + " id Tabeli: " + idTabeli + " naglowek  MSS  LinqError: wiersz=null");
                        }
                    }
                    catch (Exception ex)
                    {
                        log.Error(tenPlik + " MSS naglowek LinqError: " + ex.Message);
                    }
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("<tr>");

            //rozdzielenie
            if (iloscKolumnPrzedIteracja > 0)
            {
                string txt_1 = "<td  class='borderAll center' colspan='" + (iloscKolumnPrzedIteracja) + "'>0</td>";
                string txt_2 = "<td  class='borderAll center' colspan='" + (iloscKolumnPrzedIteracja + 1) + "'>0</td>";
                string classify = (lp) ? txt_1 : txt_2;

                kodStony.AppendLine(classify);
            }
            for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
            {
                kodStony.AppendLine("<td  class='borderAll center'>" + j.ToString() + "</td>");
            }

            //tabela główna
            for (int i = 1; i < iloscWierszyTabeli + 1; i++)
            {
                kodStony.AppendLine("<tr>");

                if (iloscKolumnPrzedIteracja > 0)
                {
                    for (int j = 1; j < iloscKolumnPrzedIteracja + 1; j++)
                    {
                        try
                        {
                            DataRow wiersz = wyciagnijWartosc(tabelaPrzedIteracja, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'", tenPlik);

                            if (wiersz != null)
                            {
                                int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                                int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                                string style = wiersz["style"].ToString().Trim();
                                if (style == "zero")
                                {
                                    continue;
                                }
                                string tekst = wiersz["text"].ToString().Trim();
                                string sekcjaRowspan = string.Empty;
                                string sekcjaColspan = string.Empty;
                                string sekcjaStyle = string.Empty;

                                if (colspan > 0)
                                {
                                    sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                                }
                                if (rowspan > 0)
                                {
                                    sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                                }
                                if (!string.IsNullOrEmpty(style))
                                {
                                    sekcjaStyle = " " + style + " ";
                                }
                                kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                            }
                        }
                        catch (Exception ex)
                        {
                            log.Error(tenPlik + " MSS TABELA BOCZNA LinqError: " + ex.Message);
                        }
                    }
                }

                if (iloscKolumnPrzedIteracja > 0)
                {
                    kodStony.AppendLine("<td class='center borderAll col_26'>" + i.ToString() + "</td>");
                }

                for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                {
                    string txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeli + "' and idWiersza ='" + i.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                    string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + i.ToString().ToString() + "!" + idTabeli + "!" + j.ToString() + "!4')\">" + txt + " </a>";
                    kodStony.AppendLine("<td class='center borderAll'>" + txt2 + "</td>");
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("</table>");
            kodStony.AppendLine("</div>");
            kodStony.AppendLine("<br/>");
            return kodStony.ToString();
        }

        public string tworztabeleMSS(string idTabeli, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyTabeli, int idWydzialu, string tekstNadTabela, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<div class='page-break'>");
            kodStony.AppendLine("<P><b>Dział " + idTabeli + "</b> " + tekstNadTabela + " </P>");
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek

            kodStony.AppendLine("<tr>");

            //tabela główna
            for (int i = 1; i < iloscWierszyTabeli + 1; i++)
            {
                kodStony.AppendLine("<tr>");

                try
                {
                    DataRow wiersz = wyciagnijWartosc(tabelaPrzedIteracja, " nrWiersza ='" + i.ToString() + "' and nrKolumny='1'", tenPlik);
                    if (wiersz != null)
                    {
                        string style = wiersz["style"].ToString().Trim();
                        string tekst = wiersz["text"].ToString().Trim();

                        string sekcjaStyle = string.Empty;

                        kodStony.AppendLine("<td  class ='  " + style + "'>" + tekst + "</td>");
                    }
                }
                catch (Exception ex)
                {
                    log.Error(tenPlik + " MSS  : " + ex.Message);
                }

                {
                    string txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeli + "' and idWiersza ='" + i.ToString() + "' and idkolumny='1'", tenPlik);
                    string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + i.ToString().ToString() + "!" + idTabeli + "!1!4')\">" + txt + " </a>";
                    kodStony.AppendLine("<td class='center borderAll col_90'>" + txt2 + "</td>");
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("</table>");
            kodStony.AppendLine("</div>");
            kodStony.AppendLine("<br/>");
            return kodStony.ToString();
        }

        public string tworztabeleMSS(string idTabeli, string napis, DataTable dane, int idWydzialu, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            kodStony.AppendLine("<div class='page-break'>");
            kodStony.AppendLine("<table style='width:100%'>");
            string txt = "0";
            kodStony.AppendLine("<tr>");
            try
            {
                txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeli + "' and idWiersza ='1' and idkolumny='1'", tenPlik);
            }
            catch { }
            kodStony.AppendLine("<td  class ='col_700 wciecie'>" + napis + "</td>");
            string txt2 = "<a Class=\"normal center \" href=\"javascript: openPopup('popup.aspx?sesja=1!" + idTabeli + "!1!4')\">" + txt + " </a>";
            kodStony.AppendLine("<td class='center borderAll col_250'>" + txt2 + "</td>");
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("</table>");
            kodStony.AppendLine("</div>");
            kodStony.AppendLine("<br/>");
            return kodStony.ToString();
        }

        public string odczytXML(string path, int idDzialu, string tabela, string tenPlik)
        {
            if (!File.Exists(path))
            {
                log.Error(tenPlik + " bład odczytu pliku: " + path);

                return "";
            }
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            StringBuilder st = new StringBuilder();
            string tekstNadTabela = string.Empty;
            int iloscWierszy = 0;
            string idTabeli = string.Empty;
            int iloscWieszyNaglowka = 0;
            int ilosckolunPrzedIteracja = 0;
            int ilosckolunPoIteracji = 0;
            int Lp = 0;
            bool lp = false;
            DataTable tabelaDanych = generuj_dane_do_tabeli_mss2(idDzialu, DateTime.Now, DateTime.Now, 60);
            StringBuilder tabelaGlowna = new StringBuilder();
            try
            {
                foreach (XmlNode node in doc.DocumentElement.ChildNodes)
                {
                    DataTable naglowek = new DataTable();
                    DataTable tabelaBoczna = new DataTable();
                    DataTable komorkiNaglowka = new DataTable();
                    DataTable komorkiboczne = new DataTable();

                    XmlNode informacjeOtabeli = node.ChildNodes[(int)pola.informacjeOtabeli];
                    if (informacjeOtabeli == null)
                    {
                        continue;
                    }
                    idTabeli = node.Attributes[0].Value.ToString();
                    if (idTabeli != tabela)
                    {
                        continue;
                    }

                    iloscWierszy = int.Parse(informacjeOtabeli.ChildNodes[0].InnerText);

                    tekstNadTabela = informacjeOtabeli.ChildNodes[1].InnerText;

                    //informacjeOtabeli
                    iloscWieszyNaglowka = int.Parse(informacjeOtabeli.ChildNodes[2].InnerText);
                    //iloscWieszyNaglowka = int.Parse(informacjeOtabeli[]);
                    ilosckolunPrzedIteracja = int.Parse(informacjeOtabeli.ChildNodes[3].InnerText);
                    st.AppendLine(" ilosckolunPrzedIteracja " + ilosckolunPrzedIteracja.ToString());

                    ilosckolunPoIteracji = int.Parse(informacjeOtabeli.ChildNodes[4].InnerText);
                    st.AppendLine(" ilosc kolun Po Iteracji " + ilosckolunPoIteracji.ToString());

                    Lp = int.Parse(informacjeOtabeli.ChildNodes[5].InnerText);
                    log.Info(tenPlik + " start odczytu danych do nagłówka : " + idDzialu.ToString());
                    naglowek = wygenerujTabele(node.ChildNodes[(int)pola.naglowek]);
                    log.Info(tenPlik + " start odczytu danych do tebeli bocznej : " + idDzialu.ToString());
                    tabelaBoczna = wygenerujTabele(node.ChildNodes[(int)pola.tabelaBoczna]);
                    log.Info(tenPlik + " start generowania tabeli : " + idDzialu.ToString());
                    tabelaGlowna.AppendLine(tworztabeleMSS(idTabeli, naglowek, tabelaBoczna, tabelaDanych, iloscWieszyNaglowka, iloscWierszy, ilosckolunPrzedIteracja, ilosckolunPoIteracji, idDzialu, lp, tekstNadTabela, "test"));
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " bład generowania tabeli dla działu  : " + idDzialu.ToString()+ " " +ex.Message);
                tabelaGlowna.AppendLine(ex.Message);
            }

            return tabelaGlowna.ToString();
        }

        public string odczytXML(string path, int idDzialu, string tabela, DataTable tabelaDanych, string tenPlik)
        {
            if (!File.Exists(path))
            {
                log.Error(tenPlik + " bład odczytu pliku: " + path);

                return "";
            }
            if (tabelaDanych == null)
            {
                log.Error(tenPlik + " brak danych dla tabeli MSS dla działu : " + idDzialu.ToString());

                //  return "";
            }
            XmlDocument doc = new XmlDocument();

            doc.Load(path);
            StringBuilder st = new StringBuilder();
            string tekstNadTabela = string.Empty;
            int iloscWierszy = 0;
            string idTabeli = string.Empty;
            int iloscWieszyNaglowka = 0;
            int ilosckolunPrzedIteracja = 0;
            int ilosckolunPoIteracji = 0;
            int Lp = 0;
            bool lp = false;
            log.Info(tenPlik + " odczytXML : rozpoczęcie odczytywania nodów");

            StringBuilder tabelaGlowna = new StringBuilder();
            try
            {
                foreach (XmlNode node in doc.DocumentElement.ChildNodes)
                {
                    DataTable naglowek = new DataTable();
                    DataTable tabelaBoczna = new DataTable();
                    DataTable komorkiNaglowka = new DataTable();
                    DataTable komorkiboczne = new DataTable();

                    XmlNode informacjeOtabeli = node.ChildNodes[(int)pola.informacjeOtabeli];
                    if (informacjeOtabeli == null)
                    {
                        continue;
                    }
                    idTabeli = node.Attributes[0].Value.ToString();
                    if (idTabeli != tabela)
                    {
                        continue;
                    }
                    log.Info(tenPlik + " odczytXML : odczytywanie informacji o tabeli");
                    iloscWierszy = int.Parse(informacjeOtabeli.ChildNodes[0].InnerText);
                    tekstNadTabela = informacjeOtabeli.ChildNodes[1].InnerText;
                    iloscWieszyNaglowka = int.Parse(informacjeOtabeli.ChildNodes[2].InnerText);
                    ilosckolunPrzedIteracja = int.Parse(informacjeOtabeli.ChildNodes[3].InnerText);
                    ilosckolunPoIteracji = int.Parse(informacjeOtabeli.ChildNodes[4].InnerText);
                    Lp = int.Parse(informacjeOtabeli.ChildNodes[5].InnerText);
                    log.Info(tenPlik + " odczytXML : odczytywanie informacji o nagłówku");
                    naglowek = wygenerujTabele(node.ChildNodes[(int)pola.naglowek]);
                    log.Info(tenPlik + " odczytXML : odczytywanie informacji o tabeli bocznej");
                    tabelaBoczna = wygenerujTabele(node.ChildNodes[(int)pola.tabelaBoczna]);
                    log.Info(tenPlik + " odczytXML : wypełnianie tabeli");
                    string wyswietlNaglowek = "1";
                    try
                    {
                        wyswietlNaglowek = informacjeOtabeli.ChildNodes[6].InnerText;
                        if ((wyswietlNaglowek.Length == 1) && (wyswietlNaglowek != "0"))
                        {
                            wyswietlNaglowek = "0";
                        }
                    }
                    catch
                    {
                    }
                    if (wyswietlNaglowek != "0")
                    {
                        tabelaGlowna.AppendLine(tworztabeleMSS(idTabeli, naglowek, tabelaBoczna, tabelaDanych, iloscWieszyNaglowka, iloscWierszy, ilosckolunPrzedIteracja, ilosckolunPoIteracji, idDzialu, lp, tekstNadTabela, "test"));
                    }
                    else
                    {
                        tabelaGlowna.AppendLine(tworztabeleMSS(idTabeli, tabelaBoczna, tabelaDanych, iloscWierszy, idDzialu, "", tenPlik));
                    }
                    //tabelaGlowna.AppendLine(tworztabeleMSS(idTabeli, naglowek, tabelaBoczna, tabelaDanych, iloscWieszyNaglowka, iloscWierszy, ilosckolunPrzedIteracja, ilosckolunPoIteracji, idDzialu, lp, tekstNadTabela, "test"));
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " tabela: " + idTabeli + " bład generowania tabli z XML : " + ex.Message);
            }

            return tabelaGlowna.ToString();
        }

        public string odczytXML(string path, int idDzialu, string tabela, DataTable tabelaDanych, string tenPlik, bool bezNaglowka)
        {
            // string path = Server.MapPath("XMLHeaders") + "\\" + sciezka;

            if (!File.Exists(path))
            {
                log.Error(tenPlik + " bład odczytu pliku: " + path);

                return "";
            }
            if (tabelaDanych == null)
            {
                log.Error(tenPlik + " brak danych dla tabeli MSS dla działu : " + idDzialu.ToString());

                // return "";
            }
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            // StringBuilder st = new StringBuilder();
            string tekstNadTabela = string.Empty;
            int iloscWierszy = 0;
            string idTabeli = string.Empty;
            int iloscWieszyNaglowka = 0;
            int ilosckolunPrzedIteracja = 0;
            int ilosckolunPoIteracji = 0;
            int Lp = 0;

            StringBuilder tabelaGlowna = new StringBuilder();
            try
            {
                foreach (XmlNode node in doc.DocumentElement.ChildNodes)
                {
                    DataTable naglowek = new DataTable();
                    DataTable tabelaBoczna = new DataTable();
                    DataTable komorkiNaglowka = new DataTable();
                    DataTable komorkiboczne = new DataTable();

                    XmlNode informacjeOtabeli = node.ChildNodes[(int)pola.informacjeOtabeli];
                    if (informacjeOtabeli == null)
                    {
                        continue;
                    }
                    idTabeli = node.Attributes[0].Value.ToString();
                    if (idTabeli != tabela)
                    {
                        continue;
                    }

                    iloscWierszy = int.Parse(informacjeOtabeli.ChildNodes[0].InnerText);

                    tekstNadTabela = informacjeOtabeli.ChildNodes[1].InnerText;

                    iloscWieszyNaglowka = int.Parse(informacjeOtabeli.ChildNodes[2].InnerText);

                    ilosckolunPrzedIteracja = int.Parse(informacjeOtabeli.ChildNodes[3].InnerText);

                    ilosckolunPoIteracji = int.Parse(informacjeOtabeli.ChildNodes[4].InnerText);

                    Lp = int.Parse(informacjeOtabeli.ChildNodes[5].InnerText);
                    //  lp = (Lp == 0);
                    //  naglowek = wygenerujTabele(node.ChildNodes[(int)pola.naglowek]);

                    tabelaBoczna = wygenerujTabele(node.ChildNodes[(int)pola.tabelaBoczna]);

                    tabelaGlowna.AppendLine(tworztabeleMSS(idTabeli, tabelaBoczna, tabelaDanych, iloscWierszy, idDzialu, "", tenPlik));
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " bład generowania tabeli z xml : " + ex.Message);
            }

            return tabelaGlowna.ToString();
        }

        public void TworzTabelizListy(string[] listaTabel, PlaceHolder placeHolder, string path, DataTable tabelaDanych, int id_dzialu, string tenPlik)
        {
            //   placeHolder = new PlaceHolder();
            placeHolder.Dispose();
            placeHolder.Controls.Clear();
            int i = 1;
            foreach (var item in listaTabel)
            {
                Thread.Sleep(20);
                string kontrolka = "Lb_" + DateTime.Now.Ticks.ToString() + i.ToString();

                log.Info(tenPlik + " nazwa kontrolki " + kontrolka);

                try
                {
                    log.Info(tenPlik + " Start generowania tabeli: " + item);
                    placeHolder.Controls.Add(new Label { Text = odczytXML(path, id_dzialu, item, tabelaDanych, tenPlik), Width = 1150, ID = kontrolka });
                }
                catch (Exception ex)
                {
                    log.Error(tenPlik + " bład generowania tabli " + item + " : " + ex.Message);
                }
                i++;
            }
        }

        private DataTable wygenerujTabele(XmlNode schemat)
        {
            DataTable tabelaWyjsciowa = schematTabeli();
            if (schemat == null)
            {
                return tabelaWyjsciowa;
            }
            try
            {
                foreach (XmlNode komorka in schemat.ChildNodes)
                {
                    int wiersz = int.Parse(komorka.ChildNodes[0].InnerText.Trim());
                    int kolumna = int.Parse(komorka.ChildNodes[1].InnerText.Trim());
                    int rowspan = int.Parse(komorka.ChildNodes[2].InnerText.Trim());
                    int colspan = int.Parse(komorka.ChildNodes[3].InnerText.Trim());
                    string style = komorka.ChildNodes[4].InnerText.Trim();
                    string tekst = komorka.ChildNodes[5].InnerText.Trim();
                    string pustak = string.Empty;
                    try
                    {
                        //     pustak = komorka.ChildNodes[6].InnerText.Trim();
                    }
                    catch (Exception ex)
                    {
                        log.Error(" - generowanie  wygenerujTabele -  " + ex.Message);
                    }
                    tabelaWyjsciowa.Rows.Add(new Object[] { wiersz, kolumna, rowspan, colspan, style, tekst, pustak });
                }

                //                         W  K  CS RS
            }
            catch (Exception ex)
            {
                log.Error(" bład generowania tabeli MSS : " + ex.Message);
            }

            return tabelaWyjsciowa;
        }

        private DataRow wyciagnijWartosc(DataTable ddT, string selectString, string tenPlik)
        {
            DataRow result = null;
            if (ddT == null)
            {
                return result;
            }
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr;
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
        }

        private string rowSpanPart(int rowSpan)
        {
            string resultZero = String.Empty;
            string rezultNotZero = "rowspan ='" + rowSpan.ToString() + "' ";
            return rowSpan == 0 ? resultZero : rezultNotZero;
        }

        public class Student
        {
            public int IdWydzial { get; set; }
            public int IdTabeli { get; set; }
            public int IdWiersza { get; set; }
            public double IdKolumny { get; set; }
            public string Wartosc { get; set; }
        }
    }
}