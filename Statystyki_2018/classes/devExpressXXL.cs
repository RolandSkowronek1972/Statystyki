using DevExpress.Data;
using DevExpress.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Statystyki_2018
{
    public class devExpressXXL
    {
          public GridViewBandColumn podKolumna(string[] teksty, int przesunieciedanych, string idTabeli, bool isFixet, int szerokoscKolumn, string tekstGlowny,int rowSpan)
        {
            GridViewBandColumn result = GetBoundColumn(tekstGlowny);
            for (int i = 0; i < teksty.Length; i++)
            {
                result.Columns.Add(kolumnaDoTabeli(teksty[i], "d_" + (i + przesunieciedanych).ToString("D2"), idTabeli, "", isFixet, szerokoscKolumn,rowSpan));
            }

            return result;
        }

        public GridViewBandColumn podKolumna(string[] teksty, int przesunieciedanych, string idTabeli, bool isFixet, int szerokoscKolumn, string tekstGlowny)
        {
            GridViewBandColumn result = GetBoundColumn(tekstGlowny);
            for (int i = 0; i < teksty.Length; i++)
            {
                result.Columns.Add(kolumnaDoTabeli(teksty[i], "d_" + (i + przesunieciedanych).ToString("D2"), idTabeli, "", isFixet, szerokoscKolumn));
            }

            return result;
        }
        public GridViewBandColumn podKolumnaMiesieczna(string[] teksty, int przesunieciedanych, string idTabeli, bool isFixet, int szerokoscKolumn, string tekstGlowny)
        {
            GridViewBandColumn result = GetBoundColumn(tekstGlowny);
            for (int i = 0; i < teksty.Length; i++)
            {
                result.Columns.Add(kolumnaDoTabeliMiesiecznej(teksty[i], "d_" + (i + przesunieciedanych).ToString("D2"), idTabeli, "", isFixet, szerokoscKolumn));
            }

            return result;
        }

        public ASPxSummaryItem komorkaSumujaca(int FieldNr)
        {
            string idPola = "d_" + FieldNr.ToString("D2");
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem
            {
                FieldName = idPola,
                ShowInColumn = idPola,
                SummaryType = SummaryItemType.Sum,
                DisplayFormat = "{0}",
                
            };
           
           
            return _komorkaSumujaca;
        }

        public ASPxSummaryItem komorkaSumujaca(string text)
        {
            string idPola = "Imienazwisko";
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem()
            {
                FieldName = idPola,
                ShowInColumn = idPola,

                SummaryType = SummaryItemType.Count,

                DisplayFormat = text
            };
            return _komorkaSumujaca;
        }

        public ASPxSummaryItem komorkaSumujaca(string text, string nazwaPola)
        {
            string idPola = nazwaPola;
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem()
            {
                FieldName = idPola,
                ShowInColumn = idPola,

                SummaryType = SummaryItemType.Count,

                DisplayFormat = text
            };
            return _komorkaSumujaca;
        }

        public GridViewBandColumn GetBoundColumn(string caption)
        {
            GridViewBandColumn _getBoundColumn = new GridViewBandColumn { Caption = caption };
            _getBoundColumn.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            _getBoundColumn.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            

            return _getBoundColumn;
        }

        public GridViewBandColumn GetBoundColumn(string caption, string style)
        {
            GridViewBandColumn _getBoundColumn = GetBoundColumn(caption);
            _getBoundColumn.HeaderStyle.CssClass = style;
            
            return _getBoundColumn;
        }
      
     
        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorTabeli, string styl, bool isFixed, int szerokoscKolumny)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorTabeli }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }
        public GridViewDataTextColumn kolumnaDoTabeliMiesiecznej(string Napis, string poleDanych, string identyfikatorTabeli, string styl, bool isFixed, int szerokoscKolumny)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplateM { IdKolumny = poleDanych, IdTabeli = identyfikatorTabeli }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }
        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorTabeli, string styl, bool isFixed, int szerokoscKolumny,int rowSpan)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                CellRowSpan= rowSpan,
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorTabeli }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }

        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, int rowSpan)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                CellRowSpan = rowSpan,
             
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            kolumna_.CellStyle.CssClass = "normal center ";
           
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
           
            return kolumna_;
        }
       
   

        // parts
        public GridViewBandColumn mediacje(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn mediacje = GetBoundColumn("mediacje");
            mediacje.Columns.Add(podKolumna(new string[] { "liczba  spraw, w których strony skierowano do mediacji" }, przesuniecie, idTabeli, false, szerokoscKolumny, "WPŁYW"));
            mediacje.Columns.Add(podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "mediacje "));
            return mediacje;
        }

        public GridViewBandColumn SkargiNaPrzewleklosc(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(kolumnaDoTabeli("wpływ", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(podKolumna(new string[] { "ogółem", "uwzględniono" }, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(kolumnaDoTabeli("pozostałość", "d_" + (przesuniecie + 3).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            return zalatwiono01skargiNaPrzewleklosc;
        }

        public GridViewBandColumn SekcjaDwiePodKolumny(string[] teksty, string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn kolumnaWyjsciowa = GetBoundColumn(Opis);
            foreach (var item in teksty)
            {
                kolumnaWyjsciowa.Columns.Add(podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, przesuniecie, idTabeli, false, szerokoscKolumny, item.ToString()));
                przesuniecie = przesuniecie + 2;
            }
            return kolumnaWyjsciowa;
        }
        public GridViewBandColumn SekcjaDwiePodKolumnyMiesieczne(string[] teksty, string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn kolumnaWyjsciowa = GetBoundColumn(Opis);
            foreach (var item in teksty)
            {
                kolumnaWyjsciowa.Columns.Add(podKolumnaMiesieczna(new string[] { "na rozprawe", "na posie- dzenie" }, przesuniecie, idTabeli, false, szerokoscKolumny, item.ToString()));
                przesuniecie = przesuniecie + 2;
            }
            return kolumnaWyjsciowa;
        }

        public GridViewBandColumn sesjeSedziegoNew(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn _sesjeSedziego = GetBoundColumn("sesje odbyte przez sędziego ");

           
            _sesjeSedziego.Columns.Add(kolumnaDoTabeli("ogółem", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            _sesjeSedziego.Columns.Add(podKolumna(new string[] { "rozprawy", "posiedzenia jawne", "posiedzenia niejawne" }, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "z tego "));
           
            
            return _sesjeSedziego;
        }
        public GridViewBandColumn sesjeSedziego(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn _sesjeSedziego = GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(kolumnaDoTabeli("ogółem", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(podKolumna(new string[] { "rozprawy", "posiedzenia" }, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "z tego "));
            _sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);
            /*
            GridViewBandColumn naPotrzebyMSS = GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(kolumnaDoTabeli("ogółem", "d_" + (przesuniecie + 3).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(podKolumna(new string[2] { "rozprawy", "posiedzenia" }, przesuniecie + 4, idTabeli, false, szerokoscKolumny, "z tego "));
            _sesjeSedziego.Columns.Add(naPotrzebyMSS);
            */
            return _sesjeSedziego;
        }
        public DataTable zLicznikiemKolumn(DataTable tabelaWejsciowa)
        {
            if (tabelaWejsciowa==null)
            {
                return null;
            }
            DataRow dataRow = tabelaWejsciowa.NewRow();
            /*
             DataTable dTable = new DataTable();
            dTable.Columns.Add("id", typeof(int));
            dTable.Columns.Add("id_sedziego", typeof(int));
            dTable.Columns.Add("Funkcja", typeof(string));
            dTable.Columns.Add("Stanowisko", typeof(string));
            dTable.Columns.Add("Imie", typeof(string));
            dTable.Columns.Add("Nazwisko", typeof(string));
            dTable.Columns.Add("id_tabeli", typeof(string));
            dTable.Columns.Add("Imienazwisko", typeof(string));

             */

            dataRow["id"] = 0;
            dataRow["id_sedziego"] = 0;
            dataRow["Funkcja"] = "";
            dataRow["Imie"] = "";
            dataRow["Nazwisko"] = "";
            dataRow["Imienazwisko"] = "";
            for (int i = 0; i < dataRow.ItemArray.Length - 6; i++)
            {
                try
                {
                    dataRow["d_" + i.ToString("D2")] = i;
                }
                catch
                {
                }
            }
            tabelaWejsciowa.Rows.Add(dataRow);

            tabelaWejsciowa.DefaultView.Sort = "id ASC";
            tabelaWejsciowa = tabelaWejsciowa.DefaultView.ToTable();

            return tabelaWejsciowa;
        }

        //private class
        private class CustomTemplate : ITemplate
        {
            public string IdTabeli;
            public string IdKolumny;

            public void InstantiateIn(Control container)
            {
                GridViewDataItemTemplateContainer gcontainer = (GridViewDataItemTemplateContainer)container;
                if (IdKolumny.Contains("d_"))
                {
                    try
                    {
                        string kolumna = IdKolumny.Replace("d_", "");
                        Label lB1 = new Label();
                        int kolumnaNum = int.Parse(kolumna);
                        if (gcontainer.KeyValue.ToString() == "0")
                        {
                            lB1.Text =  DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString () ;
                            gcontainer.Controls.Add(lB1);
                        }
                        else
                        {
                            string funkcjaJavascript = "javascript:openPopup('popup.aspx?sesja=" + gcontainer.KeyValue + "!" + IdTabeli + "!" + kolumnaNum.ToString() + "!6')";
                            lB1.Text = " <a href = " + funkcjaJavascript + ">" + DataBinder.Eval(gcontainer.DataItem, IdKolumny) + "</a>";
                            gcontainer.Controls.Add(lB1);
                        }
                        
                    }
                    catch
                    { }
                }
                else
                {
                    if (IdKolumny.Contains("id"))
                    {
                        if (gcontainer.KeyValue.ToString() == "0")
                        {
                            Label lB1 = new Label { Text = "" };
                            gcontainer.Controls.Add(lB1);
                        }
                        else
                        {
                            Label lB1 = new Label { Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString() };
                            gcontainer.Controls.Add(lB1);
                        }
                       
                    }
                    else
                    {
                        Label lB1 = new Label { Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString() };
                        gcontainer.Controls.Add(lB1);

                    }

                }
            }
        }
        private class CustomTemplateM : ITemplate
        {
            public string IdTabeli;
            public string IdKolumny;

            public void InstantiateIn(Control container)
            {
                GridViewDataItemTemplateContainer gcontainer = (GridViewDataItemTemplateContainer)container;
                if (IdKolumny.Contains("d_"))
                {
                    try
                    {
                        string kolumna = IdKolumny.Replace("d_", "");
                        Label lB1 = new Label();
                        int kolumnaNum = int.Parse(kolumna);
                        if (gcontainer.KeyValue.ToString() == "0")
                        {
                            lB1.Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString();
                            gcontainer.Controls.Add(lB1);
                        }
                        else
                        {
                            
                            string funkcjaJavascript = "javascript:openPopup('popup.aspx?sesja=" + (gcontainer.KeyValue ).ToString () + "!" + IdTabeli + "!" + kolumnaNum.ToString() + "!1')";
                            lB1.Text = " <a href = " + funkcjaJavascript + ">" + DataBinder.Eval(gcontainer.DataItem, IdKolumny) + "</a>";
                            gcontainer.Controls.Add(lB1);
                        }

                    }
                    catch
                    { }
                }
                else
                {
                    if (IdKolumny.Contains("id"))
                    {
                        if (gcontainer.KeyValue.ToString() == "0")
                        {
                            Label lB1 = new Label { Text = "" };
                            gcontainer.Controls.Add(lB1);
                        }
                        else
                        {
                            Label lB1 = new Label { Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString() };
                            gcontainer.Controls.Add(lB1);
                        }

                    }
                    else
                    {
                        Label lB1 = new Label { Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString() };
                        gcontainer.Controls.Add(lB1);

                    }

                }
            }
            private int podajNrMiesiaca(string miesiac)
            {
                int idMiesiaca = 0;
                switch (miesiac)
                {
                  
                    case "styczeń":
                        { idMiesiaca = 1; }
                        break;
                    case "luty":
                        { idMiesiaca = 2; }
                        break;
                    case "marzec":
                        { idMiesiaca = 3; }
                        break;
                    case "kwiecień":
                        { idMiesiaca = 4; }
                        break;
                    case "maj":
                        { idMiesiaca = 5; }
                        break;
                    case "czerwiec":
                        { idMiesiaca = 6; }
                        break;
                    case "lipiec":
                        { idMiesiaca = 7; }
                        break;
                    case "sierpień":
                        { idMiesiaca = 8; }
                        break;
                    case "wrzesien":
                        { idMiesiaca = 9; }
                        break;
                    case "październik":
                        { idMiesiaca = 10; }
                        break;
                    case "listopad":
                        { idMiesiaca = 11; }
                        break;
                    case "grudzien":
                        { idMiesiaca = 12; }
                        break;

                      
                }
                return idMiesiaca;
            }
        }
    } // end of class
}