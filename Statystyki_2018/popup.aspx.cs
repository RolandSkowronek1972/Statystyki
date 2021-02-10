using System;
using System.Data;
using System.Text.RegularExpressions;

namespace Statystyki_2018
{
    public partial class popup : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cm.log.Info("popup -start- " );
                string sesja = Request.QueryString["sesja"];
                if (sesja != null)
                {
                    cm.log.Info("popup -sesja- "+ sesja);
                    // jest wywolanie
                    Label1.Text = sesja;
                    string[] stringSeparators = new string[] { "!" };
                    string[] stTab = null;

                    stTab = sesja.Split(stringSeparators, StringSplitOptions.None);
                    try
                    {
                        //1 - id wiersza// id sedziego
                        //2 - id tabeli
                        //3 - id kolumny
                        //4 - id typu
                        string id_ = stTab[0].ToString().Trim();
                        string id_tabeli = stTab[1].ToString().Trim();
                        string kolumna = stTab[2].ToString().Trim();
                        string typ = stTab[3].ToString().Trim();
                        //cm.log.Info("POPUP: Wczytano dane : id tabeli "+id_tabeli +" id kolumny "+ kolumna +" typ: "+typ);
                        switch (typ)
                        {
                            case "1":
                                {
                                    tabelaWierszowa(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            case "2":
                                {
                                    tabelaSedziowska(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            case "3":
                                {
                                    //wierszowa akac
                                    tabelaWierszowaAKAC(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            case "4":
                                {
                                    //wierszowa mms
                                    tabelaMSS(int.Parse(id_), id_tabeli, int.Parse(kolumna));
                                }
                                break;

                            case "5":
                                {
                                    //wierszowa XXL
                                    tabelaXXL(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            case "6":
                                {
                                    tabelaSedziowskaNowa(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            case "7":
                                {
                                    tabelaSedziowskaNowaSesyjna(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;

                            default:
                                break;
                        }
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("POPUP: Wczytywanie danych : " + ex.Message);
                    }
                }
            }
        }

        private void tabelaSedziowskaNowaSesyjna(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            if (string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                return;
            }

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaSedziowskaNowaSesyjna- date1 " + date1);
            cm.log.Info("popup -tabelaSedziowskaNowaSesyjna- date2 " + date2);
            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            string kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);
            if (string.IsNullOrEmpty(kw.Trim()))
            {
                return;
            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup tabelaSedziowskaNowaSesyjna " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;
            DataTable tabelaDanych = new DataTable();
            switch (id_tabeli)
            {
                case 1:
                    {
                        tabelaDanych = (DataTable)Session["tabelka001"];
                    }
                    break;

                case 2:
                    {
                        tabelaDanych = (DataTable)Session["tabelka002"];
                    }
                    break;

                case 3:
                    {
                        tabelaDanych = (DataTable)Session["tabelka003"];
                    }
                    break;

                case 4:
                    {
                        tabelaDanych = (DataTable)Session["tabelka004"];
                    }
                    break;

                case 5:
                    {
                        tabelaDanych = (DataTable)Session["tabelka005"];
                    }
                    break;

                case 6:
                    {
                        tabelaDanych = (DataTable)Session["tabelka006"];
                    }
                    break;

                case 7:
                    {
                        tabelaDanych = (DataTable)Session["tabelka007"];
                    }
                    break;

                case 8:
                    {
                        tabelaDanych = (DataTable)Session["tabelka008"];
                    }
                    break;

                case 9:
                    {
                        tabelaDanych = (DataTable)Session["tabelka009"];
                    }
                    break;

                case 10:
                    {
                        tabelaDanych = (DataTable)Session["tabelka010"];
                    }
                    break;

                case 11:
                    {
                        tabelaDanych = (DataTable)Session["tabelka011"];
                    }
                    break;

                case 12:
                    {
                        tabelaDanych = (DataTable)Session["tabelka012"];
                    }
                    break;

                case 13:
                    {
                        tabelaDanych = (DataTable)Session["tabelka013"];
                    }
                    break;

                case 14:
                    {
                        tabelaDanych = (DataTable)Session["tabelka014"];
                    }
                    break;

                case 15:
                    {
                        tabelaDanych = (DataTable)Session["tabelka015"];
                    }
                    break;

                case 16:
                    {
                        tabelaDanych = (DataTable)Session["tabelka016"];
                    }
                    break;

                case 17:
                    {
                        tabelaDanych = (DataTable)Session["tabelka017"];
                    }
                    break;

                case 18:
                    {
                        tabelaDanych = (DataTable)Session["tabelka018"];
                    }
                    break;

                case 19:
                    {
                        tabelaDanych = (DataTable)Session["tabelka019"];
                    }
                    break;

                case 20:
                    {
                        tabelaDanych = (DataTable)Session["tabelka020"];
                    }
                    break;

                default:
                    break;
            }

            if (tabelaDanych == null)
            {
                return;
            }

            string selectText = "id_sedziego=" + id_sedziego.ToString();

            DataRow[] jedenWiersz = tabelaDanych.Select(selectText);
            string sedzia = string.Empty;
            if (jedenWiersz.Length > 0)
            {
                sedzia = jedenWiersz[0][5].ToString() + " " + jedenWiersz[0][4].ToString();
            }
            else
            {
                sedzia = "";
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }

        private void tabelaSedziowskaNowa(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            if (string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                return;
            }

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);

            cm.log.Info("popup -tabelaSedziowskaNowa- date1 " + date1);
            cm.log.Info("popup -tabelaSedziowskaNowa- date2 " + date2);

            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            string kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);

            if (string.IsNullOrEmpty(kw.Trim()))
            {
                return;
            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup tabelaSedziowskaNowa " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;

            if ((DataTable)Session["tabelka001"] == null)
            {
                return;
            }
            DataTable tabelaDanych = (DataTable)Session["tabelka001"];
            string selectText = "id_sedziego=" + id_sedziego.ToString();

            DataRow[] jedenWiersz = tabelaDanych.Select(selectText);
            string sedzia = string.Empty;
            if (jedenWiersz.Length > 0)
            {
                sedzia = jedenWiersz[0][5].ToString() + " " + jedenWiersz[0][4].ToString();
            }
            if (sedzia == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                sedzia = "";
                Label1.Text = sedzia;
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }

        protected void tabelaWierszowaAKAC(int id_wiersza, int id_tabeli, int id_kolumny)
        {
            if (string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                return;
            }

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaWierszowaAKAC- date1 " + date1);
            cm.log.Info("popup -tabelaWierszowaAKAC- date2 " + date2);
            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            string kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            if (string.IsNullOrEmpty(kw.Trim()))
            {
                return;
            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup  " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }

        protected void tabelaMSS(int id_wiersza, string id_tabeli, int id_kolumny)
        {
            if (string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                return;
            }

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaMSS- date1 " + date1);
            cm.log.Info("popup -tabelaMSS- date2 " + date2);
            string cs = ms.PobierzConnectionStringMSS(int.Parse(id_dzialu));
            string kw = ms.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataTable dane = new DataTable();

                dane = ms.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());

                GridView1.DataSource = dane;
                Session["data_table"] = dane;
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("POPUP: Bład odczytu tabeli do popupu MSS, kwerenda: " + kw + " ,bład " + ex.Message);

                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = "";
            Label1.Text = ms.wyciagnij_tytulMSS(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }

        protected void tabelaWierszowa(int id_wiersza, int id_tabeli, int id_kolumny)
        {
            if (string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                return;
            }

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaWierszowa- date1 " + date1);
            cm.log.Info("popup -tabelaWierszowa- date2 " + date2);
            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            string kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup tabelaWierszowa " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }

        protected void tabelaSedziowska(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaSedziowska- date1 " + date1);
            cm.log.Info("popup -tabelaSedziowska- date2 " + date2);
            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);
            }
            if (string.IsNullOrEmpty(kw.Trim()))
            {
                return;
            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;
            string sedzia = cl.wyciagnij_sedziego(id_sedziego.ToString());
            if (sedzia == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                sedzia = "";
                Label1.Text = sedzia;
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }

        protected void tabelaXXL(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = dataPoKonwersji((string)Session["data_1"]);
            string date2 = dataPoKonwersji((string)Session["data_2"]);
            cm.log.Info("popup -tabelaXXL- date1 " + date1);
            cm.log.Info("popup -tabelaXXL- date2 " + date2);
            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {
                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);
            }
            if (string.IsNullOrEmpty(kw.Trim()))
            {
                return;
            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;
            string sedzia = cl.wyciagnij_sedziegoXXL(id_sedziego.ToString());
            if (sedzia == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                sedzia = "";
                Label1.Text = sedzia;
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }

        private string dataPoKonwersji(string date1)
        {
            try
            {
               
                Regex rgx = new Regex(@"^(0[1-9]|[12][0-9]|3[01])[- \.](0[1-9]|1[012])[- \.](19|20)\d\d$");
                bool pasuje = rgx.IsMatch(date1);
                //31.12.2020
               
                if (pasuje)
                {
                    cm.log.Info("popup Konwersja daty wykrycie formatu daty DD.MM.YYYY" );
                    date1 = date1.Substring(6, 4)+"-"+ date1.Substring(3, 2) + "-" + date1.Substring(0, 2);
                }
                DateTime d1 = DateTime.Parse(date1);
                date1 = dr.KonwertujDate(d1);
            }
            catch (Exception ex)
            {
                cm.log.Error("popup Konwersja daty " + ex.Message+ " data: "+ date1);
            }
            return date1;
        }
    }
}