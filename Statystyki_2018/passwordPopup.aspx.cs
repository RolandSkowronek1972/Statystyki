using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class passwordPopup : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        public static string tenPlik = "passwordPopup.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = string.Empty;
            try
            {
                user = (string)Session["identyfikatorUzytkownika"];

            }
            catch 
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.close();", true);
            }
            if (string.IsNullOrEmpty (user.Trim ()))
            {

                return;
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", user);
Label1.Text =            cm.getQuerryValue("select distinct rtrim(imie) + ' '+ rtrim( nazwisko) from uzytkownik where ident=@ident ", cm.con_str,parametry,tenPlik);

        }

        protected void ZamknijOkno(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.close();", true);

        }

        protected void zapiszHaslo(object sender, EventArgs e)
        {
          string  user = (string)Session["identyfikatorUzytkownika"];
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", user);
            parametry.Rows.Add("@haslo",TextBox1.Text.Trim ());
            cm.runQuerry ("update  uzytkownik set password=@haslo where ident=@ident ", cm.con_str, parametry);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.close();", true);
        }
    }
}