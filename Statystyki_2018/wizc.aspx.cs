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
        private string path = string.Empty;
        private const string tenPlik = "wizc.aspx";
        public string tenPlikNazwa = "wizc";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
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
            //odswiezenie danych
            tabela_01(idWydzial, 1);
            tabela_02(idWydzial, 2);
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            //wizc_aspx

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 9, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka009"] = tabelka01;
            tworztabelkeHTML("KX1", idWydzial, 9, tabelka01);

            DataTable tabelka02 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 10, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka010"] = tabelka02;
            tworztabelkeHTML2("K2", idWydzial, 10, tabelka02);

            DataTable tabelka03 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 11, Date1.Date, Date2.Date, 100, tenPlik);
            Session["tabelka011"] = tabelka03;
            tworztabelkeHTML3("K3", idWydzial, 11, tabelka03);

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
            DataTable tabelka23 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 23, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka023"] = tabelka23;
            tworztabelkeHTML23("K23", idWydzial, 23, tabelka23, "Liczba sporządzonych uzasadnień", "", "", "Tabela 23");

            tabela_24();
            tabela_25();

            DataTable tabelka26 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 26, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka026"] = tabelka26;
            tworztabelkeHTML26("K26", idWydzial, 26, tabelka26, "liczba spraw", "", "IV. 7.3.Struktura pozostałości (referaty poszczególnych sędziów – liczba spraw)", "Tabela 26");

            DataTable tabelka27 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 27, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka027"] = tabelka27;
            tworztabelkeHTML26("K27", idWydzial, 27, tabelka27, "% spraw", "", "IV. 7.4.Struktura pozostałości (referaty poszczególnych sędziów – %)", "Tabela 27");

            DataTable tabelka28 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 28, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka028"] = tabelka28;
            tworztabelkeHTML26("K28", idWydzial, 28, tabelka28, "liczba spraw", "", "IV. 7.5.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)", "Tabela 28");

            DataTable tabelka29 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzial, 29, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka029"] = tabelka29;
            tworztabelkeHTML26("K29", idWydzial, 29, tabelka29, "% spraw", "", "IV. 7.5.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)", "Tabela 28");

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

            //  pisztb("tab_6_", 2, 1, tabelka01);
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 7, 6, 27, tenPlik);
            Session["tabelka007"] = tabelka01;
            //  pisz("tab_7_", 2, 16, tabelka01);
            try
            {
                tab_7_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_7_w01_c02.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_7_w01_c03.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_7_w01_c04.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_7_w01_c05.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_7_w01_c06.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_7_w01_c07.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_7_w01_c08.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_7_w01_c09.Text = tabelka01.Rows[8][1].ToString().Trim();
                tab_7_w01_c10.Text = tabelka01.Rows[9][1].ToString().Trim();
                tab_7_w01_c11.Text = tabelka01.Rows[10][1].ToString().Trim();
                tab_7_w01_c12.Text = tabelka01.Rows[11][1].ToString().Trim();
                tab_7_w01_c13.Text = tabelka01.Rows[12][1].ToString().Trim();
                tab_7_w01_c14.Text = tabelka01.Rows[13][1].ToString().Trim();
                tab_7_w01_c15.Text = tabelka01.Rows[14][1].ToString().Trim();
                tab_7_w01_c16.Text = tabelka01.Rows[15][1].ToString().Trim();

                tab_7_w02_c01.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_7_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_7_w02_c03.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_7_w02_c04.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_7_w02_c05.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_7_w02_c06.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_7_w02_c07.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_7_w02_c08.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_7_w02_c09.Text = tabelka01.Rows[8][2].ToString().Trim();
                tab_7_w02_c10.Text = tabelka01.Rows[9][2].ToString().Trim();
                tab_7_w02_c11.Text = tabelka01.Rows[10][2].ToString().Trim();
                tab_7_w02_c12.Text = tabelka01.Rows[11][2].ToString().Trim();
                tab_7_w02_c13.Text = tabelka01.Rows[12][2].ToString().Trim();
                tab_7_w02_c14.Text = tabelka01.Rows[13][2].ToString().Trim();
                tab_7_w02_c15.Text = tabelka01.Rows[14][2].ToString().Trim();
                tab_7_w02_c16.Text = tabelka01.Rows[15][2].ToString().Trim();

                tab_7_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_7_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_7_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
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
                tab_8_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_8_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_8_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_8_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_8_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_8_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_8_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_8_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_8_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_8_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_8_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_8_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();

                tab_8_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_8_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_8_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_8_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_8_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_8_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_8_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_8_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_8_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_8_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_8_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_8_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();

                tab_8_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_8_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_8_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_8_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_8_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_8_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_8_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_8_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_8_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_8_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_8_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_8_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();

                tab_8_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_8_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_8_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_8_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_8_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_8_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_8_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_8_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_8_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_8_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_8_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_8_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();

                tab_8_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_8_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_8_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_8_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_8_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_8_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_8_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_8_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
                tab_8_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
                tab_8_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
                tab_8_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
                tab_8_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();

                tab_8_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_8_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_8_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_8_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_8_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_8_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_8_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_8_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
                tab_8_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
                tab_8_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
                tab_8_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
                tab_8_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();

                tab_8_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_8_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_8_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_8_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_8_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_8_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_8_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_8_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
                tab_8_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
                tab_8_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
                tab_8_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
                tab_8_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();

                tab_8_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_8_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_8_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_8_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_8_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_8_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_8_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_8_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
                tab_8_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
                tab_8_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
                tab_8_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
                tab_8_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
            //   pisz("tab_8_", 8, 12, tabelka01);
        }

        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 12, 8, 15, tenPlik);
            Session["tabelka008"] = tabelka01;
            //   pisz("tab_12_", 12, 8, tabelka01);
            try
            {
                tab_12_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_12_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_12_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_12_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_12_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_12_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_12_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_12_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_12_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_12_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_12_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_12_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
                tab_12_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();

                tab_12_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_12_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_12_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_12_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_12_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_12_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_12_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_12_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_12_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_12_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_12_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_12_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
                tab_12_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();

                tab_12_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_12_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_12_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_12_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_12_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_12_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_12_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_12_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_12_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_12_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_12_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_12_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
                tab_12_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();

                tab_12_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_12_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_12_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_12_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_12_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_12_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_12_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_12_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_12_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_12_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_12_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_12_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
                tab_12_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();

                tab_12_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_12_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_12_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_12_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_12_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_12_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_12_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_12_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
                tab_12_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
                tab_12_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
                tab_12_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
                tab_12_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
                tab_12_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();

                tab_12_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_12_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_12_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_12_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_12_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_12_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_12_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_12_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
                tab_12_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
                tab_12_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
                tab_12_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
                tab_12_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
                tab_12_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();

                tab_12_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_12_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_12_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_12_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_12_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_12_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_12_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_12_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
                tab_12_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
                tab_12_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
                tab_12_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
                tab_12_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
                tab_12_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();

                tab_12_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_12_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_12_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_12_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_12_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_12_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_12_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_12_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
                tab_12_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
                tab_12_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
                tab_12_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
                tab_12_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
                tab_12_w08_c13.Text = tabelka01.Rows[7][13].ToString().Trim();
            }
            catch (Exception)
            {
            }
        }

        protected void tabela_14()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 14, 3, 2, tenPlik);
            Session["tabelka014"] = tabelka01;
            try
            {
                tab_14_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_14_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_14_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
            }
            catch (Exception)
            {
            }
            //    pisz("tab_14_", 3, 1, tabelka01);
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
            try
            {
                tab_15_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_15_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_15_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_15_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_15_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_15_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_15_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_15_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_15_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_15_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_15_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_15_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
                tab_15_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();

                tab_15_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_15_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_15_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_15_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_15_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_15_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_15_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_15_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_15_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_15_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_15_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_15_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
                tab_15_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();

                tab_15_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_15_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_15_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_15_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_15_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_15_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_15_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_15_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_15_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_15_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_15_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_15_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
                tab_15_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();

                tab_15_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_15_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_15_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_15_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_15_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_15_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_15_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_15_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_15_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_15_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_15_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_15_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
                tab_15_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();

                tab_15_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_15_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_15_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_15_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_15_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_15_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_15_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_15_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
                tab_15_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
                tab_15_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
                tab_15_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
                tab_15_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
                tab_15_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();

                tab_15_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_15_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_15_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_15_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_15_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_15_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_15_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_15_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
                tab_15_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
                tab_15_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
                tab_15_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
                tab_15_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
                tab_15_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();

                tab_15_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_15_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_15_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_15_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_15_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_15_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_15_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_15_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
                tab_15_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
                tab_15_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
                tab_15_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
                tab_15_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
                tab_15_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();

                //     tab_15_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_15_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_15_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_15_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_15_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_15_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_15_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_15_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
                tab_15_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
                tab_15_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
                tab_15_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
                tab_15_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
                tab_15_w08_c13.Text = tabelka01.Rows[7][13].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab_15: " + ex.Message);
            }
        }

        protected void tabela_16()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 16, 8, 14, tenPlik);
            Session["tabelka016"] = tabelka01;
            //   pisz("tab_16_", 8, 12, tabelka01);
            try
            {
                tab_16_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_16_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_16_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_16_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_16_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_16_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_16_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_16_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_16_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_16_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_16_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_16_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
                tab_16_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();

                tab_16_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_16_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_16_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_16_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_16_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_16_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_16_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_16_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_16_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_16_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_16_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_16_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
                tab_16_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();

                tab_16_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_16_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_16_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_16_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_16_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_16_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_16_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_16_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_16_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_16_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_16_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_16_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
                tab_16_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();

                tab_16_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_16_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_16_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_16_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_16_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_16_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_16_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_16_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_16_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_16_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_16_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_16_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
                tab_16_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();

                tab_16_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_16_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_16_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_16_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_16_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_16_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_16_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_16_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
                tab_16_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
                tab_16_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
                tab_16_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
                tab_16_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
                tab_16_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();

                tab_16_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_16_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_16_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_16_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_16_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_16_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_16_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_16_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
                tab_16_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
                tab_16_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
                tab_16_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
                tab_16_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
                tab_16_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();

                tab_16_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_16_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_16_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_16_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_16_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_16_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_16_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_16_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
                tab_16_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
                tab_16_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
                tab_16_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
                tab_16_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
                tab_16_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();

                //    tab_16_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_16_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_16_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_16_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_16_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_16_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_16_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_16_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
                tab_16_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
                tab_16_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
                tab_16_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
                tab_16_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
                tab_16_w08_c13.Text = tabelka01.Rows[7][13].ToString().Trim();
            }
            catch (Exception)
            {
            }
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
                tab_21_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_21_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_21_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_21_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
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
                tab_22_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_22_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_22_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_22_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_22_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_22_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_22_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_22_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_22_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_22_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_22_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_22_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
                tab_22_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();
                tab_22_w01_c14.Text = tabelka01.Rows[0][14].ToString().Trim();
                tab_22_w01_c15.Text = tabelka01.Rows[0][15].ToString().Trim();
                tab_22_w01_c16.Text = tabelka01.Rows[0][16].ToString().Trim();

                tab_22_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_22_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_22_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_22_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_22_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_22_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_22_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_22_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_22_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_22_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_22_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_22_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
                tab_22_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();
                tab_22_w02_c14.Text = tabelka01.Rows[1][14].ToString().Trim();
                tab_22_w02_c15.Text = tabelka01.Rows[1][15].ToString().Trim();
                tab_22_w02_c16.Text = tabelka01.Rows[1][16].ToString().Trim();

                tab_22_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_22_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_22_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_22_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_22_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_22_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_22_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_22_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_22_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_22_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_22_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_22_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
                tab_22_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();
                tab_22_w03_c14.Text = tabelka01.Rows[2][14].ToString().Trim();
                tab_22_w03_c15.Text = tabelka01.Rows[2][15].ToString().Trim();
                tab_22_w03_c16.Text = tabelka01.Rows[2][16].ToString().Trim();

                tab_22_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_22_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_22_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_22_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_22_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_22_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_22_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_22_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_22_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_22_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_22_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_22_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
                tab_22_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();
                tab_22_w04_c14.Text = tabelka01.Rows[3][14].ToString().Trim();
                tab_22_w04_c15.Text = tabelka01.Rows[3][15].ToString().Trim();
                tab_22_w04_c16.Text = tabelka01.Rows[3][16].ToString().Trim();

                tab_22_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_22_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
                tab_22_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
                tab_22_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
                tab_22_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
                tab_22_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
                tab_22_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
                tab_22_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
                tab_22_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
                tab_22_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
                tab_22_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
                tab_22_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
                tab_22_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();
                tab_22_w05_c14.Text = tabelka01.Rows[4][14].ToString().Trim();
                tab_22_w05_c15.Text = tabelka01.Rows[4][15].ToString().Trim();
                tab_22_w05_c16.Text = tabelka01.Rows[4][16].ToString().Trim();

                tab_22_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
                tab_22_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
                tab_22_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
                tab_22_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
                tab_22_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
                tab_22_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
                tab_22_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
                tab_22_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
                tab_22_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
                tab_22_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
                tab_22_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
                tab_22_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
                tab_22_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();
                tab_22_w06_c14.Text = tabelka01.Rows[5][14].ToString().Trim();
                tab_22_w06_c15.Text = tabelka01.Rows[5][15].ToString().Trim();
                tab_22_w06_c16.Text = tabelka01.Rows[5][16].ToString().Trim();

                tab_22_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
                tab_22_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
                tab_22_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
                tab_22_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
                tab_22_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
                tab_22_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
                tab_22_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
                tab_22_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
                tab_22_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
                tab_22_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
                tab_22_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
                tab_22_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
                tab_22_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();
                tab_22_w07_c14.Text = tabelka01.Rows[6][14].ToString().Trim();
                tab_22_w07_c15.Text = tabelka01.Rows[6][15].ToString().Trim();
                tab_22_w07_c16.Text = tabelka01.Rows[6][16].ToString().Trim();

                //     tab_22_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
                tab_22_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
                tab_22_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
                tab_22_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
                tab_22_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
                tab_22_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
                tab_22_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
                tab_22_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
                tab_22_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
                tab_22_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
                tab_22_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
                tab_22_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
                tab_22_w08_c13.Text = tabelka01.Rows[7][13].ToString().Trim();
                tab_22_w08_c14.Text = tabelka01.Rows[7][14].ToString().Trim();
                tab_22_w08_c15.Text = tabelka01.Rows[7][15].ToString().Trim();
                tab_22_w08_c16.Text = tabelka01.Rows[7][16].ToString().Trim();
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

            DataTable tabela024 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 24, 9, 15, tenPlik);
            Session["tabelka024"] = tabela024;

            try
            {
                //  wiersz 1
                tab_24_w01_c01.Text = tabela024.Rows[0][1].ToString().Trim();
                tab_24_w01_c02.Text = tabela024.Rows[0][2].ToString().Trim();
                tab_24_w01_c03.Text = tabela024.Rows[0][3].ToString().Trim();
                tab_24_w01_c04.Text = tabela024.Rows[0][4].ToString().Trim();
                tab_24_w01_c05.Text = tabela024.Rows[0][5].ToString().Trim();
                tab_24_w01_c06.Text = tabela024.Rows[0][6].ToString().Trim();
                tab_24_w01_c07.Text = tabela024.Rows[0][7].ToString().Trim();
                tab_24_w01_c08.Text = tabela024.Rows[0][8].ToString().Trim();
                tab_24_w01_c09.Text = tabela024.Rows[0][9].ToString().Trim();
                tab_24_w01_c10.Text = tabela024.Rows[0][10].ToString().Trim();
                tab_24_w01_c11.Text = tabela024.Rows[0][11].ToString().Trim();
                tab_24_w01_c12.Text = tabela024.Rows[0][12].ToString().Trim();
                tab_24_w01_c13.Text = tabela024.Rows[0][13].ToString().Trim();
                tab_24_w01_c14.Text = tabela024.Rows[0][14].ToString().Trim();
                //  wiersz 2
                tab_24_w02_c01.Text = tabela024.Rows[1][1].ToString().Trim();
                tab_24_w02_c02.Text = tabela024.Rows[1][2].ToString().Trim();
                tab_24_w02_c03.Text = tabela024.Rows[1][3].ToString().Trim();
                tab_24_w02_c04.Text = tabela024.Rows[1][4].ToString().Trim();
                tab_24_w02_c05.Text = tabela024.Rows[1][5].ToString().Trim();
                tab_24_w02_c06.Text = tabela024.Rows[1][6].ToString().Trim();
                tab_24_w02_c07.Text = tabela024.Rows[1][7].ToString().Trim();
                tab_24_w02_c08.Text = tabela024.Rows[1][8].ToString().Trim();
                tab_24_w02_c09.Text = tabela024.Rows[1][9].ToString().Trim();
                tab_24_w02_c10.Text = tabela024.Rows[1][10].ToString().Trim();
                tab_24_w02_c11.Text = tabela024.Rows[1][11].ToString().Trim();
                tab_24_w02_c12.Text = tabela024.Rows[1][12].ToString().Trim();
                tab_24_w02_c13.Text = tabela024.Rows[1][13].ToString().Trim();
                tab_24_w02_c14.Text = tabela024.Rows[1][14].ToString().Trim();
                //  wiersz 3
                tab_24_w03_c01.Text = tabela024.Rows[2][1].ToString().Trim();
                tab_24_w03_c02.Text = tabela024.Rows[2][2].ToString().Trim();
                tab_24_w03_c03.Text = tabela024.Rows[2][3].ToString().Trim();
                tab_24_w03_c04.Text = tabela024.Rows[2][4].ToString().Trim();
                tab_24_w03_c05.Text = tabela024.Rows[2][5].ToString().Trim();
                tab_24_w03_c06.Text = tabela024.Rows[2][6].ToString().Trim();
                tab_24_w03_c07.Text = tabela024.Rows[2][7].ToString().Trim();
                tab_24_w03_c08.Text = tabela024.Rows[2][8].ToString().Trim();
                tab_24_w03_c09.Text = tabela024.Rows[2][9].ToString().Trim();
                tab_24_w03_c10.Text = tabela024.Rows[2][10].ToString().Trim();
                tab_24_w03_c11.Text = tabela024.Rows[2][11].ToString().Trim();
                tab_24_w03_c12.Text = tabela024.Rows[2][12].ToString().Trim();
                tab_24_w03_c13.Text = tabela024.Rows[2][13].ToString().Trim();
                tab_24_w03_c14.Text = tabela024.Rows[2][14].ToString().Trim();
                //  wiersz 4
                tab_24_w04_c01.Text = tabela024.Rows[3][1].ToString().Trim();
                tab_24_w04_c02.Text = tabela024.Rows[3][2].ToString().Trim();
                tab_24_w04_c03.Text = tabela024.Rows[3][3].ToString().Trim();
                tab_24_w04_c04.Text = tabela024.Rows[3][4].ToString().Trim();
                tab_24_w04_c05.Text = tabela024.Rows[3][5].ToString().Trim();
                tab_24_w04_c06.Text = tabela024.Rows[3][6].ToString().Trim();
                tab_24_w04_c07.Text = tabela024.Rows[3][7].ToString().Trim();
                tab_24_w04_c08.Text = tabela024.Rows[3][8].ToString().Trim();
                tab_24_w04_c09.Text = tabela024.Rows[3][9].ToString().Trim();
                tab_24_w04_c10.Text = tabela024.Rows[3][10].ToString().Trim();
                tab_24_w04_c11.Text = tabela024.Rows[3][11].ToString().Trim();
                tab_24_w04_c12.Text = tabela024.Rows[3][12].ToString().Trim();
                tab_24_w04_c13.Text = tabela024.Rows[3][13].ToString().Trim();
                tab_24_w04_c14.Text = tabela024.Rows[3][14].ToString().Trim();
                //  wiersz 5
                tab_24_w05_c01.Text = tabela024.Rows[4][1].ToString().Trim();
                tab_24_w05_c02.Text = tabela024.Rows[4][2].ToString().Trim();
                tab_24_w05_c03.Text = tabela024.Rows[4][3].ToString().Trim();
                tab_24_w05_c04.Text = tabela024.Rows[4][4].ToString().Trim();
                tab_24_w05_c05.Text = tabela024.Rows[4][5].ToString().Trim();
                tab_24_w05_c06.Text = tabela024.Rows[4][6].ToString().Trim();
                tab_24_w05_c07.Text = tabela024.Rows[4][7].ToString().Trim();
                tab_24_w05_c08.Text = tabela024.Rows[4][8].ToString().Trim();
                tab_24_w05_c09.Text = tabela024.Rows[4][9].ToString().Trim();
                tab_24_w05_c10.Text = tabela024.Rows[4][10].ToString().Trim();
                tab_24_w05_c11.Text = tabela024.Rows[4][11].ToString().Trim();
                tab_24_w05_c12.Text = tabela024.Rows[4][12].ToString().Trim();
                tab_24_w05_c13.Text = tabela024.Rows[4][13].ToString().Trim();
                tab_24_w05_c14.Text = tabela024.Rows[4][14].ToString().Trim();
                //  wiersz 6
                tab_24_w06_c01.Text = tabela024.Rows[5][1].ToString().Trim();
                tab_24_w06_c02.Text = tabela024.Rows[5][2].ToString().Trim();
                tab_24_w06_c03.Text = tabela024.Rows[5][3].ToString().Trim();
                tab_24_w06_c04.Text = tabela024.Rows[5][4].ToString().Trim();
                tab_24_w06_c05.Text = tabela024.Rows[5][5].ToString().Trim();
                tab_24_w06_c06.Text = tabela024.Rows[5][6].ToString().Trim();
                tab_24_w06_c07.Text = tabela024.Rows[5][7].ToString().Trim();
                tab_24_w06_c08.Text = tabela024.Rows[5][8].ToString().Trim();
                tab_24_w06_c09.Text = tabela024.Rows[5][9].ToString().Trim();
                tab_24_w06_c10.Text = tabela024.Rows[5][10].ToString().Trim();
                tab_24_w06_c11.Text = tabela024.Rows[5][11].ToString().Trim();
                tab_24_w06_c12.Text = tabela024.Rows[5][12].ToString().Trim();
                tab_24_w06_c13.Text = tabela024.Rows[5][13].ToString().Trim();
                tab_24_w06_c14.Text = tabela024.Rows[5][14].ToString().Trim();
                //  wiersz 7
                tab_24_w07_c01.Text = tabela024.Rows[6][1].ToString().Trim();
                tab_24_w07_c02.Text = tabela024.Rows[6][2].ToString().Trim();
                tab_24_w07_c03.Text = tabela024.Rows[6][3].ToString().Trim();
                tab_24_w07_c04.Text = tabela024.Rows[6][4].ToString().Trim();
                tab_24_w07_c05.Text = tabela024.Rows[6][5].ToString().Trim();
                tab_24_w07_c06.Text = tabela024.Rows[6][6].ToString().Trim();
                tab_24_w07_c07.Text = tabela024.Rows[6][7].ToString().Trim();
                tab_24_w07_c08.Text = tabela024.Rows[6][8].ToString().Trim();
                tab_24_w07_c09.Text = tabela024.Rows[6][9].ToString().Trim();
                tab_24_w07_c10.Text = tabela024.Rows[6][10].ToString().Trim();
                tab_24_w07_c11.Text = tabela024.Rows[6][11].ToString().Trim();
                tab_24_w07_c12.Text = tabela024.Rows[6][12].ToString().Trim();
                tab_24_w07_c13.Text = tabela024.Rows[6][13].ToString().Trim();
                tab_24_w07_c14.Text = tabela024.Rows[6][14].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 24: " + ex.Message);
            }
        }

        protected void tabela_25()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 25");
            }

            DataTable tabela025 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 25, 9, 15, tenPlik);
            Session["tabelka024"] = tabela025;

            try
            {
                //  wiersz 1
                tab_25_w01_c01.Text = tabela025.Rows[0][1].ToString().Trim();
                tab_25_w01_c02.Text = tabela025.Rows[0][2].ToString().Trim();
                tab_25_w01_c03.Text = tabela025.Rows[0][3].ToString().Trim();
                tab_25_w01_c04.Text = tabela025.Rows[0][4].ToString().Trim();
                tab_25_w01_c05.Text = tabela025.Rows[0][5].ToString().Trim();
                tab_25_w01_c06.Text = tabela025.Rows[0][6].ToString().Trim();
                tab_25_w01_c07.Text = tabela025.Rows[0][7].ToString().Trim();
                tab_25_w01_c08.Text = tabela025.Rows[0][8].ToString().Trim();
                tab_25_w01_c09.Text = tabela025.Rows[0][9].ToString().Trim();
                tab_25_w01_c10.Text = tabela025.Rows[0][10].ToString().Trim();
                tab_25_w01_c11.Text = tabela025.Rows[0][11].ToString().Trim();
                tab_25_w01_c12.Text = tabela025.Rows[0][12].ToString().Trim();
                tab_25_w01_c13.Text = tabela025.Rows[0][13].ToString().Trim();
                tab_25_w01_c14.Text = tabela025.Rows[0][14].ToString().Trim();
                //  wiersz 2
                tab_25_w02_c01.Text = tabela025.Rows[1][1].ToString().Trim();
                tab_25_w02_c02.Text = tabela025.Rows[1][2].ToString().Trim();
                tab_25_w02_c03.Text = tabela025.Rows[1][3].ToString().Trim();
                tab_25_w02_c04.Text = tabela025.Rows[1][4].ToString().Trim();
                tab_25_w02_c05.Text = tabela025.Rows[1][5].ToString().Trim();
                tab_25_w02_c06.Text = tabela025.Rows[1][6].ToString().Trim();
                tab_25_w02_c07.Text = tabela025.Rows[1][7].ToString().Trim();
                tab_25_w02_c08.Text = tabela025.Rows[1][8].ToString().Trim();
                tab_25_w02_c09.Text = tabela025.Rows[1][9].ToString().Trim();
                tab_25_w02_c10.Text = tabela025.Rows[1][10].ToString().Trim();
                tab_25_w02_c11.Text = tabela025.Rows[1][11].ToString().Trim();
                tab_25_w02_c12.Text = tabela025.Rows[1][12].ToString().Trim();
                tab_25_w02_c13.Text = tabela025.Rows[1][13].ToString().Trim();
                tab_25_w02_c14.Text = tabela025.Rows[1][14].ToString().Trim();
                //  wiersz 3
                tab_25_w03_c01.Text = tabela025.Rows[2][1].ToString().Trim();
                tab_25_w03_c02.Text = tabela025.Rows[2][2].ToString().Trim();
                tab_25_w03_c03.Text = tabela025.Rows[2][3].ToString().Trim();
                tab_25_w03_c04.Text = tabela025.Rows[2][4].ToString().Trim();
                tab_25_w03_c05.Text = tabela025.Rows[2][5].ToString().Trim();
                tab_25_w03_c06.Text = tabela025.Rows[2][6].ToString().Trim();
                tab_25_w03_c07.Text = tabela025.Rows[2][7].ToString().Trim();
                tab_25_w03_c08.Text = tabela025.Rows[2][8].ToString().Trim();
                tab_25_w03_c09.Text = tabela025.Rows[2][9].ToString().Trim();
                tab_25_w03_c10.Text = tabela025.Rows[2][10].ToString().Trim();
                tab_25_w03_c11.Text = tabela025.Rows[2][11].ToString().Trim();
                tab_25_w03_c12.Text = tabela025.Rows[2][12].ToString().Trim();
                tab_25_w03_c13.Text = tabela025.Rows[2][13].ToString().Trim();
                tab_25_w03_c14.Text = tabela025.Rows[2][14].ToString().Trim();
                //  wiersz 4
                tab_25_w04_c01.Text = tabela025.Rows[3][1].ToString().Trim();
                tab_25_w04_c02.Text = tabela025.Rows[3][2].ToString().Trim();
                tab_25_w04_c03.Text = tabela025.Rows[3][3].ToString().Trim();
                tab_25_w04_c04.Text = tabela025.Rows[3][4].ToString().Trim();
                tab_25_w04_c05.Text = tabela025.Rows[3][5].ToString().Trim();
                tab_25_w04_c06.Text = tabela025.Rows[3][6].ToString().Trim();
                tab_25_w04_c07.Text = tabela025.Rows[3][7].ToString().Trim();
                tab_25_w04_c08.Text = tabela025.Rows[3][8].ToString().Trim();
                tab_25_w04_c09.Text = tabela025.Rows[3][9].ToString().Trim();
                tab_25_w04_c10.Text = tabela025.Rows[3][10].ToString().Trim();
                tab_25_w04_c11.Text = tabela025.Rows[3][11].ToString().Trim();
                tab_25_w04_c12.Text = tabela025.Rows[3][12].ToString().Trim();
                tab_25_w04_c13.Text = tabela025.Rows[3][13].ToString().Trim();
                tab_25_w04_c14.Text = tabela025.Rows[3][14].ToString().Trim();
                //  wiersz 5
                tab_25_w05_c01.Text = tabela025.Rows[4][1].ToString().Trim();
                tab_25_w05_c02.Text = tabela025.Rows[4][2].ToString().Trim();
                tab_25_w05_c03.Text = tabela025.Rows[4][3].ToString().Trim();
                tab_25_w05_c04.Text = tabela025.Rows[4][4].ToString().Trim();
                tab_25_w05_c05.Text = tabela025.Rows[4][5].ToString().Trim();
                tab_25_w05_c06.Text = tabela025.Rows[4][6].ToString().Trim();
                tab_25_w05_c07.Text = tabela025.Rows[4][7].ToString().Trim();
                tab_25_w05_c08.Text = tabela025.Rows[4][8].ToString().Trim();
                tab_25_w05_c09.Text = tabela025.Rows[4][9].ToString().Trim();
                tab_25_w05_c10.Text = tabela025.Rows[4][10].ToString().Trim();
                tab_25_w05_c11.Text = tabela025.Rows[4][11].ToString().Trim();
                tab_25_w05_c12.Text = tabela025.Rows[4][12].ToString().Trim();
                tab_25_w05_c13.Text = tabela025.Rows[4][13].ToString().Trim();
                tab_25_w05_c14.Text = tabela025.Rows[4][14].ToString().Trim();
                //  wiersz 6
                tab_25_w06_c01.Text = tabela025.Rows[5][1].ToString().Trim();
                tab_25_w06_c02.Text = tabela025.Rows[5][2].ToString().Trim();
                tab_25_w06_c03.Text = tabela025.Rows[5][3].ToString().Trim();
                tab_25_w06_c04.Text = tabela025.Rows[5][4].ToString().Trim();
                tab_25_w06_c05.Text = tabela025.Rows[5][5].ToString().Trim();
                tab_25_w06_c06.Text = tabela025.Rows[5][6].ToString().Trim();
                tab_25_w06_c07.Text = tabela025.Rows[5][7].ToString().Trim();
                tab_25_w06_c08.Text = tabela025.Rows[5][8].ToString().Trim();
                tab_25_w06_c09.Text = tabela025.Rows[5][9].ToString().Trim();
                tab_25_w06_c10.Text = tabela025.Rows[5][10].ToString().Trim();
                tab_25_w06_c11.Text = tabela025.Rows[5][11].ToString().Trim();
                tab_25_w06_c12.Text = tabela025.Rows[5][12].ToString().Trim();
                tab_25_w06_c13.Text = tabela025.Rows[5][13].ToString().Trim();
                tab_25_w06_c14.Text = tabela025.Rows[5][14].ToString().Trim();
                //  wiersz 7
                tab_25_w07_c01.Text = tabela025.Rows[6][1].ToString().Trim();
                tab_25_w07_c02.Text = tabela025.Rows[6][2].ToString().Trim();
                tab_25_w07_c03.Text = tabela025.Rows[6][3].ToString().Trim();
                tab_25_w07_c04.Text = tabela025.Rows[6][4].ToString().Trim();
                tab_25_w07_c05.Text = tabela025.Rows[6][5].ToString().Trim();
                tab_25_w07_c06.Text = tabela025.Rows[6][6].ToString().Trim();
                tab_25_w07_c07.Text = tabela025.Rows[6][7].ToString().Trim();
                tab_25_w07_c08.Text = tabela025.Rows[6][8].ToString().Trim();
                tab_25_w07_c09.Text = tabela025.Rows[6][9].ToString().Trim();
                tab_25_w07_c10.Text = tabela025.Rows[6][10].ToString().Trim();
                tab_25_w07_c11.Text = tabela025.Rows[6][11].ToString().Trim();
                tab_25_w07_c12.Text = tabela025.Rows[6][12].ToString().Trim();
                tab_25_w07_c13.Text = tabela025.Rows[6][13].ToString().Trim();
                tab_25_w07_c14.Text = tabela025.Rows[6][14].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc  tab 24: " + ex.Message);
            }
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
                tab_30_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_30_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_30_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_30_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
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
                tab_31_w01_c01.Text = tabela031.Rows[0][1].ToString().Trim();
                tab_31_w01_c02.Text = tabela031.Rows[0][2].ToString().Trim();
                tab_31_w01_c03.Text = tabela031.Rows[0][3].ToString().Trim();
                tab_31_w01_c04.Text = tabela031.Rows[0][4].ToString().Trim();
                tab_31_w01_c05.Text = tabela031.Rows[0][5].ToString().Trim();
                tab_31_w01_c06.Text = tabela031.Rows[0][6].ToString().Trim();
                tab_31_w01_c07.Text = tabela031.Rows[0][7].ToString().Trim();
                tab_31_w01_c08.Text = tabela031.Rows[0][8].ToString().Trim();
                //  wiersz 2
                tab_31_w02_c01.Text = tabela031.Rows[1][1].ToString().Trim();
                tab_31_w02_c02.Text = tabela031.Rows[1][2].ToString().Trim();
                tab_31_w02_c03.Text = tabela031.Rows[1][3].ToString().Trim();
                tab_31_w02_c04.Text = tabela031.Rows[1][4].ToString().Trim();
                tab_31_w02_c05.Text = tabela031.Rows[1][5].ToString().Trim();
                tab_31_w02_c06.Text = tabela031.Rows[1][6].ToString().Trim();
                tab_31_w02_c07.Text = tabela031.Rows[1][7].ToString().Trim();
                tab_31_w02_c08.Text = tabela031.Rows[1][8].ToString().Trim();
                //  wiersz 3
                tab_31_w03_c01.Text = tabela031.Rows[2][1].ToString().Trim();
                tab_31_w03_c02.Text = tabela031.Rows[2][2].ToString().Trim();
                tab_31_w03_c03.Text = tabela031.Rows[2][3].ToString().Trim();
                tab_31_w03_c04.Text = tabela031.Rows[2][4].ToString().Trim();
                tab_31_w03_c05.Text = tabela031.Rows[2][5].ToString().Trim();
                tab_31_w03_c06.Text = tabela031.Rows[2][6].ToString().Trim();
                tab_31_w03_c07.Text = tabela031.Rows[2][7].ToString().Trim();
                tab_31_w03_c08.Text = tabela031.Rows[2][8].ToString().Trim();
                //  wiersz 4
                tab_31_w04_c01.Text = tabela031.Rows[3][1].ToString().Trim();
                tab_31_w04_c02.Text = tabela031.Rows[3][2].ToString().Trim();
                tab_31_w04_c03.Text = tabela031.Rows[3][3].ToString().Trim();
                tab_31_w04_c04.Text = tabela031.Rows[3][4].ToString().Trim();
                tab_31_w04_c05.Text = tabela031.Rows[3][5].ToString().Trim();
                tab_31_w04_c06.Text = tabela031.Rows[3][6].ToString().Trim();
                tab_31_w04_c07.Text = tabela031.Rows[3][7].ToString().Trim();
                tab_31_w04_c08.Text = tabela031.Rows[3][8].ToString().Trim();
                //  wiersz 5
                tab_31_w05_c01.Text = tabela031.Rows[4][1].ToString().Trim();
                tab_31_w05_c02.Text = tabela031.Rows[4][2].ToString().Trim();
                tab_31_w05_c03.Text = tabela031.Rows[4][3].ToString().Trim();
                tab_31_w05_c04.Text = tabela031.Rows[4][4].ToString().Trim();
                tab_31_w05_c05.Text = tabela031.Rows[4][5].ToString().Trim();
                tab_31_w05_c06.Text = tabela031.Rows[4][6].ToString().Trim();
                tab_31_w05_c07.Text = tabela031.Rows[4][7].ToString().Trim();
                tab_31_w05_c08.Text = tabela031.Rows[4][8].ToString().Trim();
                //  wiersz 6
                tab_31_w06_c01.Text = tabela031.Rows[5][1].ToString().Trim();
                tab_31_w06_c02.Text = tabela031.Rows[5][2].ToString().Trim();
                tab_31_w06_c03.Text = tabela031.Rows[5][3].ToString().Trim();
                tab_31_w06_c04.Text = tabela031.Rows[5][4].ToString().Trim();
                tab_31_w06_c05.Text = tabela031.Rows[5][5].ToString().Trim();
                tab_31_w06_c06.Text = tabela031.Rows[5][6].ToString().Trim();
                tab_31_w06_c07.Text = tabela031.Rows[5][7].ToString().Trim();
                tab_31_w06_c08.Text = tabela031.Rows[5][8].ToString().Trim();
                //  wiersz 7
                tab_31_w07_c01.Text = tabela031.Rows[6][1].ToString().Trim();
                tab_31_w07_c02.Text = tabela031.Rows[6][2].ToString().Trim();
                tab_31_w07_c03.Text = tabela031.Rows[6][3].ToString().Trim();
                tab_31_w07_c04.Text = tabela031.Rows[6][4].ToString().Trim();
                tab_31_w07_c05.Text = tabela031.Rows[6][5].ToString().Trim();
                tab_31_w07_c06.Text = tabela031.Rows[6][6].ToString().Trim();
                tab_31_w07_c07.Text = tabela031.Rows[6][7].ToString().Trim();
                tab_31_w07_c08.Text = tabela031.Rows[6][8].ToString().Trim();
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
                tab_32_w01_c01.Text = tabela032.Rows[0][1].ToString().Trim();
                //  wiersz 2
                tab_32_w02_c01.Text = tabela032.Rows[1][1].ToString().Trim();
                //  wiersz 3
                tab_32_w03_c01.Text = tabela032.Rows[2][1].ToString().Trim();
                //  wiersz 4
                tab_32_w04_c01.Text = tabela032.Rows[3][1].ToString().Trim();
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
                tab_33_w01_c01.Text = tabela033.Rows[0][1].ToString().Trim();
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

        protected void tab_2_w01_c01_dateInit(object sender, EventArgs e)
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
                for (int i = 50; i < 64; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center "));
                for (int i = 64; i < 78; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center "));
                for (int i = 78; i < 92; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center "));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center "));
                for (int i = 92; i < 108; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center  gray"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center "));
                for (int i = 108; i < 124; i++)
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