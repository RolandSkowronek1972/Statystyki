using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class wizc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders xMLHeaders = new XMLHeaders();
        private string path = string.Empty;
        private const string tenPlik = "wizc.aspx";
        public string tenPlikNazwa = "wizc";

        protected void Page_Load(object sender, EventArgs e)
        {
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                Session["id_dzialu"] = idWydzial;
                String IdentyfikatorUzytkownika = string.Empty;
                IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                DataTable parametry = cm.makeParameterTable();
                parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


                if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
            }
            catch
            { }
            odswiez();
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            int idWydzial = int.Parse((string)Session["id_dzialu"]);
            tablePlaceHolder.Controls.Clear();
            tablePlaceHolder3.Controls.Clear();
            tablePlaceHolder13.Controls.Clear();
            tablePlaceHolder17.Controls.Clear();
            tablePlaceHolder23.Controls.Clear();
            tablePlaceHolder26.Controls.Clear();

            //odswiezenie danych
            tabela_01(idWydzial, 1);
            tabela_02(idWydzial, 2);
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
           
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 9, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka009"] = tabelka01;
            tworztabelkeHTML("KX1", idWydzial, 9, tabelka01);

            DataTable tabelka02 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 10, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka010"] = tabelka02;
            tworztabelkeHTML2("K2", idWydzial, 10, tabelka02);
            tabela_12();
            DataTable tabelka13 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 13, Date1.Date, Date2.Date, 100, tenPlik);
            Session["tabelka013"] = tabelka13;
            tworztabelkeHTML13("K13", idWydzial, 13, tabelka13);

            tabela_14();
            tabela_15();
            tabela_16();

            DataTable tabelka17 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 17, Date1.Date, Date2.Date, 120, tenPlik);
            Session["tabelka017"] = tabelka17;
            tworztabelkeHTML17("K17", idWydzial, 17, tabelka17, "liczba spraw", "SSR", "IV.5.1. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów (liczba spraw)", "Tabela 17");

            DataTable tabelka18 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 18, Date1.Date, Date2.Date, 120, tenPlik);
            Session["tabelka018"] = tabelka18;
            tworztabelkeHTML17("K18", idWydzial, 18, tabelka18, "%", "SSR", " IV.5.2.Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów(liczba spraw)", "Tabela 18");

            DataTable tabelka19 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 19, Date1.Date, Date2.Date, 120, tenPlik);
            Session["tabelka019"] = tabelka19;
            tworztabelkeHTML19("K19", idWydzial, 19, tabelka19, "liczba spraw", "", " IV.5.3.Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów(liczba spraw)", "Tabela 19");
            //
            DataTable tabelka20 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 20, Date1.Date, Date2.Date, 120, tenPlik);
            Session["tabelka020"] = tabelka20;
            tworztabelkeHTML17("K20", idWydzial, 20, tabelka20, "%", "", " IV.5.4.Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów(liczba spraw)", "Tabela 20");

            tabela_21();
            tabela_22();
            DataTable tabelka23 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 23, Date1.Date, Date2.Date, 160, tenPlik);
            Session["tabelka023"] = tabelka23;
            tworztabelkeHTML23("K23", idWydzial, 23, tabelka23, "Liczba sporządzonych uzasadnień", "", "", "Tabela 23");

            tabela_24();
            tabela_25();

            DataTable tabelka26 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 26, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka026"] = tabelka26;
            tworztabelkeHTML26("K26", idWydzial, 26, tabelka26, "liczba spraw", "", "IV. 7.3. Struktura pozostałości (referaty poszczególnych sędziów – liczba spraw)", "Tabela 26");

            DataTable tabelka27 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 27, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka027"] = tabelka27;
            tworztabelkeHTML26("K27", idWydzial, 27, tabelka27, "% spraw", "", "IV. 7.4. Struktura pozostałości (referaty poszczególnych sędziów – %)", "Tabela 27");

            DataTable tabelka28 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 28, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka028"] = tabelka28;
            tworztabelkeHTML26("K28", idWydzial, 28, tabelka28, "liczba spraw", "", "IV. 7.5. Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)", "Tabela 28");

            DataTable tabelka29 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 29, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka029"] = tabelka29;
            tworztabelkeHTML26("K29", idWydzial, 29, tabelka29, "% spraw", "", "IV. 7.5. Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)", "Tabela 29");

            tabela_30();
            tabela_31();
            tabela_32();
            tabela_33();

            makeLabels();
        }

        private void tabela_01(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
            Session["tabelka001"] = tabelka01;
            try
            {
                tab_1_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_1_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_1_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_1_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_1_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_1_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        private void tabela_02(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
            Session["tabelka002"] = tabelka01;
            try
            {
                tab_2_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_2_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_2_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_2_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_2_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_2_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 15, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 23, tenPlik);

            Session["tabelka004"] = tabelka01;
            gwTabela3_2.DataSource = null;
            gwTabela3_2.DataSourceID = null;
            gwTabela3_2.DataSource = tabelka01;
            gwTabela3_2.DataBind();
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 23, tenPlik);

            Session["tabelka005"] = tabelka01;
            gwTabela3_3.DataSource = null;
            gwTabela3_3.DataSourceID = null;
            gwTabela3_3.DataSource = tabelka01;
            gwTabela3_3.DataBind();
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 6, 2, 1, tenPlik);
            Session["tabelka006"] = tabelka01;
            try
            {
                tab_6_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_6_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 7, 6, 17, tenPlik);
            Session["tabelka007"] = tabelka01;

            try
            {
                DataRow wierszPierwszy = tabelka01.Rows[0];
                tab_7_w01_c01.Text = wierszPierwszy[0].ToString().Trim();
                tab_7_w01_c02.Text = wierszPierwszy[1].ToString().Trim();
                tab_7_w01_c03.Text = wierszPierwszy[2].ToString().Trim();
                tab_7_w01_c04.Text = wierszPierwszy[3].ToString().Trim();
                tab_7_w01_c05.Text = wierszPierwszy[4].ToString().Trim();
                tab_7_w01_c06.Text = wierszPierwszy[5].ToString().Trim();
                tab_7_w01_c07.Text = wierszPierwszy[6].ToString().Trim();
                tab_7_w01_c08.Text = wierszPierwszy[7].ToString().Trim();
                tab_7_w01_c09.Text = wierszPierwszy[8].ToString().Trim();
                tab_7_w01_c10.Text = wierszPierwszy[9].ToString().Trim();
                tab_7_w01_c11.Text = wierszPierwszy[10].ToString().Trim();
                tab_7_w01_c12.Text = wierszPierwszy[11].ToString().Trim();
                tab_7_w01_c13.Text = wierszPierwszy[12].ToString().Trim();
                tab_7_w01_c14.Text = wierszPierwszy[13].ToString().Trim();
                tab_7_w01_c15.Text = wierszPierwszy[14].ToString().Trim();

                wierszPierwszy = tabelka01.Rows[1];
                //    tab_7_w02_c01.Text = wierszPierwszy[1].ToString().Trim();
                tab_7_w02_c02.Text = wierszPierwszy[1].ToString().Trim();
                tab_7_w02_c03.Text = wierszPierwszy[2].ToString().Trim();
                tab_7_w02_c04.Text = wierszPierwszy[3].ToString().Trim();
                tab_7_w02_c05.Text = wierszPierwszy[4].ToString().Trim();
                tab_7_w02_c06.Text = wierszPierwszy[5].ToString().Trim();
                tab_7_w02_c07.Text = wierszPierwszy[6].ToString().Trim();
                tab_7_w02_c08.Text = wierszPierwszy[7].ToString().Trim();
                tab_7_w02_c09.Text = wierszPierwszy[8].ToString().Trim();
                tab_7_w02_c10.Text = wierszPierwszy[9].ToString().Trim();
                tab_7_w02_c11.Text = wierszPierwszy[10].ToString().Trim();
                tab_7_w02_c12.Text = wierszPierwszy[11].ToString().Trim();
                tab_7_w02_c13.Text = wierszPierwszy[12].ToString().Trim();
                tab_7_w02_c14.Text = wierszPierwszy[13].ToString().Trim();
                tab_7_w02_c15.Text = wierszPierwszy[14].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 8, 8, 12, tenPlik);
            Session["tabelka008"] = tabelka01;
            try
            {
                int idWiersza = 0;
                tab_8_w07_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w07_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w07_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w07_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w07_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w07_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w07_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w07_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w07_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w07_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w07_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w07_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();

                idWiersza = 1;
                tab_8_w02_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w02_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w02_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w02_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w02_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w02_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w02_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w02_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w02_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w02_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w02_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w02_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();

                idWiersza = 2;
                tab_8_w03_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w03_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w03_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w03_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w03_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w03_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w03_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w03_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w03_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w03_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w03_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w03_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();

                idWiersza = 3;
                tab_8_w04_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w04_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w04_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w04_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w04_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w04_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w04_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w04_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w04_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w04_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w04_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w04_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();

                idWiersza = 4;
                tab_8_w05_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w05_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w05_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w05_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w05_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w05_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w05_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w05_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w05_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w05_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w05_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w05_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();

                idWiersza = 5;
                tab_8_w06_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w06_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w06_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w06_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w06_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w06_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w06_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w06_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w06_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w06_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w06_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w06_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                idWiersza = 6;
                tab_8_w07_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w07_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w07_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w07_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w07_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w07_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w07_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w07_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w07_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w07_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w07_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w07_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                idWiersza = 7;
                tab_8_w08_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_8_w08_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_8_w08_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_8_w08_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_8_w08_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_8_w08_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_8_w08_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_8_w08_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_8_w08_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_8_w08_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_8_w08_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_8_w08_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 12, 8, 18, tenPlik);
            Session["tabelka012"] = tabelka01;

            try
            {
                int idWiersza = 0;
                tab_12_w01_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w01_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w01_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w01_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w01_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w01_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w01_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w01_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w01_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w01_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w01_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w01_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w01_c11.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
                tab_12_w01_c12.Text = tabelka01.Rows[idWiersza]["d_14"].ToString().Trim();
                tab_12_w01_c13.Text = tabelka01.Rows[idWiersza]["d_15"].ToString().Trim();

                idWiersza = 1;
                tab_12_w02_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w02_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w02_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w02_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w02_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w02_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w02_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w02_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w02_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w02_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w02_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w02_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w02_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
              

                idWiersza = 2;
                tab_12_w03_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w03_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w03_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w03_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w03_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w03_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w03_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w03_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w03_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w03_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w03_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w03_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w03_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
               

                idWiersza = 3;
                tab_12_w04_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w04_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w04_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w04_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w04_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w04_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w04_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w04_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w04_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w04_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w04_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w04_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w04_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
               
                idWiersza = 4;
                tab_12_w05_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w05_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w05_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w05_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w05_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w05_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w05_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w05_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w05_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w05_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w05_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w05_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w05_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
               

                idWiersza = 5;
                tab_12_w06_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w06_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w06_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w06_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w06_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w06_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w06_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w06_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w06_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w06_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w06_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w06_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w06_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
              

                idWiersza = 6;
                tab_12_w07_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w07_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w07_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w07_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w07_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w07_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w07_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w07_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w07_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w07_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w07_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w07_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w07_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
                

                idWiersza = 7;
                tab_12_w08_c01.Text = tabelka01.Rows[idWiersza]["d_01"].ToString().Trim();
                tab_12_w08_c02.Text = tabelka01.Rows[idWiersza]["d_02"].ToString().Trim();
                tab_12_w08_c03.Text = tabelka01.Rows[idWiersza]["d_03"].ToString().Trim();
                tab_12_w08_c04.Text = tabelka01.Rows[idWiersza]["d_04"].ToString().Trim();
                tab_12_w08_c05.Text = tabelka01.Rows[idWiersza]["d_05"].ToString().Trim();
                tab_12_w08_c06.Text = tabelka01.Rows[idWiersza]["d_06"].ToString().Trim();
                tab_12_w08_c07.Text = tabelka01.Rows[idWiersza]["d_07"].ToString().Trim();
                tab_12_w08_c08.Text = tabelka01.Rows[idWiersza]["d_08"].ToString().Trim();
                tab_12_w08_c09.Text = tabelka01.Rows[idWiersza]["d_09"].ToString().Trim();
                tab_12_w08_c10.Text = tabelka01.Rows[idWiersza]["d_10"].ToString().Trim();
                tab_12_w08_c11.Text = tabelka01.Rows[idWiersza]["d_11"].ToString().Trim();
                tab_12_w08_c12.Text = tabelka01.Rows[idWiersza]["d_12"].ToString().Trim();
                tab_12_w08_c13.Text = tabelka01.Rows[idWiersza]["d_13"].ToString().Trim();
              
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": bład przy tworzeniu tabeli 14: " + ex.Message);
            }
        }

        protected void tabela_14()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 14");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 14, 3, 2, tenPlik);
            Session["tabelka014"] = tabelka01;
            try
            {
                tab_14_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_14_w02_c01.Text = tabelka01.Rows[1]["d_01"].ToString().Trim();
                tab_14_w03_c01.Text = tabelka01.Rows[2]["d_01"].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": bład przy tworzeniu tabeli 14: " + ex.Message);
            }
        }

        protected void tabela_15()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 15");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 15, 8, 15, tenPlik);
            Session["tabelka015"] = tabelka01;

            string path = Server.MapPath("XMLHeaders") + "\\wizc.xml";
            StringBuilder Tabele = new StringBuilder();
            Tabele.Append(xMLHeaders.TabelaWierszyXML(path, int.Parse(idDzialu), "15", tabelka01, false, false, false, true, "", tenPlik));
            tablePlaceHolderTab15.Controls.Clear();
            tablePlaceHolderTab15.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id15" });
          
        }

        protected void tabela_16()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 16, 8, 15, tenPlik);
            Session["tabelka016"] = tabelka01;

            string path = Server.MapPath("XMLHeaders") + "\\wizc.xml";
            StringBuilder Tabele = new StringBuilder();
            Tabele.Append(xMLHeaders.TabelaWierszyXML(path, int.Parse(idDzialu), "16", tabelka01, false, false, false, true, "IV. 4.2. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w wydziale (% – ogółem)", tenPlik));
            tablePlaceHolderTab16.Controls.Clear();
            tablePlaceHolderTab16.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id16" });
        }

        protected void tabela_21()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 21, 5, 2, tenPlik);
            Session["tabelka021"] = tabelka01;

            if (tabelka01 == null)
            {
                return;
            }
            try
            {
                tab_21_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_21_w02_c01.Text = tabelka01.Rows[1]["d_01"].ToString().Trim();
                tab_21_w03_c01.Text = tabelka01.Rows[2]["d_01"].ToString().Trim();
                tab_21_w04_c01.Text = tabelka01.Rows[3]["d_01"].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 21: " + ex.Message);
            }
        }

        protected void tabela_22()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 22");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 22, 9, 18, tenPlik);
            Session["tabelka022"] = tabelka01;
            //   pisz("tab_22_", 9, 16, tabelka01);
            try
            {
                int id_ = 0;
                tab_22_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_22_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_22_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_22_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_22_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_22_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_22_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_22_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_22_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_22_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_22_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_22_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_22_w01_c13.Text = tabelka01.Rows[0]["d_13"].ToString().Trim();
                tab_22_w01_c14.Text = tabelka01.Rows[0]["d_14"].ToString().Trim();
                tab_22_w01_c15.Text = tabelka01.Rows[0]["d_15"].ToString().Trim();
                tab_22_w01_c16.Text = tabelka01.Rows[0]["d_16"].ToString().Trim();
                id_ = 1;
                tab_22_w02_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w02_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w02_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w02_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w02_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w02_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w02_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w02_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w02_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w02_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w02_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w02_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w02_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w02_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w02_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w02_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                id_ = 2;
                tab_22_w03_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w03_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w03_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w03_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w03_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w03_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w03_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w03_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w03_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w03_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w03_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w03_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w03_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w03_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w03_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w03_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                id_ = 3;
                tab_22_w04_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w04_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w04_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w04_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w04_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w04_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w04_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w04_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w04_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w04_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w04_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w04_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w04_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w04_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w04_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w04_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                id_ = 4;
                tab_22_w05_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w05_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w05_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w05_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w05_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w05_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w05_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w05_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w05_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w05_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w05_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w05_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w05_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w05_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w05_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w05_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                id_ = 5;
                tab_22_w06_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w06_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w06_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w06_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w06_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w06_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w06_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w06_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w06_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w06_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w06_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w06_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w06_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w06_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w06_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w06_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                id_ = 6;
                tab_22_w07_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
                tab_22_w07_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w07_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w07_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w07_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w07_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w07_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w07_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w07_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w07_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w07_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w07_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w07_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w07_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w07_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w07_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();

                //     tab_22_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                id_ = 7;
                
                tab_22_w08_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
                tab_22_w08_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
                tab_22_w08_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
                tab_22_w08_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
                tab_22_w08_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
                tab_22_w08_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
                tab_22_w08_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
                tab_22_w08_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
                tab_22_w08_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
                tab_22_w08_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
                tab_22_w08_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
                tab_22_w08_c13.Text = tabelka01.Rows[id_]["d_13"].ToString().Trim();
                tab_22_w08_c14.Text = tabelka01.Rows[id_]["d_14"].ToString().Trim();
                tab_22_w08_c15.Text = tabelka01.Rows[id_]["d_15"].ToString().Trim();
                tab_22_w08_c16.Text = tabelka01.Rows[id_]["d_16"].ToString().Trim();
            }
            catch (Exception)
            {
            }
        }

        protected void tabela_24()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 24");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 24, 8, 15, tenPlik);
            Session["tabelka024"] = tabelka01;

            string path = Server.MapPath("XMLHeaders") + "\\wizc.xml";
            StringBuilder Tabele = new StringBuilder();
            Tabele.Append(xMLHeaders.TabelaWierszyXML(path, int.Parse(idDzialu), "24", tabelka01, false, false, false, true, "", tenPlik));
            tablePlaceHolder27.Controls.Clear();
            tablePlaceHolder27.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id24" });
        }

        protected void tabela_25()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 25");
            }

            DataTable tabela025 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 25, 9, 15, tenPlik);
            Session["tabelka025"] = tabela025;

            string path = Server.MapPath("XMLHeaders") + "\\wizc.xml";
            StringBuilder Tabele = new StringBuilder();
            Tabele.Append(xMLHeaders.TabelaWierszyXML(path, int.Parse(idDzialu), "25", tabela025, false, false, false, true, "", tenPlik));
            tablePlaceHolder28.Controls.Clear();
            tablePlaceHolder28.Controls.Add(new Label { Text = Tabele.ToString(), ID = "id25" });
        }

        protected void tabela_30()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 30");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 30, 5, 2, tenPlik);
            Session["tabelka021"] = tabelka01;

            if (tabelka01 == null)
            {
                return;
            }
            try
            {
                tab_30_w01_c01.Text = tabelka01.Rows[0][0].ToString().Trim();
                tab_30_w02_c01.Text = tabelka01.Rows[1][0].ToString().Trim();
                tab_30_w03_c01.Text = tabelka01.Rows[2][0].ToString().Trim();
                tab_30_w04_c01.Text = tabelka01.Rows[3][0].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 21: " + ex.Message);
            }
        }

        protected void tabela_31()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 31");
            }

            DataTable tabela031 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 31, 7, 14, tenPlik);
            Session["tabelka031"] = tabela031;

            if (tabela031 == null)
            {
                return;
            }
            try
            {
                //  wiersz 1
                int id_ = 0;
                tab_31_w01_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w01_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w01_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w01_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w01_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w01_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w01_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w01_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
                //  wiersz 2
                id_ = 1;
                tab_31_w02_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w02_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w02_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w02_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w02_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w02_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w02_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w02_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
                //  wiersz 3
                id_ = 2;
                tab_31_w03_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w03_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w03_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w03_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w03_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w03_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w03_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w03_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
                //  wiersz 4
                id_ = 3;
                tab_31_w04_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w04_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w04_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w04_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w04_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w04_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w04_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w04_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
                //  wiersz 5
                id_ = 4;
                tab_31_w05_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w05_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w05_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w05_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w05_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w05_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w05_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w05_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();

                //  wiersz 6
                id_ = 5;
                tab_31_w06_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w06_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w06_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w06_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w06_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w06_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w06_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w06_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
                //  wiersz 7
                id_ = 6;
                tab_31_w07_c01.Text = tabela031.Rows[id_]["d_01"].ToString().Trim();
                tab_31_w07_c02.Text = tabela031.Rows[id_]["d_02"].ToString().Trim();
                tab_31_w07_c03.Text = tabela031.Rows[id_]["d_03"].ToString().Trim();
                tab_31_w07_c04.Text = tabela031.Rows[id_]["d_04"].ToString().Trim();
                tab_31_w07_c05.Text = tabela031.Rows[id_]["d_05"].ToString().Trim();
                tab_31_w07_c06.Text = tabela031.Rows[id_]["d_06"].ToString().Trim();
                tab_31_w07_c07.Text = tabela031.Rows[id_]["d_07"].ToString().Trim();
                tab_31_w07_c08.Text = tabela031.Rows[id_]["d_08"].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 31: " + ex.Message);
            }
        }

        protected void tabela_32()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 31");
            }

            DataTable tabela032 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 32, 7, 14, tenPlik);
            Session["tabelka032"] = tabela032;

            if (tabela032 == null)
            {
                return;
            }
            try
            {
                //  wiersz 1
                tab_32_w01_c01.Text = tabela032.Rows[0][0].ToString().Trim();
                //  wiersz 2
                tab_32_w02_c01.Text = tabela032.Rows[1][0].ToString().Trim();
                //  wiersz 3
                tab_32_w03_c01.Text = tabela032.Rows[2][0].ToString().Trim();
                //  wiersz 4
                tab_32_w04_c01.Text = tabela032.Rows[3][0].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 31: " + ex.Message);
            }
        }

        protected void tabela_33()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 31");
            }

            DataTable tabela033 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 33, 7, 14, tenPlik);
            Session["tabelka033"] = tabela033;

            if (tabela033 == null)
            {
                return;
            }
            try
            {
                //  wiersz 1
                tab_33_w01_c01.Text = tabela033.Rows[0][0].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 33: " + ex.Message);
            }
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            //excell
        }

        protected void tab_1_w02_c01_dateInit(object sender, EventArgs e)
        {
            tab_1_w05_c01.Value = DateTime.Now;
        }

        protected void tab_2_w06_c01_dateInit(object sender, EventArgs e)
        {
            tab_2_w01_c01.Value = DateTime.Now;
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(dT, gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 4);
                tb.makeHeader(dT, gwTabela3_2);
            }
        }

        protected void naglowekTabeli_gwTabela3_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 5);
                tb.makeHeader(dT, gwTabela3_3);
            }
        }

        protected void tworztabelkeHTML(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'></td>");
            builder.AppendLine("<td class='borderAll center' rowspan='3'>pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center' colspan='15'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>sprawdzenie(do usunięcia po sprawdzeniu) suma musi dać 100</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cgg</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Co</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cps</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C- upr</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Nc</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Ns</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 2, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 0, 0, "borderAll center col_250 smallFt"));

                for (int i = 1; i < 18; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 0, 0, "borderAll center col_250 smallFt"));
                for (int i = 19; i < 36; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");
            Label tblControl = new Label();

            using (tblControl)
            {
                tblControl.ID = idKontrolki;
                tblControl.Width = 1150;
                tblControl.Text = builder.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
                tblControl.Dispose();
            }
            tablePlaceHolder.Dispose();
        }

        protected void tworztabelkeHTML2(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<br/");
            builder.AppendLine("<p>Dział IV.2.2. Wielkość referatów referendarzy sądowych</p>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center' rowspan='3'></td>");
            builder.AppendLine("<td class='borderAll center' colspan='15'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>sprawdzenie(do usunięcia po sprawdzeniu) suma musi dać 100</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cgg</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Co</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cps</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C- upr</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Nc</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Ns</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>	</tr><tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 2, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 0, 0, "borderAll center col_250 smallFt"));

                for (int i = 1; i < 17; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 0, 0, "borderAll center col_250 smallFt"));
                for (int i = 18; i < 34; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");
            builder.Append("</div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML3(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<br/");
            builder.AppendLine("<p>Dział IV.2.3. Ruch spraw i obciążenie poszczególnych sędziów</p>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100'>rok</td>");
            builder.AppendLine("<td class='borderAll center col_100'>wpływ	</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załat- wienia</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozos- tałość</td>");
            builder.AppendLine("<td class='borderAll center col_100'>sprawy zawieszone</td>");
            builder.AppendLine("<td class='borderAll center col_100'>wpływ na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załatwienia  na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozostałość na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wpływ na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >załatwienia na sędziego według  obsady średnio- okresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >pozostałość na sędziego według obsady średnio- okresowej (wg limitu)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wskaźnik pozostałości</td>");
            builder.AppendLine("<td class='borderAll center col_100' >efektywny czas pracy</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center col_100"));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center col_100"));

                for (int i = 2; i < 15; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center col_100"));
                for (int i = 16; i < 29; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center col_100"));
                for (int i = 30; i < 43; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center col_100"));
                for (int i = 44; i < 57; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center col_100"));
                for (int i = 58; i < 71; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center col_100"));
                for (int i = 72; i < 85; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!86!2')\">" + wierszZtabeli["D_86"].ToString() + " </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!87!2')\">" + wierszZtabeli["D_87"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!88!2')\">" + wierszZtabeli["D_88"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!89!2')\">" + wierszZtabeli["D_89"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine(tb.komorkaHTML("", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!90!2')\">" + wierszZtabeli["D_90"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!91!2')\">" + wierszZtabeli["D_91"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!92!2')\">" + wierszZtabeli["D_92"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!93!2')\">" + wierszZtabeli["D_93"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!94!2')\">" + wierszZtabeli["D_94"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!95!2')\">" + wierszZtabeli["D_95"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                //     builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja="+ wierszZtabeli["id_sedziego"].ToString() + "!"+idtabeli+"!2!86')\">000 </a>", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                //licznik++;
            }
            //footer
            //   builder.AppendLine("</tr>");

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder3.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML13(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<br/>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100'>rok</td>");
            builder.AppendLine("<td class='borderAll center col_100'>wpływ	</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załat- wienia</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozos- tałość</td>");
            builder.AppendLine("<td class='borderAll center col_100'>sprawy zawieszone</td>");
            builder.AppendLine("<td class='borderAll center col_100'>wpływ na referendarza sądowego według liczby referendarzy i wakujących stanowisk referendarskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załatwienia  na referendarza sądowego według liczby referendarzy i wakujących stanowisk referendarskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozostałość na referendarza według liczby referendarzy i wakujących stanowisk referendarskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100' wpływ na referendarza sądowego według obsady średniookresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wpływ na referendarza sądowego według obsady średniookresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wpływ na referendarza sądowego według obsady średniookresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wskaźnik pozostałości</td>");
            builder.AppendLine("<td class='borderAll center col_100' >efektywny czas pracy</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Referendarz " + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center col_100"));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center col_100"));

                for (int i = 2; i < 15; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center col_100"));
                for (int i = 16; i < 29; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center col_100"));
                for (int i = 30; i < 43; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center col_100"));
                for (int i = 44; i < 57; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center col_100"));
                for (int i = 58; i < 71; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center col_100"));
                for (int i = 72; i < 85; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!86!2')\">" + wierszZtabeli["D_86"].ToString() + " </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!87!2')\">" + wierszZtabeli["D_87"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!88!2')\">" + wierszZtabeli["D_88"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!89!2')\">" + wierszZtabeli["D_89"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine(tb.komorkaHTML("", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!90!2')\">" + wierszZtabeli["D_90"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!91!2')\">" + wierszZtabeli["D_91"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!92!2')\">" + wierszZtabeli["D_92"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!93!2')\">" + wierszZtabeli["D_93"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!94!2')\">" + wierszZtabeli["D_94"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!95!2')\">" + wierszZtabeli["D_95"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                //     builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja="+ wierszZtabeli["id_sedziego"].ToString() + "!"+idtabeli+"!2!86')\">000 </a>", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                //licznik++;
            }
            //footer
            //   builder.AppendLine("</tr>");

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder13.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML17(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane, string tekst, string funkcjaSR, string opisDzialu, string nrTabeli)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<p>" + opisDzialu + "</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>" + nrTabeli + "</p>");
            }
            builder.AppendLine("<br/>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>imię i nazwisko</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>Funkcja</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>pomoc asystenta</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>rok</td>");
            builder.AppendLine("<td colspan=12 class='borderAll center col_81'>" + tekst + "	</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td  class='borderAll center col_81'>do 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  3 do 6  miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  6 do 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 12 miesięcy do 2 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 2 do 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 3 do 5 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 5 do 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>ponad 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>SUMA</td>");

            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(funkcjaSR + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!1!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center "));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center "));

                for (int i = 2; i < 15; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center "));
                for (int i = 15; i < 28; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center "));
                for (int i = 28; i < 41; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center "));
                for (int i = 41; i < 54; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center "));
                for (int i = 54; i < 67; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center "));
                for (int i = 67; i < 80; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center "));
                for (int i = 80; i < 95; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center "));
                for (int i = 95; i < 110; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");

                //licznik++;
            }
            //footer

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder17.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML19(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane, string tekst, string funkcjaSR, string opisDzialu, string nrTabeli)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<p>" + opisDzialu + "</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>" + nrTabeli + "</p>");
            }
            builder.AppendLine("<br/>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>imię i nazwisko</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>Funkcja</td>");

            builder.AppendLine("<td rowspan=2 class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>rok</td>");
            builder.AppendLine("<td colspan=12 class='borderAll center col_81'>" + tekst + "	</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td  class='borderAll center col_81'>do 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  3 do 6  miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  6 do 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 12 miesięcy do 2 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 2 do 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 3 do 5 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 5 do 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>ponad 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>SUMA</td>");

            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(funkcjaSR + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center "));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center "));

                for (int i = 1; i < 14; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center "));
                for (int i = 14; i < 27; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center "));
                for (int i = 27; i < 40; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center "));
                for (int i = 40; i < 53; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center "));
                for (int i = 53; i < 66; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center "));
                for (int i = 66; i < 79; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center "));
                for (int i = 79; i < 93; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center "));
                for (int i = 93; i < 107; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");

                //licznik++;
            }
            //footer
            //   builder.AppendLine("</tr>");

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder17.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML23(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane, string tekst, string funkcjaSR, string opisDzialu, string nrTabeli)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<p>" + opisDzialu + "</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>" + nrTabeli + "</p>");
            }
            builder.AppendLine("<br/>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td rowspan=3 class='borderAll center col_81'>imię i nazwisko</td>");
            builder.AppendLine("<td rowspan=3 class='borderAll center col_81'>Funkcja</td>");
            builder.AppendLine("<td rowspan=3 class='borderAll center col_81'>pomoc asystenta</td>");
            builder.AppendLine("<td rowspan=3 class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td rowspan=3 class='borderAll center col_81'>rok</td>");
            builder.AppendLine("<td colspan=10 class='borderAll center '>" + tekst + "	</td>");
            builder.AppendLine("<td colspan=5 class='borderAll center '>roztrzygnięcie II instancji*	</td>");

            builder.AppendLine("</tr>");

            builder.AppendLine("<tr>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>ogółem</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>w terminie ustawowym</td>");
            builder.AppendLine("<td colspan=8 class='borderAll center col_81'>po upływie terminu ustawowego</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>liczba spraw  poddanych kontroli instancyjnej</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>utrzymano w mocy</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>zmieniono</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>uchylono i przekazano do ponownego roztrzygnięcia</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>załatwiono w inny sposób</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");

            builder.AppendLine("<td  class='borderAll center col_81'>1-14 dni</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>w tym nieusprawiedliwione</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>15-30 dni</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>w tym nieusprawiedliwione</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>pow.1 do 3 mies.</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>w tym nieusprawiedliwione</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>ponad 3 mies.</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>w tym nieusprawiedliwione</td>");

            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(funkcjaSR + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center "));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center "));

                for (int i = 2; i < 18; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center "));
                for (int i = 18; i < 34; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center "));
                for (int i = 34; i < 50; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center "));
                for (int i = 50; i < 66; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center "));
                for (int i = 67; i < 83; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center "));
                for (int i = 83; i < 99; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center "));
                for (int i = 99; i < 117; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center "));
                for (int i = 117; i < 135; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
            }

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder23.Controls.Add(tblControl);
        }

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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

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

        protected void tworztabelkeHTML26(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane, string tekst, string funkcjaSR, string opisDzialu, string nrTabeli)
        {
            if (dane == null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.Append(" <div class='page-break'>");
            builder.AppendLine("<p>" + opisDzialu + "</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>" + nrTabeli + "</p>");
            }
            builder.AppendLine("<br/>");
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>imię i nazwisko</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>Funkcja</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>pomoc asystenta</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td rowspan=2 class='borderAll center col_81'>rok</td>");
            builder.AppendLine("<td colspan=12 class='borderAll center col_81'>" + tekst + "	</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td  class='borderAll center col_81'>do 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  3 do 6  miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej  6 do 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 12 miesięcy</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 12 miesięcy do 2 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 2 do 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>suma powyżej 3 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 3 do 5 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>powyżej 5 do 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>ponad 8 lat</td>");
            builder.AppendLine("<td  class='borderAll center col_81'>SUMA</td>");

            builder.AppendLine("</tr>");

            //ilosc sedziów
            //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(funkcjaSR + wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center "));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!1!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center "));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center "));

                for (int i = 2; i < 15; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center "));
                for (int i = 15; i < 28; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center "));
                for (int i = 28; i < 41; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center "));
                for (int i = 41; i < 54; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center "));
                for (int i = 54; i < 67; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center "));
                for (int i = 67; i < 80; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center "));
                for (int i = 80; i < 95; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
            }
            //footer

            builder.Append("</table>");
            builder.Append(" </div>");
            tblControl.Text = builder.ToString();
            tablePlaceHolder26.Controls.Add(tblControl);
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz

        protected void pisztb(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz

        protected void stopkaTabeli3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                tb.makeSumRow((DataTable)Session["tabelka005"], e, 0);
            }
        }

        protected void stopkaTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }
    }
}