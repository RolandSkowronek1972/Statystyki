using DevExpress.Web;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018.classes
{
    public class CustomTemplate : ITemplate
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

                    string funkcjaJavascript = "javascript:openPopup('popup.aspx?sesja=" + gcontainer.KeyValue + "!" + IdTabeli + "!" + kolumnaNum.ToString() + "!6')";
                    lB1.Text = " <a href = " + funkcjaJavascript + ">" + DataBinder.Eval(gcontainer.DataItem, IdKolumny) + "</a>";
                    gcontainer.Controls.Add(lB1);
                }
                catch
                { }
            }
            else
            {
                Label lB1 = new Label
                {
                    Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString()
                };
                gcontainer.Controls.Add(lB1);
            }
        }
    }
}