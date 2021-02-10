using OfficeOpenXml;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    using System;

    public partial class oglp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private int storid = 0;
        private int rowIndex = 1;
        private const string tenPlik = "oglp.aspx";
        private const string tenPlikNazwa = "oglp";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
                if (idWydzial == null)
                {
                    return;
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                else
                {
                    CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                    newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                    System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                    System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                    DateTime dTime = DateTime.Now.AddMonths(-1); ;

                    if (Date1.Text.Length == 0)
                    {
                        Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                    }

                    if (Date2.Text.Length == 0)
                    {
                        Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                    }

                    Session["id_dzialu"] = idWydzial;
                    Session["data_1"] = Date1.Date.ToShortDateString();
                    Session["data_2"] = Date2.Date.ToShortDateString();

                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        clearHedersSession();
                        makeHeader();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch
            {
                //  Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void clearHedersSession()
        {
            Session["header_01"] = null;
            Session["header_02"] = null;
            Session["header_03"] = null;
            Session["header_04"] = null;
            Session["header_05"] = null;
            Session["header_06"] = null;
            Session["header_07"] = null;
            Session["header_08"] = null;
        }

        protected void odswiez()
        {
            string yyx = (string)Session["id_dzialu"];
            try
            {
                cm.log.Info(tenPlik + "ładowanie danych do tabeli 100");
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 100, 20, 20, tenPlik);
                Session["tabelka100"] = tabelka01;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 100  " + ex.Message);
            }
            tabela_1();
            tabela_2();
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            tabela_9();
            tabela_10();
            gwTabela1.DataBind();
            gwTabela2.DataBind();
            gwTabela3.DataBind();
            gwTabela5.DataBind();
            gwTabela6.DataBind();
            GwTabela7.DataBind();
            GwTable10.DataBind();

            // dopasowanie opisów
            makeLabels();
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = cl.debug(int.Parse(yyx));
                infoLabel4.Visible = cl.debug(int.Parse(yyx));
                infoLabel5.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
            }

            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"

        protected void makeHeader()
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            #region tabela  1 (wierszowa)

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
            dT_01.Columns.Add("Column6", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));
            dT_02.Columns.Add("Column6", typeof(string));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));
            dT_03.Columns.Add("Column6", typeof(string));
            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            dT_04.Columns.Add("Column6", typeof(string));

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));
            dT_05.Columns.Add("Column6", typeof(string));

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));
            dT_06.Columns.Add("Column6", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "p", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Np", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Po", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem z zakresu prawa pracy", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Imię i nazwisko sędziego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wpływ", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość sesji", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Załatwienia", "4", "1" });

            string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
            int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
            if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
            {
                // cały miesiąc
                dT_01.Rows.Add(new Object[] { "3", "Informacja z ruchu spraw za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.", "7", "1" });
            }
            else
            {
                dT_01.Rows.Add(new Object[] { "3", "Informacja z ruchu spraw za okres od " + Date1.Text + " do  " + Date2.Text, "7", "1" });
            }

            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "1", "2", "1", "h", "165" });//
            dT_02.Rows.Add(new Object[] { "1", "2", "1", "1", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "1", "3", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "4", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "5", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "6", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "7", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "8", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "9", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "10", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "11", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "12", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "13", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "14", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "15", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "16", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "17", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "18", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "19", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "20", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "21", "1", "1", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "2", "pub- liczne", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "prywatki", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "wyrokiem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "nakazem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "inne", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "Ko", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "1Ko", "1", "1", "h", "45" });//;

            dT_02.Rows.Add(new Object[] { "3", "K", "1", "2", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego  ", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "załawione", "3", "1", "h", "135" });//
            dT_02.Rows.Add(new Object[] { "3", "Ko", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "Kp", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "W", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "w tym zała- twione na podst. art.. 93 kpw (NK)", "1", "2", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "4", "Dni rozp- rawy", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Dni posie- dzeń", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Karne", "10", "1", "h", "450" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Wykrocze- niowe", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "4", "Kop", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy karne i wykro- cze- niowe", "1", "3", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "5", "L.p.", "1", "4", "h", "35" });

            dT_02.Rows.Add(new Object[] { "5", "Sędzia", "1", "4", "h", "130" });//Choroby I urlopy w dniach roboczych
            dT_02.Rows.Add(new Object[] { "5", "Choroby i urlopy w dniach roboczych", "1", "4", "h", "130" });//

            dT_02.Rows.Add(new Object[] { "5", "Ilość sesji", "2", "1", "h", "90" });
            dT_02.Rows.Add(new Object[] { "5", "Ilość spraw skier. na wokandy", "1", "4", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "5", "Załatwienia", "14", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "5", "Med", "1", "4", "h", "45" });
            dT_02.Rows.Add(new Object[] { "5", "Sprawy zawie- szone", "1", "4", "h", "45" });
            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "W   ", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ogółem", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nazwisko i imię", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wpływ do repertorium/wykazu", "6", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "L", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });

            #endregion tabela  4 ()

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Efektywny okres oczekiwania", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wyznaczonych ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość odroczeń ", "2", "1", "H" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość przerw ", "2", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Załatwienia ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie K", "1", "2", "H" });

            Session["header_05"] = dT_05;

            dT_06.Clear();
            dT_06.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Stan referatów ", "6", "1", "H" });

            Session["header_06"] = dT_06;

            #endregion tabela  5 ()
        }

        protected void StopkaTabeliGridview1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 0);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 2), gwTabela2);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 3), gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 5), gwTabela5);
            }
        }

        protected void naglowekTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 6), gwTabela6);
            }
        }

        protected void naglowekTabeli_GwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 7), GwTabela7);
            }
        }

        protected void naglowekTabeli_GwTable10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(tb.naglowek(path, 10), GwTable10);
            }
        }

        protected void stopkaTabeli_GwTable10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer) tb.makeSumRow((DataTable)Session["tabelka010"], e, 0);
        }

        protected void stopkaTabeli_GwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer) tb.makeSumRow((DataTable)Session["tabelka007"], e, 0);
        }

        protected void stopkaTabeli_gwTabela15(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer) tb.makeSumRow((DataTable)Session["tabelka015"], e, 0);
        }

        protected void stopkaTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer) tb.makeSumRow((DataTable)Session["tabelka014"], e, 0);
        }

        /*
        protected void stopkaTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 13
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka013"];
                tb.makeSumRow(table, e, 0);
            }
        }
        */

        protected void stopkaTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka011"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka010"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka008"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka007"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 0);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        #endregion "nagłowki tabel"

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

                //	id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    Label2.Text = "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli, string drugiText, int colSpanDrugi, int rowSpanDrugi, string cssStyleDrugi)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(drugiText, 7, 2, "borderTopLeft "));

            NewTotalRow.Cells.Add(tb.cela(tekst, colSpan, rowSpan, cssStyleDlaTabeli));
            for (int i = 1; i < 17; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
            }

            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            string idtabeli = "100";
            DataTable tabelka01 = (DataTable)Session["tabelka100"];

            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Pozostało z poprzedniego miesiąca", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Wpływ", 3, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Załatwienie", 3, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Pozostało na następny miesiąc", 3, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "odroczenie spraw", 3, 1, "normal", "borderTopLeft col_60 normal"));
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 0, idWiersza, idtabeli, "Ilość spraw niezałatwionych licząc od daty wpływu / zawieszone niezakreślone", 7, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 3 - 6 miesięcy", 3, 1, "normal", "borderTopLeft col_60 normal"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 6 - 12 miesięcy", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 12 do 24 miesiący", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 2 lat do 3 lat", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 3 lat do 5 lat", 3, 1, "normal", "borderTopLeft col_60 normal"));

            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 5 lat do 8 lat", 3, 1, "normal", "borderTopLeft col_60 normal"));
            idWiersza = 12;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 5, idWiersza, idtabeli, "Powyżej 8 lat", 3, 1, "normal", "borderTopLeft col_60 normal"));
        }

        #region generowane danych do tabel

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\" + tenPlikNazwa + ".xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\" + tenPlikNazwa + "";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 13, 0, 4, false, false, false, false, false);
                // podtabela

                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 4, 1, "Pozostało z poprzedniego miesiąca", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 5, 1, "Wpływ", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 6, 1, "Załatwienia", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 7, 1, "Pozostało na następny miesiąc", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 8, 1, "Odroczenia spraw ", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 9, 1, "Ilość spraw niezałatwionych licząc od daty wpływu / zawieszone niezakreślone", true, 0, 6);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 10, 1, "Powyżej 3 - 6 miesięcy", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 11, 1, "Powyżej 6 - 12 miesięcy", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 12, 1, "Powyżej 12 do 24 miesiący", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 13, 1, "Powyżej 2 lat do 3 lat", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 14, 1, "WpPowyżej 3 lat do 5 latływ", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 15, 1, "Powyżej 5 lat do 8 lat", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, ((DataTable)Session["tabelka001"]).Rows.Count + 16, 1, "Powyżej 8 lat", true, 0, 3);
                //  DataTable tabelka02 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse((string)Session["id_wydzial"]), 100, Date1.Date, Date2.Date, 4, tenPlik);
                int iloscWierszy = (((DataTable)Session["tabelka001"]).Rows.Count + 4);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka100"], 5, 4, 4, iloscWierszy, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 13, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 4, 4, 1, 4, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 4, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka008"], 12, 3, 1, 4, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka009"], 1, 11, 1, 7, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka010"], 11, 0, 6, false, false, false, false, false);

                try
                {
                    MyExcel.SaveAs(fNewFile);
                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }//end of using
        }

        protected void tabela_1()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 15, tenPlik);
                Session["tabelka001"] = tabelka01;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = tabelka01;
                gwTabela1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 1 " + ex.Message);
            }
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 13, tenPlik);
                Session["tabelka002"] = tabelka01;
                gwTabela2.DataSource = null;
                gwTabela2.DataSourceID = null;
                gwTabela2.DataSource = tabelka01;
                gwTabela2.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 2 " + ex.Message);
            }
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 13, tenPlik);
                Session["tabelka003"] = tabelka01;
                gwTabela3.DataSource = null;
                gwTabela3.DataSourceID = null;
                gwTabela3.DataSource = tabelka01;
                gwTabela3.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 3 " + ex.Message);
            }
        }

        protected void tabela_4()
        {
            //wierszowa
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 4, 4, 4, tenPlik);
                Session["tabelka004"] = tabelka01;
                pisz("tab_4_", 4, 4, tabelka01);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 4 " + ex.Message);
            }
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 12, tenPlik);
            Session["tabelka005"] = tabelka01;
            try
            {
                gwTabela5.DataSource = null;
                gwTabela5.DataSourceID = null;
                gwTabela5.DataSource = tabelka01;
                gwTabela5.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 5 " + ex.Message);
            }
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 6, Date1.Date, Date2.Date, 13, tenPlik);
                Session["tabelka006"] = tabelka01;
                gwTabela6.DataSource = null;
                gwTabela6.DataSourceID = null;
                gwTabela6.DataSource = tabelka01;
                gwTabela6.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 6 " + ex.Message);
            }
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 7, Date1.Date, Date2.Date, 22, tenPlik);
                Session["tabelka007"] = tabelka01;
                GwTabela7.DataSource = null;
                GwTabela7.DataSourceID = null;
                GwTabela7.DataSource = tabelka01;
                GwTabela7.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 7 " + ex.Message);
            }
        }

        private void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 8, 13, 3, tenPlik);
                Session["tabelka008"] = tabelka01;
                pisz("tab_8_",12, 2, tabelka01);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 8 " + ex.Message);
            }
        }

        private void tabela_9()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 9, 2, 15, tenPlik);
                Session["tabelka009"] = tabelka01;
                pisz("tab_9_", 2, 15, tabelka01);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 9 " + ex.Message);
            }
        }

        private void tabela_10()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            try
            {
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 10, Date1.Date, Date2.Date,12, tenPlik);
                Session["tabelka010"] = tabelka01;
                GwTable10.DataSource = null;
                GwTable10.DataSourceID = null;
                GwTable10.DataSource = tabelka01;
                GwTable10.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " tabela 9 " + ex.Message);
            }
        }

        #endregion generowane danych do tabel

        #region metody dodatkowe

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
                        {
                        }
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
                        catch { }
                    }
                }
            }
        }// end of pisz

        #endregion metody dodatkowe

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader(dT, gwTabela1);
            }
            else
            {
                if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
                {
                    rowIndex = 0;
                    AddNewRow(sender, e);
                }
            }
        }

        protected void gwTabela1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }
    }
}