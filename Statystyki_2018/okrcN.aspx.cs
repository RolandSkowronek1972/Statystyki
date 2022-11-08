using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class okrcN : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "okrcN.aspx";
        public XMLHeaders xMLHeaders = new XMLHeaders();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
            Session["id_dzialu"] = idWydzial;
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                String IdentyfikatorUzytkownika = string.Empty;
                IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                DataTable parametry = cm.makeParameterTable();
                parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);


                if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "0" && !cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]))
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

                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch
            {
                Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
        {
            string idDzialu = (string)Session["id_dzialu"];
            string idWydzialu = (string)Session["id_dzialu"];
           
            string txt = string.Empty;
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabelaDanych1 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzialuNumerycznie, 1, Date1.Date, Date2.Date, 28, tenPlik);
                DataTable tabelaDanych2 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idWydzialuNumerycznie, 1, Date1.Date, Date2.Date, 28, tenPlik);

                //wypełnianie lebeli
                tablePlaceHolder01.Controls.Clear();

                string path = Server.MapPath("XMLHeaders") + "\\" + "okrc.xml";

                string txtN = xMLHeaders.TabelaSedziowskaXML(path, idWydzialuNumerycznie, "1", tabelaDanych1, true, true, true, true,"", tenPlik);
                string txtN2 = xMLHeaders.TabelaSedziowskaXML(path, idWydzialuNumerycznie, "2", tabelaDanych2, true, true, true, true,"", tenPlik);

                tablePlaceHolder01.Controls.Add(new Label { Text = txtN+ txtN2, ID = "id1" });

                //enf for while
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

           
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

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
                //    Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                //    id_dzialu.Text = (string)Session["txt_dzialu"];
                ///       Label28.Text = cl.podajUzytkownika(User_id, domain);
                //       Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    //         Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    //        tabela1Label.Text = " Sprawy rozpatrywane w trybie art. 335, 336, 338a, 387 i 474a kpk za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    //           tabela1Label.Text = " Sprawy rozpatrywane w trybie art. 335, 336, 338a, 387 i 474a kpk za okres od:  " + Date1.Text + " do  " + Date2.Text;
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
    }
}