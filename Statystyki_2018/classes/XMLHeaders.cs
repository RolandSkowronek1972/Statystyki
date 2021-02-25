using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Xml;

namespace Statystyki_2018
{
    public class XMLHeaders : common
    {
        private tabele Tabele = new tabele();
        private dataReaders dr = new dataReaders();

        public string TabelaSedziowskaXML(string path, int idDzialu, string tabela, DataTable tabelaDanych, bool lp, bool funkcja, bool stanowisko, bool imeInazwiskoRazem, string tenPlik)
        {
            if (!File.Exists(path))
            {
                log.Error(tenPlik + " bład odczytu pliku: " + path);

                return "";
            }
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            string tekstNadTabela = string.Empty;
            int iloscWierszy = 0;
            string idTabeli = string.Empty;
            int iloscWieszyNaglowka = 0;
            int ilosckolunPoIteracji = 0;


            StringBuilder tabelaGlowna = new StringBuilder();
            try
            {
                foreach (XmlNode node in doc.DocumentElement.ChildNodes)
                {
                    DataTable naglowek = new DataTable();

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

                    tekstNadTabela = informacjeOtabeli.ChildNodes[1].InnerText;

                    //informacjeOtabeli
                    iloscWieszyNaglowka = int.Parse(informacjeOtabeli.ChildNodes[2].InnerText);
                    ilosckolunPoIteracji = int.Parse(informacjeOtabeli.ChildNodes[4].InnerText);
                    naglowek = wygenerujTabele(node.ChildNodes[(int)pola.naglowek]);

                    tabelaGlowna.AppendLine(tworztabeleSedziowskaXML(idTabeli, naglowek, tabelaDanych, iloscWieszyNaglowka, iloscWierszy, ilosckolunPoIteracji, idDzialu, lp, tekstNadTabela, funkcja, stanowisko, imeInazwiskoRazem, tenPlik));
                }
            }
            catch (Exception ex)
            {
                tabelaGlowna.AppendLine(ex.Message);
            }

            return tabelaGlowna.ToString();
        }

        public string tworztabeleSedziowskaXML(string idTabeli, DataTable naglowek, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela, bool funkcja, bool stanowisko, bool imeInazwiskoRazem, string tenPlik)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<div class='page-break'>");
            kodStony.AppendLine("<P>" + tekstNadTabela + " </P>");
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek
            //   DataTable header = naglowek;
            log.Info(tenPlik + " start generowania naglowka do tabeli  : " + idTabeli);
            for (int i = 1; i < iloscWierszyNaglowka + 1; i++)

            {
                kodStony.AppendLine("<tr>");
                //pierwsza kolumna nagłówka
           
                for (int j = 1; j <= iloscKolumnPoIteracji + 1; j++)
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
                            log.Error(tenPlik + "id Tabeli: " + idTabeli + " naglowek  MSS  LinqError: wiersz=null");
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
            int index = 0;
            foreach (DataRow wierszDanych in dane.Rows)
            {
                kodStony.AppendLine("<tr>");
                if (lp)
                {
                    kodStony.AppendLine("<td class='center borderAll'>" + (index + 1).ToString() + "</td>");
                }
                if (stanowisko)
                {
                    try
                    {
                        string Stanowisko = wierszDanych["stanowisko"].ToString();
                        kodStony.AppendLine("<td class='center borderAll'>" + Stanowisko + "</td>");
                    }
                    catch
                    { }
                }
                if (funkcja)
                {
                    try
                    {
                        string Funkcja = wierszDanych["funkcja"].ToString();
                        kodStony.AppendLine("<td class='center borderAll'>" + Funkcja + "</td>");
                    }
                    catch
                    { }
                }
                if (imeInazwiskoRazem)
                {
                    try
                    {
                        string Imie = wierszDanych["imie"].ToString();
                        string Nazwisko = wierszDanych["nazwisko"].ToString();
                        kodStony.AppendLine("<td class='center borderAll'>" + Imie + " " + Nazwisko + "</td>");
                    }
                    catch
                    { }
                }
                else
                {
                    try
                    {
                        string Imie = wierszDanych["imie"].ToString();
                        string Nazwisko = wierszDanych["nazwisko"].ToString();

                        kodStony.AppendLine("<td class='center borderAll'>" + Nazwisko + "</td>");
                        kodStony.AppendLine("<td class='center borderAll'>" + Imie + "</td>");
                    }
                    catch
                    { }
                }

                for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                {
                    string nazwaKolumny = "d_" + j.ToString("D2");
                    string txt = wierszDanych[nazwaKolumny].ToString(); //dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeli + "' and idWiersza ='" + index.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                    string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + index.ToString().ToString() + "!" + idTabeli + "!" + j.ToString() + "!7')\">" + txt + " </a>";
                    kodStony.AppendLine("<td class='center borderAll'>" + txt2 + "</td>");
                }



                kodStony.AppendLine("</tr>");
            }
            //tabela główna
          
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("</table>");
            kodStony.AppendLine("</div>");
            kodStony.AppendLine("<br/>");
            return kodStony.ToString();
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

        public void getHeaderFromXML(string path, System.Web.UI.WebControls.GridView GridViewX)
        {
            if (string.IsNullOrEmpty(path))
            {
                //   return null;
            }
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));
            schematNaglowka.Columns.Add("hv", typeof(string));
            schematNaglowka.Columns.Add("css", typeof(string));
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            int i = doc.DocumentElement.ChildNodes.Count;
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                try
                {
                    string style = string.Empty;
                    int wiersz = int.Parse(node["wiersz"].InnerText);
                    int kolumna = int.Parse(node["kolumna"].InnerText);
                    string text = node["text"].InnerText;
                    int rowspan = int.Parse(node["rowSpan"].InnerText);
                    int colspan = int.Parse(node["colSpan"].InnerText);
                    string hv = node["hv"].InnerText;
                    try
                    {
                        style = node["style"].InnerText;
                    }
                    catch
                    { }

                    DataRow dataRow = schematNaglowka.NewRow();
                    dataRow["text"] = text;
                    dataRow["wiersz"] = wiersz;
                    dataRow["kolumna"] = kolumna;
                    dataRow["rowSpan"] = rowspan;
                    dataRow["colspan"] = colspan;
                    dataRow["hv"] = hv;
                    dataRow["css"] = style;
                    schematNaglowka.Rows.Add(dataRow);
                }
                catch (Exception ex)
                {
                    log.Error("XML Header " + ex.Message);
                }
            }

