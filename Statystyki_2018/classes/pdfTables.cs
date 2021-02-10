using iTextSharp.text;
using System;
using System.Data;
using System.IO;

namespace Statystyki_2018
{
    public class pdfTables
    {
        public Class1 cl = new Class1();

        public MemoryStream memoryStr2(DataTable dT)
        {
            //======================
            using (MemoryStream ms = new MemoryStream())
            using (Document document = new Document(PageSize.A4.Rotate(), 25, 25, 30, 30))
            using (iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms))
            {
                document.Open();

                document.Add(new Paragraph(" "));

                // tabela pierwsza

                // przetważanie tabeli
                if (dT.Rows.Count > 0)
                {
                    int il_kolumn = dT.Columns.Count;
                    iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(il_kolumn);
                    for (int ij = 0; ij < il_kolumn; ij++)
                    {
                        string dana = dT.Columns[ij].ColumnName.ToString();
                        iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(dana));
                        cell.BackgroundColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                        table.AddCell(cell);
                    }// end for
                    foreach (DataRow dR in dT.Rows)
                    {
                        // loop po wierszach
                        for (int j = 0; j < il_kolumn; j++)
                        {
                            // loop po kolumnach
                            string dana = dR[j].ToString().Trim();
                            iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(dana));
                            table.AddCell(cell);
                        } //end for
                    }// end foreach
                    document.Add(table);
                }// end of if
                document.Close();
                document.Close();
                writer.Close();
                ms.Close();
                //======================
                return ms;
            }
        }

        public MemoryStream memoryStr(string sedzia, string tabela, string dzial, DateTime data1, DateTime data2, string aa, string bb)
        {
            //======================
            using (MemoryStream ms = new MemoryStream())
            using (Document document = new Document(PageSize.A4.Rotate(), 25, 25, 30, 30))
            using (iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms))
            {
                document.Open();
                string id_sedziego = sedzia;//(string)Session["id_sedziego"];
                string txt = cl.wyciagnij_sedziego(id_sedziego).ToString();
                if (txt == "Object reference not set to an instance of an object.")
                {
                    txt = "";
                }
                document.Add(new Paragraph(txt));
                document.Add(new Paragraph(" "));

                // tabela pierwsza
                int i = 0;
                try
                {
                    i = int.Parse(aa.Trim()) - 1;
                }
                catch (Exception)
                { }

                string cs = cl.podajConnectionString(int.Parse(dzial));
                string kw = cl.podajKwerende(int.Parse(dzial), int.Parse(aa), int.Parse(bb), int.Parse(tabela));
                DataTable dT = new DataTable();
                try
                {
                    DataSet dane = new DataSet();
                    dane.Tables.Clear();
                    if (tabela == "1")
                    {
                        dane = cl.pod_tabela(cs, kw, data1.ToShortDateString(), data2.ToShortDateString(), sedzia);
                    }
                    else
                    {
                        dane = cl.pod_tabela(cl.podajConnectionString(int.Parse(dzial)), cl.podajKwerende(int.Parse(dzial), 0, int.Parse(bb), int.Parse(tabela)), data1.ToShortDateString(), data2.ToShortDateString(), sedzia);
                    }
                    dT = dane.Tables[0];
                }
                catch
                { }
                // przetważanie tabeli
                if (dT.Rows.Count > 0)
                {
                    int il_kolumn = dT.Columns.Count;
                    iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(il_kolumn);
                    for (int ij = 0; ij < il_kolumn; ij++)
                    {
                        string dana = dT.Columns[ij].ColumnName.ToString();
                        iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(dana));
                        cell.BackgroundColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                        table.AddCell(cell);
                    }// end for
                    foreach (DataRow dR in dT.Rows)
                    {
                        // loop po wierszach
                        for (int j = 0; j < il_kolumn; j++)
                        {
                            // loop po kolumnach
                            string dana = dR[j].ToString().Trim();
                            iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(dana));
                            table.AddCell(cell);
                        } //end for
                    }// end foreach
                    document.Add(table);
                }// end of if
                document.Close();
                document.Close();
                writer.Close();
                ms.Close();
                //======================
                return ms;
            }
        }

    }
}