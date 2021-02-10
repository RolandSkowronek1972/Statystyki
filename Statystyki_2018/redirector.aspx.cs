using System;
using System.Globalization;

namespace Statystyki_2018
{
    public partial class redirector : System.Web.UI.Page
    {
        common cm = new common();
        protected void Page_Load(object sender, EventArgs e)
        {
            cm.log.Info("start redirektora  " + DateTime.Now.ToLongTimeString());
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            /*
            try
            {
                AppSettingsReader app = new AppSettingsReader();
                if ((int)app.GetValue("redirektorDebug", typeof(int)) == 1)
                {
                    GridView1.Visible = true;
                    GridView2.Visible = true;
                    Panel1.Visible = true;
                }
                else
                {
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Panel1.Visible = false;


                }
            }
            catch 
            { }
        */
        }
    }
}