            try
            {
                StringBuilder stringBuilder = new StringBuilder();

                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                string hv = "h";
                Style stl = new Style();
                foreach (DataRow dR in schematNaglowka.Rows)
                {
                    if (int.Parse(dR["wiersz"].ToString().Trim()) != row)
                    {
                        GridView HeaderGrid = (GridView)sn;
                        HeaderGridRow = Tabele.Grw(sn);
                        row = int.Parse(dR["wiersz"].ToString().Trim());
                        try
                        {
                            hv = dR["hv"].ToString().Trim();
                        }
                        catch
                        { }
                    }
                    if (hv == "v")
                    {
                        stl.CssClass = "verticaltext";
                    }
                    else
                    {
                        stl.CssClass = "horizontaltext";
                    }
                    if (!string.IsNullOrEmpty(dR["css"].ToString().Trim()))
                    {
                        stl.CssClass = stl.CssClass + " " + dR["css"].ToString().Trim();
                    }
                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR["text"].ToString().Trim();
                    HeaderCell.Style.Clear();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = int.Parse(dR["colSpan"].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR["rowSpan"].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridViewX.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch (Exception ex)
            {
                log.Error("tabele.dll->makeHeader: " + ex.Message);
            } // end of try
        }

        public string getHeaderFromXML(string path, string tenPlik)
        {
            if (string.IsNullOrEmpty(path))
            {
                log.Error(tenPlik + " XML Header - brak pliku ");

                return string.Empty;
            }
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));
            schematNaglowka.Columns.Add("hv", typeof(string));
            schematNaglowka.Columns.Add("css", typeof(string));
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            int i = doc.DocumentElement.ChildNodes.Count;
            StringBuilder NaglowekTabeli = new StringBuilder();
            NaglowekTabeli.Append("<tr>");
            int tenWiersz = 0;
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                try
                {
                    string style = string.Empty;
                    int wiersz = int.Parse(node["wiersz"].InnerText);
                    if (tenWiersz == 0)
                    {
                        tenWiersz = wiersz;
                    }
                    int kolumna = int.Parse(node["kolumna"].InnerText);
                    string text = node["text"].InnerText;
                    int rowspan = int.Parse(node["rowSpan"].InnerText);
                    int colspan = int.Parse(node["colSpan"].InnerText);

                    string StyleTxt = string.Empty;
                    string RowspanTxt = string.Empty;
                    string ColspanTxt = string.Empty;
                    try
                    {
                        style = node["style"].InnerText;
                    }
                    catch
                    { }
                    if (!string.IsNullOrEmpty(style.Trim()))
                    {
                        StyleTxt = " class='" + style.Trim() + "' ";
                    }
                    if (rowspan > 0)
                    {
                        RowspanTxt = " rowspan='" + rowspan.ToString() + "'";
                    }
                    if (colspan > 0)
                    {
                        ColspanTxt = " colspan='" + colspan.ToString() + "'";
                    }
                    if (tenWiersz != wiersz)
                    {
                        NaglowekTabeli.AppendLine("</tr>");
                        NaglowekTabeli.AppendLine("<tr>");
                        tenWiersz = wiersz;
                    }
                    NaglowekTabeli.AppendLine("<td " + StyleTxt + RowspanTxt + ColspanTxt + " >" + text + "</td>");
                }
                catch (Exception ex)
                {
                    log.Error(tenWiersz + " XML Header " + ex.Message);
                }
            }

            return NaglowekTabeli.ToString();
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

        private string rowSpanPart(int rowSpan)
        {
            string resultZero = String.Empty;
            string rezultNotZero = "rowspan ='" + rowSpan.ToString() + "' ";
            return rowSpan == 0 ? resultZero : rezultNotZero;
        }
    }
}