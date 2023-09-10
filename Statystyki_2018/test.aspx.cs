
using System;

using System.Diagnostics;

using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;

namespace Statystyki_2018
{
    public partial class test : System.Web.UI.Page
    {

        #region Imports
        [DllImport("user32.dll")]
        public static extern IntPtr FindWindowEx(IntPtr hwndParent, IntPtr hwndChildAfter, string lpszClass, string lpszWindow);

        [DllImport("User32.dll")]
        private static extern int SendMessage(IntPtr hWnd, int uMsg, int wParam, string lParam);

      
        #endregion




      
      
              

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            
            Thread STAThread = new Thread(
            delegate ()
            {
            
                System.Windows.Forms.Clipboard.SetText(TextBox1.Text);
            });
            STAThread.SetApartmentState(ApartmentState.STA);
            STAThread.Start();
            STAThread.Join();

            var notepad = Process.Start("notepad.exe");
            System.Threading.Thread.Sleep(50);
        }



    }
}