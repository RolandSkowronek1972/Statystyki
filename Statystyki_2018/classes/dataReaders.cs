/*
Last Update:
     - version 1.190414
Creation date: 2018-11-21

*/

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public class dataReaders
    {
        public common Common = new common();
        public Class1 cl = new Class1();
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
        public log_4_net log = new log_4_net();

        private string getColumnName(int i)
        {
            string txt = string.Empty;
            if (i < 10)
            {
                txt = "d_0" + i.ToString().Trim();
            }
            else
            {
                txt = "d_" + i.ToString().Trim();
            }
            return txt;
        }

        public string wyciagnijDaneNt(string kw, DateTime poczatek, DateTime koniec, string cs, string tenPlik)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@data_1", KonwertujDate(poczatek));
            parameters.Rows.Add("@data_2", KonwertujDate(koniec));

            return Common.getQuerryValue(kw, cs, parameters, tenPlik);
        }

        public DataTable generuj_dane_do_tabeli_wierszy2018(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli, int iloscWierszy, int iloscKolumn, string tenPlik)

        {
            /*roznica w stosunku do wersji bez NT polega na tym ze wszystkie kwerendy są zaczytywane jednocześnie a potem tylko
            zaciągane z datasetu
            struktura datasetu
            - wiersz, kolumna, kwerenda
            - kwerenda: SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli
            */

            const string kod = " DR0003";

            //Common.log.Info(tenPlik + kod +"-> : rozpoczęcie tworzenia tabeli z danymi");
            DataTable outputTable = new DataTable();
            for (int i = 1; i <= iloscKolumn + 1; i++)
            {
                outputTable.Columns.Add("d_" + i.ToString("D2").Trim(), typeof(string));
                outputTable.Columns["d_" + i.ToString("D2").Trim()].DefaultValue = "0";
            }

            DataTable kwerendy = new DataTable();
            DataTable parameters = Common.makeParameterTable();

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            //Common.log.Info(tenPlik + kod + "-> : odczyt kwerend");
            DataTable ddT = Common.getDataTable("SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wiersza>0 and id_kolumny>0 and id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli", con_str, parameters, tenPlik);
            if (ddT.Rows.Count == 0)
            {
                Common.log.Info(tenPlik + kod + "-> : odczyt kwerend: brak kwerend do doczytu danych");
                return null;
            }
            string cs = cl.podajConnectionString(int.Parse(id_dzialu));
            string kw = string.Empty;
            for (int i = 1; i <= iloscWierszy; i++) //po wierszach
            {
                DataRow dR = outputTable.NewRow();
                for (int j = 1; j <= iloscKolumn; j++)//po kolumnach
                {
                    try
                    {
                        string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;
                        DataRow[] foundRows;
                        foundRows = ddT.Select(selectString);
                        if (foundRows.Count() != 0)
                        {
                            DataRow dr = foundRows[0];
                            kw = dr[2].ToString();
                            //wpisanie danych
                            try
                            {
                                dR[j] = wyciagnijDaneNt(kw, poczatek, koniec, cs, tenPlik);
                            }
                            catch (Exception ex)
                            {
                                Common.log.Error(tenPlik + " Kwerenda: " + kw + " bład " + kod + " " + ex.Message);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Common.log.Error(kod + " " + ex.Message);
                        dR[j] = "0";
                    }//end of try
                }
                outputTable.Rows.Add(dR);
            }
            return outputTable;
        }// end of generuj_dane_do_tabeli

        public DataTable generuj_dane_do_tabeli_z_miesiacami(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli, int iloscKolumn, string tenPlik)

        {
            //Common.log.Info(tenPlik + kod +"-> : rozpoczęcie tworzenia tabeli z danymi");
            DataTable outputTable = tabelaZmiesiacami(iloscKolumn);
            DataTable parameters = Common.makeParameterTable();

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            //Common.log.Info(tenPlik + kod + "-> : odczyt kwerend");
            DataTable ddT = Common.getDataTable("SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wiersza>0 and id_kolumny>0 and id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli", con_str, parameters, tenPlik);
            if (ddT.Rows.Count == 0)
            {
                Common.log.Info(tenPlik + "-> : odczyt kwerend: brak kwerend do doczytu danych");
                return null;
            }
            string cs = cl.podajConnectionString(int.Parse(id_dzialu));
            string kw = string.Empty;

            for (int i = 1; i < 13; i++) //po wierszach
            {
                DataRow dR = outputTable.NewRow();
                dR["id"] = i;
                dR["miesiac"] = Common.podajMiesiac(i);
                for (int j = 1; j <= iloscKolumn; j++)//po kolumnach
                {
                    try
                    {
                        string selectString = "id_wiersza=" + (i) + " and " + "id_kolumny=" + j;
                        DataRow[] foundRows;
                        foundRows = ddT.Select(selectString);
                        if (foundRows.Count() != 0)
                        {
                            DataRow dr = foundRows[0];
                            kw = dr[2].ToString();
                            //wpisanie danych
                            try
                            {
                                dR[j + 1] = wyciagnijDaneNt(kw, poczatek, koniec, cs, tenPlik);
                            }
                            catch (Exception ex)
                            {
                                Common.log.Error(tenPlik + " Kwerenda: " + kw + " bład " + " " + ex.Message);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Common.log.Error(tenPlik + " bład " + ex.Message);
                        dR[j] = "0";
                    }//end of try
                }
                outputTable.Rows.Add(dR);
            }
            return outputTable;
        }// end of generuj_dane_do_tabeli

        public DataTable konwertujNaPrzecinek(DataTable tabelaWejsciowa)
        {
            if (tabelaWejsciowa == null)
            {
                return null;
            }
            DataTable tabelaSkonwertowana = tabelaWejsciowa.Clone();
            tabelaSkonwertowana.Rows.Clear();
            foreach (DataRow wiersz in tabelaWejsciowa.Rows)
            {
                DataRow nowyWiersz = tabelaSkonwertowana.NewRow();
                for (int i = 0; i <= tabelaSkonwertowana.Columns.Count; i++)
                {
                    try
                    {
                        string wartosc = wiersz[i].ToString();
                        wartosc = wartosc.Replace(".", ",");
                        nowyWiersz[i] = wartosc;
                    }
                    catch
                    {
                    }
                }
                tabelaSkonwertowana.Rows.Add(nowyWiersz);
            }
            return tabelaSkonwertowana;
        }

        public string generuj_dane_do_tabeli_(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, string tenPlik)
        {
            Common.log.Info("Początek przetwarzania danych w pliku" + tenPlik + " identyfikator tabeli: " + id_tabeli);
            string kod = "Dr00001 ";
            string status = string.Empty;
            //Common.log.Info(kod + "pompowanie danch do tabeli: " + id_tabeli.ToString());
            var conn = new SqlConnection(con_str);
            string kwerenda = string.Empty;
            DataTable parameters = Common.makeParameterTable();

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            DataTable ddT = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_wiersza=0 and id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters, tenPlik);

            if (ddT.Rows.Count == 0)
            {
                // brak kwerend odcztującch
                Common.log.Info(kod + "brak kwerend odcztujących");
                return "";
            }

            // sa kwerendy
            Common.log.Info("są kwerendy odcztujące, il: " + ddT.Rows.Count.ToString());
            //getTable
            try
            {
                foreach (DataRow dRow in ddT.Rows)
                {
                    string id_kol = dRow[0].ToString().Trim();
                    string kwe = dRow[1].ToString().Trim();
                    string cs = cl.podajConnectionString(id_dzialu);
                    ////############################################  ladowanie danych tabela 2 ##############################
                    // odczyt sedziów
                    parameters = Common.makeParameterTable();

                    parameters.Rows.Add("@id_dzialu", id_dzialu);
                    parameters.Rows.Add("@id_tabeli", id_tabeli);
                    parameters.Rows.Add("@data_1", KonwertujDate(poczatek));
                    parameters.Rows.Add("@data_2", KonwertujDate(koniec));

                    ddT = Common.getDataTable(kwe, cs, parameters, tenPlik);
                    //pętla ładująca dane dane sedzw

                    foreach (DataRow dR in ddT.Rows)
                    {
                        switch (id_kol)
                        {
                            case "0":
                                {
                                    parameters = Common.makeParameterTable();
                                    parameters.Rows.Add("@imie", dR[1].ToString().Trim());
                                    parameters.Rows.Add("@nazwisko", dR[2].ToString().Trim());
                                    parameters.Rows.Add("@funkcja", dR[3].ToString().Trim());
                                    parameters.Rows.Add("@stanowisko", dR[4].ToString().Trim());
                                    parameters.Rows.Add("@id_sedziego", dR[0].ToString().Trim());
                                    parameters.Rows.Add("@id_tabeli", id_tabeli);
                                    parameters.Rows.Add("@id_dzialu", id_dzialu);
                                    parameters.Rows.Add("@sesja", "s3030");
                                    Common.runQuerry("insert into tbl_statystyki_tbl_02 (imie,nazwisko,funkcja,stanowisko,id_sedziego,sesja,id_tabeli,id_dzialu) values (@imie,@nazwisko,@funkcja,@stanowisko,@id_sedziego,@sesja,@id_tabeli,@id_dzialu)", con_str, parameters, tenPlik);
                                    // załadowanie danych do pierwszych kolumn
                                }
                                break;

                            default:
                                {
                                    string txt = string.Empty;
                                    txt = getColumnName(int.Parse(id_kol.Trim()));
                                    parameters = Common.makeParameterTable();

                                    string ttxx = dR[0].ToString().Trim();
                                    parameters.Rows.Add("@value", dR[0].ToString().Trim());
                                    try
                                    {
                                        parameters.Rows.Add("@id_", dR[1].ToString().Trim());
                                    }
                                    catch
                                    {
                                        parameters.Rows.Add("@id_", "0");
                                    }

                                    parameters.Rows.Add("@id_tabeli", id_tabeli);
                                    parameters.Rows.Add("@id_dzialu", id_dzialu);
                                    parameters.Rows.Add("@sesja", "s3030");

                                    Common.runQuerry("update tbl_statystyki_tbl_02 set " + txt + "=@value, sesja=@sesja where id_sedziego=@id_ and id_tabeli=@id_tabeli and id_dzialu=@id_dzialu", con_str, parameters, tenPlik);
                                }
                                break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Common.log.Error(kod + " " + ex.Message);
            }//end of try
            Common.log.Info("Koniec przetwarzania danych w pliku" + tenPlik + " identyfikator tabeli: " + id_tabeli);
            return status;
        }// end of generuj_dane_do_tabeli_3

        //================================================================================================

        private string funkcja(int id_)
        {
            //funkcja=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=tbl_statystyki_tbl_02.funkcja)"

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@_id", id_);
            return Common.getQuerryValue("SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=@_id", con_str, parameters);
        } // end of funkcja

        private string stanowisko(int id_)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@_id", id_);
            return Common.getQuerryValue("SELECT rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=2 and ident=@_id", con_str, parameters);
        }

        public string KonwertujDate(DateTime data) => data.Year.ToString().Trim() + "-" + data.Month.ToString("D2") + "-" + data.Day.ToString("D2");

        public DataTable generuj_dane_do_tabeli_sedziowskiej_2019(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn, string tenPlik)
        {
            string status = string.Empty;
            //Common.log.Info(tenPlik + " :Generowanie tabeli danych: Rozpoczęcie");

            DataTable dTable = new DataTable();
            //Common.log.Info(tenPlik + " :Generowanie tabeli danych: Pobieranie connectionstringa");

            string cs = cl.podajConnectionString(id_dzialu);

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            Common.log.Info(tenPlik + " :Generowanie tabeli danych: Wyciądnięcie kwerend dla tabeli :" + id_tabeli);
            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,kwerenda FROM kwerendy where id_wiersza=0 and id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters, tenPlik);
            if (dT1.Rows.Count == 0)
            {
                Common.log.Info(tenPlik + " :Generowanie tabeli danych: Brak kwerend dla tabeli : " + id_tabeli);
                return null;
            }

            // tworzenie tabeli
            dTable = tabelaSedziowska(il_kolumn);

            // sa kwerendy
            //wyselekcjonuj kwerendy z sedziami col=0
            DataRow[] kwerendySedziow = dT1.Select("id_kolumny=0");
            if (kwerendySedziow.Length == 0)
            {
                Common.log.Info(tenPlik + " :Generowanie tabeli danych: Brak kwerend wyciągających sedziów dla tabeli : " + id_tabeli);
                return null;
            }
            DataRow[] kwerendyDanych = dT1.Select("id_kolumny>0");
            if (kwerendyDanych.Length == 0)
            {
                Common.log.Info(tenPlik + " :Generowanie tabeli danych: ilość kwerend wyciągających dane  dla tabeli : " + id_tabeli + "=" + kwerendyDanych.Length);
            }
            // ladowanie danych sedziów
            try
            {
                Common.log.Info(tenPlik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli : " + id_tabeli);
                int i = 1;
                foreach (var wiersz in kwerendySedziow)
                {
                    string kwerendaSedziego = wiersz[1].ToString();
                    DataTable parametry = Common.makeParameterTable();
                    Common.log.Info(tenPlik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli -> parametr data_1: " + KonwertujDate(poczatek));
                    Common.log.Info(tenPlik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli -> parametr data_2: " + KonwertujDate(koniec));

                    parametry.Rows.Add("@data_1", KonwertujDate(poczatek));
                    parametry.Rows.Add("@data_2", KonwertujDate(koniec));
                    //con_str_wcyw
                    DataTable tabelaSedziow = Common.getDataTable(kwerendaSedziego, cs, parametry, tenPlik);
                   
                    foreach (DataRow Sedzia in tabelaSedziow.Rows)
                    {
                        try
                        {
                            DataRow daneSedziego = dTable.NewRow();
                            daneSedziego[0] = i;
                            daneSedziego[1] = int.Parse(Sedzia[0].ToString());                      //id sedziego
                            daneSedziego[2] = funkcja(int.Parse(Sedzia[3].ToString().Trim()));      //funkcja
                            daneSedziego[3] = stanowisko(int.Parse(Sedzia[4].ToString().Trim()));                     //stanowisko
                            daneSedziego[4] = Sedzia[1].ToString().Trim();                     //imie
                            daneSedziego[5] = Sedzia[2].ToString().Trim();                     //nazwisko
                            daneSedziego[6] = id_tabeli;                                //id tabeli
                            daneSedziego[7] = Sedzia[1].ToString().Trim() + " " + Sedzia[2].ToString().Trim();                     //imie i nazwisko
                            dTable.Rows.Add(daneSedziego);
                            i++;
                        }
                        catch (Exception ex)
                        {
                            string exx = ex.Message;
                            Common.log.Error(tenPlik + " :Generowanie tabeli danych: Wpisywanie danych dla tabeli : " + id_tabeli + " " + ex.Message);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string exx = ex.Message;
                Common.log.Error(tenPlik + " :Generowanie tabeli danych: Wpisywanie danych dla tabeli : " + id_tabeli + " " + ex.Message);
            }
            // wpisywanie danych dla sedziów
            try
            {
                foreach (var wiersz in kwerendyDanych)
                {
                    string kolumna = wiersz[0].ToString();
                    string kwerendaDanych = wiersz[1].ToString();
                    DataTable parametry = Common.makeParameterTable();

                    parametry.Rows.Add("@data_1", KonwertujDate(poczatek));
                    parametry.Rows.Add("@data_2", KonwertujDate(koniec));
                    DataTable tabelaDanychDlaSedziow = Common.getDataTable(kwerendaDanych, cs, parametry, tenPlik);

                    // przepisanie danych sedziow
                    int index = 0;

                    foreach (DataRow dRow in tabelaDanychDlaSedziow.Rows)
                    {
                        try
                        {
                            string idSedziego = dRow[1].ToString().Trim();
                            //linq znajdz wiersz z sedzim
                            // pobierz index

                            string warosc = dRow[0].ToString().Trim();
                            index = 0;
                            foreach (DataRow dr in dTable.Rows)
                            {
                                if (dr.ItemArray.Length < 2)
                                {
                                    continue;
                                }
                                string nr_sedziego = dr[1].ToString();
                                if (nr_sedziego == idSedziego)
                                {
                                    dTable.Rows[index][getColumnName(int.Parse(kolumna))] = warosc;
                                }
                                index++;
                            }
                        }
                        catch
                        { }
                    }
                }
            }
            catch
            { }

            

            return dTable;
        }// end of generuj_dane_do_tabeli_5

        public DataTable generuj_naglowki_do_tabeli_sedziowskiej_2019(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn, string tenPlik)
        {
            string status = string.Empty;
            //Common.log.Info(tenPlik + " :Generowanie tabeli danych: Rozpoczęcie");

            DataTable dTable = new DataTable();
            //Common.log.Info(tenPlik + " :Generowanie tabeli danych: Pobieranie connectionstringa");

            string cs = cl.podajConnectionString(id_dzialu);

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            Common.log.Info(tenPlik + " :Generowanie tabeli danych: Wyciądnięcie kwerend dla tabeli :" + id_tabeli);
            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,kwerenda FROM kwerendy where id_wiersza<0 and id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters, tenPlik);
            if (dT1.Rows.Count == 0)
            {
                Common.log.Info(tenPlik + " :Generowanie tabeli danych: Brak kwerend dla tabeli : " + id_tabeli);
                return null;
            }

            return dT1;
        }// end of generuj_dane_do_tabeli_5

        public string generuj_naglowki_nad_tabela(int id_dzialu, int id_tabeli, string tenPlik)
        {
            string napis = string.Empty;
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);

            napis = Common.getQuerryValue("SELECT kwerenda FROM kwerendy WHERE (id_tabeli = @id_tabeli) AND (id_kolumny = - 1) AND (id_wydzial = @id_dzialu)", con_str, parameters, tenPlik);

            return napis;
        }// end of generuj_dane_do_tabeli_5
        public DataTable generuj_naglowki_nad_tabelaMK(int id_dzialu, int id_tabeli, string tenPlik)
        {
            string napis = string.Empty;
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            return Common.getDataTable("SELECT kwerenda,id_kolumny FROM kwerendy WHERE (id_tabeli = @id_tabeli) AND (id_wiersza =-1) AND (id_wydzial = @id_dzialu)", con_str, parameters, tenPlik);


        }// end of  generuj_naglowki_nad_tabelaMK
        public string wyciagnijWartosc(DataTable ddT, string selectString, string tenPlik)
        {
            if ((string.IsNullOrEmpty(selectString)) || (ddT == null))
            {
                return "0";
            }
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[4].ToString();
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
        }
        public string wyciagnijWartoscMK(DataTable ddT, string selectString, string tenPlik)
        {
            if ((string.IsNullOrEmpty(selectString)) || (ddT == null))
            {
                return "0";
            }
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[0].ToString();
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
        }

        public DataTable tworzTabele(int idDzialu, int idTabeli, DateTime dataPoczatku, DateTime dataKonca, int iloscKolumn, GridView kontrolka, string tenPlik)
        {
            if (cl.debug(idDzialu))
            {
                Common.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli: " + idTabeli);
            }
            DataTable tabelka = generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, idTabeli, dataPoczatku, dataKonca, iloscKolumn, tenPlik);
            kontrolka.DataSource = null;
            kontrolka.DataSourceID = null;
            kontrolka.DataSource = tabelka;
            kontrolka.DataBind();
            return tabelka;
        }

        public int iloscKolumnMK(int idTabeli, int idWydzialu, string tenPlik)
        {
            try
            {
                log.Info(tenPlik + " - iloscKolumn -id tabeli " + idTabeli.ToString());
                log.Info(tenPlik + " - iloscKolumn -id idWydzialu " + idWydzialu.ToString());
                DataTable parameters = Common.makeParameterTable();
                parameters.Rows.Add("@idTabeli", idTabeli);
                parameters.Rows.Add("@idWydzialu", idWydzialu);
                return int.Parse(Common.getQuerryValue("SELECT COALESCE(MAX(id_kolumny),0) AS iloscKolumn FROM  kwerendy WHERE (id_wydzial = @idWydzialu) AND (id_tabeli = @idTabeli and id_wiersza>0)", con_str, parameters));
            }
            catch (Exception ex)

            {
                log.Error(tenPlik + " - ilosc Kolumn  " + ex.Message);
            }
            return 0;
        }
        public int iloscKolumn(int idTabeli, int idWydzialu, string tenPlik)
        {
            try
            {
                log.Info(tenPlik + " - iloscKolumn -id tabeli " + idTabeli.ToString());
                log.Info(tenPlik + " - iloscKolumn -id idWydzialu " + idWydzialu.ToString());
                DataTable parameters = Common.makeParameterTable();
                parameters.Rows.Add("@idTabeli", idTabeli);
                parameters.Rows.Add("@idWydzialu", idWydzialu);
                return int.Parse(Common.getQuerryValue("SELECT COALESCE(MAX(id_kolumny),0) AS iloscKolumn FROM  kwerendy WHERE (id_wydzial = @idWydzialu) AND (id_tabeli = @idTabeli and id_wiersza=0)", con_str, parameters));
            }
            catch (Exception ex)

            {
                log.Error(tenPlik + " - ilosc Kolumn  " + ex.Message);
            }
            return 0;
        }
        public int iloscWierszy(int idTabeli, int idWydzialu, string tenPlik)
        {
            try
            {
                DataTable parameters = Common.makeParameterTable();
                parameters.Rows.Add("@idTabeli", idTabeli);
                parameters.Rows.Add("@idWydzialu", idWydzialu);
                return int.Parse(Common.getQuerryValue("SELECT COALESCE(MAX(id_wiersza), 0) AS iloscKolumn FROM  kwerendy WHERE (id_wydzial = @idWydzialu) AND (id_tabeli = @idTabeli) and (id_kolumny>0)", con_str, parameters));
            }
            catch (Exception ex)

            {
                log.Error(tenPlik + " - ilosc Wierszy  " + ex.Message);
            }
            return 0;
        }

        public DataRow[] getData(DataTable dTab, string expression)
        {
            DataRow[] foundRows = null;
            if (dTab != null)
            {
                foundRows = dTab.Select(expression);
            }
            return foundRows;
        }
       
        private DataTable tabelaSedziowska(int il_kolumn)
        {
            DataTable dTable = new DataTable();
            dTable.Columns.Add("id", typeof(int));
            dTable.Columns.Add("id_sedziego", typeof(int));
            dTable.Columns.Add("Funkcja", typeof(string));
            dTable.Columns.Add("Stanowisko", typeof(string));
            dTable.Columns.Add("Imie", typeof(string));
            dTable.Columns.Add("Nazwisko", typeof(string));
            dTable.Columns.Add("id_tabeli", typeof(string));
            dTable.Columns.Add("Imienazwisko", typeof(string));

            for (int i = 1; i <= il_kolumn; i++)
            {
                DataColumn column = new DataColumn
                {
                    DataType = typeof(string),
                    AllowDBNull = false,
                    ColumnName = getColumnName(i),
                    DefaultValue = "0"
                };
                dTable.Columns.Add(column);
            }
            return dTable;
        }

        private DataTable tabelaZmiesiacami(int il_kolumn)
        {
            DataTable dTable = new DataTable();
            dTable.Columns.Add("id", typeof(int));
            dTable.Columns.Add("miesiac", typeof(string));

            for (int i = 1; i <= il_kolumn; i++)
            {
                DataColumn column = new DataColumn();

                column.DataType = typeof(string);
                column.AllowDBNull = false;
                column.ColumnName = getColumnName(i);
                column.DefaultValue = "0";
                dTable.Columns.Add(column);
            }
           
            return dTable;
        }
    } // end of class
}