using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class oopk : System.Web.UI.Page
    {
        private tabele tb = new tabele();
        public Class1 cl = new Class1();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public const string tenPlik = "oopk";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
            if (idWydzial == null)
            {
                Server.Transfer("default.aspx");
                return;
            }

            Session["id_dzialu"] = idWydzial;
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

            try
            {
                string user = (string)Session["userIdNum"];
                string dzial = (string)Session["id_dzialu"];
                bool dost = cm.dostep(dzial, user);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + user + " nie praw do działu nr " + dzial + "'");
                }
                else
                {
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
                //  Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
        {
            string dzial = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                Session["tabelka001"] = dr.tworzTabele(int.Parse(dzial), 5, Date1.Date, Date2.Date, 140, GridView1, tenPlik);
                GridView1.DataBind();
            }
            catch
            { }
            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
        }

        #region "nagłowki tabel"

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header1(), GridView1);
            }
        }

        private DataTable header1()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("Column1", typeof(string));
            dT.Columns.Add("Column2", typeof(string));
            dT.Columns.Add("Column3", typeof(string));
            dT.Columns.Add("Column4", typeof(string));
            dT.Columns.Add("Column5", typeof(string));
            // wypełnienie danymi
            dT.Clear();
        //    dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });
       //     dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });

      //     dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });
       //   dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });

            //wpływ
            dT.Rows.Add(new Object[] { "1", "śledztwa", "1", "1", "v" });
            dT.Rows.Add(new Object[] { "1", "dochodzenia", "1", "1", "v" });
            for (int i = 0; i < 15; i++)
            {
                dT.Rows.Add(new Object[] { "1", "na rozprawę <br/>", "1", "1", "v" });
                dT.Rows.Add(new Object[] { "1", "na posiedzenie <br/>", "1", "1", "v" });
            }

          
            //Sesje odbyte przez sędziego
            dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "posiedzenia jawne", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "posiedzenia niejawne", "1", "1", "h" });

        //    dT.Rows.Add(new Object[] { "1", "ogółem ", "1", "2", "h" });
        //    dT.Rows.Add(new Object[] { "1", "z tego", "2", "1", "h" });
            //Liczba odroczonych publikacji orzeczeń
          //  dT.Rows.Add(new Object[] { "1", "Ogółem (wszystkie kategorie spraw)", "1", "2", "h" });

          //  dT.Rows.Add(new Object[] { "1", "K", "1", "2", "h" });
         //   dT.Rows.Add(new Object[] { "1", "W", "1", "2", "h" });
            //Liczba odroczonych spraw
         ///   dT.Rows.Add(new Object[] { "1", "z terminem", "1", "2", "h" });

          //  dT.Rows.Add(new Object[] { "1", "bez wyznaczonego terminu", "1", "2", "h" });
       //     dT.Rows.Add(new Object[] { "1", "OGÓŁEM (wraz <br/>z publikacją orzeczeń)", "1", "2", "h" });
            //
            dT.Rows.Add(new Object[] { "1", "1 do 14 dni", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "w tym nieusprawied-liwione", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "15 do 30 dni  ", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "w tym nieusprawied-liwione ", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "pow. 1 do 3 m-cy", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "w tym nieusprawied-liwione", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "ponad 3 miesiące", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "w tym nieusprawied-liwione", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1", "h" });

            //Liczba spraw, w których projekt uzasadnienia sporządził asystent** (Dz. 1.3)
        //    dT.Rows.Add(new Object[] { "1", "razem k.13 w.01", "1", "2", "h" });
       //     dT.Rows.Add(new Object[] { "1", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "1", "ogółem", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "uwzględniono", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "na rozprawie", "1", "1", "h" });
            dT.Rows.Add(new Object[] { "1", "na posiedzeniu", "1", "1", "h" });

            // ================================    2     ============================
            //wpływ
            dT.Rows.Add(new Object[] { "2", "Ogółem ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "K <br/>", "1", "2", "h" });
         //   dT.Rows.Add(new Object[] { "2", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "W<br/> ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kop<br/>", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kp <br/>", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko karne", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko wykrocz", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "WSNk", "1", "2", "h" });
            //wyznaczono
            dT.Rows.Add(new Object[] { "2", "Ogółem", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "K ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "W ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Kop ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Kp ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko<br/> karne", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko <br/>wykrocz", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "WSNk", "2", "1", "h" });
            //Załatwiono
            dT.Rows.Add(new Object[] { "2", "Ogółem <br/> ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "K ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "W", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Kop", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Kp", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko karne", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko wykrocz", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "WSNkk", "2", "1", "h" });
            //Załatwienia
            dT.Rows.Add(new Object[] { "2", "Ogółem <br/> ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "K", "1", "2", "h" });
         //   dT.Rows.Add(new Object[] { "2", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "W", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko karne", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko wykrocz", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "WSNK", "1", "2", "h" });
            //Sesje odbyte przez sędziego
            dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "z tego", "3", "1", "h" });
            //POZOSTAŁOŚC na następny miesiąc (Dz.1.1.k.04)"
            dT.Rows.Add(new Object[] { "2", "Ogółem ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "K ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "W ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko karne", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Ko wykrocz", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "WSNk", "1", "2", "h" });
            //Pozostało spraw starych (Dz.2.1.1. w.01+08+09+10)"
            dT.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "do 3 m-cy", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow.3 do 6 m-cy ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow.6 do 12 m-cy ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 12 m-cy do 3 lat", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 12 m-cy do 2 lat ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 2 do 3 lat ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 3 do 5 lat ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 5 do 8 lat", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "pow. 8 lat", "1", "2", "h" });

            dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "zakreś-lonych", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "niezak-reślonych", "1", "2", "h" });

            dT.Rows.Add(new Object[] { "2", "Łącznie", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "W terminie ustawowym 14 dni", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Razem po terminie ustawowym ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Nieusprawied-liwionych", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Po upływie terminu ustawowego", "8", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "uzasadnienia wygłoszone **", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent*	", "2", "1", "h" });

            //"Skargi na przewlekłość (Dz. 7.1)"
            dT.Rows.Add(new Object[] { "2", "wpływ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "załatwiono", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "2", "pozostało", "1", "2", "h" });
            //"Stan spraw zawiszonych"
            dT.Rows.Add(new Object[] { "2", " liczba mediacji wpisanych w danym miesiącu do Wykazu Med. ", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "liczba spraw z rep. K załatwionych w związku z postępowaniem mediacyjnym", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "w tym <br/> liczba spraw, w których postępowanie zakończyło się ugodą", "1", "2", "h" });

            // ================================   3     ============================
            dT.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Funkcja", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Imię i Nazwisko sędziego", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Zaległości z poprzedniego roku", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "WPŁYW", "8", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Wyznaczono", "16", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Załatwiono", "16", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Załatwienia", "8", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Sesje odbyte przez sędziego", "4", "1", "h" });
          //  dT.Rows.Add(new Object[] { "3", "Liczba odroczonych <br/> publikacji orzeczeń", "3", "2", "h" });
          //  dT.Rows.Add(new Object[] { "3", "Liczba odroczonych <br/> spraw", "3", "2", "h" });
            dT.Rows.Add(new Object[] { "3", "POZOSTAŁOŚĆ na następny miesiąc", "8", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Pozostało spraw starych", "10", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "stan spraw zawieszonych (wszystkie kategorie spraw)", "3", "1", "h" });

            dT.Rows.Add(new Object[] { "3", "terminowość sporządzonych uzasadnień (zgodnie z MS-S5r, dz. 1.3 - tylko kat. K i W)*", "16", "1", "h" });
      //      dT.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "4", "h" });
       //     dT.Rows.Add(new Object[] { "3", "Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnien wygłoszone", "1", "4", "h" });
        //    dT.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia sporządził asystent**  ", "2", "2", "h" });
            dT.Rows.Add(new Object[] { "3", "Skargi na przewlekłość", "4", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Mediacje", "3", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Uwagi", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Kolumna kontrolna (wyznaczenia>=załatwienia)", "2", "2", "h" });

            return dT;
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

                id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    Label19.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    Label19.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oopk.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oopk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                tb.tworzArkuszwExcle(MyWorksheet, (DataTable)Session["tabelka001"], 100, 0,6, true, true, false, false, true);

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
            }
            odswiez();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //make footer

            if (e.Row.RowType == DataControlRowType.Footer)

            {
                tb.makeSumRow((DataTable)Session["tabelka001"], e, 4, 4);
            }
        }
    }
}