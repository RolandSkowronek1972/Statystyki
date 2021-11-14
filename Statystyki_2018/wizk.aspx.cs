/*
Last Update:
     - version 1.191108
Creation date: 2019-11-08

*/

using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class wizk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders XMLHeaders = new XMLHeaders();

        private string path = string.Empty;
        private const string tenPlik = "wizk.aspx";
        public string tenPlikNazwa = "wizk";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
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
            PlaceHolderTB3.Controls.Clear();
            PlaceHolderTB4.Controls.Clear();
            PlaceHolderTB5.Controls.Clear();
            PlaceHolderTB6.Controls.Clear();
            PlaceHolderTB7.Controls.Clear();
            PlaceHolderTB11.Controls.Clear();
            PlaceHolderTB12.Controls.Clear();
            PlaceHolderTB13.Controls.Clear();
            PlaceHolderTB15.Controls.Clear();
            PlaceHolderTB19.Controls.Clear();
            PlaceHolderTB25.Controls.Clear();
            PlaceHolderTB29.Controls.Clear();

            //odswiezenie danych
            tabela_01(idWydzial, 1);
            tabela_02(idWydzial, 2);
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();

            tabela_8();
            tabela_9();
            tabela_10();
            tabela_11();
            tabela_12();
            tabela_13();
            tabela_14();

            tabela_15();
            tabela_16();
            tabela_17();
            tabela_18();
            tabela_19();
            tabela_20();
            tabela_21();
            tabela_22();
            tabela_23();
            tabela_24();
            tabela_25();
            tabela_26();
            tabela_27();
            tabela_28();
            tabela_29();
            tabela_30();
            tabela_31();
            tabela_32();
            tabela_33();
            tabela_34();
            tabela_35();
            tabela_36();
            tabela_37();
            tabela_38();
            tabela_39();

            makeLabels();
        }

        private void tabela_01(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, false, tenPlik);
            Session["tabelka001"] = tabelka01;
            try
            {
                tab_1_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_1_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_1_w04_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
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

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, false, tenPlik);
            Session["tabelka002"] = tabelka01;
            try
            {
                tab_2_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_2_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_2_w04_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
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
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 3, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka003"] = tabelka01;
            tworztabelkeHTMLTabela3("tb3", idDzialu, 3, tabelka01);
        }

        protected void tabela_4()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 4, Date1.Date, Date2.Date, 160, tenPlik);
            Session["tabelka003"] = tabelka01;
            tworztabelkeHTMLTabela4("tb4", idDzialu, 4, tabelka01);
        }

        protected void tabela_5()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 5, Date1.Date, Date2.Date, 160, tenPlik);

            Session["tabelka005"] = tabelka01;
            tworztabelkeHTMLTabela5("tb5", idDzialu, 5, tabelka01);
        }

        protected void tabela_6()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 6, Date1.Date, Date2.Date, 160, tenPlik);

            Session["tabelka006"] = tabelka01;
            tworztabelkeHTMLTabela6("tb6", idDzialu, 6, tabelka01);
        }

        protected void tabela_7()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 7, Date1.Date, Date2.Date, 16, tenPlik);

            Session["tabelka007"] = tabelka01;
            tworztabelkeHTMLTabela71("tb71", idDzialu, 7, tabelka01);
        }

        protected void tabela_8()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 8, 3, 2, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 8!");
                return;
            }

            try
            {
                tab_8_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_8_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_9()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 9, 8, 18, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 9!");
                return;
            }
            //  wiersz 1
            try
            {
                tab_9_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_9_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_9_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_9_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_9_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_9_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_9_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_9_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_9_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_9_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_9_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_9_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_9_w01_c13.Text = tabelka01.Rows[0]["d_13"].ToString().Trim();
                tab_9_w01_c14.Text = tabelka01.Rows[0]["d_14"].ToString().Trim();
                tab_9_w01_c15.Text = tabelka01.Rows[0]["d_15"].ToString().Trim();
                //  wiersz 2
                tab_9_w02_c01.Text = tabelka01.Rows[1]["d_01"].ToString().Trim();
                tab_9_w02_c02.Text = tabelka01.Rows[1]["d_02"].ToString().Trim();
                tab_9_w02_c03.Text = tabelka01.Rows[1]["d_03"].ToString().Trim();
                tab_9_w02_c04.Text = tabelka01.Rows[1]["d_04"].ToString().Trim();
                tab_9_w02_c05.Text = tabelka01.Rows[1]["d_05"].ToString().Trim();
                tab_9_w02_c06.Text = tabelka01.Rows[1]["d_06"].ToString().Trim();
                tab_9_w02_c07.Text = tabelka01.Rows[1]["d_07"].ToString().Trim();
                tab_9_w02_c08.Text = tabelka01.Rows[1]["d_08"].ToString().Trim();
                tab_9_w02_c09.Text = tabelka01.Rows[1]["d_09"].ToString().Trim();
                tab_9_w02_c10.Text = tabelka01.Rows[1]["d_10"].ToString().Trim();
                tab_9_w02_c11.Text = tabelka01.Rows[1]["d_11"].ToString().Trim();
                tab_9_w02_c12.Text = tabelka01.Rows[1]["d_12"].ToString().Trim();
                tab_9_w02_c13.Text = tabelka01.Rows[1]["d_13"].ToString().Trim();
                tab_9_w02_c14.Text = tabelka01.Rows[1]["d_14"].ToString().Trim();
                tab_9_w02_c15.Text = tabelka01.Rows[1]["d_15"].ToString().Trim();
                //  wiersz 3
                tab_9_w04_c01.Text = tabelka01.Rows[2]["d_01"].ToString().Trim();
                tab_9_w04_c02.Text = tabelka01.Rows[2]["d_02"].ToString().Trim();
                tab_9_w04_c03.Text = tabelka01.Rows[2]["d_03"].ToString().Trim();
                tab_9_w04_c04.Text = tabelka01.Rows[2]["d_04"].ToString().Trim();
                tab_9_w04_c05.Text = tabelka01.Rows[2]["d_05"].ToString().Trim();
                tab_9_w04_c06.Text = tabelka01.Rows[2]["d_06"].ToString().Trim();
                tab_9_w04_c07.Text = tabelka01.Rows[2]["d_07"].ToString().Trim();
                tab_9_w04_c08.Text = tabelka01.Rows[2]["d_08"].ToString().Trim();
                tab_9_w04_c09.Text = tabelka01.Rows[2]["d_09"].ToString().Trim();
                tab_9_w04_c10.Text = tabelka01.Rows[2]["d_10"].ToString().Trim();
                tab_9_w04_c11.Text = tabelka01.Rows[2]["d_11"].ToString().Trim();
                tab_9_w04_c12.Text = tabelka01.Rows[2]["d_12"].ToString().Trim();
                tab_9_w04_c13.Text = tabelka01.Rows[2]["d_13"].ToString().Trim();
                tab_9_w04_c14.Text = tabelka01.Rows[2]["d_14"].ToString().Trim();
                tab_9_w04_c15.Text = tabelka01.Rows[2]["d_15"].ToString().Trim();
                //  wiersz 4
                tab_9_w04_c01.Text = tabelka01.Rows[3]["d_01"].ToString().Trim();
                tab_9_w04_c02.Text = tabelka01.Rows[3]["d_02"].ToString().Trim();
                tab_9_w04_c03.Text = tabelka01.Rows[3]["d_03"].ToString().Trim();
                tab_9_w04_c04.Text = tabelka01.Rows[3]["d_04"].ToString().Trim();
                tab_9_w04_c05.Text = tabelka01.Rows[3]["d_05"].ToString().Trim();
                tab_9_w04_c06.Text = tabelka01.Rows[3]["d_06"].ToString().Trim();
                tab_9_w04_c07.Text = tabelka01.Rows[3]["d_07"].ToString().Trim();
                tab_9_w04_c08.Text = tabelka01.Rows[3]["d_08"].ToString().Trim();
                tab_9_w04_c09.Text = tabelka01.Rows[3]["d_09"].ToString().Trim();
                tab_9_w04_c10.Text = tabelka01.Rows[3]["d_10"].ToString().Trim();
                tab_9_w04_c11.Text = tabelka01.Rows[3]["d_11"].ToString().Trim();
                tab_9_w04_c12.Text = tabelka01.Rows[3]["d_12"].ToString().Trim();
                tab_9_w04_c13.Text = tabelka01.Rows[3]["d_13"].ToString().Trim();
                tab_9_w04_c14.Text = tabelka01.Rows[3]["d_14"].ToString().Trim();
                tab_9_w04_c15.Text = tabelka01.Rows[3]["d_15"].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_10()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 10, 3, 2, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 10!");
                return;
            }
            //  wiersz 1
            tab_10_w01_c01.Text = tabelka01.Rows[0][0].ToString().Trim();
            //  wiersz 2
            tab_10_w02_c01.Text = tabelka01.Rows[1][0].ToString().Trim();
            //  wiersz 3
            tab_10_w03_c01.Text = tabelka01.Rows[2][0].ToString().Trim();
        }

        protected void tabela_11()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 11, 23, 12, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 11!");
                return;
            }
            //  wiersz 1

            tab_11_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
            tab_11_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
            tab_11_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
            tab_11_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
            tab_11_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
            tab_11_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
            tab_11_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
            tab_11_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
            tab_11_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
            tab_11_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
            tab_11_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
            tab_11_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();

            //  wiersz 2
            tab_11_w02_c01.Text = tabelka01.Rows[1]["d_01"].ToString().Trim();
            tab_11_w02_c02.Text = tabelka01.Rows[1]["d_02"].ToString().Trim();
            tab_11_w02_c03.Text = tabelka01.Rows[1]["d_03"].ToString().Trim();
            tab_11_w02_c04.Text = tabelka01.Rows[1]["d_04"].ToString().Trim();
            tab_11_w02_c05.Text = tabelka01.Rows[1]["d_05"].ToString().Trim();
            tab_11_w02_c06.Text = tabelka01.Rows[1]["d_06"].ToString().Trim();
            tab_11_w02_c07.Text = tabelka01.Rows[1]["d_07"].ToString().Trim();
            tab_11_w02_c08.Text = tabelka01.Rows[1]["d_08"].ToString().Trim();
            tab_11_w02_c09.Text = tabelka01.Rows[1]["d_09"].ToString().Trim();
            tab_11_w02_c10.Text = tabelka01.Rows[1]["d_10"].ToString().Trim();
            tab_11_w02_c11.Text = tabelka01.Rows[1]["d_11"].ToString().Trim();
            tab_11_w02_c12.Text = tabelka01.Rows[1]["d_12"].ToString().Trim();

            //  wiersz 3

            tab_11_w04_c01.Text = tabelka01.Rows[2]["d_01"].ToString().Trim();
            tab_11_w04_c02.Text = tabelka01.Rows[2]["d_02"].ToString().Trim();
            tab_11_w04_c03.Text = tabelka01.Rows[2]["d_03"].ToString().Trim();
            tab_11_w04_c04.Text = tabelka01.Rows[2]["d_04"].ToString().Trim();
            tab_11_w04_c05.Text = tabelka01.Rows[2]["d_05"].ToString().Trim();
            tab_11_w04_c06.Text = tabelka01.Rows[2]["d_06"].ToString().Trim();
            tab_11_w04_c07.Text = tabelka01.Rows[2]["d_07"].ToString().Trim();
            tab_11_w04_c08.Text = tabelka01.Rows[2]["d_08"].ToString().Trim();
            tab_11_w04_c09.Text = tabelka01.Rows[2]["d_09"].ToString().Trim();
            tab_11_w04_c10.Text = tabelka01.Rows[2]["d_10"].ToString().Trim();
            tab_11_w04_c11.Text = tabelka01.Rows[2]["d_11"].ToString().Trim();
            tab_11_w04_c12.Text = tabelka01.Rows[2]["d_12"].ToString().Trim();

            //  wiersz 4

            tab_11_w04_c01.Text = tabelka01.Rows[3]["d_01"].ToString().Trim();
            tab_11_w04_c02.Text = tabelka01.Rows[3]["d_02"].ToString().Trim();
            tab_11_w04_c03.Text = tabelka01.Rows[3]["d_03"].ToString().Trim();
            tab_11_w04_c04.Text = tabelka01.Rows[3]["d_04"].ToString().Trim();
            tab_11_w04_c05.Text = tabelka01.Rows[3]["d_05"].ToString().Trim();
            tab_11_w04_c06.Text = tabelka01.Rows[3]["d_06"].ToString().Trim();
            tab_11_w04_c07.Text = tabelka01.Rows[3]["d_07"].ToString().Trim();
            tab_11_w04_c08.Text = tabelka01.Rows[3]["d_08"].ToString().Trim();
            tab_11_w04_c09.Text = tabelka01.Rows[3]["d_09"].ToString().Trim();
            tab_11_w04_c10.Text = tabelka01.Rows[3]["d_10"].ToString().Trim();
            tab_11_w04_c11.Text = tabelka01.Rows[3]["d_11"].ToString().Trim();
            tab_11_w04_c12.Text = tabelka01.Rows[3]["d_12"].ToString().Trim();

            //  wiersz 5

            tab_11_w05_c01.Text = tabelka01.Rows[4]["d_01"].ToString().Trim();
            tab_11_w05_c02.Text = tabelka01.Rows[4]["d_02"].ToString().Trim();
            tab_11_w05_c03.Text = tabelka01.Rows[4]["d_03"].ToString().Trim();
            tab_11_w05_c04.Text = tabelka01.Rows[4]["d_04"].ToString().Trim();
            tab_11_w05_c05.Text = tabelka01.Rows[4]["d_05"].ToString().Trim();
            tab_11_w05_c06.Text = tabelka01.Rows[4]["d_06"].ToString().Trim();
            tab_11_w05_c07.Text = tabelka01.Rows[4]["d_07"].ToString().Trim();
            tab_11_w05_c08.Text = tabelka01.Rows[4]["d_08"].ToString().Trim();
            tab_11_w05_c09.Text = tabelka01.Rows[4]["d_09"].ToString().Trim();
            tab_11_w05_c10.Text = tabelka01.Rows[4]["d_10"].ToString().Trim();
            tab_11_w05_c11.Text = tabelka01.Rows[4]["d_11"].ToString().Trim();
            tab_11_w05_c12.Text = tabelka01.Rows[4]["d_12"].ToString().Trim();

            //  wiersz 6

            tab_11_w06_c01.Text = tabelka01.Rows[5]["d_01"].ToString().Trim();
            tab_11_w06_c02.Text = tabelka01.Rows[5]["d_02"].ToString().Trim();
            tab_11_w06_c03.Text = tabelka01.Rows[5]["d_03"].ToString().Trim();
            tab_11_w06_c04.Text = tabelka01.Rows[5]["d_04"].ToString().Trim();
            tab_11_w06_c05.Text = tabelka01.Rows[5]["d_05"].ToString().Trim();
            tab_11_w06_c06.Text = tabelka01.Rows[5]["d_06"].ToString().Trim();
            tab_11_w06_c07.Text = tabelka01.Rows[5]["d_07"].ToString().Trim();
            tab_11_w06_c08.Text = tabelka01.Rows[5]["d_08"].ToString().Trim();
            tab_11_w06_c09.Text = tabelka01.Rows[5]["d_09"].ToString().Trim();
            tab_11_w06_c10.Text = tabelka01.Rows[5]["d_10"].ToString().Trim();
            tab_11_w06_c11.Text = tabelka01.Rows[5]["d_11"].ToString().Trim();
            tab_11_w06_c12.Text = tabelka01.Rows[5]["d_12"].ToString().Trim();

            //  wiersz 7

            tab_11_w07_c01.Text = tabelka01.Rows[6]["d_01"].ToString().Trim();
            tab_11_w07_c02.Text = tabelka01.Rows[6]["d_02"].ToString().Trim();
            tab_11_w07_c03.Text = tabelka01.Rows[6]["d_03"].ToString().Trim();
            tab_11_w07_c04.Text = tabelka01.Rows[6]["d_04"].ToString().Trim();
            tab_11_w07_c05.Text = tabelka01.Rows[6]["d_05"].ToString().Trim();
            tab_11_w07_c06.Text = tabelka01.Rows[6]["d_06"].ToString().Trim();
            tab_11_w07_c07.Text = tabelka01.Rows[6]["d_07"].ToString().Trim();
            tab_11_w07_c08.Text = tabelka01.Rows[6]["d_08"].ToString().Trim();
            tab_11_w07_c09.Text = tabelka01.Rows[6]["d_09"].ToString().Trim();
            tab_11_w07_c10.Text = tabelka01.Rows[6]["d_10"].ToString().Trim();
            tab_11_w07_c11.Text = tabelka01.Rows[6]["d_11"].ToString().Trim();
            tab_11_w07_c12.Text = tabelka01.Rows[6]["d_12"].ToString().Trim();

            //  wiersz 8

            tab_11_w08_c01.Text = tabelka01.Rows[7]["d_01"].ToString().Trim();
            tab_11_w08_c02.Text = tabelka01.Rows[7]["d_02"].ToString().Trim();
            tab_11_w08_c03.Text = tabelka01.Rows[7]["d_03"].ToString().Trim();
            tab_11_w08_c04.Text = tabelka01.Rows[7]["d_04"].ToString().Trim();
            tab_11_w08_c05.Text = tabelka01.Rows[7]["d_05"].ToString().Trim();
            tab_11_w08_c06.Text = tabelka01.Rows[7]["d_06"].ToString().Trim();
            tab_11_w08_c07.Text = tabelka01.Rows[7]["d_07"].ToString().Trim();
            tab_11_w08_c08.Text = tabelka01.Rows[7]["d_08"].ToString().Trim();
            tab_11_w08_c09.Text = tabelka01.Rows[7]["d_09"].ToString().Trim();
            tab_11_w08_c10.Text = tabelka01.Rows[7]["d_10"].ToString().Trim();
            tab_11_w08_c11.Text = tabelka01.Rows[7]["d_11"].ToString().Trim();
            tab_11_w08_c12.Text = tabelka01.Rows[7]["d_12"].ToString().Trim();
            int id_ = 8;
            tab_11_w09_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w09_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w09_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w09_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w09_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w09_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w09_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w09_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w09_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w09_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w09_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w09_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 9;
            tab_11_w10_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w10_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w10_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w10_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w10_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w10_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w10_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w10_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w10_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w10_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w10_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w10_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 10;
            tab_11_w11_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w11_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w11_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w11_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w11_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w11_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w11_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w11_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w11_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w11_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w11_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w11_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 11;
            tab_11_w12_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w12_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w12_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w12_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w12_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w12_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w12_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w12_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w12_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w12_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w12_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w12_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 12;
            tab_11_w13_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w13_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w13_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w13_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w13_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w13_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w13_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w13_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w13_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w13_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w13_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w13_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 13;
            tab_11_w14_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w14_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w14_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w14_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w14_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w14_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w14_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w14_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w14_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w14_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w14_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w14_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 14;
            tab_11_w15_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w15_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w15_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w15_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w15_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w15_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w15_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w15_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w15_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w15_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w15_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w15_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 15;
            tab_11_w16_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w16_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w16_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w16_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w16_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w16_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w16_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w16_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w16_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w16_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w16_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w16_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 16;
            tab_11_w17_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w17_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w17_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w17_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w17_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w17_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w17_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w17_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w17_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w17_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w17_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w17_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 17;
            tab_11_w18_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w18_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w18_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w18_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w18_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w18_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w18_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w18_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w18_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w18_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w18_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w18_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 18;
            tab_11_w19_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w19_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w19_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w19_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w19_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w19_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w19_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w19_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w19_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w19_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w19_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w19_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 19;
            tab_11_w20_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w20_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w20_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w20_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w20_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w20_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w20_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w20_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w20_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w20_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w20_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w20_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
            id_ = 20;
            tab_11_w21_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w21_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w21_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w21_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w21_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w21_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w21_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w21_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w21_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w21_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w21_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w21_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();

            id_ = 21;
            tab_11_w22_c01.Text = tabelka01.Rows[id_]["d_01"].ToString().Trim();
            tab_11_w22_c02.Text = tabelka01.Rows[id_]["d_02"].ToString().Trim();
            tab_11_w22_c03.Text = tabelka01.Rows[id_]["d_03"].ToString().Trim();
            tab_11_w22_c04.Text = tabelka01.Rows[id_]["d_04"].ToString().Trim();
            tab_11_w22_c05.Text = tabelka01.Rows[id_]["d_05"].ToString().Trim();
            tab_11_w22_c06.Text = tabelka01.Rows[id_]["d_06"].ToString().Trim();
            tab_11_w22_c07.Text = tabelka01.Rows[id_]["d_07"].ToString().Trim();
            tab_11_w22_c08.Text = tabelka01.Rows[id_]["d_08"].ToString().Trim();
            tab_11_w22_c09.Text = tabelka01.Rows[id_]["d_09"].ToString().Trim();
            tab_11_w22_c10.Text = tabelka01.Rows[id_]["d_10"].ToString().Trim();
            tab_11_w22_c11.Text = tabelka01.Rows[id_]["d_11"].ToString().Trim();
            tab_11_w22_c12.Text = tabelka01.Rows[id_]["d_12"].ToString().Trim();
        }

        protected void tabela_12()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 12, Date1.Date, Date2.Date, 60, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 12!");
                return;
            }
            Session["tabelka012"] = tabelka01;
            tworztabelkeHTMLTabela12("tb11", idDzialu, 12, tabelka01, "IV.2.1 Wielkość (stan) referatów sędziów");
        }

        protected void tabela_13()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 13, Date1.Date, Date2.Date, 160, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 13!");
                return;
            }
            Session["tabelka013"] = tabelka01;
            tworztabelkeHTMLTabela12("tb12", idDzialu, 13, tabelka01, "IV.2.2. Wielkość (stan) referatów referendarzy sądowych");
          
        }

        protected void tabela_14()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 14");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 14, Date1.Date, Date2.Date, 80, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 14!");
                return;
            }
            Session["tabelka014"] = tabelka01;
            tworztabelkeHTMLTabela14("tb13", idDzialu, 14, tabelka01);
        }

        protected void tabela_15()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 15");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 15, 23, 16, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 15!");
                return;
            }
            //  wiersz 1
            try
            {
                tab_15_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_15_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_15_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_15_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_15_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_15_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_15_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_15_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_15_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_15_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_15_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_15_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_15_w01_c13.Text = tabelka01.Rows[0]["d_13"].ToString().Trim();

                //  wiersz 2
                int id_wiersza = 1;
                tab_15_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w02_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w02_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();

                //  wiersz 3
                id_wiersza = 2;
                tab_15_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w04_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();

                //  wiersz 4
                id_wiersza = 3;
                tab_15_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w04_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 5
                id_wiersza = 4;
                tab_15_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w05_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w05_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 6
                id_wiersza = 5;
                tab_15_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w06_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w06_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 7
                id_wiersza = 6;
                tab_15_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w07_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w07_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 8
                id_wiersza = 7;
                tab_15_w08_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w08_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w08_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w08_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w08_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w08_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w08_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w08_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w08_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w08_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w08_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w08_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w08_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 9
                id_wiersza = 8;
                tab_15_w09_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w09_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w09_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w09_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w09_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w09_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w09_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w09_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w09_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w09_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w09_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w09_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w09_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 10
                id_wiersza = 9;
                tab_15_w10_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w10_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w10_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w10_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w10_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w10_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w10_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w10_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w10_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w10_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w10_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w10_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w10_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 11
                id_wiersza = 10;
                tab_15_w11_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w11_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w11_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w11_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w11_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w11_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w11_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w11_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w11_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w11_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w11_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w11_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w11_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 12
                id_wiersza = 11;
                tab_15_w12_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w12_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w12_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w12_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w12_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w12_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w12_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w12_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w12_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w12_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w12_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w12_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w12_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 13
                id_wiersza = 12;
                tab_15_w13_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w13_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w13_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w13_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w13_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w13_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w13_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w13_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w13_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w13_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w13_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w13_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w13_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 14

                id_wiersza = 13;
                tab_15_w14_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w14_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w14_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w14_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w14_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w14_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w14_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w14_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w14_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w14_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w14_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w14_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w14_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 15
                id_wiersza = 14;
                tab_15_w15_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w15_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w15_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w15_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w15_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w15_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w15_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w15_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w15_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w15_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w15_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w15_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w15_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 16
                id_wiersza = 15;
                tab_15_w16_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w16_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w16_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w16_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w16_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w16_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w16_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w16_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w16_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w16_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w16_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w16_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w16_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 17
                id_wiersza = 16;
                tab_15_w17_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w17_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w17_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w17_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w17_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w17_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w17_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w17_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w17_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w17_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w17_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w17_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w17_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 18
                id_wiersza = 17;
                tab_15_w18_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w18_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w18_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w18_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w18_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w18_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w18_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w18_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w18_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w18_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w18_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w18_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w18_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 19
                id_wiersza = 18;
                tab_15_w19_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w19_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w19_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w19_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w19_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w19_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w19_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w19_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w19_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w19_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w19_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w19_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w19_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 20
                id_wiersza = 19;
                tab_15_w20_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w20_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w20_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w20_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w20_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w20_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w20_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w20_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w20_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w20_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w20_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w20_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w20_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 21
                id_wiersza = 20;
                tab_15_w21_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w21_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w21_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w21_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w21_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w21_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w21_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w21_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w21_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w21_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w21_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w21_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w21_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                //  wiersz 22
                id_wiersza = 21;
                tab_15_w22_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_15_w22_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_15_w22_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_15_w22_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_15_w22_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_15_w22_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_15_w22_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_15_w22_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_15_w22_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_15_w22_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_15_w22_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_15_w22_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_15_w22_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_16()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 16");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 16, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 16!");
                return;
            }
            Session["tabelka016"] = tabelka01;
            tworztabelkeHTMLTabela16("tb15", idDzialu, 16, tabelka01);
        }

        protected void tabela_17()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 17");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 17, 3, 4, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 17!");
                return;
            }
            //  wiersz 1
            try
            {
                tab_17_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                //  wiersz 2
                tab_17_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                //  wiersz 3
                tab_17_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_18()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 18");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 18, 30, 13, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 18!");
                return;
            }
           
            try
            {
                tab_18_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_18_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_18_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_18_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_18_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_18_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_18_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_18_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_18_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_18_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_18_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_18_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
              
                //  wiersz 2
                int id_wiersza = 1;
                tab_18_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w02_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
          
                //  wiersz 3
                id_wiersza = 2;
                tab_18_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              

                //  wiersz 4
                id_wiersza = 3;
                tab_18_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                id_wiersza = 4;
                tab_18_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w05_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 6
                id_wiersza = 5;
                tab_18_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w06_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 7
                id_wiersza = 6;
                tab_18_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w07_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                
                //  wiersz 8
                id_wiersza = 7;
                tab_18_w08_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w08_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w08_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w08_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w08_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w08_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w08_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w08_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w08_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w08_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w08_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w08_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                //  wiersz 9
                id_wiersza = 8;
                tab_18_w09_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w09_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w09_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w09_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w09_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w09_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w09_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w09_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w09_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w09_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w09_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w09_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
           
                //  wiersz 10
                id_wiersza = 9;
                tab_18_w10_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w10_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w10_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w10_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w10_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w10_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w10_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w10_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w10_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w10_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w10_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w10_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 11
                id_wiersza = 10;
                tab_18_w11_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w11_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w11_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w11_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w11_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w11_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w11_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w11_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w11_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w11_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w11_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w11_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 12
                id_wiersza = 11;
                tab_18_w12_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w12_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w12_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w12_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w12_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w12_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w12_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w12_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w12_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w12_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w12_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w12_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 13
                id_wiersza = 12;
                tab_18_w13_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w13_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w13_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w13_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w13_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w13_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w13_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w13_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w13_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w13_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w13_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w13_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               

                id_wiersza = 13;
                tab_18_w14_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w14_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w14_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w14_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w14_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w14_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w14_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w14_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w14_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w14_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w14_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w14_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 15
                id_wiersza = 14;
                tab_18_w15_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w15_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w15_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w15_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w15_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w15_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w15_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w15_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w15_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w15_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w15_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w15_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 16
                id_wiersza = 15;
                tab_18_w16_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w16_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w16_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w16_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w16_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w16_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w16_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w16_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w16_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w16_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w16_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w16_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 17
                id_wiersza = 16;
                tab_18_w17_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w17_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w17_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w17_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w17_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w17_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w17_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w17_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w17_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w17_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w17_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w17_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                id_wiersza = 17;
                tab_18_w18_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w18_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w18_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w18_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w18_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w18_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w18_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w18_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w18_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w18_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w18_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w18_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 19
                id_wiersza = 18;
                tab_18_w19_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w19_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w19_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w19_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w19_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w19_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w19_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w19_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w19_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w19_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w19_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w19_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                id_wiersza = 19;
                tab_18_w20_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w20_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w20_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w20_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w20_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w20_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w20_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w20_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w20_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w20_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w20_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w20_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 21
                id_wiersza = 20;
                tab_18_w21_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_18_w21_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w21_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w21_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w21_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w21_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w21_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w21_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w21_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w21_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w21_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w21_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 22
                id_wiersza = 21;
           
                tab_18_w22_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w22_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w22_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w22_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w22_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w22_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w22_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w22_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w22_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w22_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w22_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                //  wiersz 23
                id_wiersza = 22;

                tab_18_w23_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_18_w23_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_18_w23_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_18_w23_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_18_w23_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_18_w23_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_18_w23_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_18_w23_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_18_w23_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_18_w23_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_18_w23_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_19()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 19");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 19, 25, 13, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 19!");
                return;
            }
           
               try
            {
                tab_19_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_19_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_19_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_19_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_19_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_19_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_19_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_19_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_19_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_19_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_19_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_19_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
              
                //  wiersz 2
                int id_wiersza = 1;
                tab_19_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w02_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
          
                //  wiersz 3
                id_wiersza = 2;
                tab_19_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              

                //  wiersz 4
                id_wiersza = 3;
                tab_19_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                id_wiersza = 4;
                tab_19_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w05_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 6
                id_wiersza = 5;
                tab_19_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w06_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 7
                id_wiersza = 6;
                tab_19_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w07_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                
                //  wiersz 8
                id_wiersza = 7;
                tab_19_w08_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w08_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w08_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w08_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w08_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w08_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w08_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w08_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w08_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w08_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w08_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w08_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                //  wiersz 9
                id_wiersza = 8;
                tab_19_w09_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w09_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w09_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w09_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w09_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w09_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w09_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w09_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w09_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w09_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w09_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w09_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
           
                //  wiersz 10
                id_wiersza = 9;
                tab_19_w10_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w10_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w10_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w10_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w10_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w10_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w10_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w10_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w10_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w10_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w10_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w10_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 11
                id_wiersza = 10;
                tab_19_w11_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w11_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w11_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w11_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w11_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w11_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w11_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w11_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w11_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w11_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w11_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w11_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 12
                id_wiersza = 11;
                tab_19_w12_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w12_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w12_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w12_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w12_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w12_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w12_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w12_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w12_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w12_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w12_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w12_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
             
                //  wiersz 13
                id_wiersza = 12;
                tab_19_w13_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w13_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w13_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w13_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w13_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w13_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w13_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w13_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w13_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w13_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w13_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w13_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               

                id_wiersza = 13;
                tab_19_w14_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w14_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w14_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w14_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w14_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w14_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w14_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w14_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w14_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w14_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w14_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w14_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 15
                id_wiersza = 14;
                tab_19_w15_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w15_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w15_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w15_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w15_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w15_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w15_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w15_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w15_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w15_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w15_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w15_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 16
                id_wiersza = 15;
                tab_19_w16_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w16_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w16_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w16_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w16_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w16_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w16_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w16_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w16_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w16_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w16_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w16_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 17
                id_wiersza = 16;
                tab_19_w17_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w17_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w17_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w17_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w17_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w17_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w17_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w17_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w17_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w17_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w17_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w17_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            
                id_wiersza = 17;
                tab_19_w18_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w18_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w18_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w18_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w18_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w18_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w18_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w18_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w18_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w18_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w18_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w18_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 19
                id_wiersza = 18;
                tab_19_w19_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w19_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w19_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w19_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w19_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w19_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w19_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w19_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w19_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w19_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w19_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w19_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                id_wiersza = 19;
                tab_19_w20_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w20_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w20_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w20_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w20_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w20_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w20_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w20_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w20_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w20_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w20_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w20_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
              
                //  wiersz 21
                id_wiersza = 20;
                tab_19_w21_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_19_w21_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w21_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w21_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w21_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w21_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w21_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w21_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w21_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w21_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w21_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w21_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
               
                //  wiersz 22
                id_wiersza = 21;
           
                tab_19_w22_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w22_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w22_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w22_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w22_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w22_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w22_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w22_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w22_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w22_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w22_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                //  wiersz 23
                id_wiersza = 22;

                tab_19_w23_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_19_w23_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_19_w23_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_19_w23_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_19_w23_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_19_w23_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_19_w23_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_19_w23_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_19_w23_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_19_w23_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_19_w23_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_20()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 20");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 20, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 20!");
                return;
            }
            Session["tabelka020"] = tabelka01;
            tworztabelkeHTMLTabela20("tb19", idDzialu, 20, tabelka01);
        }

        protected void tabela_21()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 20");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 21, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 20!");
                return;
            }
            Session["tabelka021"] = tabelka01;
            tworztabelkeHTMLTabela21("tb20", idDzialu, 21, tabelka01);
        }

        protected void tabela_22()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 22");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 22, Date1.Date, Date2.Date, 260, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 22!");
                return;
            }
            Session["tabelka022"] = tabelka01;
            tworztabelkeHTMLTabela22("tb21", idDzialu, 22, tabelka01);
        }

        protected void tabela_23()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 23");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 23, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 23!");
                return;
            }
            Session["tabelka023"] = tabelka01;
            tworztabelkeHTMLTabela23("tb22", idDzialu, 23, tabelka01);
        }

        protected void tabela_24()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 24");
            }
            DataTable tabela023 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 24, 4, 2, tenPlik);
            if (tabela023 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 24!");
                return;
            }
            try
            {
                //  wiersz 1
                tab_24_w01_c01.Text = tabela023.Rows[0][1].ToString().Trim();
                //  wiersz 2
                tab_24_w02_c01.Text = tabela023.Rows[1][1].ToString().Trim();
                //  wiersz 3
                tab_24_w04_c01.Text = tabela023.Rows[2][1].ToString().Trim();
                //  wiersz 4
                tab_24_w04_c01.Text = tabela023.Rows[3][1].ToString().Trim();
            }
            catch
            {
            }
        }

        protected void tabela_25()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 25");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 25, 9, 15, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 25!");
                return;
            }
           

            try
            {
                tab_25_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_25_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_25_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_25_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_25_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_25_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_25_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_25_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_25_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_25_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_25_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
                tab_25_w01_c12.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_25_w01_c13.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_25_w01_c14.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
                tab_25_w01_c15.Text = tabelka01.Rows[0]["d_12"].ToString().Trim();
               
                //  wiersz 2
                int id_wiersza = 1;
                tab_25_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w02_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();

                tab_25_w02_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w02_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w02_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();
                //  wiersz 3
                id_wiersza = 2;
                tab_25_w03_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w03_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w03_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w03_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w03_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w03_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w03_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w03_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w03_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w03_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w03_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w03_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_25_w03_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w03_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w03_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();

                //  wiersz 4
                id_wiersza = 3;
                tab_25_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w04_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_25_w04_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w04_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w04_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();
                id_wiersza = 4;
                tab_25_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w05_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_25_w05_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w05_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w05_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();
                //  wiersz 6
                id_wiersza = 5;
                tab_25_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w06_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_25_w06_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w06_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w06_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();
                //  wiersz 7
                id_wiersza = 6;
                tab_25_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w07_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();
                tab_25_w07_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w07_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w07_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();
                //  wiersz 8
                id_wiersza = 7;
                tab_25_w08_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_25_w08_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_25_w08_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_25_w08_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_25_w08_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_25_w08_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_25_w08_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_25_w08_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_25_w08_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_25_w08_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_25_w08_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                tab_25_w08_c12.Text = tabelka01.Rows[id_wiersza]["d_12"].ToString().Trim();

                tab_25_w08_c13.Text = tabelka01.Rows[id_wiersza]["d_13"].ToString().Trim();
                tab_25_w08_c14.Text = tabelka01.Rows[id_wiersza]["d_14"].ToString().Trim();
                tab_25_w08_c15.Text = tabelka01.Rows[id_wiersza]["d_15"].ToString().Trim();

            }
            catch
            {
            }

        }

        protected void tabela_26()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 26");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 26, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 26!");
                return;
            }
            Session["tabelka026"] = tabelka01;
            tworztabelkeHTMLTabela26("tb25", idDzialu, 26, tabelka01);
        }

        protected void tabela_27()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 27");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 27, 8, 11, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 27!");
                return;
            }
            try
            {
                tab_27_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_27_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_27_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_27_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_27_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_27_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_27_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_27_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_27_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_27_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_27_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
          

                //  wiersz 2
                int id_wiersza = 1;
                tab_27_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
               

                //  wiersz 3
                id_wiersza = 2;
                tab_27_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
              


                //  wiersz 4
                id_wiersza = 3;
                tab_27_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
            

                id_wiersza = 4;
                tab_27_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
             

                //  wiersz 6
                id_wiersza = 5;
                tab_27_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
             

                //  wiersz 7
                id_wiersza = 6;
                tab_27_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_27_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_27_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_27_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_27_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_27_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_27_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_27_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_27_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_27_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_27_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
             




            }
            catch
            {
            }

        }

        protected void tabela_28()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 28");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 28, 8, 11, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 28!");
                return;
            }
            try
            {
                tab_28_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_28_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_28_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_28_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_28_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_28_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_28_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_28_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
                tab_28_w01_c09.Text = tabelka01.Rows[0]["d_09"].ToString().Trim();
                tab_28_w01_c10.Text = tabelka01.Rows[0]["d_10"].ToString().Trim();
                tab_28_w01_c11.Text = tabelka01.Rows[0]["d_11"].ToString().Trim();
              

                //  wiersz 2
                int id_wiersza = 1;
                tab_28_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
               

                //  wiersz 3
                id_wiersza = 2;
                tab_28_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
              


                //  wiersz 4
                id_wiersza = 3;
                tab_28_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
              
                id_wiersza = 4;
                tab_28_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
              

                //  wiersz 6
                id_wiersza = 5;
                tab_28_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
               

                //  wiersz 7
                id_wiersza = 6;
                tab_28_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_28_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_28_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_28_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_28_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_28_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_28_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_28_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_28_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_28_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_28_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                

                //  wiersz 9
            
             
            }
            catch
            {
            }
        }

        protected void tabela_29()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 29");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 29, 8, 11, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 29!");
                return;
            }

            try
            {
                //  wiersz 1
                int id_wiersza = 0;
                tab_29_w01_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w01_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w01_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w01_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w01_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w01_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w01_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w01_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w01_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w01_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w01_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();

                //  wiersz 2
                id_wiersza = 1;
                tab_29_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w02_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w02_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w02_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();

                //  wiersz 3
                id_wiersza = 2;
                tab_29_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                //  wiersz 4
                id_wiersza = 3;
                tab_29_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w04_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w04_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w04_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                //  wiersz 5
                id_wiersza = 4;
                tab_29_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w05_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w05_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w05_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                //  wiersz 6
                id_wiersza = 5;
                tab_29_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w06_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w06_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w06_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
                //  wiersz 7
                id_wiersza = 6;
                tab_29_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_29_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_29_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_29_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_29_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_29_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_29_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_29_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
                tab_29_w07_c09.Text = tabelka01.Rows[id_wiersza]["d_09"].ToString().Trim();
                tab_29_w07_c10.Text = tabelka01.Rows[id_wiersza]["d_10"].ToString().Trim();
                tab_29_w07_c11.Text = tabelka01.Rows[id_wiersza]["d_11"].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": bład podczas  tworzenia tabeli 28 " + ex.Message);
            }
        }

        protected void tabela_30()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 30");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 30, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 30!");
                return;
            }
            Session["tabelka030"] = tabelka01;
            tworztabelkeHTMLTabela30("tb29", idDzialu, 30, tabelka01);
        }

        protected void tabela_31()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 31");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 31, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 31!");
                return;
            }
            Session["tabelka030"] = tabelka01;
            tworztabelkeHTMLTabela31("tb29", idDzialu, 31, tabelka01);
        }

        protected void tabela_32()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 32");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 32, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 32!");
                return;
            }
            Session["tabelka031"] = tabelka01;
            tworztabelkeHTMLTabela31("tb29", idDzialu, 32, tabelka01);
        }

        protected void tabela_33()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 33");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 33, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 33!");
                return;
            }
            Session["tabelka033"] = tabelka01;
            tworztabelkeHTMLTabela33(idDzialu, 33, tabelka01);
        }

        protected void tabela_34()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 34");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 34, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 34!");
                return;
            }
            Session["tabelka032"] = tabelka01;
            tworztabelkeHTMLTabela34(idDzialu, 34, tabelka01);
        }

        protected void tabela_35()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 35");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 35, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 35!");
                return;
            }
            Session["tabelka035"] = tabelka01;
            tworztabelkeHTMLTabela35(idDzialu, 35, tabelka01);
        }

        protected void tabela_36()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 36");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 36, 10, 10, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 36!");
                return;
            }
            try
            {
                tab_36_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();


                //  wiersz 2
                int id_wiersza = 1;
                tab_36_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();


                //  wiersz 3
                id_wiersza = 2;
                tab_36_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();

                //  wiersz 4
                id_wiersza = 3;
                tab_36_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();

            }
            //  wiersz 5

            catch
            {
            }
        }

        protected void tabela_37()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 37");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 37, 10, 10, false, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 37!");
                return;
            }
            try
            {
                tab_37_w01_c01.Text = tabelka01.Rows[0]["d_01"].ToString().Trim();
                tab_37_w01_c02.Text = tabelka01.Rows[0]["d_02"].ToString().Trim();
                tab_37_w01_c03.Text = tabelka01.Rows[0]["d_03"].ToString().Trim();
                tab_37_w01_c04.Text = tabelka01.Rows[0]["d_04"].ToString().Trim();
                tab_37_w01_c05.Text = tabelka01.Rows[0]["d_05"].ToString().Trim();
                tab_37_w01_c06.Text = tabelka01.Rows[0]["d_06"].ToString().Trim();
                tab_37_w01_c07.Text = tabelka01.Rows[0]["d_07"].ToString().Trim();
                tab_37_w01_c08.Text = tabelka01.Rows[0]["d_08"].ToString().Trim();
             

                //  wiersz 2
                int id_wiersza = 1;
                tab_37_w02_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w02_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w02_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w02_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w02_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w02_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w02_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w02_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
            
                //  wiersz 3
                id_wiersza = 2;
                tab_37_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
             
                //  wiersz 4
                id_wiersza = 3;
                tab_37_w04_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w04_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w04_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w04_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w04_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w04_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w04_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w04_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
               
                //  wiersz 5
                id_wiersza = 4;
                tab_37_w05_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w05_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w05_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w05_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w05_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w05_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w05_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w05_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
               
                //  wiersz 6
                id_wiersza = 5;
                tab_37_w06_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w06_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w06_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w06_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w06_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w06_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w06_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w06_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
            
                //  wiersz 7
                id_wiersza = 6;
                tab_37_w07_c01.Text = tabelka01.Rows[id_wiersza]["d_01"].ToString().Trim();
                tab_37_w07_c02.Text = tabelka01.Rows[id_wiersza]["d_02"].ToString().Trim();
                tab_37_w07_c03.Text = tabelka01.Rows[id_wiersza]["d_03"].ToString().Trim();
                tab_37_w07_c04.Text = tabelka01.Rows[id_wiersza]["d_04"].ToString().Trim();
                tab_37_w07_c05.Text = tabelka01.Rows[id_wiersza]["d_05"].ToString().Trim();
                tab_37_w07_c06.Text = tabelka01.Rows[id_wiersza]["d_06"].ToString().Trim();
                tab_37_w07_c07.Text = tabelka01.Rows[id_wiersza]["d_07"].ToString().Trim();
                tab_37_w07_c08.Text = tabelka01.Rows[id_wiersza]["d_08"].ToString().Trim();
      
            }
            catch
            {
            }
        }

        protected void tabela_38()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 38");
            }
         
        }

        protected void tabela_39()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 38");
            }
          
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            //excell
        }

        protected void tab_1_w02_c01_dateInit(object sender, EventArgs e)
        {
            //  tab_1_w05_c01.Value = DateTime.Now;
        }

        protected void tab_2_w01_c01_dateInit(object sender, EventArgs e)
        {
            // tab_2_w01_c01.Value = DateTime.Now;
        }

        protected void tworztabelkeHTMLTabela3(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            PlaceHolderTB3.Dispose();

            try
            {
                string path = Server.MapPath("XMLHeaders") + "\\wizk.xml";
                StringBuilder Tabele = new StringBuilder();
                Tabele.Append(XMLHeaders.TabelaSedziowskaXML(path, idWydzialu, idtabeli.ToString(), dane, true, false, false, true, "", tenPlik));

                PlaceHolderTB3.Controls.Add(new Label { Text = Tabele.ToString(), ID = idKontrolki });
            }
            catch (Exception ex)
            {
                string exx = ex.Message;
                cm.log.Error(tenPlik + " :Generowanie tabeli danych:  " + ex.Message + " " + tenPlik);
            }
        }

        protected void tworztabelkeHTMLTabela4(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];

                string path = Server.MapPath("XMLHeaders") + "\\wizk.xml";
                StringBuilder Tabele = new StringBuilder();
                Tabele.Append(XMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), idtabeli.ToString(), dane, true, false, false, true, "", tenPlik));

                PlaceHolderTB3.Controls.Add(new Label { Text = Tabele.ToString(), ID = idKontrolki });
            }
            catch (Exception ex)
            {
                string exx = ex.Message;
                cm.log.Error(tenPlik + " :Generowanie tabeli danych:  " + ex.Message + " " + tenPlik);
            }
        }

        protected void tworztabelkeHTMLTabela5(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='2'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_250' rowspan='2'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >okres pełnienia funkcji</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >wymiar czasu pracy w wydziale wg podziału czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >efektywny czas pracy (w miesiącach) </td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='6' >Wyznaczone sesje (jawne/niejawne) </td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba wyznaczonych sesji jawnych</td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba wyznaczonych sesji niejawnych</td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba sesji jawnych i niejawnych OGÓŁEM</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji OGÓŁEM miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji jawnych miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji niejawnych  miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 0, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 0, "borderAll center col_100"));

                builder.Append(tworzPodSekcje(1, 12, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append(sumaTabeli(dane, 12, idtabeli, "Razem", 2));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB5.Controls.Add(tblControl);

            PlaceHolderTB5.Dispose();
        }

        protected void tworztabelkeHTMLTabela6(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];

                string path = Server.MapPath("XMLHeaders") + "\\wizk.xml";
                StringBuilder Tabele = new StringBuilder();
                Tabele.Append(XMLHeaders.TabelaSedziowskaXML(path, int.Parse(idDzialu), idtabeli.ToString(), dane, true, false, false, true, "", tenPlik));
                PlaceHolderTB6.Controls.Clear();
                PlaceHolderTB6.Controls.Add(new Label { Text = Tabele.ToString(), ID = idKontrolki });
            }
            catch (Exception ex)
            {
                string exx = ex.Message;
                cm.log.Error(tenPlik + " :Generowanie tabeli danych:  " + ex.Message + " " + tenPlik);
            }
        }

        protected void tworztabelkeHTMLTabela71(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<p>III.3.1. Asystenci sędziów</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela 7 </p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='1'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >okres pracy w wydziale</td>");

            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >wymiar czasu pracy w wydziale wg zakresu czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >liczba sędziów, z którymi asystent współpracuje</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 0, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 0, "borderAll center col_100"));

                builder.Append(tworzPodSekcje(1, 4, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB71.Controls.Clear();
            PlaceHolderTB71.Controls.Add(tblControl);

            PlaceHolderTB71.Dispose();
        }

        protected void tworztabelkeHTMLTabela12(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane, string tytul)
        {
            if (dane == null)
            {
                return;
            }
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(tytul);
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_150' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_81' rowspan='3' >funkcja</td>");

            builder.AppendLine("<td class='borderAll center col_81' rowspan='3' ></td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='15' >kategoria spraw</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_81' >ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2'>K</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2'>Kp</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2' >Ko</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2' >W</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2' >Kop</td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2' ></td>");
            builder.AppendLine("<td class='borderAll center col_81' colspan='2' ></td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_81' >liczba</td>");
            for (int i = 0; i < 7; i++)
            {
                builder.AppendLine("<td class='borderAll center col_81' >liczba</td>");
                builder.AppendLine("<td class='borderAll center col_81' >%</td>");
            }

            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 3, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 3, "borderAll center col_150"));

                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 3, "borderAll center col_81"));

                builder.Append(tworzSekcjeTR(1, 16, 40, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB11.Controls.Add(tblControl);
            PlaceHolderTB11.Dispose();
        }

        protected void tworztabelkeHTMLTabela13(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
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
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' >funkcja</td>");

            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' ></td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='15' >kategoria spraw</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>K</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Kp</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Ko</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >W</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Kop</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' ></td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' ></td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
            for (int i = 0; i < 7; i++)
            {
                builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
                builder.AppendLine("<td class='borderAll center col_100' >%</td>");
            }

            builder.AppendLine("</tr>");

            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 0, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 0, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 0, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 0, "borderAll center col_100"));

                builder.Append(tworzPodSekcje(2, 19, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB12.Controls.Add(tblControl);
            PlaceHolderTB12.Dispose();
        }

        protected void tworztabelkeHTMLTabela14(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_13.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                int step = 12;
                builder.Append(TabelaWewnetrzna14(step, licznik, idtabeli, wierszZtabeli));

                licznik++;
            }
            //  builder.Append(sumaTabeliX(dane, 6, 13, idtabeli,"  ",2,true));
            builder.Append(sumaTabeli(dane, 6, 12, idtabeli, "Razem", 5));

            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB13.Controls.Add(tblControl);
            PlaceHolderTB13.Dispose();
        }

        protected void tworztabelkeHTMLTabela16(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_13.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;

            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTMLbezP(licznik.ToString(), 0, 6, "borderAll center col_36"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["d_01"].ToString(), 0, 6, "borderAll center col_100"));
                int step = 12;
                builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(step + 1, (step * 2) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 1, (step * 3) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 1, (step * 4) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 1, (step * 5) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 1, (step * 6) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                licznik++;
            }

            builder.Append(sumaTabeliX(dane, 72, 12, idtabeli, "Razem", 5,0));
            builder.Append("</table>");
            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB15.Controls.Clear();
            PlaceHolderTB15.Controls.Add(tblControl);
            PlaceHolderTB15.Dispose();
        }

        protected void tworztabelkeHTMLTabela20(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTMLbezP(licznik.ToString(), 0, 6, "borderAll center col_36"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["d_02"].ToString(), 0, 6, "borderAll center col_100"));
                int step = 12;
                builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(step + 1, (step * 2) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 1, (step * 3) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 1, (step * 4) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 1, (step * 5) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 1, (step * 6) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                licznik++;
            }
            builder.Append(sumaTabeliX(dane, 72, 12, idtabeli, "Razem", 5, 0));
        //    builder.Append(sumaTabeli(dane, 6, 14, idtabeli, "Razem",5));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB19.Controls.Add(tblControl);
            PlaceHolderTB19.Dispose();
        }

        protected void tworztabelkeHTMLTabela21(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<p>IV.5.1. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów (liczba spraw)</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_20.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów

            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTMLbezP(licznik.ToString(), 0, 6, "borderAll center col_36"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTMLbezP(wierszZtabeli["d_02"].ToString(), 0, 6, "borderAll center col_100"));
                int step = 12;
                builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP(step + 1, (step * 2) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 1, (step * 3) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 1, (step * 4) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 1, (step * 5) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
                builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 1, (step * 6) + 1, wierszZtabeli, idtabeli.ToString(), 0));
                licznik++;
                // builder.AppendLine("</tr>");
            }
            builder.Append(sumaTabeliX(dane, 72, 12, idtabeli, "Razem", 5, 0));
         //   builder.Append(sumaTabeli(dane, 6, 14, idtabeli, "Razem", 4));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB19.Controls.Add(tblControl);
            PlaceHolderTB19.Dispose();
        }

        protected void tworztabelkeHTMLTabela22(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("</br>");
            builder.AppendLine("<p>IV.5.3. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów (liczba spraw)</p>");

            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli));

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append(sumaTabeliX(dane, 72, 12, idtabeli, "Razem", 5, 0));
        //    builder.Append(sumaTabeli(dane, 6, 14, idtabeli, "Razem", 4));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB19.Controls.Add(tblControl);
            PlaceHolderTB19.Dispose();
        }

        protected void tworztabelkeHTMLTabela23(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("</br>");
            builder.AppendLine("<p>IV.5.3. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów (liczba spraw)</p>");

            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_20.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli));

                licznik++;
                builder.AppendLine("</tr>");
            }
            //     builder.Append(sumaTabeli(dane, 7, 13, idtabeli, "Razem", 5));
            builder.Append(sumaTabeliX(dane, 72, 12, idtabeli, "Razem", 5,1));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB19.Controls.Add(tblControl);
            PlaceHolderTB19.Dispose();
        }

        protected void tworztabelkeHTMLTabela26(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<div class='page-break'>");
            builder.AppendLine("</br>");

            builder.AppendLine("<p>IV.6.2. Terminowość sporządzania uzasadnień i stabilność orzecznictwa poszczególnych sędziów</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_25.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 2;
            cm.log.Info("tabela 26 ilosc wirszy " + dane.Rows.Count.ToString());
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna26(14, licznik, idtabeli, wierszZtabeli));

                licznik++;
                builder.AppendLine("</tr>");
            }
           // builder.Append(sumaTabeliX2(dane, 90, 15, idtabeli, "Razem", 5, 1));
            builder.Append(sumaTabeli26(dane, 7, 15, idtabeli, "Razem", 5));
            builder.Append("</table>");
            builder.AppendLine("</div>");
            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB25.Controls.Add(tblControl);
            PlaceHolderTB25.Dispose();
        }

        protected void tworztabelkeHTMLTabela30(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.3.Struktura pozostałości (referaty poszczególnych sędziów – liczba spraw)</p>");

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli));

                licznik++;
            }

         //   builder.Append(sumaTabeli(dane, 7, 14, idtabeli, "Razem", 4));
            builder.Append(sumaTabeliX(dane, 72, 14, idtabeli, "Razem", 4, 0));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        protected void tworztabelkeHTMLTabela31(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.3.Struktura pozostałości (referaty poszczególnych sędziów – liczba spraw (obok liczby ogółem należy podać liczbę spraw zawieszonych))</p>");

            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli));
                licznik++;
            }

           // builder.Append(sumaTabeli(dane, 7, 13, idtabeli, "Razem", 5));
            builder.Append(sumaTabeliX(dane, 72, 32, idtabeli, "Razem", 5, 0));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        protected void tworztabelkeHTMLTabela32(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();

            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.5.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;

            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(14, licznik, idtabeli, wierszZtabeli));

                licznik++;
            }
            builder.Append(sumaTabeli(dane, 7, 14, idtabeli, "Razem", 5));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };

            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        protected void tworztabelkeHTMLTabela33(int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();

            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.5.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw)</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli));
                licznik++;
            }
            builder.Append(sumaTabeli(dane, 7, 13, idtabeli, "Razem", 5));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };

            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        protected void tworztabelkeHTMLTabela34(int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();

            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.5.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – liczba spraw (obok liczby ogółem należy podać liczbę spraw zawieszonych))</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli)); licznik++;
            }
            builder.Append(sumaTabeli(dane, 7, 13, idtabeli, "Razem", 5));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        protected void tworztabelkeHTMLTabela35(int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();

            builder.AppendLine("<br/>");
            builder.AppendLine("<p>IV. 7.6.Struktura pozostałości (referaty poszczególnych referendarzy sądowych – %)</p>");
            if (cl.debug(idWydzialu))
            {
                builder.AppendLine("<p>Tabela " + idtabeli.ToString() + "</p>");
            }
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_19.xml";
            builder.AppendLine(XMLHeaders.getHeaderFromXML(path, tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;

            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.Append(TabelaWewnetrzna(12, licznik, idtabeli, wierszZtabeli)); licznik++;
            }
            builder.Append(sumaTabeli(dane, 7, 13, idtabeli, "Razem", 5));
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB29.Controls.Add(tblControl);
            PlaceHolderTB29.Dispose();
        }

        private string sumaTabeli(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli)
        {
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];
            for (int i = 0; i < dlugoscLinii - 1; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 0;

            for (int i = 0; i < (iloscWierszy * dlugoscLinii); i++)
            {
                try
                {
                    wierszSumujacy[dlugosc] = wierszSumujacy[dlugosc] + double.Parse(suma.Rows[0][i + 1].ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 0;
                }
                dlugosc++;
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML("Razem", 4, 0, "borderAll center col_100 gray"));

            for (int j = 0; j < dlugoscLinii - 1; j++)
            {
                if ((j < 5) ^ (j > 7))
                {
                    builder.Append(tb.komorkaHTML(wierszSumujacy[j].ToString(), 0, 0, "borderAll center col_100 gray"));
                }
                else
                {
                    builder.Append(tb.komorkaHTML("", 0, 0, "borderAll center col_100"));
                }
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string sumaTabeli(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli, int przesunięcie)
        {
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];
            for (int i = 0; i < dlugoscLinii - 1; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 0;

            for (int i = 0; i < (iloscWierszy * dlugoscLinii); i++)
            {
                try
                {
                    string nazwaKolumny = "d_" + (i + przesunięcie).ToString("D2");
                    wierszSumujacy[dlugosc] = wierszSumujacy[dlugosc] + double.Parse(suma.Rows[0][nazwaKolumny].ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 0;
                }
                dlugosc++;
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML("Razem", 5, 0, "borderAll center col_100 gray"));

            for (int j = 0; j < dlugoscLinii - 1; j++)
            {
                if ((j < 5) ^ (j > 7))
                {
                    builder.Append(tb.komorkaHTML(wierszSumujacy[j].ToString(), 0, 0, "borderAll center col_100 gray"));
                }
                else
                {
                    builder.Append(tb.komorkaHTML("", 0, 0, "borderAll center col_100"));
                }
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string sumaTabeli(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem)
        {
            //   List<double> items = new List<double>();
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii+2];
            for (int i = 0; i < dlugoscLinii+2; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 0;

            for (int i = 0; i < (iloscWierszy * dlugoscLinii); i++)
            {
                try
                {
                    double wynik = double.Parse(suma.Rows[0][i + 1].ToString());
                    double poprzedni = wierszSumujacy[dlugosc];
                    double razem = wynik + poprzedni;
                    wierszSumujacy[dlugosc] = wierszSumujacy[dlugosc] + double.Parse(suma.Rows[0][i + 1].ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 0;
                }
                dlugosc++;
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));

            for (int j = 0; j < dlugoscLinii ; j++)
            {
                builder.Append(tb.komorkaHTML(wierszSumujacy[j + 1].ToString(), 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }
        private string sumaTabeli26(DataTable dane, int iloscWierszy, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem)
        {
            //   List<double> items = new List<double>();
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii + 2];
            for (int i = 0; i < dlugoscLinii + 2; i++)
            {
                wierszSumujacy[i] = 0;
            }

            DataTable suma = tb.makeSumRow(dane, iloscWierszy * dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            int dlugosc = 1;

            for (int i = 1; i < (iloscWierszy * dlugoscLinii-1); i++)
            {
                try
                {
                    double wynik = double.Parse(suma.Rows[0][i].ToString());
                    double poprzedni = wierszSumujacy[dlugosc];
                    double razem = wynik + poprzedni;
                    wierszSumujacy[dlugosc] = razem;

                }
                catch (Exception ex)
                {
                    cm.log.Error("Bład wizk sumowanie : " + ex.Message);
                }
                if (dlugosc == dlugoscLinii)
                {
                    dlugosc = 1;
                }
                dlugosc++;
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));

            for (int j = 2; j < dlugoscLinii+1; j++)
            {
                builder.Append(tb.komorkaHTML(wierszSumujacy[j].ToString(), 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string sumaTabeli(DataTable dane, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem)
        {
            //   List<double> items = new List<double>();
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];

            DataTable suma = tb.makeSumRow(dane, dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));
            DataRow wierszDanych = suma.Rows[0];
            for (int j = 1; j < dlugoscLinii; j++)
            {
                string nazwaKolumny = "d_" + j.ToString("D2");
                string wartoscdanej = wierszDanych[nazwaKolumny].ToString();

                builder.Append(tb.komorkaHTML(wartoscdanej, 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }

        private string sumaTabeliX(DataTable dane, int iloscKolumn, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem,int przesuniecie)
        {
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];

            DataTable suma = tb.makeSumRow(dane, iloscKolumn, dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));
            DataRow wierszDanych = suma.Rows[0];
            for (int j = 1+przesuniecie; j <= dlugoscLinii+przesuniecie; j++)
            {
                string wartoscdanej = "0";
                try
                {
                    string nazwaKolumny = "d_" + j.ToString("D2");
                    wartoscdanej = wierszDanych[nazwaKolumny].ToString();
                }
                catch
                {
                }

                builder.Append(tb.komorkaHTML(wartoscdanej, 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
        }
        private string sumaTabeliX2(DataTable dane, int iloscKolumn, int dlugoscLinii, int idtabeli, string tekst, int złaczenieRazem, int przesuniecie)
        {
            StringBuilder builder = new StringBuilder();
            string sumaKoncowa = string.Empty;
            double[] wierszSumujacy = new double[dlugoscLinii];

            DataTable suma = tb.makeSumRow(dane, iloscKolumn, dlugoscLinii);
            if (suma == null)
            {
                cm.log.Error(tenPlik + " bład w sumowaniu tabeli " + idtabeli.ToString());
                return "";
            }

            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML(tekst, złaczenieRazem, 0, "borderAll center col_100 gray"));
            DataRow wierszDanych = suma.Rows[0];
            for (int j = 1 + przesuniecie; j <= dlugoscLinii + przesuniecie-1; j++)
            {
                string wartoscdanej = "0";
                try
                {
                    string nazwaKolumny = "d_" + j.ToString("D2");
                    wartoscdanej = wierszDanych[nazwaKolumny].ToString();
                }
                catch
                {
                }

                builder.Append(tb.komorkaHTML(wartoscdanej, 0, 0, "borderAll center col_100 gray"));
            }

            builder.AppendLine("</tr>");

            return builder.ToString();
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

        // private metodes

        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + (i + indexPoczatkowy).ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzPodSekcjebezP(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + (i + indexPoczatkowy).ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTMLbezP(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

      
        private string tworzPodSekcjeBezTRiP(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();

            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + (i + indexPoczatkowy).ToString() + "!2')\">" + wierszZtabeli["d_" + (i + indexPoczatkowy).ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTMLbezP(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

      

        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            //  result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string wartosc = wierszZtabeli["d_" + i.ToString("D2")].ToString();
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["d_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            //result.AppendLine("</tr>");
            return result.ToString();
        }

       

        private string tworzPodSekcjeTR(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli, string komorka)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            result.AppendLine(komorka);
            for (int i = poczatek; i < koniec; i++)
            {
                string wartosc = wierszZtabeli["d_" + i.ToString("D2")].ToString();
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["d_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTMLbezP(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcje(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli));
                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }

        private string tworzSekcjeTR(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();

            result.AppendLine(tworzPodSekcjeTR(1, 16, wierszZtabeli, idtabeli, tb.komorkaHTMLbezP("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 0, 0, "borderAll center col_250 smallFt")));

            result.AppendLine(tworzPodSekcjeTR(16, 31, wierszZtabeli, idtabeli, tb.komorkaHTMLbezP("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 0, 0, "borderAll center col_250 smallFt")));

            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcje(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli, indexPoczatkowy));
                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }

        private string tworzSekcjebezP(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli, int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcjebezP(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli, indexPoczatkowy));

                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }

        private void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    try
                    {
                        var kontrolka = this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (kontrolka != null)
                        {
                            var typKontrolki = kontrolka.GetType();
                            var nazwaTypu = typKontrolki.Name;
                            if (string.Equals(nazwaTypu.ToString(), "label"))
                            {
                                Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);

                                tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                            }
                            else
                            {
                                TextBox tbx = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);

                                tbx.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                            }

                            cm.log.Info(" pisz " + nazwaTypu.ToString());
                        }
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error(tenPlik + " pisz " + ex.Message);
                    }
                    /*
                    try
                    {
                        Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (tb != null)
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        TextBox tbx = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                        if (tbx != null)
                        {
                            tbx.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    */
        }
    }
        }// end of pisz

        private string TabelaWewnetrzna(int step, int licznik, int idtabeli, DataRow wierszZtabeli)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<tr>");
            builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 6, "borderAll center col_36"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 6, "borderAll center col_100"));

            builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 1));
            builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(step + 1, (step * 2) + 1, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 1, (step * 3) + 1, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 1, (step * 4) + 1, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 1, (step * 5) + 1, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 1, (step * 6) + 1, wierszZtabeli, idtabeli.ToString(), 0));

            return builder.ToString();
        }
        private string TabelaWewnetrzna26(int step, int licznik, int idtabeli, DataRow wierszZtabeli)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<tr>");
            builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 6, "borderAll center col_36"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 6, "borderAll center col_100"));

            builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 1));
            builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(step + 2, (step * 2) +2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 2, (step * 3) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 2, (step * 4) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 2, (step * 5) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 2, (step * 6) + 2, wierszZtabeli, idtabeli.ToString(), 0));

            return builder.ToString();
        }
        private string TabelaWewnetrzna14(int step, int licznik, int idtabeli, DataRow wierszZtabeli)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<tr>");
            builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 6, "borderAll center col_36"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
            builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 6, "borderAll center col_100"));

            builder.Append(tb.komorkaHTMLbezP("K", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(1, step + 1, wierszZtabeli, idtabeli.ToString(), 1));
            builder.Append(tb.komorkaHTMLbezP("Kp", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP(step + 2, (step * 2) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Ko", 0, 1, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 2) + 2, (step * 3) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("W", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 3) + 2, (step * 4) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("Kop", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 4) + 2, (step * 5) + 2, wierszZtabeli, idtabeli.ToString(), 0));
            builder.Append(tb.komorkaHTMLbezP("", 0, 0, "borderAll center col_100"));
            builder.Append(tworzPodSekcjeBezTRiP((step * 5) + 2, (step * 6) + 2, wierszZtabeli, idtabeli.ToString(), 0));

            return builder.ToString();
        }
        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}